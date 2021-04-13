module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output valid;
output [7:0] candidate;

wire [3:0] _cur_state;

wire [1:0] _reg_mode;
wire _read_done;
wire _proc_done;

CTRL CTRL(
	.clk(clk),
	.rst(rst),
	.reg_mode(_reg_mode),
	.read_done(_read_done),
	.proc_done(_proc_done),
	.cur_state(_cur_state),
	.busy(busy),
	.valid(valid)
);
PROC PROC(
	.clk(clk),
	.rst(rst),
	.en(en),
	.cur_state(_cur_state),
	.central(central),
	.radius(radius),
	.mode(mode), 
	.reg_mode(_reg_mode),
	.read_done(_read_done),
	.proc_done(_proc_done),
	.candidate(candidate)
);

endmodule

module CTRL (clk, rst, reg_mode, read_done, proc_done, cur_state, busy, valid);
input clk, rst;
input [1:0] reg_mode;
input read_done, proc_done;
reg [3:0] next_state;
output reg [3:0] cur_state;
output reg busy, valid;
parameter [3:0] STATE_READ		= 4'b0000,
				STATE_PROC1 	= 4'b0001,
				STATE_PROC2_1 	= 4'b0010,
				STATE_PROC2_2	= 4'b0011,
				STATE_PROC3_1	= 4'b0100,
				STATE_PROC3_2	= 4'b0101,
				STATE_PROC4_1	= 4'b0110,
				STATE_PROC4_2	= 4'b0111,
				STATE_PROC4_3	= 4'b1000,
				STATE_RES		= 4'b1110,
				STATE_FIN   	= 4'b1111;

always @(posedge clk or posedge rst) begin
	if (rst)
		cur_state <= STATE_READ;
	else
		cur_state <= next_state;
end

always @(*) begin
	case(cur_state)
		STATE_READ: begin
			if(read_done) begin
				case(reg_mode)
					2'b00: 	next_state = STATE_PROC1;
					2'b01: 	next_state = STATE_PROC2_1;
					2'b10: 	next_state = STATE_PROC3_1;
					default: next_state = STATE_PROC4_1;
				endcase
			end
			else
				next_state = STATE_READ;
		end
		STATE_PROC1: begin
			if(proc_done)
				next_state = STATE_RES;
			else
				next_state = STATE_PROC1;
		end
		STATE_PROC2_1: begin
			next_state = STATE_PROC2_2;
		end
		STATE_PROC2_2: begin
			if(proc_done)
				next_state = STATE_RES;
			else
				next_state = STATE_PROC2_1;
		end
		STATE_PROC3_1: begin
			next_state = STATE_PROC3_2;
		end
		STATE_PROC3_2: begin
			if(proc_done)
				next_state = STATE_RES;
			else
				next_state = STATE_PROC3_1;
		end
		STATE_PROC4_1: begin
			next_state = STATE_PROC4_2;
		end
		STATE_PROC4_2: begin
			next_state = STATE_PROC4_3;
		end
		STATE_PROC4_3: begin
			if(proc_done)
				next_state = STATE_RES;
			else
				next_state = STATE_PROC4_1;
		end
		STATE_RES: begin
			next_state = STATE_READ;
		end
		default:
			next_state = STATE_FIN;
	endcase
end

always @(*) begin
	case(cur_state)
		STATE_READ:
			busy = 1'b0;
		default:
			busy = 1'b1;
	endcase
end

always @(*) begin
	case(cur_state)
		STATE_RES:
			valid = 1'b1;
		default:
			valid = 1'b0;
	endcase
end
endmodule
/*------PROC begin------*/
module PROC (clk, rst, en, cur_state, central, radius, mode, reg_mode, read_done, proc_done, candidate);
input clk, rst;
input en;
input [3:0] 	cur_state;
input [23:0] 	central;
input [11:0]	radius;
input [1:0]		mode;

reg [23:0]	reg_central;
reg [11:0]	reg_radius;
output reg [1:0]	reg_mode;

output reg read_done;

parameter [3:0] STATE_READ		= 4'b0000,
				STATE_PROC1 	= 4'b0001,
				STATE_PROC2_1 	= 4'b0010,
				STATE_PROC2_2	= 4'b0011,
				STATE_PROC3_1	= 4'b0100,
				STATE_PROC3_2	= 4'b0101,
				STATE_PROC4_1	= 4'b0110,
				STATE_PROC4_2	= 4'b0111,
				STATE_PROC4_3	= 4'b1000,
				STATE_RES		= 4'b1110,
				STATE_FIN   	= 4'b1111;

/*---read----*/
always @(posedge clk or posedge rst) begin
	if (rst) begin
		reg_central <= 24'b0;
		reg_radius	<= 12'b0;
		reg_mode	<= 2'b0;
		read_done	<= 1'b0;
	end
	else begin
		if(en) begin
			reg_central <= central;
			reg_radius 	<= radius;
			reg_mode	<= mode;
			read_done	<= 1'b1;
		end
		else
			read_done	<= 1'b0;
	end
end

output proc_done;
reg [3:0] cntX;
reg [3:0] cntY;

assign proc_done = ((cntX == 4'b1000) && (cntY == 4'b1000))? 1'b1:1'b0;

