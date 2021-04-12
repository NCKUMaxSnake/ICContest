module huffman( clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);
input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output CNT_valid;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output code_valid;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;
//====================================================================
//====================================================================
// control part
wire [2:0] _control_signal;
// count part
wire _count_done;
// sort part
wire _sort_done;
wire [13:0] _sort_arr [5:0];
// resort part
wire _resort_done;
// tree part
wire _tree_done;
wire [13:0] _huff_tree [9:0];
//encode
wire _encode_done;

controlUnit CTRL(.clk(clk), .reset(reset), .control_signal(_control_signal), .CNT_valid(CNT_valid),
				 .count_done(_count_done), .sort_done(_sort_done), .resort_done(_resort_done), .tree_done(_tree_done), .encode_done(_encode_done));

grayCounter GRAYCOUNTER(.clk(clk), .reset(reset), .control_signal(_control_signal), .gray_valid(gray_valid), .gray_data(gray_data),
						.finish_flag(_count_done), .CNT1(CNT1), .CNT2(CNT2), .CNT3(CNT3), .CNT4(CNT4), .CNT5(CNT5), .CNT6(CNT6));

sorting SORT( .clk(clk), .reset(reset), .control_signal(_control_signal),
			  .CNT1(CNT1), .CNT2(CNT2), .CNT3(CNT3), .CNT4(CNT4), .CNT5(CNT5), .CNT6(CNT6),.finish_flag(_sort_done),
			  .out_arr1(_sort_arr[0]), .out_arr2(_sort_arr[1]), .out_arr3(_sort_arr[2]),
			  .out_arr4(_sort_arr[3]), .out_arr5(_sort_arr[4]), .out_arr6(_sort_arr[5]));

huffTree TREE( .clk(clk), .reset(reset), .control_signal(_control_signal), .sorted_arr1(_sort_arr[0]), .sorted_arr2(_sort_arr[1]),
			   .sorted_arr3(_sort_arr[2]), .sorted_arr4(_sort_arr[3]), .sorted_arr5(_sort_arr[4]), .sorted_arr6(_sort_arr[5]),
			   .resort_finish(_resort_done), .tree_finish(_tree_done), .huff_tree1(_huff_tree[0]), .huff_tree2(_huff_tree[1]),
			   .huff_tree3(_huff_tree[2]), .huff_tree4(_huff_tree[3]), .huff_tree5(_huff_tree[4]), .huff_tree6(_huff_tree[5]),
			   .huff_tree7(_huff_tree[6]), .huff_tree8(_huff_tree[7]), .huff_tree9(_huff_tree[8]), .huff_tree10(_huff_tree[9]));

encodeHuff ENCODE(.clk(clk), .reset(reset), .control_signal(_control_signal), .huff_tree1(_huff_tree[0]), .huff_tree2(_huff_tree[1]),
			   .huff_tree3(_huff_tree[2]), .huff_tree4(_huff_tree[3]), .huff_tree5(_huff_tree[4]), .huff_tree6(_huff_tree[5]),
			   .huff_tree7(_huff_tree[6]), .huff_tree8(_huff_tree[7]), .huff_tree9(_huff_tree[8]), .huff_tree10(_huff_tree[9]),
			   .HC1(HC1), .HC2(HC2), .HC3(HC3), .HC4(HC4), .HC5(HC5), .HC6(HC6), .M1(M1), .M2(M2), .M3(M3), .M4(M4), .M5(M5), .M6(M6), 
			   .encode_finish(_encode_done), .code_valid(code_valid));

endmodule

/*------------controlUnit begin------------*/
module controlUnit(clk, reset, count_done, sort_done, resort_done, tree_done, encode_done, control_signal, CNT_valid);
input clk, reset;
input count_done, sort_done, resort_done, tree_done, encode_done;
output [2:0] control_signal;
output CNT_valid;

reg delay;
reg [2:0] current_state, next_state, control_signal;

