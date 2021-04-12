`timescale 1ns/10ps
module IOTDF( clk, rst, in_en, iot_in, fn_sel, busy, valid, iot_out);
input          clk;
input          rst;
input          in_en;
input  [7:0]   iot_in;
input  [2:0]   fn_sel;
output         busy;
output         valid;
output [127:0] iot_out;

wire [2:0] _cur_state;
wire _read_done;

CTRL CTRL(
	.clk(clk),
	.rst(rst),
	.read_done(_read_done),
	.cur_state(_cur_state),
	.busy(busy)
);

READ READ(
	.clk(clk),
	.rst(rst),
	.cur_state(_cur_state),
	.in_en(in_en),
	.iot_in(iot_in),
	.fn_sel(fn_sel),
	.read_done(_read_done),
	.result(iot_out),
	.valid(valid)
);

endmodule

module CTRL(clk, rst, read_done, 
			cur_state, busy);
input	clk, rst;
input read_done;
output reg [2:0] cur_state;
reg [2:0] next_state;

output reg busy;

parameter [2:0]	STATE_INIT	= 3'b000,
				STATE_READ	= 3'b001,
				STATE_PROC	= 3'b010,
				STATE_OUT	= 3'b011,
		  		STATE_FIN	= 3'b111;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		cur_state <= STATE_INIT;
	end
	else  begin
		cur_state <= next_state;
	end
end

always@(*) begin
	case(cur_state)
		STATE_INIT:
			next_state = STATE_READ;
		STATE_READ: begin
			if(read_done)
				next_state = STATE_PROC;
			else
				next_state = STATE_READ;
		end
		STATE_PROC:
			next_state = STATE_OUT;
		STATE_OUT:
			next_state = STATE_READ;
		default:
			next_state = STATE_FIN;
	endcase
end

always @(*) begin
	case(cur_state)
		STATE_READ:
			if(read_done)
				busy = 1'b1;
			else
				busy = 1'b0;
		default:
			busy = 1'b1;
	endcase
end

endmodule

module READ(clk, rst, cur_state, in_en, iot_in, fn_sel,
			read_done, result, valid);
input clk, rst;
input in_en;
input [2:0] cur_state;
input [7:0] iot_in;
input [2:0] fn_sel;

reg [127:0] comp_data;
reg [3:0] byte_cnt;
reg [2:0] data_cnt;

output reg read_done;

reg [127:0] local_max;
reg [127:0] local_min;
reg [130:0] sum;
reg [127:0] global_max;
reg [127:0] global_min;
reg ext, exc;
reg b_max, b_min;

output reg [127:0] result;
output reg valid;

integer i;

parameter [2:0]	STATE_INIT	= 3'b000,
				STATE_READ	= 3'b001,
				STATE_PROC	= 3'b010,
				STATE_OUT	= 3'b011,
		  		STATE_FIN	= 3'b111;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		comp_data <= 128'b0;
		byte_cnt <= 4'b0;
		data_cnt <= 3'b0;
	end
	else begin
		if(in_en) begin
			comp_data[{~byte_cnt,3'b0}+:8] <= iot_in;
			byte_cnt <= byte_cnt + 4'b1;
			if(byte_cnt == 4'b1111)
				data_cnt <= data_cnt + 3'b1;
		end
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		local_max <= 128'b0;
		global_max <= 128'b0;
		for(i = 0; i < 128; i=i+1) begin
			local_min[i] <= 1'b1;
			global_min[i] <= 1'b1;
		end
		sum <= 128'b0;
		b_max <= 1'b0;
		b_max <= 1'b0;
	end
	else begin
		case(cur_state)
			STATE_PROC: begin
				if(comp_data > local_max)
					local_max <= comp_data;
				if(comp_data < local_min)
					local_min <= comp_data;
				sum <= sum + comp_data;
				if(comp_data[127:124] > 4'b0110 && comp_data[127:124] < 4'b1011)
					ext <= 1'b1;
				if(comp_data[127:124] < 4'b1000 || comp_data[127:124] > 4'b1011)
					exc <= 1'b1;
				if(comp_data > global_max) begin
					b_max <= 1'b1;
					global_max <= comp_data;
				end
				if(comp_data < global_min) begin
					b_min <= 1'b1;
					global_min <= comp_data;
				end
			end
			STATE_OUT: begin
				if(data_cnt == 3'b0) begin
					local_max <= 128'b0;
					for(i = 0; i < 128; i=i+1)
						local_min[i] <= 1'b1;
					sum <= 128'b0;
					b_max <= 1'b0;
					b_min <= 1'b0;
				end
				ext <= 1'b0;
				exc <= 1'b0;
			end
		endcase
	end
end

always @(*) begin
	case(fn_sel)
		3'b001: result = local_max;
		3'b010: result = local_min;
		3'b011: result = sum >> 3;
		3'b100/*ext*/, 3'b101/*exc*/: result = comp_data;
		3'b110: result = global_max;
		3'b111: result = global_min;
		default: result = comp_data;
	endcase
end

always @(*) begin
	if(byte_cnt == 4'b1111)
		read_done = 1'b1;
	else
		read_done = 1'b0;
end

always @(*) begin
	case(cur_state)
		STATE_OUT: begin
			case(fn_sel)
				3'b100: begin
					if(ext)
						valid = 1'b1;
					else
						valid = 1'b0;
				end
				3'b101: begin
					if(exc)
						valid = 1'b1;
					else
						valid = 1'b0;
				end
				3'b110: begin
					if(b_max && data_cnt == 3'b000)
						valid = 1'b1;
					else
						valid = 1'b0;
				end
				3'b111: begin
					if(b_min && data_cnt == 3'b000)
						valid = 1'b1;
					else
						valid = 1'b0;
				end
				default: begin
					if(data_cnt == 3'b000)
						valid = 1'b1;
					else
						valid = 1'b0;
				end
			endcase
		end
		default: valid = 1'b0;
	endcase
end
endmodule