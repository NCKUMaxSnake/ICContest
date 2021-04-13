module DT(clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, res_addr, res_do, res_di);
input 	clk;
input	reset;
output	done;
output	sti_rd;
output	[9:0]	sti_addr;
input	[15:0]	sti_di;
output	res_wr;
output	res_rd;
output	[13:0]	res_addr ;
output	[7:0]	res_do;
input	[7:0]	res_di;

wire [2:0]  _control_signal;
wire [13:0] _global_idx;
wire _read_req;

control CTRL(.clk(clk), .reset(reset), .current_state(_control_signal), .read_req(_read_req));
rdSti RDSTI(.clk(clk), .reset(reset), .control_signal(_control_signal),
			.sti_rd(sti_rd), .sti_addr(sti_addr), .global_idx(_global_idx), .read_req(_read_req));
wrRes WRRES(.clk(clk), .reset(reset), .control_signal(_control_signal),.global_idx(_global_idx), .sti_di(sti_di), .res_wr(res_wr), .res_do(res_do), .res_addr(res_addr));

endmodule

/*------control begin------*/
module control(clk, reset, current_state, read_req);
input clk, reset, read_req;
output [2:0] current_state;

reg [2:0] current_state, next_state;

parameter [2:0] STATE_INIT 		= 3'b0,
				STATE_STIRD1	= 3'b1,
				STATE_STIRD2	= 3'b10,
				STATE_RESWR1	= 3'b11;

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		current_state <= STATE_RESWR1; // init is WR
	end
	else begin
		current_state <= next_state;
	end
end

always@(*) begin
	case(current_state)
		STATE_INIT:
			next_state = STATE_STIRD1;
		STATE_STIRD1:
			next_state = STATE_STIRD2;
		STATE_STIRD2:
			next_state = STATE_RESWR1;
		STATE_RESWR1: begin
			if(read_req)
				next_state = STATE_STIRD1;
			else
				next_state = STATE_RESWR1;
		end
	endcase
end
endmodule
/*------control end------*/

/*------rdsti begin------*/
module rdSti(clk, reset, control_signal, sti_rd, sti_addr, global_idx, read_req);
input clk, reset;
input [2:0] control_signal;
output sti_rd;
output [9:0] sti_addr;
output [13:0] global_idx;
output read_req;

reg [13:0] global_idx;
// wire [9:0]  block_idx;
wire [3:0]  local_idx;

parameter [2:0] STATE_INIT 		= 3'b0,
				STATE_STIRD1	= 3'b1,
				STATE_STIRD2	= 3'b10,
				STATE_RESWR1	= 3'b11;

assign read_req = (local_idx == 4'b1111);
assign sti_rd = /*read_req &&*/ (control_signal == STATE_STIRD1 || control_signal == STATE_STIRD2);
assign sti_addr = (control_signal == STATE_STIRD1) ? global_idx[13:4] - 10'b1000 : global_idx[13:4]; /*block_idx*/
assign local_idx = global_idx[3:0];

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		global_idx <= 14'b1111111; //d'127
	end
	else begin
		case(control_signal)
			STATE_RESWR1: begin
				global_idx <= global_idx + 14'b1;
			end
		endcase
	end
end
endmodule
/*------rdsti end------*/

/*------wrres end------*/
module wrRes(clk, reset, control_signal, global_idx, sti_di, res_wr, res_do, res_addr);
input clk, reset;
input [2:0]  control_signal;
input [13:0] global_idx;
input [15:0] sti_di;

output res_wr;
output [7:0] res_do;
output [13:0] res_addr;

reg [15:0] top_block, buttom_block;
reg [1:0] top_left, buttom_left;

wire [3:0]  local_idx;

parameter [2:0] STATE_INIT 		= 3'b0,
				STATE_STIRD1	= 3'b1,
				STATE_STIRD2	= 3'b10,
				STATE_RESWR1	= 3'b11;
assign local_idx = global_idx[3:0];
assign res_wr = (control_signal == STATE_RESWR1) ? 1'b1 : 1'b0;
assign res_addr = global_idx;
// assign res_do = 8'b0 + buttom_block[global_idx[3:0]];
always@(*) begin
	if(local_idx == 4'b0)
end

always @(posedge clk or negedge reset) begin
	if (~reset) begin
		top_block <= 16'b0;
		buttom_block <= 16'b0;
	end
	else begin
		case(control_signal)
			STATE_STIRD1: begin
				top_block <= sti_di;
				top_left  <= top_block[15:14];
			end
			STATE_STIRD2: begin
				buttom_block <= sti_di;
				buttom_left  <= buttom_left[15:14];
			end
		endcase
	end
end

endmodule
/*------wrres end------*/