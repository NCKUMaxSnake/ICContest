module STI_DAC(clk ,reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, pi_end,
	       so_data, so_valid,
	       oem_finish, oem_dataout, oem_addr,
	       odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr);

input		clk, reset;
input		load, pi_msb, pi_low, pi_end; 
input	[15:0]	pi_data;
input	[1:0]	pi_length;
input		pi_fill;
output		so_data, so_valid;

output  oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output [4:0] oem_addr;
output [7:0] oem_dataout;

//==============================================================================

wire [2:0] _cur_state;

wire _read_done;
wire _out_done;

wire _mem_done;

CTRL CTRL(
	.clk(clk),
	.reset(reset),
	.pi_end(pi_end),
	.read_done(_read_done),
	.out_done(_out_done),
	.mem_done(_mem_done),
	.cur_state(_cur_state),
	.so_valid(so_valid),
	.oem_finish(oem_finish)
);

PROC PROC(
	.clk(clk),
	.reset(reset),
	.cur_state(_cur_state),
	.load(load),
	.pi_data(pi_data),
	.pi_length(pi_length),
	.pi_fill(pi_fill),
	.pi_msb(pi_msb),
	.pi_low(pi_low),
	.read_done(_read_done),
	.out_done(_out_done),
	.so_data(so_data)
);

DAC DAC(
	.clk(clk),
	.reset(reset),
	.cur_state(_cur_state),
	.so_valid(so_valid),
	.so_data(so_data),
	.odd1_wr(odd1_wr),
	.odd2_wr(odd2_wr),
	.odd3_wr(odd3_wr),
	.odd4_wr(odd4_wr),
	.even1_wr(even1_wr),
	.even2_wr(even2_wr),
	.even3_wr(even3_wr),
	.even4_wr(even4_wr),
	.oem_addr(oem_addr),
	.oem_dataout(oem_dataout),
	.mem_done(_mem_done)
);

endmodule

/*------CTRL begin------*/
module CTRL(clk ,reset, pi_end, read_done, out_done, mem_done, cur_state, so_valid, oem_finish);
input clk, reset;
input pi_end;
input read_done, out_done, mem_done;
output reg [2:0] cur_state;

reg [2:0] next_state;

parameter [2:0] STATE_READ = 3'b000,
				STATE_PROC = 3'b001,
				STATE_OUT  = 3'b010,
				STATE_MEM  = 3'b011,
				STATE_FIN  = 3'b111;

// cur_state
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cur_state <= STATE_READ;
	end
	else begin
		cur_state <= next_state;
	end
end

// next_state
always @(*) begin
	case(cur_state)
		STATE_READ:begin
			if(pi_end) begin
				next_state = STATE_MEM;
			end
			else if(read_done) begin
				next_state = STATE_PROC;
			end
			else begin
				next_state = STATE_READ;
			end
		end
		STATE_PROC: begin
			next_state = STATE_OUT;
		end
		STATE_OUT: begin
			if(out_done)
				next_state = STATE_READ;
			else
				next_state = STATE_OUT;
		end
		STATE_MEM: begin
			if(mem_done)
				next_state = STATE_FIN;
			else
				next_state = STATE_MEM;
		end
		default: begin
			next_state = STATE_FIN;
		end
	endcase
end

output reg so_valid;
// signal: so_valid
always @(*) begin
	case(cur_state)
		STATE_OUT:	so_valid = 1'b1;
		default:	so_valid = 1'b0;
	endcase
end

output reg oem_finish;
// signal: so_valid
always @(*) begin
	case(cur_state)
		STATE_FIN:	oem_finish = 1'b1;
		default:	oem_finish = 1'b0;
	endcase
end

endmodule

module PROC(clk, reset, cur_state, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, 
			read_done, out_done, so_data);
input clk,reset;
input [2:0] cur_state;
input load;
input [15:0] pi_data;
input [1:0]  pi_length;
input pi_fill, pi_msb, pi_low;

reg [15:0]	data;
reg [1:0]	length;
reg fill, msb, low;

output reg read_done;

