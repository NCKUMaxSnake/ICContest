
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output   [13:0] 	gray_addr;
output         	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  [13:0] 	lbp_addr;
output   	lbp_valid;
output   [7:0] 	lbp_data;
output  	finish;
//====================================================================
wire [2:0]  _control_signal;
wire [13:0] _global_index;
wire _read_done;
wire [7:0] _mid_data0, _mid_data1, _mid_data2, _mid_data3, _mid_data4, _mid_data5, _mid_data6, _mid_data7, _mid_data8;

assign lbp_addr = _global_index;


CONTROL CONTROL(
	.clk(clk),
	.reset(reset),
	.gray_ready(gray_ready),
	.read_done(_read_done),
	.current_state(_control_signal),
	.global_index(_global_index),
	.gray_req(gray_req),
	.lbp_valid(lbp_valid),
	.finish(finish)
);
READ READ(
	.clk(clk),
	.reset(reset),
	.control_signal(_control_signal),
	.global_index(_global_index),
	.gray_data(gray_data),
	.gray_addr(gray_addr),
	.read_done(_read_done),
	.result(lbp_data)
);

//====================================================================
endmodule

/*------CONTROL begin------*/
module CONTROL(clk, reset, gray_ready, read_done, current_state, global_index, gray_req, lbp_valid, finish);
input clk, reset;
input gray_ready;
input read_done;

output reg [2:0] current_state;
output reg [13:0] global_index;
output reg gray_req;
output reg lbp_valid;
output reg finish;

reg [2:0] next_state;
 

parameter [2:0] STATE_INIT = 3'b0,
				STATE_READ = 3'b1,
				STATE_WRITE = 3'b10,
				STATE_FINISH = 3'b111;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		current_state <= STATE_INIT;
	end
	else begin
		current_state <= next_state;
	end
end

always@(*) begin
	case(current_state)
		STATE_INIT: begin
			if(gray_ready)
				next_state = STATE_READ;
			else
				next_state = STATE_INIT;
		end
		STATE_READ: begin
			if(read_done)
				next_state = STATE_WRITE;
			else
				next_state = STATE_READ;
		end
		STATE_WRITE: begin
			if(global_index == 14'd16254)
				next_state = STATE_FINISH;
			else	
				next_state = STATE_READ;
		end
		default:
			next_state = STATE_FINISH;
	endcase
end

reg [6:0] counter;
wire [6:0] next_counter;
// global index
always @(posedge clk or posedge reset) begin
	if (reset) begin
		global_index <= 14'd129;
	end
	else begin
		case(current_state)
			STATE_WRITE: begin
				if(counter == 7'b1111101)
					global_index <= global_index + 14'b11;
				else
					global_index <= global_index + 14'b1;
			end 
		endcase
	end
end


assign next_counter = counter + 7'b1;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		counter <= 7'b0;
	end
	else begin
		case(current_state)
			STATE_WRITE: begin
				if(next_counter == 7'b1111110)
					counter <= 7'b0;
				else
					counter <= next_counter;
			end
		endcase
	end
end

// gray_req
always@(*) begin
	case(current_state)
		STATE_READ: gray_req = 1'b1;
		default: 	gray_req = 1'b0;
	endcase
end

// lbp_valid
always@(*) begin
	case(current_state)
		STATE_WRITE: 	lbp_valid = 1'b1;
		default: 		lbp_valid = 1'b0;
	endcase
end

// finish
always@(*) begin
	case(current_state)
		STATE_FINISH: 	finish = 1'b1;
		default: 		finish = 1'b0;
	endcase
end
endmodule
/*------CONTROL end------*/

/*------READ begin------*/
module READ(clk, reset, control_signal, global_index, gray_data, gray_addr, read_done, result);
input clk, reset;
input [2:0] control_signal;
input [13:0] global_index;
input [7:0] gray_data;

output [13:0] gray_addr;
output read_done;

reg [3:0] counter;

wire [13:0] read_addr_array [8:0];

parameter [2:0] STATE_INIT = 3'b0,
				STATE_READ = 3'b1,
				STATE_WRITE = 3'b10,
				STATE_FINISH = 3'b111;

assign read_done = (counter == 4'b1000)? 1'b1:1'b0;

assign read_addr_array[0] = global_index;
assign read_addr_array[1] = global_index - 14'd129;
assign read_addr_array[2] = global_index - 14'd128;
assign read_addr_array[3] = global_index - 14'd127;
assign read_addr_array[4] = global_index - 14'd1;
assign read_addr_array[5] = global_index + 14'd1;
assign read_addr_array[6] = global_index + 14'd127;
assign read_addr_array[7] = global_index + 14'd128;
assign read_addr_array[8] = global_index + 14'd129;

assign gray_addr = read_addr_array[counter];

output reg [7:0] result;
reg [7:0] mid_data;

integer i;
// gray_array set
always @(posedge clk or posedge reset) begin
	if (reset) begin
		result <= 8'b0;
	end
	else begin
		//gray_array[counter] <= gray_data;
		if(counter == 4'b0)
			mid_data <= gray_data;
		else
			if(gray_data >= mid_data)
				result[counter - 4'b1] <= 1'b1;
			else
				result[counter - 4'b1] <= 1'b0;
	end
end

// counter count
always @(posedge clk or posedge reset) begin
	if (reset) begin
		counter <= 4'b0;
	end
	else begin
		case(control_signal)
			STATE_READ: counter <= counter + 4'b1;
			default: 	counter <= 4'b0;
		endcase
	end
end
endmodule
/*------READ end------*/