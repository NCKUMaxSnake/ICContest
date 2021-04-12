module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output match;
reg match;
output [4:0] match_index;
reg [4:0] match_index;
output valid;
// reg valid;

reg [1:0] current_state, next_state;
parameter [1:0] STATE_GETSTRPAT = 0,
                STATE_COMPARE   = 1,
                STATE_OUTPUT    = 2;

reg [7:0] strings [32:0];
reg [7:0] patterns [7:0];

// counter part
reg recnt_flag;
wire [4:0] cnt_num;
reg  [4:0] strings_num;
reg  [2:0] patterns_num;

reg [1:0] isStrPat;

// compare part
wire [7:0] string_cp_char;
reg [7:0] pattern_cp_char;
reg [4:0] start_cp_bit; // for start compare from string bit
reg [2:0] current_cp_bit; // for current compare bit
wire cp_complete; // check complete compare
wire  tmp_result;
reg  match_done;

// star part
reg [3:0] idx8;
wire star;
reg star_flag;
reg [4:0] star_index;

// for loop
integer idx;

Counter32 GET(.clk(clk),.reset(reset), .recount_counter32(recnt_flag), .count_out(cnt_num), .isstring(isstring), .ispattern(ispattern));
Compare CP( .next_state(next_state), .string_cp_char(string_cp_char), .pattern_cp_char(pattern_cp_char), .result(tmp_result), .star(star));

assign valid = (current_state == STATE_OUTPUT) ? 1 : 0;

// State register
always@(posedge clk or posedge reset) begin
    if(reset)
        current_state <= STATE_GETSTRPAT;
    else
        current_state <= next_state;
end

// Next state logic
always@(*) begin
    case(current_state)
        STATE_GETSTRPAT: begin
            if(!(isstring || ispattern)) // NOR
                next_state = STATE_COMPARE;
            else
                next_state = STATE_GETSTRPAT;
        end
        STATE_COMPARE: begin
            if(cp_complete)
                next_state = STATE_OUTPUT;
            else
                next_state = STATE_COMPARE;
        end
        STATE_OUTPUT: begin
            next_state = STATE_GETSTRPAT;
        end
    endcase // current_state
end

// recountFlag output logic
always@(*) begin
    case(current_state)
        STATE_GETSTRPAT: begin
            if(next_state == STATE_COMPARE)
                recnt_flag = 1;
            else
                recnt_flag = 0;
        end
        STATE_COMPARE: begin
            if(next_state == STATE_OUTPUT)
                recnt_flag = 1;
            else
                recnt_flag = 0;
        end
        STATE_OUTPUT:
            recnt_flag = 0;
    endcase // current_state
end

// always@(*) begin
//     if(current_state == STATE_OUTPUT && isstring) begin
//         // for(idx = 0; idx < 33; idx = idx + 1)
//         //     strings[idx] = 8'b11111111;
//         //current_state = STATE_GETSTRPAT;
//     end
//     else if(ispattern) begin
//         //current_state = STATE_GETSTRPAT;
//     end
// end

//compare part
//character table
// '^' dec:94, hex:5E
// '$' dec:36, hex:24
// '.' dec:46, hex:2E
// '*' dec:42, hex:2A
// ' ' dec:32, hex:20

// //register strings pattern get
// always@(posedge clk or posedge reset) begin

//     if(reset) begin
//         // for(idx = 0; idx < 33; idx = idx + 1)
//         //     strings[idx]  <= 8'b11111111;
//         // for(idx = 0; idx < 8; idx = idx + 1)
//         //     patterns[idx] <= 8'b11111111;
//     end
//     else begin
//         case(current_state)
//             STATE_GETSTRPAT: begin
//                 // if(isstring) begin
//                 //     strings[cnt_num] <= chardata;
//                 //     //strings_num <= cnt_num;
//                 // end
//                 // else if (ispattern) begin
//                 //     patterns[cnt_num] <= chardata;
//                 //     //patterns_num <= cnt_num;
//                 // end
                