// coordinate ctrl
always @(posedge clk or posedge rst) begin
	if (rst) begin
		cntX <= 4'b1;
		cntY <= 4'b1;
	end
	else begin
		case(cur_state)
			STATE_READ: begin
				cntX <= 4'b1;
				cntY <= 4'b1;
			end
			STATE_PROC1, STATE_PROC2_2, STATE_PROC3_2, STATE_PROC4_3: begin
				if(cntX == 4'b1000) begin
					cntX <= 4'b1;
					if(cntY == 4'b1000)
						cntY <= 4'b1;
					else
						cntY <= cntY + 4'b1;
				end
				else
					cntX <= cntX + 4'b1;
			end
			// STATE_PROC2_2: begin // need to modify
			// 	if(cntX == 4'b1000) begin
			// 		cntX <= 4'b1;
			// 		if(cntY == 4'b1000)
			// 			cntY <= 4'b1;
			// 		else
			// 			cntY <= cntY + 4'b1;
			// 	end
			// 	else
			// 		cntX <= cntX + 4'b1;
			// end
			// STATE_PROC3_2: begin
			// 	if(cntX == 4'b1000) begin
			// 		cntX <= 4'b1;
			// 		if(cntY == 4'b1000)
			// 			cntY <= 4'b1;
			// 		else
			// 			cntY <= cntY + 4'b1;
			// 	end
			// 	else
			// 		cntX <= cntX + 4'b1;
			// end
			// STATE_PROC4_3: begin
			// 	if(cntX == 4'b1000) begin
			// 		cntX <= 4'b1;
			// 		if(cntY == 4'b1000)
			// 			cntY <= 4'b1;
			// 		else
			// 			cntY <= cntY + 4'b1;
			// 	end
			// 	else
			// 		cntX <= cntX + 4'b1;
			// end
		endcase
	end
end

output reg [7:0] candidate;
reg signed [3:0] r,x,y;
wire [7:0] r_sqr, x_sqr, y_sqr;

reg tmp_res;
reg tmp_res2;

always @(*) begin
	case(cur_state)
		// STATE_PROC1: begin // 00, A
		// 	r = reg_radius[11:8];
		// 	x = (reg_central[23:20] - cntX);
		// 	y = (reg_central[19:16] - cntY);
		// end
		STATE_PROC1, STATE_PROC2_1, STATE_PROC3_1, STATE_PROC4_1: begin // 01, A
			r = reg_radius[11:8];
			x = (reg_central[23:20] - cntX);
			y = (reg_central[19:16] - cntY);
		end
		STATE_PROC2_2, STATE_PROC3_2, STATE_PROC4_2: begin // 01, B
			r = reg_radius[7:4];
			x = (reg_central[15:12] - cntX);
			y = (reg_central[11:8]  - cntY);
		end
		// STATE_PROC3_1: begin // 10, A
		// 	r = reg_radius[11:8];
		// 	x = (reg_central[23:20] - cntX);
		// 	y = (reg_central[19:16] - cntY);
		// end
		// STATE_PROC3_2: begin // 10, B
		// 	r = reg_radius[7:4];
		// 	x = (reg_central[15:12] - cntX);
		// 	y = (reg_central[11:8]  - cntY);
		// end
		// STATE_PROC4_1: begin
		// 	r = reg_radius[11:8];
		// 	x = (reg_central[23:20] - cntX);
		// 	y = (reg_central[19:16] - cntY);
		// end
		// STATE_PROC4_2: begin
		// 	r = reg_radius[7:4];
		// 	x = (reg_central[15:12] - cntX);
		// 	y = (reg_central[11:8]  - cntY);
		// end
		STATE_PROC4_3: begin
			r = reg_radius[3:0];
			x = (reg_central[7:4] - cntX);
			y = (reg_central[3:0] - cntY);
		end
		default: begin
			r = 4'b0;
			x = 4'b0;
			y = 4'b0;
		end
	endcase
end

assign r_sqr = r * r;
assign x_sqr = x * x;
assign y_sqr = y * y;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		candidate <= 8'b0;
	end
	else begin
		case(cur_state)
			STATE_PROC1: begin
				if(x_sqr + y_sqr <= r_sqr)
					candidate <= candidate + 8'b1;
			end
			STATE_PROC2_1, STATE_PROC3_1, STATE_PROC4_1: begin
				if(x_sqr + y_sqr <= r_sqr)
					tmp_res <= 1'b1;
				else
					tmp_res <= 1'b0;
			end
			STATE_PROC2_2: begin
				if((x_sqr + y_sqr <= r_sqr) && tmp_res)
					candidate <= candidate + 8'b1;
			end
			// STATE_PROC3_1: begin
			// 	if(x_sqr + y_sqr <= r_sqr)
			// 		tmp_res <= 1'b1;
			// 	else
			// 		tmp_res <= 1'b0;
			// end
			STATE_PROC3_2: begin
				if(((x_sqr + y_sqr <= r_sqr) && !tmp_res) ||(!(x_sqr + y_sqr <= r_sqr)) && tmp_res)
					candidate <= candidate + 8'b1;
			end
			// STATE_PROC4_1: begin
			// 	if(x_sqr + y_sqr <= r_sqr)
			// 		tmp_res <= 1'b1;
			// 	else
			// 		tmp_res <= 1'b0;
			// end
			STATE_PROC4_2: begin
				if(x_sqr + y_sqr <= r_sqr)
					tmp_res2 <= 1'b1;
				else
					tmp_res2 <= 1'b0;
			end
			STATE_PROC4_3: begin
				case({tmp_res, tmp_res2})
					2'b01:
						if((x_sqr + y_sqr <= r_sqr))
							candidate <= candidate + 8'b1;
					2'b10:
						if((x_sqr + y_sqr <= r_sqr))
							candidate <= candidate + 8'b1;
					2'b11:
						if(!(x_sqr + y_sqr <= r_sqr))
							candidate <= candidate + 8'b1;
				endcase
			end
			default: 
				candidate <= 8'b0;
		endcase
	end
end
endmodule