module DT(clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, res_addr, res_do, res_di);
input 	clk;
input	reset;
output	done;
output	sti_rd;
output	[9:0]	sti_addr;
input	[15:0]	sti_di;
output	res_wr;
output	res_rd;
output	[13:0]	res_addr;
output	[7:0]	res_do;
input	[7:0]	res_di;

reg	[13:0]	res_addr;

// control part
wire [3:0] _control_signal;

// global index part
wire [13:0] _global_idx;

// wrRes
wire _init_done;
wire _is_object;
wire _forward_done;
wire _backward_done;

// rdRes
wire [2:0] _rd_idx;
wire _rd_res_done;
wire [13:0] _res_RDaddr;

parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;

always@ (*) begin
	case(_control_signal)
		STATE_READRES: begin
			res_addr = _res_RDaddr;
		end
		STATE_READRES2: begin
			res_addr = _res_RDaddr;
		end
		default: begin
			res_addr = _global_idx;
		end
	endcase
end

control CTRL(.clk(clk), .reset(reset), .init_done(_init_done), .is_object(_is_object), .rd_res_done(_rd_res_done), .forward_done(_forward_done), .backward_done(_backward_done),
			 .current_state(_control_signal), .done(done));

rdSti RDSTI(.clk(clk), .reset(reset), .control_signal(_control_signal), .global_idx(_global_idx));

checkSti CHKSTI(.clk(clk), .reset(reset), .control_signal(_control_signal), .global_idx(_global_idx), .sti_di(sti_di),
				.sti_rd(sti_rd), .sti_addr(sti_addr), .is_object(_is_object));

wrRes WRRES(.clk(clk), .reset(reset), .control_signal(_control_signal), .global_idx(_global_idx), .is_object(_is_object),
			.rd_idx(_rd_idx), .res_di(res_di), .res_do(res_do), .res_wr(res_wr), .init_done(_init_done), .forward_done(_forward_done), .backward_done(_backward_done));

rdRes RDRES(.clk(clk), .reset(reset), .control_signal(_control_signal),.global_idx(_global_idx),
			.res_rd(res_rd), .res_addr(_res_RDaddr), .rd_idx(_rd_idx), .rd_res_done(_rd_res_done));

endmodule

/*------control begin------*/
module control(clk, reset, init_done, is_object, rd_res_done, forward_done, backward_done, current_state, done/*, reg_is_obj*/);
input clk, reset;
input init_done, is_object, rd_res_done, forward_done, backward_done;

output [3:0] current_state;
output done;

reg [3:0] current_state, next_state; 

parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;

assign done = (current_state == STATE_DONE)? 1'b1 : 1'b0;

always @(posedge clk or negedge reset) begin
	if (~reset)
		current_state <= STATE_INIT;
	else 
		current_state <= next_state;
end

always @(*) begin
	case(current_state)
		STATE_INIT: begin
			if(init_done)
				next_state = STATE_CHECKSTI;
			else
				next_state = STATE_INIT;
		end
		STATE_CHECKSTI: begin
			if(is_object)
				next_state = STATE_READRES;
			else
				next_state = STATE_WRITERES;
		end
		STATE_READRES: begin
			if(rd_res_done)
				next_state = STATE_WRITERES;
			else
				next_state = STATE_READRES;
		end
		STATE_WRITERES: begin
			if(forward_done)
				next_state = STATE_INIT2;
			else
				next_state = STATE_CHECKSTI;
		end
		STATE_INIT2: begin
			next_state = STATE_CHECKSTI2;
		end
		STATE_CHECKSTI2: begin
			if(is_object)
				next_state = STATE_READRES2;
			else
				next_state = STATE_WRITERES2;
		end
		STATE_READRES2: begin
			if(rd_res_done)
				next_state = STATE_WRITERES2;
			else
				next_state = STATE_READRES2;
		end
		STATE_WRITERES2: begin
			if(backward_done)
				next_state = STATE_DONE;
			else
				next_state = STATE_CHECKSTI2;
		end

	endcase
end
endmodule
/*------control end------*/

/*------rdsti begin------*/
module rdSti(clk, reset, control_signal, global_idx);
input clk, reset;
input [3:0] control_signal;

output [13:0] global_idx;
reg [13:0] global_idx;

parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		global_idx <= 14'b0;
	end
	else begin
		case(control_signal)
			STATE_INIT: begin
				global_idx <= global_idx + 14'b1;
			end
			STATE_WRITERES: begin
				global_idx <= global_idx + 14'b1;
			end
			STATE_INIT2: begin
				global_idx <= 14'b11111101111111; // 14'h3F7F
			end
			STATE_WRITERES2: begin
				global_idx <= global_idx - 14'b1;
			end
		endcase
	end
end
endmodule
/*------rdsti end------*/

/*------checkSti begin------*/
module checkSti(clk, reset, control_signal, global_idx, sti_di, sti_rd, sti_addr, is_object);
input clk, reset;
input [3:0] control_signal;
input [13:0] global_idx;
input [15:0] sti_di;

output sti_rd;
output [9:0] sti_addr;
output is_object;

reg is_object;

wire [9:0] block_idx;
wire [3:0] local_idx;
 
parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;

assign sti_rd = ((control_signal == STATE_CHECKSTI) || (control_signal == STATE_CHECKSTI2))? 1'b1 : 1'b0;
assign block_idx = global_idx[13:4];
assign sti_addr = block_idx;
assign local_idx = global_idx[3:0];