//                 if(current_state == STATE_COMPARE) begin // '*'->'.'
//                     if(patterns[0] == 42)
//                         patterns[0] = 46;
//                     else if(patterns[patterns_num] == 42)
//                         patterns[patterns_num] = 46;
//                     else
//                         patterns[0] = patterns[0];
//                 end
//                 else
//                     patterns[0] <= patterns[0];
                
//             end
//             STATE_COMPARE: begin
//                 // if(match_done) begin
//                 // for(idx = 0; idx < 8; idx = idx + 1)
//         				// patterns[idx] = 8'b11111111;
//                 // end
//                 // strings[0]  <= strings[0];
//                 // patterns[0] <= patterns[0];
//             end
//             STATE_OUTPUT: begin
//             	// if(isstring) begin
//              //        strings[0] <= chardata;
//              //        for(idx = 1; idx < 33; idx = idx + 1)
//              //        	strings[idx] <= 8'b11111111;
//              //    end
//              //    else if (ispattern) begin
//              //        patterns[0] <= chardata;
//              //        for(idx = 1; idx < 8; idx = idx + 1)
//              //        	patterns[idx] <= 8'b11111111;
//              //    end
//             end
//         endcase
//     end
// end

//compare part
//character table
// '^' dec:94, hex:5E
// '$' dec:36, hex:24
// '.' dec:46, hex:2E
// '*' dec:42, hex:2A
// ' ' dec:32, hex:20
assign string_cp_char = strings[6'b0 + start_cp_bit + current_cp_bit];

always@(*) begin
    if(start_cp_bit == 0 && patterns[0] == 94)
        pattern_cp_char = patterns[current_cp_bit + 1];
    else
        pattern_cp_char = patterns[current_cp_bit];
end

assign cp_complete = ((start_cp_bit == strings_num) || match_done)? 1:0;

always@(*) begin
    if(patterns[0] == 94 && start_cp_bit!= 0) // patterns[0] == '^'
        match_index = star_flag?star_index : start_cp_bit + 1;
    else
        match_index = star_flag?star_index : start_cp_bit;
end

always@(posedge clk or posedge reset) begin
    if(reset) begin
    	//test
    	for(idx = 0; idx < 33; idx = idx + 1)
            strings[idx]  <= 8'b11111111;
        for(idx = 0; idx < 8; idx = idx + 1)
            patterns[idx] <= 8'b11111111;
    	//test
        start_cp_bit <= 5'b0;
        current_cp_bit <= 3'b0;
        match <= 1'b1;
        match_done <= 0;
        idx8 <= 0;
        star_flag <= 0;
        star_index <= 5'b0;

        isStrPat <= 2'b0;
    end
    else begin
        case(current_state)
            STATE_COMPARE: begin
                if(current_cp_bit == patterns_num || //1 pattern compare complete
                   start_cp_bit == 0 && patterns[0] == 94 && current_cp_bit == patterns_num - 1) begin //str:123 pat:^123
                    current_cp_bit <= 3'b0;
                    if(match & tmp_result) begin
                        match_done <= 1;
                        start_cp_bit <= start_cp_bit;
                    end
                    else begin
                        match_done <= 0;
                        start_cp_bit <= start_cp_bit + 1;
                    end
                    match <= 1;
                    star_flag <= star_flag;
                    star_index <= star_index;
                end
                else if(start_cp_bit == strings_num) begin // compare done
                    current_cp_bit <= 5'b0;
                    start_cp_bit <= 3'b0;

                    match <= 0;
                    match_done <= 0;
                end
                else begin // 1 pattern compare not complete
                    if(star && match) begin
                        start_cp_bit <= start_cp_bit + current_cp_bit;
                        current_cp_bit <= 3'b0;
                        match <= 1;
                        match_done <= 0;

                        for(idx = 0; idx < 8; idx = idx + 1) begin
                            if(idx - (current_cp_bit + 1) >= 0) begin
                                patterns[idx - (current_cp_bit + 1)] <= patterns[idx];
                                patterns[idx] <= 8'b11111111;
                            end
                        end
                        patterns_num <= patterns_num - (current_cp_bit + 1);
                        star_flag <= 1;
                        star_index <= start_cp_bit;
                    end
                    else begin
                        current_cp_bit <= current_cp_bit + 1;
                        match <= match & tmp_result;
                        match_done <= 0;
                    end
                end
            end
            STATE_OUTPUT: begin
                start_cp_bit <= 5'b0;
                current_cp_bit <= 3'b0;
                match_done <= 0;
                star_flag <= 0;
                star_index <= 5'b0;
                for(idx = 0; idx < 8; idx = idx + 1)
                    patterns[idx] <= 8'b11111111;

                if(isstring) begin
                    strings[0] <= chardata;
                    strings_num <= cnt_num;
                    for(idx = 1; idx < 33; idx = idx + 1)
                    	strings[idx] <= 8'b11111111;
                end
                else if (ispattern) begin
                    patterns[0] <= chardata;
                    patterns_num <= cnt_num;
                    for(idx = 1; idx < 8; idx = idx + 1)
                    	patterns[idx] <= 8'b11111111;
                end
            end
            STATE_GETSTRPAT: begin
                start_cp_bit <= 5'b0;
                current_cp_bit <= 3'b0;
                match <= 1;
                match_done <= 0;
                star_flag <= 0;
                star_index <= 5'b0;

                if(isstring) begin
                    strings[cnt_num] <= chardata;
                    strings_num <= cnt_num;
                    isStrPat <= 2'b10;
                end
                else if(ispattern && isStrPat == 2'b10) begin
                    patterns[0] <= chardata;
                    patterns_num <= cnt_num;
                    isStrPat <= 2'b01;
                end
                else if (ispattern) begin
                    patterns[cnt_num] <= chardata;
                    patterns_num <= cnt_num;
                end
            end
        endcase
    end
end

endmodule

//Module Counter32
module Counter32(clk, reset, recount_counter32, count_out, isstring, ispattern);
input clk, reset, recount_counter32, isstring, ispattern;
output [4:0] count_out;
reg [4:0] count_out;
reg [1:0] isStrPat;

always@(posedge clk or posedge reset) begin
    if(reset)
        count_out <= 0;
    else begin
        if(recount_counter32)
            count_out <= 0;
        else if(isStrPat == 2'b10 && ispattern)
            count_out <= 1;
        else
            count_out <= count_out + 1;
    end
end

always@(posedge clk or posedge reset) begin
    if(reset)
        isStrPat <= 2'b0;
    else
        if(isstring)
            isStrPat <= 2'b10;
        else if(ispattern)
            isStrPat <= 2'b01;
        else
            isStrPat <= 2'b01;
end
// always@(posedge clk or posedge reset) begin
// 	if(reset)
// 		isStrPat = 0;
// 	else
// end

// always@(negedge isstring) begin
//     if(!isstring)
//         count_out <= 0;
//     else
//         count_out <= count_out;
// end
endmodule

module Compare(next_state, string_cp_char, pattern_cp_char, result, star);
    input [1:0] next_state;
    input [7:0] string_cp_char, pattern_cp_char;

    output result;
    reg result;
    output star;
    reg star;

    //character table
    // '^' dec:94, hex:5E
    // '$' dec:36, hex:24
    // '.' dec:46, hex:2E
    // '*' dec:42, hex:2A
    // ' ' dec:32, hex:20

    always@(*) begin
        if( string_cp_char == pattern_cp_char || // Str_char and Pat_char are exactly same
            pattern_cp_char == 8'd46 || // Pat_char is '.'
            pattern_cp_char == 8'd94 && string_cp_char == 8'd32 || // Pat_char is '^' and Str_char is ' '.
            pattern_cp_char == 8'd36 && (string_cp_char == 8'd32 || string_cp_char == 8'b11111111)|| // Pat_char is '$' and Str_char is ' '.
            next_state == 2) begin// STATE_OUTPUT begin
            result = 1;
            star = 0;
        end
        else if(pattern_cp_char == 42) begin //Pat_char is '*'
            result = 1;
            star = 1;
        end
        else begin
            result = 0;
            star = 0;        
        end
    end
endmodule












