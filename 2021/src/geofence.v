module geofence ( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output valid;
output is_inside;
//reg valid;
//reg is_inside;

wire [2:0] _cur_state;

wire _read_done;
wire _cross_done;
wire _hexarea_done;
wire _heptarea_done;

// `include "DW_sqrt_function.inc"

// wire [9:0] _test1;

// DW_sqrt #(20, 0) U1(.a(20'b00100), .root(_test1));

CTRL CTRL (
	.clk(clk),
	.reset(reset),
	.read_done(_read_done),
	.cross_done(_cross_done),
	.hexarea_done(_hexarea_done),
	.heptarea_done(_heptarea_done),
	.cur_state(_cur_state),
	.valid(valid)
);

READ READ (
	.clk(clk),
	.reset(reset),
	.cur_state(_cur_state),
	.in_X(X),
	.in_Y(Y),
	.in_R(R),
	.read_done(_read_done),
	.cross_done(_cross_done),
	.hexarea_done(_hexarea_done),
	.heptarea_done(_heptarea_done),
	.is_inside(is_inside)
);

endmodule

/*---CTRL begin---*/
module CTRL (clk, reset, read_done, cross_done, hexarea_done, heptarea_done, cur_state, valid);
input clk, reset;
input read_done, cross_done, hexarea_done, heptarea_done;

output reg [2:0] cur_state;
reg [2:0] next_state;

output reg valid;

parameter [2:0] STATE_READ		= 4'b0000,
				STATE_VEC		= 4'b0001,
				STATE_CROSS		= 4'b0010,
				STATE_REODER	= 4'b0011,
				STATE_HEXAREA	= 4'b0100,
				STATE_SIDELEN	= 4'b0101,
				STATE_HEPTAREA	= 4'b0110,
				STATE_OUTPUT	= 4'b0111,
				STATE_FIN		= 4'b1111;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		cur_state <= STATE_READ;
	end
	else begin
		cur_state <= next_state;
	end
end

always @(*) begin
	case(cur_state)
		STATE_READ: begin
			if(read_done)
				next_state = STATE_VEC;
			else
				next_state = STATE_READ;
		end
		STATE_VEC:
			next_state = STATE_CROSS;
		STATE_CROSS: begin
			if(cross_done)
				next_state = STATE_REODER;
			else
				next_state = STATE_CROSS;
		end
		STATE_REODER: begin
			next_state = STATE_HEXAREA;
		end
		STATE_HEXAREA: begin
			if(hexarea_done)
				next_state = STATE_SIDELEN;
			else
				next_state = STATE_HEXAREA;
		end
		STATE_SIDELEN: begin
			next_state = STATE_HEPTAREA;
		end
		STATE_HEPTAREA: begin
			if(heptarea_done)
				next_state = STATE_OUTPUT;
			else
				next_state = STATE_SIDELEN;
		end
		STATE_OUTPUT: begin
			next_state = STATE_READ;
		end
		default: next_state = STATE_FIN;
	endcase
end

always @(*) begin
	case(cur_state)
		STATE_OUTPUT: 	valid = 1'b1;
		default:		valid = 1'b0;
	endcase
end
endmodule
/*---CTRL end---*/

/*---READ begin---*/
module READ(clk, reset, cur_state, in_X, in_Y, in_R,
			read_done, cross_done, hexarea_done, heptarea_done, is_inside);
input clk, reset;
input [2:0] cur_state;
input [9:0] in_X, in_Y;
input [10:0] in_R;

reg [2:0] rd_cnt;
reg [9:0] X [5:0];
reg [9:0] Y [5:0];
reg [10:0] R [5:0];

output read_done;

parameter [2:0] STATE_READ		= 4'b0000,
				STATE_VEC		= 4'b0001,
				STATE_CROSS		= 4'b0010,
				STATE_REODER	= 4'b0011,
				STATE_HEXAREA	= 4'b0100,
				STATE_SIDELEN	= 4'b0101,
				STATE_HEPTAREA	= 4'b0110,
				STATE_OUTPUT	= 4'b0111,
				STATE_FIN		= 4'b1111;
integer i;

assign read_done = (rd_cnt == 3'b101)? 1'b1: 1'b0;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		rd_cnt <= 3'b0;
	end
	else begin
		case(cur_state)
			STATE_READ:	rd_cnt <= rd_cnt + 3'b1;
			default:	rd_cnt <= 3'b0;
		endcase
	end
end

reg [2:0] reach_cnt [4:0];

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 6; i = i + 1) begin
			X[i] <= 10'b0;
			Y[i] <= 10'b0;
			R[i] <= 11'b0;
		end
	end
	else begin
		case(cur_state)
			STATE_READ: begin
				X[rd_cnt] <= in_X;
				Y[rd_cnt] <= in_Y;
				R[rd_cnt] <= in_R;
			end
			STATE_REODER: begin
				X[reach_cnt[0] + 3'b1] <= X[1];
				X[reach_cnt[1] + 3'b1] <= X[2];
				X[reach_cnt[2] + 3'b1] <= X[3];
				X[reach_cnt[3] + 3'b1] <= X[4];
				X[reach_cnt[4] + 3'b1] <= X[5];

				Y[reach_cnt[0] + 3'b1] <= Y[1];
				Y[reach_cnt[1] + 3'b1] <= Y[2];
				Y[reach_cnt[2] + 3'b1] <= Y[3];
				Y[reach_cnt[3] + 3'b1] <= Y[4];
				Y[reach_cnt[4] + 3'b1] <= Y[5];

				R[reach_cnt[0] + 3'b1] <= R[1];
				R[reach_cnt[1] + 3'b1] <= R[2];
				R[reach_cnt[2] + 3'b1] <= R[3];
				R[reach_cnt[3] + 3'b1] <= R[4];
				R[reach_cnt[4] + 3'b1] <= R[5];
			end
		endcase
	end
end

reg signed [10:0] vecX [4:0];
reg signed [10:0] vecY [4:0];

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 5; i = i + 1) begin
			vecX[i] <= 10'b0;
			vecY[i] <= 10'b0;
		end
	end
	else begin
		case(cur_state)
			STATE_VEC: begin
				vecX[0] <= X[1] - X[0];
				vecX[1] <= X[2] - X[0];
				vecX[2] <= X[3] - X[0];
				vecX[3] <= X[4] - X[0];
				vecX[4] <= X[5] - X[0];

				vecY[0] <= Y[1] - Y[0];
				vecY[1] <= Y[2] - Y[0];
				vecY[2] <= Y[3] - Y[0];
				vecY[3] <= Y[4] - Y[0];
				vecY[4] <= Y[5] - Y[0];
			end
		endcase
	end
end

// CROSS begin
output cross_done;

reg [2:0] outer_cnt;
reg [2:0] inner_cnt;
// reg [2:0] reach_cnt [4:0];

assign cross_done = (inner_cnt == 3'b100) && (outer_cnt == 3'b100)? 1'b1:1'b0;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		outer_cnt <= 3'b0;
		inner_cnt <= 3'b0;
	end
	else begin
		case(cur_state)
			STATE_CROSS: begin
				if(inner_cnt == 3'b100) begin
					inner_cnt <= 3'b0;
					if(outer_cnt == 3'b100)
						outer_cnt <= 3'b0;
					else
						outer_cnt <= outer_cnt + 3'b1;
				end
				else begin
					inner_cnt <= inner_cnt + 3'b1;
				end
			end
		endcase
	end
end

wire signed [21:0] front_res;
wire signed [21:0] back_res;
wire signed [21:0] final_res;
assign front_res = vecX[outer_cnt] * vecY[inner_cnt];
assign back_res  = vecX[inner_cnt] * vecY[outer_cnt];
assign final_res = front_res - back_res;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i = 0; i < 5; i = i + 1)
			reach_cnt[i] <= 3'b0;
	end
	else begin
		case(cur_state)
			STATE_CROSS: begin
				if(final_res < 0)
					reach_cnt[outer_cnt] <= reach_cnt[outer_cnt] + 3'b1;
			end
			STATE_READ: begin
				for(i = 0; i < 5; i = i + 1)
					reach_cnt[i] <= 3'b0;
			end
		endcase
	end
end

output hexarea_done;

reg [2:0] item1_cnt;
reg [2:0] item2_cnt;
reg [19:0] hex_area;

assign hexarea_done = (item1_cnt == 3'b101)? 1'b1:1'b0;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		item1_cnt <= 3'b0;
		item2_cnt <= 3'b1;
	end
	else begin
		case(cur_state)
			STATE_HEXAREA: begin
				item1_cnt <= item1_cnt + 3'b1;
				if(item2_cnt == 3'b101)
					item2_cnt <= 3'b0;
				else
					item2_cnt <= item2_cnt + 3'b1;
			end
			default: begin
				item1_cnt <= 3'b0;
				item2_cnt <= 3'b1;
			end
		endcase
	end
end

always @(posedge clk or posedge reset) begin
	if(reset)
		hex_area <= 19'b0;
	else begin
		case(cur_state)
			STATE_HEXAREA: begin
				hex_area <= hex_area + (X[item1_cnt] * Y[item2_cnt] - X[item2_cnt] * Y[item1_cnt]);
			end
			// STATE_SIDELEN: begin
			// 	hex_area <= hex_area >> 1;
			// end
			STATE_READ: begin
				hex_area <= 19'b0;
			end
		endcase
	end
end

reg [2:0] side_cnt;
reg [10:0] side_length;

reg signed [10:0] diff_x, diff_y;
wire signed [19:0] sqr_x, sqr_y;
wire signed [19:0] sqr_sum;

assign sqr_x = diff_x * diff_x;
assign sqr_y = diff_y * diff_y;
assign sqr_sum = sqr_x + sqr_y;

wire [9:0] root;

DW_sqrt #(20, 0) U1(.a(sqr_sum), .root(root));

always @(*) begin
	case(side_cnt)
		3'b101: begin
			diff_x = X[0] - X[side_cnt];
			diff_y = Y[0] - Y[side_cnt];
		end 
		default: begin
			diff_x = X[side_cnt + 3'b1] - X[side_cnt];
			diff_y = Y[side_cnt + 3'b1] - Y[side_cnt];
		end
	endcase
end

always @(posedge clk or posedge reset) begin
	if(reset)
		side_cnt <= 3'b0;
	else begin
		case(cur_state)
			STATE_HEPTAREA: begin
				side_cnt <= side_cnt + 3'b1;
			end
			STATE_READ: begin
				side_cnt <= 3'b0;
			end
		endcase
	end
end

always @(posedge clk or posedge reset) begin
	if(reset)
			side_length <= 11'b0;
	else begin
		case(cur_state)
			STATE_SIDELEN: begin
				side_length <= root;
			end
		endcase
	end
end

wire [11:0] side_sum;
reg [10:0] side_A, side_B;
assign side_sum = (side_A + side_B + side_length) >> 1;

always @(*) begin
	case(side_cnt)
		3'b101: begin
			side_A = R[side_cnt];
			side_B = R[0];
		end
		default: begin
			side_A = R[side_cnt];
			side_B = R[side_cnt + 3'b1];
		end
	endcase
end

wire [11:0] root1;
wire [11:0] root2;

wire [11:0] res1, res2, res3;
wire [23:0] res4, res5;

assign res1 = (side_sum > side_length)?side_sum - side_length:side_length - side_sum;
assign res2 = (side_sum > side_A)?side_sum - side_A:side_A - side_sum;
assign res3 = (side_sum > side_B)?side_sum - side_B:side_B - side_sum;
assign res4 = side_sum * res1;
assign res5 = res2 * res3;

DW_sqrt #(24, 0) U2(.a(res4), .root(root1));
DW_sqrt #(24, 0) U3(.a(res5), .root(root2));

reg [19:0] hept_area;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		hept_area <= 20'b0;
	end
	else begin
		case(cur_state)
			STATE_HEPTAREA:
				hept_area <= hept_area + (root1 * root2);
			STATE_READ:
				hept_area <= 20'b0;
		endcase
	end
end

output heptarea_done;
assign heptarea_done = (side_cnt == 3'b101)? 1'b1:1'b0;

output is_inside;
assign is_inside = ((hex_area >> 1) > hept_area)? 1'b1:1'b0;

endmodule
/*---READ end---*/