parameter [2:0] STATE_INIT    	= 3'b0,
				STATE_GETCNT  	= 3'b1,
				STATE_CNTDONE 	= 3'b10,
				STATE_SORT	  	= 3'b11,
				STATE_TREE		= 3'b100,
				STATE_RESORT	= 3'b101,
				STATE_ENCODE	= 3'b110,
				STATE_FINISH	= 3'b111;

assign CNT_valid = (current_state == STATE_CNTDONE) ? 1 : 0;

always @(posedge clk or posedge reset) begin
	if(reset) begin
		delay <= 1'b0;
	end 
	else begin
		delay <= delay + 1'b1;
	end
end

always @(posedge clk or posedge reset) begin
	if(reset) begin
		current_state <= 3'b0;
	end 
	else begin
		current_state <= next_state;
	end
end

always@(*) begin
	case(current_state)
		STATE_INIT: begin
			if(delay)
				next_state = STATE_GETCNT;
			else
				next_state = STATE_INIT;
		end
		STATE_GETCNT: begin
			if(count_done == 1'b1)
				next_state = STATE_CNTDONE;
			else
				next_state = STATE_GETCNT;
		end
		STATE_CNTDONE:
			next_state = STATE_SORT;
		STATE_SORT: begin
			if(sort_done == 1'b1)
				next_state = STATE_TREE;
			else
				next_state = STATE_SORT;
		end
		STATE_TREE: begin
			if(tree_done)
				next_state = STATE_ENCODE;
			else
				next_state = STATE_RESORT;
		end
		STATE_RESORT: begin
			if(resort_done)
				next_state = STATE_TREE;
			else
				next_state = STATE_RESORT;
		end
		STATE_ENCODE: begin
			if(encode_done)
				next_state = STATE_FINISH;
			else
				next_state = STATE_ENCODE;
		end
		STATE_FINISH:
			next_state = STATE_FINISH;
	endcase // current_state
end

always@(*) begin
	case(current_state)
		STATE_INIT:
			control_signal = STATE_INIT;
		STATE_GETCNT:
			control_signal = STATE_GETCNT;
		STATE_CNTDONE:
			control_signal = STATE_CNTDONE;
		STATE_SORT:
			control_signal = STATE_SORT;
		STATE_TREE:
			control_signal = STATE_TREE;
		STATE_RESORT:
			control_signal = STATE_RESORT;
		STATE_ENCODE:
			control_signal = STATE_ENCODE;
		STATE_FINISH:
			control_signal = STATE_FINISH;
	endcase // current_state
end
endmodule
/*------------controlUnit end------------*/

/*------------graycounter begin------------*/
module grayCounter( clk, reset, control_signal, gray_valid, gray_data,
					finish_flag, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6);
input clk, reset;
input [2:0] control_signal;
input gray_valid;
input [7:0] gray_data;

output finish_flag;
output [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;

reg [7:0] symbol_counter [5:0]; //symbol count

integer i;
parameter [2:0] STATE_INIT    	= 3'b0,
				STATE_GETCNT  	= 3'b1,
				STATE_CNTDONE 	= 3'b10,
				STATE_SORT	  	= 3'b11,
				STATE_TREE		= 3'b100,
				STATE_RESORT	= 3'b101,
				STATE_ENCODE	= 3'b110,
				STATE_FINISH	= 3'b111;

assign CNT1 = symbol_counter[0];
assign CNT2 = symbol_counter[1];
assign CNT3 = symbol_counter[2];
assign CNT4 = symbol_counter[3];
assign CNT5 = symbol_counter[4];
assign CNT6 = symbol_counter[5];
assign finish_flag = (symbol_counter[0] + symbol_counter[1] + symbol_counter[2] + 
					  symbol_counter[3] + symbol_counter[4] + symbol_counter[5] == 8'h64/*8d'100*/) ? 1'b1 : 1'b0;

always@(posedge clk or posedge reset) begin
	if(reset) begin
		for (i = 0; i < 6; i = i + 1)
			symbol_counter[i] <= 8'b0;
	end
	else begin
		case(control_signal)
			STATE_INIT: begin
				for (i = 0; i < 6; i = i + 1)
					symbol_counter[i] <= 8'b0;
			end
			STATE_GETCNT: begin
				symbol_counter[gray_data - 8'b1] <= symbol_counter[gray_data - 8'b1] + 8'b1;
			end
		endcase // control_signal
	end
end
endmodule
/*------------graycounter end------------*/

/*------------sorting start------------*/
module sorting( clk, reset, control_signal, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6, finish_flag, 
				out_arr1, out_arr2, out_arr3, out_arr4, out_arr5, out_arr6);
input clk, reset;
input [2:0] control_signal;
input [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;

output finish_flag;
output [13:0] out_arr1, out_arr2, out_arr3, out_arr4, out_arr5, out_arr6;

reg [13:0] sorted_array_index [5:0];
reg sort_idx;
reg [2:0] sort_cnt;

parameter [2:0] STATE_INIT    	= 3'b0,
				STATE_GETCNT  	= 3'b1,
				STATE_CNTDONE 	= 3'b10,
				STATE_SORT	  	= 3'b11,
				STATE_TREE		= 3'b100,
				STATE_RESORT	= 3'b101,
				STATE_ENCODE	= 3'b110,
				STATE_FINISH	= 3'b111;
integer i;

assign out_arr1 = sorted_array_index[0];
assign out_arr2 = sorted_array_index[1];
assign out_arr3 = sorted_array_index[2];
assign out_arr4 = sorted_array_index[3];
assign out_arr5 = sorted_array_index[4];
assign out_arr6 = sorted_array_index[5];
assign finish_flag = (sort_cnt == 6);


always@(posedge clk or posedge reset) begin
	if(reset)
		sort_idx <= 1'b0;
	else
		sort_idx <= ~sort_idx;
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		sort_cnt <= 3'b0;
	end
	else begin
		case(control_signal)
			STATE_SORT: begin
				sort_cnt <= (sort_cnt == 6) ? sort_cnt : sort_cnt + 3'b1;
			end
		endcase
	end
end

always@(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 6; i = i + 1)
			sorted_array_index[i] <= 8'b0;
	end
	else begin
		case(control_signal)
			STATE_CNTDONE: begin
				sorted_array_index[0] <= {CNT1, 6'b000001};
				sorted_array_index[1] <= {CNT2, 6'b000010};
				sorted_array_index[2] <= {CNT3, 6'b000100};
				sorted_array_index[3] <= {CNT4, 6'b001000};
				sorted_array_index[4] <= {CNT5, 6'b010000};
				sorted_array_index[5] <= {CNT6, 6'b100000};
			end
			STATE_SORT: begin
				if(~sort_idx) begin
					for(i = 0; i < 6; i = i + 2) begin
						sorted_array_index[ i ] <= (sorted_array_index[i][13:6] > sorted_array_index[i+1][13:6] || 
													sorted_array_index[i][13:6] == sorted_array_index[i+1][13:6] && sorted_array_index[i][5:0] < sorted_array_index[i+1][5:0])
													? sorted_array_index[i+1] : sorted_array_index[i]; 
						sorted_array_index[i+1] <= (sorted_array_index[i][13:6] > sorted_array_index[i+1][13:6] ||
													sorted_array_index[i][13:6] == sorted_array_index[i+1][13:6] && sorted_array_index[i][5:0] < sorted_array_index[i+1][5:0])
													? sorted_array_index[i]   : sorted_array_index[i+1]; 
					end
				end
				else begin
					for(i = 1; i < 5; i = i + 2) begin
						sorted_array_index[ i ] <= (sorted_array_index[i][13:6] > sorted_array_index[i+1][13:6] ||
													sorted_array_index[i][13:6] == sorted_array_index[i+1][13:6] && sorted_array_index[i][5:0] < sorted_array_index[i+1][5:0])
													? sorted_array_index[i+1] : sorted_array_index[i]; 
						sorted_array_index[i+1] <= (sorted_array_index[i][13:6] > sorted_array_index[i+1][13:6] ||
													sorted_array_index[i][13:6] == sorted_array_index[i+1][13:6] && sorted_array_index[i][5:0] < sorted_array_index[i+1][5:0])
													? sorted_array_index[i]   : sorted_array_index[i+1];
					end
				end
			end
		endcase
	end
end
endmodule
/*------------sorting end------------*/
/*------------hufftree start------------*/
module huffTree(clk, reset, control_signal, sorted_arr1, sorted_arr2, sorted_arr3, sorted_arr4, sorted_arr5, sorted_arr6,
				resort_finish, tree_finish, huff_tree1, huff_tree2, huff_tree3, huff_tree4, huff_tree5, huff_tree6,
				huff_tree7, huff_tree8, huff_tree9, huff_tree10);
input clk, reset;
input [2:0] control_signal;
input [13:0] sorted_arr1, sorted_arr2, sorted_arr3, sorted_arr4, sorted_arr5, sorted_arr6;
output resort_finish, tree_finish;
output [13:0] huff_tree1, huff_tree2, huff_tree3, huff_tree4, huff_tree5, huff_tree6, huff_tree7, huff_tree8, huff_tree9, huff_tree10;

reg [13:0] huff_tree [9:0];
reg [13:0] sorted_arr [5:0];
reg [3:0]  tree_cnt;

reg [2:0] sort_cnt;
reg resort_finish, tree_finish;

wire [3:0] next_tree_cnt;
parameter [2:0] STATE_INIT    	= 3'b0,
				STATE_GETCNT  	= 3'b1,
				STATE_CNTDONE 	= 3'b10,
				STATE_SORT	  	= 3'b11,
				STATE_TREE		= 3'b100,
				STATE_RESORT	= 3'b101,
				STATE_ENCODE	= 3'b110,
				STATE_FINISH	= 3'b111;

integer i;

assign next_tree_cnt = tree_cnt + 2;

assign huff_tree1  = huff_tree[0];
assign huff_tree2  = huff_tree[1];
assign huff_tree3  = huff_tree[2];
assign huff_tree4  = huff_tree[3];
assign huff_tree5  = huff_tree[4];
assign huff_tree6  = huff_tree[5];
assign huff_tree7  = huff_tree[6];
assign huff_tree8  = huff_tree[7];
assign huff_tree9  = huff_tree[8];
assign huff_tree10 = huff_tree[9];

always@(posedge clk or posedge reset) begin
	if(reset) begin
		sort_cnt <= 0;
	end
	else begin
		case(control_signal)
			STATE_TREE: begin
				sort_cnt <= 0;
			end
			STATE_RESORT: begin
				sort_cnt <= sort_cnt + 1;
			end
		endcase
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 10; i = i + 1)
			huff_tree[i] <= 14'b0;
		for(i = 0; i < 6; i = i + 1)
			sorted_arr[i] <= 14'b0;
		tree_cnt <= 4'b0;
		resort_finish <= 0;
		tree_finish   <= 0;
	end
	else begin
		case(control_signal)
			STATE_SORT: begin //init
				sorted_arr[0] <= sorted_arr1;
				sorted_arr[1] <= sorted_arr2;
				sorted_arr[2] <= sorted_arr3;
				sorted_arr[3] <= sorted_arr4;
				sorted_arr[4] <= sorted_arr5;
				sorted_arr[5] <= sorted_arr6;
			end
			STATE_TREE: begin
				// Tree add
				huff_tree[tree_cnt] <= sorted_arr[0];
				huff_tree[tree_cnt + 1] <= sorted_arr[1];
				tree_cnt <= next_tree_cnt;

				//Preprocessing before sort
				resort_finish <= 0;
				sorted_arr[0] <= sorted_arr[0] + sorted_arr[1];
				sorted_arr[1] <= sorted_arr[2];
				sorted_arr[2] <= sorted_arr[3];
				sorted_arr[3] <= sorted_arr[4];
				sorted_arr[4] <= sorted_arr[5];
				sorted_arr[5] <= 14'h3FFF; // 2'b11111111111111
				if(tree_cnt == 4'b1000)
					tree_finish <= 1'b1;
				else
					tree_finish <= 1'b0;
			end
			STATE_RESORT: begin
				if(sorted_arr[sort_cnt][13:6] > sorted_arr[sort_cnt + 1][13:6]) begin
					sorted_arr[sort_cnt]     <= sorted_arr[sort_cnt + 1];
					sorted_arr[sort_cnt + 1] <= sorted_arr[sort_cnt];
					if(sort_cnt == 4)
						resort_finish <= 1'b1;
				end
				else
					resort_finish <= 1'b1;
			end
		endcase	
	end
end
endmodule
/*------------hufftree end------------*/
/*------------encode start------------*/
module encodeHuff(clk, reset, control_signal, huff_tree1, huff_tree2, huff_tree3, huff_tree4, huff_tree5, huff_tree6,
				huff_tree7, huff_tree8, huff_tree9, huff_tree10, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6,
				encode_finish, code_valid);
input clk, reset;
input [2:0] control_signal;
input [13:0] huff_tree1, huff_tree2, huff_tree3, huff_tree4, huff_tree5, huff_tree6, huff_tree7, huff_tree8, huff_tree9, huff_tree10;
output [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output [7:0] M1, M2, M3, M4, M5, M6;
output encode_finish, code_valid;

reg [7:0] hc [5:0];
reg [7:0] M1, M2, M3, M4, M5, M6;
reg [7:0] idx [5:0];
reg [13:0] huff_tree [9:0];
reg [3:0]  tree_cnt;
reg encode_finish;
reg code_valid;

parameter [2:0] STATE_INIT    	= 3'b0,
				STATE_GETCNT  	= 3'b1,
				STATE_CNTDONE 	= 3'b10,
				STATE_SORT	  	= 3'b11,
				STATE_TREE		= 3'b100,
				STATE_RESORT	= 3'b101,
				STATE_ENCODE	= 3'b110,
				STATE_FINISH	= 3'b111;

integer i;

assign HC1 = hc[0];
assign HC2 = hc[1];
assign HC3 = hc[2];
assign HC4 = hc[3];
assign HC5 = hc[4];
assign HC6 = hc[5];

always@(*) begin
	for(i = 0; i < 8; i = i + 1) begin
		M1[i] = i < idx[0] ? 1 : 0;
		M2[i] = i < idx[1] ? 1 : 0;
		M3[i] = i < idx[2] ? 1 : 0;
		M4[i] = i < idx[3] ? 1 : 0;
		M5[i] = i < idx[4] ? 1 : 0;
		M6[i] = i < idx[5] ? 1 : 0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		for(i = 0; i < 10; i = i + 1)
			huff_tree[i] <= 14'b0;
		for(i = 0; i < 6; i = i + 1)
			hc[i] <= 8'b0;
		for(i = 0; i < 6; i = i + 1)
			idx[i] <= 8'b0;
		tree_cnt <= 8'b0; // 8'd8
		encode_finish <= 0;
		code_valid <= 0;
	end
	else begin
		case(control_signal)
			STATE_TREE: begin
				huff_tree[0] <= huff_tree1;
				huff_tree[1] <= huff_tree2;
				huff_tree[2] <= huff_tree3;
				huff_tree[3] <= huff_tree4;
				huff_tree[4] <= huff_tree5;
				huff_tree[5] <= huff_tree6;
				huff_tree[6] <= huff_tree7;
				huff_tree[7] <= huff_tree8;
				huff_tree[8] <= huff_tree9;
				huff_tree[9] <= huff_tree10;
			end
			STATE_ENCODE: begin
				if(tree_cnt < 8'b1010) begin
					// 1
					for(i = 0; i < 6; i = i + 1) begin
						if(huff_tree[tree_cnt][i] == 1) begin
							hc[i][idx[i]] <= 1;
							idx[i] <= idx[i] + 1;
						end 
					end
					// 0
					for(i = 0; i < 6; i = i + 1) begin
						if(huff_tree[tree_cnt + 1][i] == 1) begin
							hc[i][idx[i]] <= 0;
							idx[i] <= idx[i] + 1;
						end
					end
				end
				if(tree_cnt == 8'b1000)
					encode_finish <= 1;
				tree_cnt <= tree_cnt + 2;
			end
			STATE_FINISH: begin
				code_valid <= 1;
			end
		endcase
	end
end
endmodule
/*------------encode end------------*/