always @(*) begin
	if(sti_di[4'b1111 - local_idx])
		is_object = 1'b1;
	else
		is_object = 1'b0;
end
endmodule
/*------checkSti end------*/

/*------wrRes begin------*/
module wrRes(clk, reset, control_signal, global_idx, is_object, rd_idx, res_di, res_do, res_wr, init_done, forward_done, backward_done);
input clk, reset;
input [3:0] control_signal;
input [13:0] global_idx;
input is_object;
input [2:0] rd_idx;
input [7:0] res_di;

output [7:0] res_do;
output res_wr;
output init_done;
output forward_done;
output backward_done;

reg [7:0] res_do;
reg res_wr;
reg [7:0] res_data [4:0];

wire [7:0] smallestResult;

parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;
integer i;
getSmallest GETSMALLEST(.element1(res_data[0]), .element2(res_data[1]), .element3(res_data[2]), .element4(res_data[3]), .final_result(smallestResult));

assign init_done = (global_idx == 14'b1111111/*128*/)? 1'b1 : 1'b0;
assign forward_done = (global_idx == 14'b11111111111111)? 1'b1 : 1'b0;
assign backward_done = (global_idx == 14'b0)? 1'b1 : 1'b0;

always @(*) begin
	case(control_signal)
		STATE_INIT:
			res_do = 8'b0;
		STATE_WRITERES: begin
			if(is_object)
				res_do = smallestResult + 8'b1;
			else
				res_do = 8'b0;
		end
		STATE_WRITERES2: begin
			if(is_object)
				res_do = (smallestResult + 8'b1 < res_data[4])? smallestResult + 8'b1 : res_data[4];
			else
				res_do = 8'b0;
		end
		default:
			res_do = 8'b0;
	endcase
end

always @(*) begin
	case(control_signal)
		STATE_INIT: 
			res_wr = 1'b1;
		STATE_WRITERES:
			res_wr = 1'b1;
		STATE_WRITERES2:
			res_wr = 1'b1;
		default:
			res_wr = 1'b0;
	endcase
end

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		for(i = 0; i < 4; i = i + 1)
			res_data[i] <= 8'b0;
	end
	else begin
		case(control_signal)
			STATE_READRES: begin
				res_data[rd_idx] <= res_di;
			end
			STATE_READRES2: begin
				res_data[rd_idx] <= res_di;
			end
		endcase
	end
end
endmodule
/*------wrRes end------*/

/*------rdRes start------*/
module rdRes(clk, reset, control_signal, global_idx, res_rd, res_addr, rd_idx, rd_res_done);
input clk, reset;
input [13:0] global_idx;
input [3:0] control_signal;

output res_rd;
output [13:0] res_addr;
output [2:0] rd_idx;
output rd_res_done;

wire [13:0] rd_addr_idx_fw [3:0];
wire [13:0] rd_addr_idx_bc [4:0];

reg [2:0] rd_idx;
reg [13:0] res_addr;

parameter [3:0] STATE_INIT = 4'b0,
				STATE_CHECKSTI = 4'b1,
				STATE_READRES = 4'b10,
				STATE_WRITERES = 4'b11,
				STATE_INIT2 = 4'b100,
				STATE_CHECKSTI2 = 4'b101,
				STATE_READRES2 = 4'b110,
				STATE_WRITERES2 = 4'b111,
				STATE_DONE = 4'b1000;

assign res_rd = ((control_signal == STATE_READRES)||(control_signal == STATE_READRES2))? 1'b1 : 1'b0;

assign rd_addr_idx_fw[0] = global_idx - 14'b10000001; // 129
assign rd_addr_idx_fw[1] = global_idx - 14'b10000000; // 128
assign rd_addr_idx_fw[2] = global_idx - 14'b1111111; // 127
assign rd_addr_idx_fw[3] = global_idx - 14'b1; // 2

assign rd_addr_idx_bc[0] = global_idx + 14'b10000001; // 129
assign rd_addr_idx_bc[1] = global_idx + 14'b10000000; // 128
assign rd_addr_idx_bc[2] = global_idx + 14'b1111111; // 127
assign rd_addr_idx_bc[3] = global_idx + 14'b1; // 2
assign rd_addr_idx_bc[4] = global_idx; // self

// assign res_addr = rd_addr_idx_fw[rd_idx];
always@(*) begin
	case(control_signal)
		STATE_READRES: begin
			res_addr = rd_addr_idx_fw[rd_idx];
		end
		default: begin
			res_addr = rd_addr_idx_bc[rd_idx];
		end
	endcase
end

assign rd_res_done = ((control_signal == STATE_READRES) && (rd_idx == 3'b11) || ((control_signal == STATE_READRES2) && (rd_idx == 3'b100)))? 1'b1 : 1'b0;

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		rd_idx <= 3'b0;
	end
	else begin
		case(control_signal)
			STATE_READRES: begin
				rd_idx <= rd_idx + 3'b1;
			end
			STATE_WRITERES: begin
				rd_idx <= 3'b0;
			end
			STATE_READRES2: begin
				rd_idx <= rd_idx + 3'b1;
			end
			STATE_WRITERES2: begin
				rd_idx <= 3'b0;
			end
		endcase
	end
end

endmodule
/*------rdRes end------*/

/*------getSmallest start------*/
module getSmallest(element1, element2, element3, element4, final_result);
input [7:0] element1, element2, element3, element4;
output [7:0] final_result;
wire [7:0] result1, result2;

assign result1 = (element1 < element2)? element1 : element2;
assign result2 = (element3 < element4)? element3 : element4;
assign final_result = (result1 < result2)? result1 : result2;
endmodule
/*------getSmallest end------*/