parameter [2:0] STATE_READ = 3'b000,
				STATE_PROC = 3'b001,
				STATE_OUT  = 3'b010,
				STATE_MEM  = 3'b011,
				STATE_FIN  = 3'b111;

// STATE_READ
always @(posedge clk or posedge reset) begin
	if (reset) begin
		data 	<= 16'b0;
		length 	<= 2'b0;
		fill 	<= 1'b0;
		msb		<= 1'b0;
		low		<= 1'b0;
		read_done <= 1'b0;
	end
	else begin
		if(load) begin
			data 	<= pi_data;
			length 	<= pi_length;
			fill 	<= pi_fill;
			msb  	<= pi_msb;
			low  	<= pi_low;
			read_done <= 1'b1;
		end
		else begin
			read_done <= 1'b0;
		end
	end
end

reg [31:0] 	proc_data;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		proc_data <= 32'b0;
	end
	else begin
		case(length)
			2'b00: begin // 8 bits
				if(low)
					proc_data <= {24'b0, data[15:8]};
				else
					proc_data <= {24'b0, data[7:0]};
			end
			2'b01: begin // 16 bits
				proc_data[15:0] <= {16'b0, data};
			end
			2'b10: begin // 24 bits
				if(fill)
					proc_data <= {8'b0, data, 8'b0};
				else
					proc_data <= {8'b0, 8'b0, data};
			end
			2'b11: begin // 32 bits
				if(fill)
					proc_data <= {data, 16'b0};
				else
					proc_data <= {16'b0, data};
			end
		endcase
	end
end

reg [4:0] origin;
reg [4:0] destin;
output out_done;
output so_data;
assign out_done = (origin == destin)? 1'b1:1'b0;
assign so_data = proc_data[origin];

// origin
always @(posedge clk or posedge reset) begin
	if (reset) begin
		origin <= 5'b0;
	end
	else begin
		case(cur_state)
			STATE_PROC: begin
				if(msb) begin
					case(length)
						2'b00: origin <= 5'b00111;
						2'b01: origin <= 5'b01111;
						2'b10: origin <= 5'b10111;
						2'b11: origin <= 5'b11111;
					endcase
				end
				else
					origin <= 5'b0;
			end
			STATE_OUT: begin
				if(msb)
					origin <= origin - 1;
				else
					origin <= origin + 1;
			end
		endcase
	end
end

// destin
always @(posedge clk or posedge reset) begin
	if (reset) begin
		destin <= 5'b0;
	end
	else begin
		case(cur_state)
			STATE_PROC: begin
				if(msb)
					destin <= 5'b0;
				else begin
					case(length)
						2'b00: destin <= 5'b00111;
						2'b01: destin <= 5'b01111;
						2'b10: destin <= 5'b10111;
						2'b11: destin <= 5'b11111;
					endcase
				end
			end
		endcase
	end
end

endmodule

module DAC(clk, reset, cur_state, so_valid, so_data,
	odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr,
	oem_addr, oem_dataout, mem_done);
input clk, reset;
input [2:0] cur_state;
input so_valid;
input so_data;

output reg odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output reg [4:0] oem_addr;
output [7:0] oem_dataout;

reg [7:0] data_mem [255:0];

integer i;

parameter [2:0] STATE_READ = 3'b000,
				STATE_PROC = 3'b001,
				STATE_OUT  = 3'b010,
				STATE_MEM  = 3'b011,
				STATE_FIN  = 3'b111;

reg [2:0] cnt_bit;
reg [7:0] cnt_byte;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		cnt_bit <= 3'b111;
		cnt_byte <= 8'b0;
	end
	else begin
		case(cur_state)
			STATE_OUT: begin
				if(cnt_bit == 3'b0)
					cnt_byte <= cnt_byte + 8'b1;
				cnt_bit <= cnt_bit - 3'b1;
			end
		endcase
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 256; i = i + 1)
			data_mem[i] <= 8'b0;
	end
	else begin
		if(so_valid)
			data_mem[cnt_byte][cnt_bit] <= so_data;
	end
end

reg [7:0] rd_addr;

assign oem_dataout = data_mem[rd_addr];

always @(posedge clk or posedge reset) begin
	if (reset) begin
		rd_addr <= 8'b0;
	end
	else begin
		case(cur_state)
			STATE_MEM:
				rd_addr <= rd_addr + 8'b1;
		endcase
	end
end

reg carry;
//reg [4:0] wr_addr; // each mem addr

// assign oem_addr = wr_addr;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		carry <= 1'b0;
		//wr_addr <= 5'b0;
		oem_addr <= 5'b0;
	end
	else begin
		case(cur_state)
			STATE_MEM: begin
				carry <= carry + 1'b1;
				if(carry == 1'b1)
					oem_addr <= oem_addr + 5'b1;
			end
		endcase
	end
end

parameter [7:0] ODD1 	= 8'b10000000,
				EVEN1 	= 8'b01000000,
				ODD2 	= 8'b00100000,
				EVEN2 	= 8'b00010000,
				ODD3 	= 8'b00001000,
				EVEN3	= 8'b00000100,
				ODD4	= 8'b00000010,
				EVEN4 	= 8'b00000001,
				NULL	= 8'b00000000;

reg [7:0] mem_sel, next_mem_sel;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		mem_sel <= ODD1;
	end
	else begin
		case(cur_state)
			STATE_MEM: 	mem_sel <= next_mem_sel;
			STATE_FIN:	mem_sel <= NULL;
			default: 	mem_sel <= ODD1;
		endcase
	end
end

always @(*) begin
	case(mem_sel)
		ODD1: begin
			if(/*wr_addr*/oem_addr == 5'b11111)
				next_mem_sel = ODD2;
			else if(rd_addr[2:0] == 3'b111 || cur_state != STATE_MEM)
				next_mem_sel = ODD1;
			else
				next_mem_sel = EVEN1;
		end
		EVEN1: begin
			if(rd_addr[2:0] == 3'b111)
				next_mem_sel = EVEN1;
			else
				next_mem_sel = ODD1;
		end
		ODD2: begin
			if(/*wr_addr*/oem_addr == 5'b11111)
				next_mem_sel = ODD3;
			else if(rd_addr[2:0] == 3'b111)
				next_mem_sel = ODD2;
			else
				next_mem_sel = EVEN2;
		end
		EVEN2: begin
			if(rd_addr[2:0] == 3'b111)
				next_mem_sel = EVEN2;
			else
				next_mem_sel = ODD2;
		end
		ODD3: begin
			if(/*wr_addr*/oem_addr == 5'b11111)
				next_mem_sel = ODD4;
			else if(rd_addr[2:0] == 3'b111)
				next_mem_sel = ODD3;
			else
				next_mem_sel = EVEN3;
		end
		EVEN3: begin
			if(rd_addr[2:0] == 3'b111)
				next_mem_sel = EVEN3;
			else
				next_mem_sel = ODD3;
		end
		ODD4: begin
			if(/*wr_addr*/oem_addr == 5'b11111)
				next_mem_sel = NULL;
			else if(rd_addr[2:0] == 3'b111)
				next_mem_sel = ODD4;
			else
				next_mem_sel = EVEN4;
		end
		EVEN4: begin
			if(rd_addr[2:0] == 3'b111)
				next_mem_sel = EVEN4;
			else
				next_mem_sel = ODD4;
		end
		default: next_mem_sel = NULL;
	endcase
end

always@(*) begin
	case(mem_sel)
		ODD1: begin
			odd1_wr = 1'b1;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		ODD2: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b1;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		ODD3: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b1;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		ODD4: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b1;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		EVEN1: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b1;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		EVEN2: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b1;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
		EVEN3: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b1;
			even4_wr = 1'b0;
		end
		EVEN4: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b1;
		end
		default: begin
			odd1_wr = 1'b0;
			odd2_wr = 1'b0;
			odd3_wr = 1'b0;
			odd4_wr = 1'b0;
			even1_wr = 1'b0;
			even2_wr = 1'b0;
			even3_wr = 1'b0;
			even4_wr = 1'b0;
		end
	endcase
end

output mem_done;
assign mem_done = (mem_sel == NULL)? 1'b1:1'b0;

endmodule