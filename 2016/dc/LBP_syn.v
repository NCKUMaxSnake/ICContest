/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Apr 13 20:28:55 2021
/////////////////////////////////////////////////////////////


module CONTROL_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CONTROL_DW01_inc_1_DW01_inc_3 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module CONTROL ( clk, reset, gray_ready, read_done, current_state, 
        global_index, gray_req, lbp_valid, finish );
  output [2:0] current_state;
  output [13:0] global_index;
  input clk, reset, gray_ready, read_done;
  output gray_req, lbp_valid, finish;
  wire   n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51,
         N52, N53, N54, N55, N75, n9, n11, n12, n13, n14, n15, n17, n23, n24,
         n25, n26, n27, n28, n290, n300, n310, n320, n330, n340, n350, n360,
         n370, n380, n390, n400, n410, n420, n430, n440, n450, n460, n470,
         n480, n490, n500, n510, n520, n530, n540, n550, n56, n57, n58, n59,
         n60, n61, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n750, n76, n77, n78, n79, n80, n81, n82, n83, n85, n86, n87, n88,
         add_113_carry_2_, add_113_carry_3_, add_113_carry_4_,
         add_113_carry_5_, add_113_carry_6_, add_113_carry_7_,
         add_113_carry_8_, add_113_carry_9_, add_113_carry_10_,
         add_113_carry_11_, add_113_carry_12_, add_113_carry_13_, n2, n84, n89,
         n90, n91, n93, n94, n95, n96, n97, n98, n99, n100, n101, n117, n119;
  wire   [2:0] next_state;
  wire   [6:0] counter;
  wire   [6:1] next_counter;

  DFFRX1 counter_reg_6_ ( .D(n68), .CK(clk), .RN(n91), .Q(counter[6]), .QN(n60) );
  DFFRX1 counter_reg_5_ ( .D(n67), .CK(clk), .RN(n91), .Q(counter[5]), .QN(n59) );
  DFFRX1 counter_reg_1_ ( .D(n69), .CK(clk), .RN(n91), .Q(counter[1]), .QN(n58) );
  DFFRX1 counter_reg_4_ ( .D(n66), .CK(clk), .RN(n91), .Q(counter[4]), .QN(n61) );
  DFFRX1 counter_reg_3_ ( .D(n65), .CK(clk), .RN(n91), .Q(counter[3]), .QN(n57) );
  DFFRX1 counter_reg_2_ ( .D(n64), .CK(clk), .RN(n91), .Q(counter[2]), .QN(n56) );
  DFFRX1 counter_reg_0_ ( .D(n85), .CK(clk), .RN(n90), .Q(counter[0]), .QN(n63) );
  DFFRX1 current_state_reg_2_ ( .D(next_state[2]), .CK(clk), .RN(n90), .Q(
        current_state[2]), .QN(n86) );
  DFFRX1 current_state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n90), .Q(
        current_state[1]), .QN(n87) );
  DFFRX1 global_index_reg_1_ ( .D(n82), .CK(clk), .RN(n90), .Q(n113), .QN(n550) );
  DFFRX1 global_index_reg_2_ ( .D(n80), .CK(clk), .RN(n90), .Q(n112), .QN(n530) );
  DFFSX2 global_index_reg_0_ ( .D(n83), .CK(clk), .SN(n101), .Q(
        global_index[0]), .QN(n94) );
  DFFRX2 global_index_reg_13_ ( .D(n81), .CK(clk), .RN(n90), .QN(n540) );
  DFFRX1 current_state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(n90), .Q(
        current_state[0]), .QN(n88) );
  DFFRX1 global_index_reg_12_ ( .D(n70), .CK(clk), .RN(n91), .Q(n102), .QN(
        n430) );
  DFFRX1 global_index_reg_9_ ( .D(n73), .CK(clk), .RN(n91), .Q(n105), .QN(n460) );
  DFFRX1 global_index_reg_11_ ( .D(n71), .CK(clk), .RN(n91), .Q(n103), .QN(
        n440) );
  DFFRX1 global_index_reg_10_ ( .D(n72), .CK(clk), .RN(n91), .Q(n104), .QN(
        n450) );
  DFFRX1 global_index_reg_6_ ( .D(n76), .CK(clk), .RN(n90), .Q(n108), .QN(n490) );
  DFFRX1 global_index_reg_5_ ( .D(n77), .CK(clk), .RN(n90), .Q(n109), .QN(n500) );
  DFFRX1 global_index_reg_4_ ( .D(n78), .CK(clk), .RN(n90), .Q(n110), .QN(n510) );
  DFFRX1 global_index_reg_3_ ( .D(n79), .CK(clk), .RN(n90), .Q(n111), .QN(n520) );
  DFFRX1 global_index_reg_8_ ( .D(n74), .CK(clk), .RN(n90), .Q(n106), .QN(n470) );
  INVX16 U3 ( .A(n520), .Y(global_index[3]) );
  INVX16 U4 ( .A(n510), .Y(global_index[4]) );
  INVX16 U5 ( .A(n500), .Y(global_index[5]) );
  INVX16 U6 ( .A(n490), .Y(global_index[6]) );
  INVX16 U7 ( .A(n540), .Y(global_index[13]) );
  INVXL U8 ( .A(n540), .Y(n2) );
  BUFX12 U9 ( .A(n114), .Y(gray_req) );
  NOR3X1 U10 ( .A(current_state[1]), .B(n88), .C(current_state[2]), .Y(n114)
         );
  INVX16 U11 ( .A(n470), .Y(global_index[8]) );
  XOR2XL U12 ( .A(n106), .B(add_113_carry_8_), .Y(N36) );
  BUFX12 U13 ( .A(n116), .Y(finish) );
  NOR3X1 U14 ( .A(n88), .B(n86), .C(n87), .Y(n116) );
  XOR2XL U15 ( .A(n111), .B(add_113_carry_3_), .Y(N31) );
  XOR2XL U16 ( .A(n110), .B(add_113_carry_4_), .Y(N32) );
  XOR2XL U17 ( .A(n109), .B(add_113_carry_5_), .Y(N33) );
  XOR2XL U18 ( .A(n108), .B(add_113_carry_6_), .Y(N34) );
  INVX16 U19 ( .A(n450), .Y(global_index[10]) );
  XOR2XL U20 ( .A(n104), .B(add_113_carry_10_), .Y(N38) );
  INVX16 U21 ( .A(n440), .Y(global_index[11]) );
  XOR2XL U22 ( .A(n103), .B(add_113_carry_11_), .Y(N39) );
  INVX16 U23 ( .A(n460), .Y(global_index[9]) );
  XOR2XL U24 ( .A(n105), .B(add_113_carry_9_), .Y(N37) );
  INVX16 U25 ( .A(n430), .Y(global_index[12]) );
  XOR2XL U26 ( .A(n102), .B(add_113_carry_12_), .Y(N40) );
  XOR2XL U28 ( .A(n119), .B(add_113_carry_7_), .Y(N35) );
  INVX16 U29 ( .A(n530), .Y(global_index[2]) );
  INVX16 U30 ( .A(n550), .Y(global_index[1]) );
  CLKINVX1 U31 ( .A(n94), .Y(n93) );
  AND2XL U32 ( .A(add_113_carry_7_), .B(n119), .Y(add_113_carry_8_) );
  AND2XL U33 ( .A(add_113_carry_9_), .B(n105), .Y(add_113_carry_10_) );
  AND2XL U34 ( .A(add_113_carry_8_), .B(n106), .Y(add_113_carry_9_) );
  AND2XL U35 ( .A(add_113_carry_10_), .B(n104), .Y(add_113_carry_11_) );
  AND2XL U36 ( .A(add_113_carry_11_), .B(n103), .Y(add_113_carry_12_) );
  AND2XL U37 ( .A(add_113_carry_4_), .B(n110), .Y(add_113_carry_5_) );
  AND2XL U38 ( .A(add_113_carry_5_), .B(n109), .Y(add_113_carry_6_) );
  AND2XL U39 ( .A(add_113_carry_6_), .B(n108), .Y(add_113_carry_7_) );
  AND2XL U40 ( .A(add_113_carry_12_), .B(n102), .Y(add_113_carry_13_) );
  AND2XL U41 ( .A(add_113_carry_2_), .B(n112), .Y(add_113_carry_3_) );
  AND2XL U42 ( .A(add_113_carry_3_), .B(n111), .Y(add_113_carry_4_) );
  OR2XL U43 ( .A(n113), .B(n93), .Y(add_113_carry_2_) );
  NOR3X1 U44 ( .A(current_state[0]), .B(n87), .C(current_state[2]), .Y(n115)
         );
  CLKBUFX3 U45 ( .A(n26), .Y(n84) );
  NAND2X1 U46 ( .A(lbp_valid), .B(n23), .Y(n17) );
  NAND4X1 U47 ( .A(next_counter[5]), .B(next_counter[4]), .C(next_counter[6]), 
        .D(n24), .Y(n23) );
  NOR4X1 U48 ( .A(N75), .B(n100), .C(n99), .D(n98), .Y(n24) );
  BUFX4 U49 ( .A(n115), .Y(lbp_valid) );
  CLKINVX1 U50 ( .A(next_counter[3]), .Y(n98) );
  CLKBUFX3 U51 ( .A(n27), .Y(n89) );
  NOR2BX1 U52 ( .AN(n115), .B(n410), .Y(n27) );
  CLKINVX1 U53 ( .A(next_counter[2]), .Y(n99) );
  CLKINVX1 U54 ( .A(next_counter[1]), .Y(n100) );
  AND2X2 U55 ( .A(lbp_valid), .B(n410), .Y(n26) );
  AO21X1 U56 ( .A0(current_state[0]), .A1(read_done), .B0(next_state[2]), .Y(
        next_state[1]) );
  CLKBUFX3 U57 ( .A(n101), .Y(n90) );
  CLKBUFX3 U58 ( .A(n101), .Y(n91) );
  OAI21XL U59 ( .A0(n540), .A1(lbp_valid), .B0(n380), .Y(n81) );
  AOI22X1 U60 ( .A0(N55), .A1(n26), .B0(N41), .B1(n89), .Y(n380) );
  OAI21XL U61 ( .A0(n430), .A1(lbp_valid), .B0(n25), .Y(n70) );
  AOI22X1 U62 ( .A0(N54), .A1(n84), .B0(N40), .B1(n89), .Y(n25) );
  OAI21XL U63 ( .A0(n440), .A1(lbp_valid), .B0(n28), .Y(n71) );
  AOI22X1 U64 ( .A0(N53), .A1(n84), .B0(N39), .B1(n89), .Y(n28) );
  OAI21XL U65 ( .A0(n450), .A1(lbp_valid), .B0(n290), .Y(n72) );
  AOI22X1 U66 ( .A0(N52), .A1(n84), .B0(N38), .B1(n89), .Y(n290) );
  OAI21XL U67 ( .A0(n460), .A1(lbp_valid), .B0(n300), .Y(n73) );
  AOI22X1 U68 ( .A0(N51), .A1(n84), .B0(N37), .B1(n89), .Y(n300) );
  OAI21XL U69 ( .A0(n470), .A1(lbp_valid), .B0(n310), .Y(n74) );
  AOI22X1 U70 ( .A0(N50), .A1(n84), .B0(N36), .B1(n89), .Y(n310) );
  NAND3X1 U71 ( .A(n87), .B(n86), .C(n15), .Y(next_state[0]) );
  AOI2BB2X1 U72 ( .B0(gray_ready), .B1(n88), .A0N(read_done), .A1N(n88), .Y(
        n15) );
  OAI21XL U73 ( .A0(n480), .A1(lbp_valid), .B0(n320), .Y(n750) );
  AOI22X1 U74 ( .A0(N49), .A1(n84), .B0(N35), .B1(n89), .Y(n320) );
  OAI21XL U75 ( .A0(n490), .A1(lbp_valid), .B0(n330), .Y(n76) );
  AOI22X1 U76 ( .A0(N48), .A1(n84), .B0(N34), .B1(n89), .Y(n330) );
  OAI21XL U77 ( .A0(n500), .A1(lbp_valid), .B0(n340), .Y(n77) );
  AOI22X1 U78 ( .A0(N47), .A1(n26), .B0(N33), .B1(n89), .Y(n340) );
  OAI21XL U79 ( .A0(n510), .A1(lbp_valid), .B0(n350), .Y(n78) );
  AOI22X1 U80 ( .A0(N46), .A1(n26), .B0(N32), .B1(n89), .Y(n350) );
  OAI21XL U81 ( .A0(n520), .A1(lbp_valid), .B0(n360), .Y(n79) );
  AOI22X1 U82 ( .A0(N45), .A1(n26), .B0(N31), .B1(n89), .Y(n360) );
  OAI21XL U83 ( .A0(n530), .A1(lbp_valid), .B0(n370), .Y(n80) );
  AOI22X1 U84 ( .A0(N44), .A1(n26), .B0(N30), .B1(n89), .Y(n370) );
  OAI21XL U85 ( .A0(n550), .A1(lbp_valid), .B0(n390), .Y(n82) );
  AOI22X1 U86 ( .A0(N43), .A1(n26), .B0(N29), .B1(n89), .Y(n390) );
  OAI22XL U87 ( .A0(n56), .A1(lbp_valid), .B0(n99), .B1(n17), .Y(n64) );
  OAI22XL U88 ( .A0(n57), .A1(lbp_valid), .B0(n98), .B1(n17), .Y(n65) );
  OAI22XL U89 ( .A0(n61), .A1(lbp_valid), .B0(n97), .B1(n17), .Y(n66) );
  CLKINVX1 U90 ( .A(next_counter[4]), .Y(n97) );
  OAI22XL U91 ( .A0(n59), .A1(lbp_valid), .B0(n96), .B1(n17), .Y(n67) );
  CLKINVX1 U92 ( .A(next_counter[5]), .Y(n96) );
  OAI22XL U93 ( .A0(n60), .A1(lbp_valid), .B0(n95), .B1(n17), .Y(n68) );
  CLKINVX1 U94 ( .A(next_counter[6]), .Y(n95) );
  OAI22XL U95 ( .A0(n58), .A1(lbp_valid), .B0(n100), .B1(n17), .Y(n69) );
  NAND4BBXL U96 ( .AN(n63), .BN(n61), .C(n58), .D(n420), .Y(n410) );
  NOR4X1 U97 ( .A(n56), .B(n57), .C(n59), .D(n60), .Y(n420) );
  OAI21XL U98 ( .A0(n94), .A1(lbp_valid), .B0(n400), .Y(n83) );
  AOI22X1 U99 ( .A0(N42), .A1(n26), .B0(n94), .B1(n89), .Y(n400) );
  OAI2BB2XL U100 ( .B0(n63), .B1(lbp_valid), .A0N(n115), .A1N(N75), .Y(n85) );
  AO21X1 U101 ( .A0(current_state[1]), .A1(n9), .B0(current_state[2]), .Y(
        next_state[2]) );
  OAI2BB1X1 U102 ( .A0N(n11), .A1N(n12), .B0(n88), .Y(n9) );
  NOR4X1 U103 ( .A(n13), .B(n500), .C(n470), .D(n490), .Y(n12) );
  NOR4BBX1 U104 ( .AN(n94), .BN(n480), .C(n14), .D(n550), .Y(n11) );
  OR4X1 U105 ( .A(n460), .B(n450), .C(n440), .D(n430), .Y(n13) );
  OR4X1 U106 ( .A(n540), .B(n530), .C(n520), .D(n510), .Y(n14) );
  CLKINVX1 U107 ( .A(reset), .Y(n101) );
  XOR2X1 U108 ( .A(n2), .B(add_113_carry_13_), .Y(N41) );
  XOR2X1 U109 ( .A(n112), .B(add_113_carry_2_), .Y(N30) );
  XNOR2X1 U110 ( .A(n93), .B(n113), .Y(N29) );
  CONTROL_DW01_inc_0_DW01_inc_2 add_122 ( .A(counter), .SUM({next_counter, N75}) );
  CONTROL_DW01_inc_1_DW01_inc_3 add_115 ( .A({n2, n102, n103, n104, n105, n106, 
        n119, n108, n109, n110, n111, n112, n113, n93}), .SUM({N55, N54, N53, 
        N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42}) );
  DFFSX4 global_index_reg_7_ ( .D(n750), .CK(clk), .SN(n101), .Q(n107), .QN(
        n480) );
  INVX8 U27 ( .A(n107), .Y(n117) );
  CLKINVX20 U111 ( .A(n117), .Y(global_index[7]) );
  INVXL U112 ( .A(n117), .Y(n119) );
endmodule


module READ_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  XOR2XL U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module READ_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  NOR2X1 U1 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2XL U2 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2XL U3 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2XL U4 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2XL U5 ( .A(n9), .B(A[6]), .Y(n8) );
  NAND2X1 U6 ( .A(n2), .B(n4), .Y(n15) );
  NAND2X1 U7 ( .A(n6), .B(n3), .Y(n16) );
  XNOR2XL U8 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  NOR2XL U9 ( .A(A[12]), .B(n15), .Y(n14) );
  OAI2BB1XL U10 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1XL U11 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1XL U12 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1XL U13 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1XL U14 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1XL U15 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1XL U16 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1XL U17 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  AO21XL U18 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  CLKINVX1 U19 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U20 ( .A(n16), .Y(n2) );
  OR2XL U21 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2XL U22 ( .A(n8), .B(A[7]), .Y(n7) );
  INVXL U23 ( .A(A[10]), .Y(n3) );
  INVXL U24 ( .A(A[11]), .Y(n4) );
  XOR2X1 U25 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  OAI21XL U26 ( .A0(n2), .A1(n4), .B0(n15), .Y(SUM[11]) );
  OAI21XL U27 ( .A0(n6), .A1(n3), .B0(n16), .Y(SUM[10]) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module READ ( clk, reset, control_signal, global_index, gray_data, gray_addr, 
        read_done, result );
  input [2:0] control_signal;
  input [13:0] global_index;
  input [7:0] gray_data;
  output [13:0] gray_addr;
  output [7:0] result;
  input clk, reset;
  output read_done;
  wire   n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, read_addr_array_8__13_,
         read_addr_array_8__12_, read_addr_array_8__11_,
         read_addr_array_8__10_, read_addr_array_8__9_, read_addr_array_8__8_,
         read_addr_array_8__7_, read_addr_array_8__6_, read_addr_array_8__5_,
         read_addr_array_8__4_, read_addr_array_8__3_, read_addr_array_8__2_,
         read_addr_array_8__1_, read_addr_array_7__13_, read_addr_array_7__12_,
         read_addr_array_7__11_, read_addr_array_7__10_, read_addr_array_7__9_,
         read_addr_array_7__8_, read_addr_array_6__13_, read_addr_array_6__12_,
         read_addr_array_6__11_, read_addr_array_6__10_, read_addr_array_6__9_,
         read_addr_array_6__8_, read_addr_array_6__7_, read_addr_array_6__6_,
         read_addr_array_6__5_, read_addr_array_6__4_, read_addr_array_6__3_,
         read_addr_array_6__2_, read_addr_array_6__1_, read_addr_array_5__13_,
         read_addr_array_5__12_, read_addr_array_5__11_,
         read_addr_array_5__10_, read_addr_array_5__9_, read_addr_array_5__8_,
         read_addr_array_5__7_, read_addr_array_5__6_, read_addr_array_5__5_,
         read_addr_array_5__4_, read_addr_array_5__3_, read_addr_array_5__2_,
         read_addr_array_5__1_, read_addr_array_5__0_, read_addr_array_4__13_,
         read_addr_array_4__12_, read_addr_array_4__11_,
         read_addr_array_4__10_, read_addr_array_4__9_, read_addr_array_4__8_,
         read_addr_array_4__7_, read_addr_array_4__6_, read_addr_array_4__5_,
         read_addr_array_4__4_, read_addr_array_4__3_, read_addr_array_4__2_,
         read_addr_array_4__1_, read_addr_array_4__0_, read_addr_array_3__13_,
         read_addr_array_3__12_, read_addr_array_3__11_,
         read_addr_array_3__10_, read_addr_array_3__9_, read_addr_array_3__8_,
         read_addr_array_3__7_, read_addr_array_3__6_, read_addr_array_3__5_,
         read_addr_array_3__4_, read_addr_array_3__3_, read_addr_array_3__2_,
         read_addr_array_3__1_, read_addr_array_2__13_, read_addr_array_2__12_,
         read_addr_array_2__11_, read_addr_array_2__10_, read_addr_array_2__9_,
         read_addr_array_2__8_, read_addr_array_2__7_, read_addr_array_1__13_,
         read_addr_array_1__12_, read_addr_array_1__11_,
         read_addr_array_1__10_, read_addr_array_1__9_, read_addr_array_1__8_,
         read_addr_array_1__7_, read_addr_array_1__6_, read_addr_array_1__5_,
         read_addr_array_1__4_, read_addr_array_1__3_, read_addr_array_1__2_,
         read_addr_array_1__1_, N57, N98, N99, N100, N101, n18, n21, n22, n23,
         n24, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n570, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n980, n990, n1000, n1010, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, add_194_carry_2_,
         add_194_carry_3_, add_194_carry_4_, add_194_carry_5_,
         add_194_carry_6_, add_194_carry_7_, add_194_carry_8_,
         add_194_carry_9_, add_194_carry_10_, add_194_carry_11_,
         add_194_carry_12_, add_194_carry_13_, add_192_carry_2_,
         add_192_carry_3_, add_192_carry_4_, add_192_carry_5_,
         add_192_carry_6_, add_192_carry_7_, add_192_carry_8_,
         add_192_carry_9_, add_192_carry_10_, add_192_carry_11_,
         add_192_carry_12_, add_192_carry_13_, sub_189_carry_2_,
         sub_189_carry_3_, sub_189_carry_4_, sub_189_carry_5_,
         sub_189_carry_6_, sub_189_carry_7_, sub_189_carry_8_,
         sub_189_carry_9_, sub_189_carry_10_, sub_189_carry_11_,
         sub_189_carry_12_, sub_189_carry_13_, sub_187_carry_2_,
         sub_187_carry_3_, sub_187_carry_4_, sub_187_carry_5_,
         sub_187_carry_6_, sub_187_carry_7_, sub_187_carry_8_,
         sub_187_carry_9_, sub_187_carry_10_, sub_187_carry_11_,
         sub_187_carry_12_, sub_187_carry_13_, n1, n2, n15, n17, n20, n113,
         n115, n117, n119, n121, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157;
  wire   [3:0] counter;
  wire   [7:1] mid_data;
  wire   [13:9] add_193_carry;
  wire   [13:9] sub_188_carry;

  EDFFX1 mid_data_reg_6_ ( .D(gray_data[6]), .E(n154), .CK(clk), .QN(n153) );
  EDFFX1 mid_data_reg_7_ ( .D(gray_data[7]), .E(n154), .CK(clk), .Q(
        mid_data[7]), .QN(n124) );
  EDFFX1 mid_data_reg_0_ ( .D(gray_data[0]), .E(n154), .CK(clk), .QN(n152) );
  EDFFX1 mid_data_reg_1_ ( .D(gray_data[1]), .E(n154), .CK(clk), .Q(
        mid_data[1]) );
  EDFFX1 mid_data_reg_3_ ( .D(gray_data[3]), .E(n154), .CK(clk), .Q(
        mid_data[3]) );
  EDFFX1 mid_data_reg_5_ ( .D(gray_data[5]), .E(n154), .CK(clk), .Q(
        mid_data[5]) );
  EDFFX1 mid_data_reg_4_ ( .D(gray_data[4]), .E(n154), .CK(clk), .Q(
        mid_data[4]) );
  EDFFX1 mid_data_reg_2_ ( .D(gray_data[2]), .E(n154), .CK(clk), .Q(
        mid_data[2]) );
  DFFRX1 counter_reg_0_ ( .D(N98), .CK(clk), .RN(n157), .Q(counter[0]), .QN(
        n24) );
  DFFRX1 counter_reg_1_ ( .D(N99), .CK(clk), .RN(n157), .Q(counter[1]), .QN(
        n23) );
  DFFRX1 result_reg_2_ ( .D(n110), .CK(clk), .RN(n157), .Q(n173), .QN(n119) );
  DFFRX1 result_reg_0_ ( .D(n112), .CK(clk), .RN(n157), .Q(n175), .QN(n117) );
  DFFRX1 result_reg_1_ ( .D(n111), .CK(clk), .RN(n157), .Q(n174), .QN(n115) );
  DFFRX1 result_reg_3_ ( .D(n109), .CK(clk), .RN(n157), .Q(n172), .QN(n113) );
  DFFRX1 result_reg_4_ ( .D(n108), .CK(clk), .RN(n157), .Q(n171), .QN(n20) );
  DFFRX1 result_reg_5_ ( .D(n107), .CK(clk), .RN(n157), .Q(n170), .QN(n17) );
  DFFRX1 result_reg_6_ ( .D(n106), .CK(clk), .RN(n157), .Q(n169), .QN(n15) );
  DFFRX1 result_reg_7_ ( .D(n105), .CK(clk), .RN(n157), .Q(n168), .QN(n18) );
  DFFRX1 counter_reg_2_ ( .D(N100), .CK(clk), .RN(n157), .Q(counter[2]), .QN(
        n22) );
  INVX3 U3 ( .A(global_index[0]), .Y(n134) );
  AOI221XL U4 ( .A0(read_addr_array_3__2_), .A1(n126), .B0(global_index[2]), 
        .B1(n132), .C0(n73), .Y(n72) );
  AOI222XL U5 ( .A0(n134), .A1(n130), .B0(n121), .B1(n131), .C0(n121), .C1(
        n127), .Y(n95) );
  AOI221XL U6 ( .A0(n134), .A1(n126), .B0(n121), .B1(n132), .C0(n97), .Y(n96)
         );
  AOI221XL U7 ( .A0(read_addr_array_3__1_), .A1(n126), .B0(global_index[1]), 
        .B1(n132), .C0(n77), .Y(n76) );
  AOI221XL U8 ( .A0(read_addr_array_3__3_), .A1(n126), .B0(global_index[3]), 
        .B1(n132), .C0(n69), .Y(n68) );
  AOI221XL U9 ( .A0(read_addr_array_3__4_), .A1(n126), .B0(global_index[4]), 
        .B1(n132), .C0(n65), .Y(n64) );
  AOI221XL U10 ( .A0(read_addr_array_3__5_), .A1(n126), .B0(global_index[5]), 
        .B1(n132), .C0(n61), .Y(n60) );
  AOI222XL U11 ( .A0(read_addr_array_6__7_), .A1(n130), .B0(global_index[7]), 
        .B1(n131), .C0(read_addr_array_2__7_), .C1(n127), .Y(n51) );
  AOI221XL U12 ( .A0(read_addr_array_3__7_), .A1(n126), .B0(
        read_addr_array_2__7_), .B1(n132), .C0(n53), .Y(n52) );
  AOI222XL U13 ( .A0(read_addr_array_6__8_), .A1(n130), .B0(global_index[8]), 
        .B1(n131), .C0(read_addr_array_7__8_), .C1(n127), .Y(n47) );
  AOI221XL U14 ( .A0(read_addr_array_3__8_), .A1(n126), .B0(
        read_addr_array_2__8_), .B1(n132), .C0(n49), .Y(n48) );
  AOI222XL U15 ( .A0(read_addr_array_6__9_), .A1(n130), .B0(global_index[9]), 
        .B1(n131), .C0(read_addr_array_7__9_), .C1(n127), .Y(n43) );
  AOI221XL U16 ( .A0(read_addr_array_3__9_), .A1(n126), .B0(
        read_addr_array_2__9_), .B1(n132), .C0(n45), .Y(n44) );
  AOI222XL U17 ( .A0(read_addr_array_6__10_), .A1(n130), .B0(global_index[10]), 
        .B1(n131), .C0(read_addr_array_7__10_), .C1(n127), .Y(n91) );
  AOI221XL U18 ( .A0(read_addr_array_3__10_), .A1(n126), .B0(
        read_addr_array_2__10_), .B1(n132), .C0(n93), .Y(n92) );
  AND3X2 U19 ( .A(n54), .B(n55), .C(n56), .Y(n1) );
  AND3X2 U20 ( .A(n94), .B(n95), .C(n96), .Y(n2) );
  INVX12 U21 ( .A(n2), .Y(gray_addr[0]) );
  INVX12 U22 ( .A(n1), .Y(gray_addr[6]) );
  AND3X2 U23 ( .A(n58), .B(n59), .C(n60), .Y(n163) );
  INVX12 U24 ( .A(n163), .Y(gray_addr[5]) );
  AND3X2 U25 ( .A(n62), .B(n63), .C(n64), .Y(n164) );
  INVX12 U26 ( .A(n164), .Y(gray_addr[4]) );
  AND3X2 U27 ( .A(n66), .B(n67), .C(n68), .Y(n165) );
  INVX12 U28 ( .A(n165), .Y(gray_addr[3]) );
  AND3X2 U29 ( .A(n70), .B(n71), .C(n72), .Y(n166) );
  INVX12 U30 ( .A(n166), .Y(gray_addr[2]) );
  AND3X2 U31 ( .A(n46), .B(n47), .C(n48), .Y(n161) );
  INVX12 U32 ( .A(n161), .Y(gray_addr[8]) );
  AND3X2 U33 ( .A(n50), .B(n51), .C(n52), .Y(n162) );
  INVX12 U34 ( .A(n162), .Y(gray_addr[7]) );
  AND3X2 U35 ( .A(n42), .B(n43), .C(n44), .Y(n160) );
  INVX12 U36 ( .A(n160), .Y(gray_addr[9]) );
  AND3X2 U37 ( .A(n90), .B(n91), .C(n92), .Y(n159) );
  INVX12 U38 ( .A(n159), .Y(gray_addr[10]) );
  XNOR2XL U39 ( .A(sub_187_carry_8_), .B(global_index[8]), .Y(
        read_addr_array_1__8_) );
  AND2XL U40 ( .A(global_index[8]), .B(add_192_carry_8_), .Y(add_192_carry_9_)
         );
  AND2XL U41 ( .A(global_index[8]), .B(add_194_carry_8_), .Y(add_194_carry_9_)
         );
  OR2XL U42 ( .A(global_index[8]), .B(sub_187_carry_8_), .Y(sub_187_carry_9_)
         );
  AND3X2 U43 ( .A(n74), .B(n75), .C(n76), .Y(n167) );
  INVX12 U44 ( .A(n167), .Y(gray_addr[1]) );
  BUFX12 U45 ( .A(n168), .Y(result[7]) );
  INVX12 U46 ( .A(n15), .Y(result[6]) );
  INVX12 U47 ( .A(n17), .Y(result[5]) );
  INVX12 U48 ( .A(n20), .Y(result[4]) );
  INVX12 U49 ( .A(n113), .Y(result[3]) );
  INVX12 U50 ( .A(n115), .Y(result[1]) );
  INVX12 U51 ( .A(n117), .Y(result[0]) );
  INVX12 U52 ( .A(n119), .Y(result[2]) );
  XNOR2XL U53 ( .A(sub_187_carry_3_), .B(global_index[3]), .Y(
        read_addr_array_1__3_) );
  OR2XL U54 ( .A(global_index[3]), .B(add_192_carry_3_), .Y(add_192_carry_4_)
         );
  AND2XL U55 ( .A(global_index[3]), .B(add_194_carry_3_), .Y(add_194_carry_4_)
         );
  OR2XL U56 ( .A(global_index[4]), .B(sub_187_carry_4_), .Y(sub_187_carry_5_)
         );
  XNOR2XL U57 ( .A(sub_187_carry_4_), .B(global_index[4]), .Y(
        read_addr_array_1__4_) );
  OR2XL U58 ( .A(global_index[4]), .B(add_192_carry_4_), .Y(add_192_carry_5_)
         );
  AND2XL U59 ( .A(global_index[4]), .B(add_194_carry_4_), .Y(add_194_carry_5_)
         );
  OR2XL U60 ( .A(global_index[5]), .B(sub_187_carry_5_), .Y(sub_187_carry_6_)
         );
  XNOR2XL U61 ( .A(sub_187_carry_5_), .B(global_index[5]), .Y(
        read_addr_array_1__5_) );
  OR2XL U62 ( .A(global_index[5]), .B(add_192_carry_5_), .Y(add_192_carry_6_)
         );
  AND2XL U63 ( .A(global_index[5]), .B(add_194_carry_5_), .Y(add_194_carry_6_)
         );
  AND2XL U64 ( .A(global_index[6]), .B(add_194_carry_6_), .Y(add_194_carry_7_)
         );
  XNOR2XL U65 ( .A(sub_187_carry_6_), .B(global_index[6]), .Y(
        read_addr_array_1__6_) );
  OR2XL U66 ( .A(global_index[6]), .B(sub_187_carry_6_), .Y(sub_187_carry_7_)
         );
  OR2XL U67 ( .A(global_index[6]), .B(add_192_carry_6_), .Y(add_192_carry_7_)
         );
  AND2XL U68 ( .A(global_index[10]), .B(add_194_carry_10_), .Y(
        add_194_carry_11_) );
  AND2XL U69 ( .A(global_index[10]), .B(add_192_carry_10_), .Y(
        add_192_carry_11_) );
  OR2XL U70 ( .A(global_index[10]), .B(sub_187_carry_10_), .Y(
        sub_187_carry_11_) );
  XOR2XL U71 ( .A(global_index[10]), .B(add_194_carry_10_), .Y(
        read_addr_array_8__10_) );
  XOR2XL U72 ( .A(global_index[11]), .B(add_194_carry_11_), .Y(
        read_addr_array_8__11_) );
  AND2XL U73 ( .A(global_index[11]), .B(add_192_carry_11_), .Y(
        add_192_carry_12_) );
  AND2XL U74 ( .A(global_index[11]), .B(add_194_carry_11_), .Y(
        add_194_carry_12_) );
  OR2XL U75 ( .A(global_index[11]), .B(sub_187_carry_11_), .Y(
        sub_187_carry_12_) );
  XOR2XL U76 ( .A(global_index[9]), .B(add_194_carry_9_), .Y(
        read_addr_array_8__9_) );
  AND2XL U77 ( .A(global_index[9]), .B(add_194_carry_9_), .Y(add_194_carry_10_) );
  AND2XL U78 ( .A(global_index[9]), .B(add_192_carry_9_), .Y(add_192_carry_10_) );
  OR2XL U79 ( .A(global_index[9]), .B(sub_187_carry_9_), .Y(sub_187_carry_10_)
         );
  XOR2XL U80 ( .A(global_index[12]), .B(add_192_carry_12_), .Y(
        read_addr_array_6__12_) );
  XNOR2XL U81 ( .A(sub_187_carry_12_), .B(global_index[12]), .Y(
        read_addr_array_1__12_) );
  XOR2XL U82 ( .A(global_index[12]), .B(add_194_carry_12_), .Y(
        read_addr_array_8__12_) );
  XNOR2XL U83 ( .A(add_194_carry_7_), .B(global_index[7]), .Y(
        read_addr_array_8__7_) );
  AND2XL U84 ( .A(global_index[7]), .B(add_192_carry_7_), .Y(add_192_carry_8_)
         );
  OR2XL U85 ( .A(global_index[7]), .B(add_194_carry_7_), .Y(add_194_carry_8_)
         );
  AND2XL U86 ( .A(sub_187_carry_7_), .B(global_index[7]), .Y(sub_187_carry_8_)
         );
  NAND3X1 U87 ( .A(n78), .B(n79), .C(n80), .Y(gray_addr[13]) );
  AOI222XL U88 ( .A0(read_addr_array_6__13_), .A1(n130), .B0(global_index[13]), 
        .B1(n131), .C0(read_addr_array_7__13_), .C1(n127), .Y(n79) );
  AOI221XL U89 ( .A0(read_addr_array_3__13_), .A1(n126), .B0(
        read_addr_array_2__13_), .B1(n132), .C0(n81), .Y(n80) );
  AOI221XL U90 ( .A0(read_addr_array_3__11_), .A1(n126), .B0(
        read_addr_array_2__11_), .B1(n132), .C0(n89), .Y(n88) );
  CLKINVX2 U91 ( .A(n134), .Y(n121) );
  BUFX12 U92 ( .A(n158), .Y(gray_addr[11]) );
  NAND3X1 U93 ( .A(n86), .B(n87), .C(n88), .Y(n158) );
  XNOR2XL U94 ( .A(sub_189_carry_10_), .B(global_index[10]), .Y(
        read_addr_array_3__10_) );
  XNOR2XL U95 ( .A(sub_189_carry_11_), .B(global_index[11]), .Y(
        read_addr_array_3__11_) );
  XNOR2XL U96 ( .A(global_index[13]), .B(sub_189_carry_13_), .Y(
        read_addr_array_3__13_) );
  OR2XL U97 ( .A(global_index[12]), .B(sub_189_carry_12_), .Y(
        sub_189_carry_13_) );
  AOI221XL U98 ( .A0(read_addr_array_3__12_), .A1(n126), .B0(
        read_addr_array_2__12_), .B1(n132), .C0(n85), .Y(n84) );
  AND3X2 U99 ( .A(n82), .B(n83), .C(n84), .Y(n123) );
  INVX12 U100 ( .A(n123), .Y(gray_addr[12]) );
  OR2XL U101 ( .A(global_index[7]), .B(sub_189_carry_7_), .Y(sub_189_carry_8_)
         );
  AND2XL U102 ( .A(sub_189_carry_6_), .B(global_index[6]), .Y(sub_189_carry_7_) );
  OR2XL U103 ( .A(global_index[9]), .B(sub_189_carry_9_), .Y(sub_189_carry_10_) );
  OR2XL U104 ( .A(global_index[8]), .B(sub_189_carry_8_), .Y(sub_189_carry_9_)
         );
  OR2XL U105 ( .A(global_index[10]), .B(sub_189_carry_10_), .Y(
        sub_189_carry_11_) );
  OR2XL U106 ( .A(global_index[11]), .B(sub_189_carry_11_), .Y(
        sub_189_carry_12_) );
  AND2XL U107 ( .A(sub_189_carry_4_), .B(global_index[4]), .Y(sub_189_carry_5_) );
  AND2XL U108 ( .A(sub_189_carry_5_), .B(global_index[5]), .Y(sub_189_carry_6_) );
  XNOR2XL U109 ( .A(sub_189_carry_7_), .B(global_index[7]), .Y(
        read_addr_array_3__7_) );
  XNOR2XL U110 ( .A(sub_189_carry_12_), .B(global_index[12]), .Y(
        read_addr_array_3__12_) );
  XNOR2XL U111 ( .A(sub_189_carry_9_), .B(global_index[9]), .Y(
        read_addr_array_3__9_) );
  XNOR2XL U112 ( .A(sub_189_carry_8_), .B(global_index[8]), .Y(
        read_addr_array_3__8_) );
  XOR2XL U113 ( .A(global_index[6]), .B(sub_189_carry_6_), .Y(
        read_addr_array_3__6_) );
  XOR2XL U114 ( .A(global_index[8]), .B(global_index[7]), .Y(
        read_addr_array_7__8_) );
  XOR2XL U115 ( .A(global_index[10]), .B(add_193_carry[10]), .Y(
        read_addr_array_7__10_) );
  XOR2XL U116 ( .A(global_index[11]), .B(add_193_carry[11]), .Y(
        read_addr_array_7__11_) );
  XOR2XL U117 ( .A(global_index[4]), .B(sub_189_carry_4_), .Y(
        read_addr_array_3__4_) );
  XOR2XL U118 ( .A(global_index[5]), .B(sub_189_carry_5_), .Y(
        read_addr_array_3__5_) );
  XOR2XL U119 ( .A(global_index[13]), .B(add_193_carry[13]), .Y(
        read_addr_array_7__13_) );
  AND2XL U120 ( .A(global_index[12]), .B(add_193_carry[12]), .Y(
        add_193_carry[13]) );
  XNOR2XL U121 ( .A(global_index[13]), .B(sub_188_carry[13]), .Y(
        read_addr_array_2__13_) );
  OR2XL U122 ( .A(global_index[12]), .B(sub_188_carry[12]), .Y(
        sub_188_carry[13]) );
  AND2XL U123 ( .A(global_index[8]), .B(global_index[7]), .Y(add_193_carry[9])
         );
  OR2XL U124 ( .A(global_index[8]), .B(global_index[7]), .Y(sub_188_carry[9])
         );
  OR2XL U125 ( .A(global_index[9]), .B(sub_188_carry[9]), .Y(sub_188_carry[10]) );
  OR2XL U126 ( .A(global_index[10]), .B(sub_188_carry[10]), .Y(
        sub_188_carry[11]) );
  OR2XL U127 ( .A(global_index[11]), .B(sub_188_carry[11]), .Y(
        sub_188_carry[12]) );
  AND2XL U128 ( .A(global_index[9]), .B(add_193_carry[9]), .Y(
        add_193_carry[10]) );
  AND2XL U129 ( .A(global_index[10]), .B(add_193_carry[10]), .Y(
        add_193_carry[11]) );
  AND2XL U130 ( .A(global_index[11]), .B(add_193_carry[11]), .Y(
        add_193_carry[12]) );
  XNOR2XL U131 ( .A(global_index[7]), .B(global_index[8]), .Y(
        read_addr_array_2__8_) );
  XNOR2XL U132 ( .A(sub_188_carry[12]), .B(global_index[12]), .Y(
        read_addr_array_2__12_) );
  XNOR2XL U133 ( .A(sub_188_carry[9]), .B(global_index[9]), .Y(
        read_addr_array_2__9_) );
  XNOR2XL U134 ( .A(sub_188_carry[10]), .B(global_index[10]), .Y(
        read_addr_array_2__10_) );
  XNOR2XL U135 ( .A(sub_188_carry[11]), .B(global_index[11]), .Y(
        read_addr_array_2__11_) );
  XOR2XL U136 ( .A(global_index[12]), .B(add_193_carry[12]), .Y(
        read_addr_array_7__12_) );
  XOR2XL U137 ( .A(global_index[9]), .B(add_193_carry[9]), .Y(
        read_addr_array_7__9_) );
  AOI22XL U138 ( .A0(read_addr_array_5__0_), .A1(n128), .B0(
        read_addr_array_4__0_), .B1(n129), .Y(n94) );
  AO22XL U139 ( .A0(n134), .A1(counter[3]), .B0(n134), .B1(n133), .Y(n97) );
  XNOR2XL U140 ( .A(sub_187_carry_10_), .B(global_index[10]), .Y(
        read_addr_array_1__10_) );
  XNOR2XL U141 ( .A(sub_187_carry_11_), .B(global_index[11]), .Y(
        read_addr_array_1__11_) );
  XOR2XL U142 ( .A(global_index[9]), .B(add_192_carry_9_), .Y(
        read_addr_array_6__9_) );
  XOR2XL U143 ( .A(global_index[10]), .B(add_192_carry_10_), .Y(
        read_addr_array_6__10_) );
  XOR2XL U144 ( .A(global_index[11]), .B(add_192_carry_11_), .Y(
        read_addr_array_6__11_) );
  XOR2XL U145 ( .A(global_index[13]), .B(add_192_carry_13_), .Y(
        read_addr_array_6__13_) );
  AND2XL U146 ( .A(global_index[12]), .B(add_192_carry_12_), .Y(
        add_192_carry_13_) );
  AND2XL U147 ( .A(global_index[12]), .B(add_194_carry_12_), .Y(
        add_194_carry_13_) );
  OR2XL U148 ( .A(global_index[2]), .B(add_192_carry_2_), .Y(add_192_carry_3_)
         );
  OR2XL U149 ( .A(global_index[3]), .B(sub_187_carry_3_), .Y(sub_187_carry_4_)
         );
  OR2XL U150 ( .A(global_index[2]), .B(sub_187_carry_2_), .Y(sub_187_carry_3_)
         );
  OR2XL U151 ( .A(global_index[1]), .B(n121), .Y(add_192_carry_2_) );
  OR2XL U152 ( .A(global_index[1]), .B(n121), .Y(sub_187_carry_2_) );
  AND2XL U153 ( .A(sub_189_carry_2_), .B(global_index[2]), .Y(sub_189_carry_3_) );
  AND2XL U154 ( .A(sub_189_carry_3_), .B(global_index[3]), .Y(sub_189_carry_4_) );
  AND2XL U155 ( .A(global_index[0]), .B(global_index[1]), .Y(sub_189_carry_2_)
         );
  AND2XL U156 ( .A(global_index[1]), .B(n121), .Y(add_194_carry_2_) );
  AND2XL U157 ( .A(global_index[2]), .B(add_194_carry_2_), .Y(add_194_carry_3_) );
  OR2XL U158 ( .A(global_index[12]), .B(sub_187_carry_12_), .Y(
        sub_187_carry_13_) );
  XOR2XL U159 ( .A(global_index[7]), .B(add_192_carry_7_), .Y(
        read_addr_array_6__7_) );
  XOR2XL U160 ( .A(global_index[7]), .B(sub_187_carry_7_), .Y(
        read_addr_array_1__7_) );
  XNOR2XL U161 ( .A(sub_187_carry_9_), .B(global_index[9]), .Y(
        read_addr_array_1__9_) );
  XOR2XL U162 ( .A(global_index[8]), .B(add_194_carry_8_), .Y(
        read_addr_array_8__8_) );
  XOR2XL U163 ( .A(global_index[8]), .B(add_192_carry_8_), .Y(
        read_addr_array_6__8_) );
  XOR2XL U164 ( .A(global_index[6]), .B(add_194_carry_6_), .Y(
        read_addr_array_8__6_) );
  XNOR2XL U165 ( .A(add_192_carry_4_), .B(global_index[4]), .Y(
        read_addr_array_6__4_) );
  XNOR2XL U166 ( .A(add_192_carry_5_), .B(global_index[5]), .Y(
        read_addr_array_6__5_) );
  XNOR2XL U167 ( .A(add_192_carry_6_), .B(global_index[6]), .Y(
        read_addr_array_6__6_) );
  XOR2XL U168 ( .A(global_index[3]), .B(add_194_carry_3_), .Y(
        read_addr_array_8__3_) );
  XOR2XL U169 ( .A(global_index[4]), .B(add_194_carry_4_), .Y(
        read_addr_array_8__4_) );
  XOR2XL U170 ( .A(global_index[5]), .B(add_194_carry_5_), .Y(
        read_addr_array_8__5_) );
  XNOR2XL U171 ( .A(add_192_carry_2_), .B(global_index[2]), .Y(
        read_addr_array_6__2_) );
  XNOR2XL U172 ( .A(add_192_carry_3_), .B(global_index[3]), .Y(
        read_addr_array_6__3_) );
  XNOR2XL U173 ( .A(n121), .B(global_index[1]), .Y(read_addr_array_6__1_) );
  XOR2XL U174 ( .A(global_index[2]), .B(sub_189_carry_2_), .Y(
        read_addr_array_3__2_) );
  XOR2XL U175 ( .A(global_index[3]), .B(sub_189_carry_3_), .Y(
        read_addr_array_3__3_) );
  XOR2XL U176 ( .A(global_index[1]), .B(n121), .Y(read_addr_array_3__1_) );
  XOR2XL U177 ( .A(global_index[1]), .B(n121), .Y(read_addr_array_8__1_) );
  XOR2XL U178 ( .A(global_index[2]), .B(add_194_carry_2_), .Y(
        read_addr_array_8__2_) );
  CLKBUFX3 U179 ( .A(n27), .Y(n127) );
  CLKBUFX3 U180 ( .A(n37), .Y(n132) );
  CLKBUFX3 U181 ( .A(n41), .Y(n131) );
  CLKBUFX3 U182 ( .A(n29), .Y(n130) );
  CLKBUFX3 U183 ( .A(n35), .Y(n126) );
  CLKBUFX3 U184 ( .A(n31), .Y(n128) );
  CLKBUFX3 U185 ( .A(n33), .Y(n129) );
  NOR4X1 U186 ( .A(n21), .B(counter[0]), .C(counter[1]), .D(counter[2]), .Y(
        read_done) );
  CLKINVX1 U187 ( .A(N57), .Y(n155) );
  AOI222XL U188 ( .A0(read_addr_array_6__12_), .A1(n130), .B0(global_index[12]), .B1(n131), .C0(read_addr_array_7__12_), .C1(n127), .Y(n83) );
  AOI22X1 U189 ( .A0(read_addr_array_5__12_), .A1(n128), .B0(
        read_addr_array_4__12_), .B1(n129), .Y(n82) );
  AOI22X1 U190 ( .A0(read_addr_array_5__13_), .A1(n128), .B0(
        read_addr_array_4__13_), .B1(n129), .Y(n78) );
  AO22X1 U191 ( .A0(read_addr_array_8__13_), .A1(counter[3]), .B0(
        read_addr_array_1__13_), .B1(n133), .Y(n81) );
  AOI222XL U192 ( .A0(read_addr_array_6__11_), .A1(n130), .B0(global_index[11]), .B1(n131), .C0(read_addr_array_7__11_), .C1(n127), .Y(n87) );
  AOI22X1 U193 ( .A0(read_addr_array_5__11_), .A1(n128), .B0(
        read_addr_array_4__11_), .B1(n129), .Y(n86) );
  AO22X1 U194 ( .A0(read_addr_array_8__12_), .A1(counter[3]), .B0(
        read_addr_array_1__12_), .B1(n133), .Y(n85) );
  AO22X1 U195 ( .A0(read_addr_array_8__11_), .A1(counter[3]), .B0(
        read_addr_array_1__11_), .B1(n133), .Y(n89) );
  AOI22X1 U196 ( .A0(read_addr_array_5__8_), .A1(n128), .B0(
        read_addr_array_4__8_), .B1(n129), .Y(n46) );
  AOI22X1 U197 ( .A0(read_addr_array_5__9_), .A1(n128), .B0(
        read_addr_array_4__9_), .B1(n129), .Y(n42) );
  AOI22X1 U198 ( .A0(read_addr_array_5__10_), .A1(n128), .B0(
        read_addr_array_4__10_), .B1(n129), .Y(n90) );
  AO21X1 U199 ( .A0(n124), .A1(gray_data[7]), .B0(n125), .Y(N57) );
  AOI22X1 U200 ( .A0(n151), .A1(mid_data[7]), .B0(n147), .B1(n146), .Y(n125)
         );
  CLKINVX1 U201 ( .A(gray_data[7]), .Y(n151) );
  OAI2BB2XL U202 ( .B0(n155), .B1(n34), .A0N(n173), .A1N(n34), .Y(n110) );
  NAND2X1 U203 ( .A(n126), .B(n21), .Y(n34) );
  OAI2BB2XL U204 ( .B0(n155), .B1(n38), .A0N(n175), .A1N(n38), .Y(n112) );
  NAND2X1 U205 ( .A(n133), .B(n21), .Y(n38) );
  OAI2BB2XL U206 ( .B0(n155), .B1(n36), .A0N(n174), .A1N(n36), .Y(n111) );
  NAND2X1 U207 ( .A(n132), .B(n21), .Y(n36) );
  OAI2BB2XL U208 ( .B0(n155), .B1(n32), .A0N(n172), .A1N(n32), .Y(n109) );
  NAND2X1 U209 ( .A(n129), .B(n21), .Y(n32) );
  OAI2BB2XL U210 ( .B0(n155), .B1(n30), .A0N(n171), .A1N(n30), .Y(n108) );
  NAND2X1 U211 ( .A(n128), .B(n21), .Y(n30) );
  OAI2BB2XL U212 ( .B0(n155), .B1(n28), .A0N(n170), .A1N(n28), .Y(n107) );
  NAND2X1 U213 ( .A(n130), .B(n21), .Y(n28) );
  OAI2BB2XL U214 ( .B0(n155), .B1(n26), .A0N(n169), .A1N(n26), .Y(n106) );
  NAND2X1 U215 ( .A(n127), .B(n21), .Y(n26) );
  OAI2BB2XL U216 ( .B0(n18), .B1(read_done), .A0N(read_done), .A1N(N57), .Y(
        n105) );
  AO22X1 U217 ( .A0(read_addr_array_8__9_), .A1(counter[3]), .B0(
        read_addr_array_1__9_), .B1(n133), .Y(n45) );
  AO22X1 U218 ( .A0(read_addr_array_8__8_), .A1(counter[3]), .B0(
        read_addr_array_1__8_), .B1(n133), .Y(n49) );
  AO22X1 U219 ( .A0(read_addr_array_8__10_), .A1(counter[3]), .B0(
        read_addr_array_1__10_), .B1(n133), .Y(n93) );
  CLKINVX1 U220 ( .A(gray_data[5]), .Y(n150) );
  CLKINVX1 U221 ( .A(gray_data[3]), .Y(n149) );
  CLKINVX1 U222 ( .A(gray_data[1]), .Y(n148) );
  AOI222XL U223 ( .A0(read_addr_array_6__5_), .A1(n130), .B0(global_index[5]), 
        .B1(n131), .C0(global_index[5]), .C1(n127), .Y(n59) );
  AOI22X1 U224 ( .A0(read_addr_array_5__5_), .A1(n128), .B0(
        read_addr_array_4__5_), .B1(n129), .Y(n58) );
  AOI222XL U225 ( .A0(read_addr_array_6__6_), .A1(n130), .B0(global_index[6]), 
        .B1(n131), .C0(global_index[6]), .C1(n127), .Y(n55) );
  AOI221XL U226 ( .A0(read_addr_array_3__6_), .A1(n126), .B0(global_index[6]), 
        .B1(n132), .C0(n570), .Y(n56) );
  AOI22X1 U227 ( .A0(read_addr_array_5__6_), .A1(n128), .B0(
        read_addr_array_4__6_), .B1(n129), .Y(n54) );
  AOI22X1 U228 ( .A0(read_addr_array_5__7_), .A1(n128), .B0(
        read_addr_array_4__7_), .B1(n129), .Y(n50) );
  AO22X1 U229 ( .A0(read_addr_array_8__7_), .A1(counter[3]), .B0(
        read_addr_array_1__7_), .B1(n133), .Y(n53) );
  AO22X1 U230 ( .A0(read_addr_array_8__5_), .A1(counter[3]), .B0(
        read_addr_array_1__5_), .B1(n133), .Y(n61) );
  AO22X1 U231 ( .A0(read_addr_array_8__6_), .A1(counter[3]), .B0(
        read_addr_array_1__6_), .B1(n133), .Y(n570) );
  AOI22X1 U232 ( .A0(read_addr_array_5__1_), .A1(n128), .B0(
        read_addr_array_4__1_), .B1(n129), .Y(n74) );
  AOI222XL U233 ( .A0(read_addr_array_6__1_), .A1(n130), .B0(global_index[1]), 
        .B1(n131), .C0(global_index[1]), .C1(n127), .Y(n75) );
  AOI222XL U234 ( .A0(read_addr_array_6__4_), .A1(n130), .B0(global_index[4]), 
        .B1(n131), .C0(global_index[4]), .C1(n127), .Y(n63) );
  AOI22X1 U235 ( .A0(read_addr_array_5__4_), .A1(n128), .B0(
        read_addr_array_4__4_), .B1(n129), .Y(n62) );
  AO22X1 U236 ( .A0(read_addr_array_8__1_), .A1(counter[3]), .B0(
        read_addr_array_1__1_), .B1(n133), .Y(n77) );
  AOI222XL U237 ( .A0(read_addr_array_6__2_), .A1(n130), .B0(global_index[2]), 
        .B1(n131), .C0(global_index[2]), .C1(n127), .Y(n71) );
  AOI22X1 U238 ( .A0(read_addr_array_5__2_), .A1(n128), .B0(
        read_addr_array_4__2_), .B1(n129), .Y(n70) );
  AOI222XL U239 ( .A0(read_addr_array_6__3_), .A1(n130), .B0(global_index[3]), 
        .B1(n131), .C0(global_index[3]), .C1(n127), .Y(n67) );
  AOI22X1 U240 ( .A0(read_addr_array_5__3_), .A1(n128), .B0(
        read_addr_array_4__3_), .B1(n129), .Y(n66) );
  AO22X1 U241 ( .A0(read_addr_array_8__2_), .A1(counter[3]), .B0(
        read_addr_array_1__2_), .B1(n133), .Y(n73) );
  AO22X1 U242 ( .A0(read_addr_array_8__3_), .A1(counter[3]), .B0(
        read_addr_array_1__3_), .B1(n133), .Y(n69) );
  AO22X1 U243 ( .A0(read_addr_array_8__4_), .A1(counter[3]), .B0(
        read_addr_array_1__4_), .B1(n133), .Y(n65) );
  INVXL U244 ( .A(global_index[7]), .Y(read_addr_array_2__7_) );
  INVX3 U245 ( .A(n40), .Y(n154) );
  NAND2BX1 U246 ( .AN(reset), .B(n131), .Y(n40) );
  NAND2X1 U247 ( .A(counter[1]), .B(n24), .Y(n980) );
  NOR2X1 U248 ( .A(n22), .B(counter[1]), .Y(n990) );
  NOR2BX1 U249 ( .AN(n990), .B(n24), .Y(n31) );
  NOR2BX1 U250 ( .AN(n990), .B(counter[0]), .Y(n33) );
  NOR3X1 U251 ( .A(n24), .B(counter[2]), .C(n23), .Y(n35) );
  NOR3X1 U252 ( .A(n23), .B(n24), .C(n22), .Y(n27) );
  NOR2X1 U253 ( .A(n980), .B(n22), .Y(n29) );
  NOR2X1 U254 ( .A(n980), .B(counter[2]), .Y(n37) );
  NOR4X1 U255 ( .A(counter[0]), .B(counter[1]), .C(counter[2]), .D(counter[3]), 
        .Y(n41) );
  CLKBUFX3 U256 ( .A(n39), .Y(n133) );
  NOR3X1 U257 ( .A(counter[1]), .B(counter[2]), .C(n24), .Y(n39) );
  NAND2X1 U258 ( .A(n104), .B(control_signal[0]), .Y(n1010) );
  NOR2X1 U259 ( .A(control_signal[2]), .B(control_signal[1]), .Y(n104) );
  NOR2X1 U260 ( .A(n1010), .B(counter[0]), .Y(N98) );
  AOI21X1 U261 ( .A0(n980), .A1(n1000), .B0(n1010), .Y(N99) );
  NAND2X1 U262 ( .A(counter[0]), .B(n23), .Y(n1000) );
  NOR2X1 U263 ( .A(n102), .B(n1010), .Y(N101) );
  XOR2X1 U264 ( .A(n127), .B(n21), .Y(n102) );
  OAI2BB1X1 U265 ( .A0N(counter[2]), .A1N(N98), .B0(n103), .Y(N100) );
  OAI21XL U266 ( .A0(n990), .A1(n126), .B0(n156), .Y(n103) );
  CLKINVX1 U267 ( .A(n1010), .Y(n156) );
  INVX3 U268 ( .A(reset), .Y(n157) );
  XNOR2X1 U269 ( .A(global_index[13]), .B(sub_187_carry_13_), .Y(
        read_addr_array_1__13_) );
  XNOR2X1 U270 ( .A(sub_187_carry_2_), .B(global_index[2]), .Y(
        read_addr_array_1__2_) );
  XNOR2X1 U271 ( .A(n121), .B(global_index[1]), .Y(read_addr_array_1__1_) );
  XOR2X1 U272 ( .A(global_index[13]), .B(add_194_carry_13_), .Y(
        read_addr_array_8__13_) );
  NAND2BX1 U273 ( .AN(mid_data[4]), .B(gray_data[4]), .Y(n135) );
  OAI222XL U274 ( .A0(mid_data[5]), .A1(n150), .B0(mid_data[5]), .B1(n135), 
        .C0(n150), .C1(n135), .Y(n136) );
  OAI222XL U275 ( .A0(gray_data[6]), .A1(n136), .B0(n153), .B1(n136), .C0(
        gray_data[6]), .C1(n153), .Y(n147) );
  NOR2BX1 U276 ( .AN(mid_data[4]), .B(gray_data[4]), .Y(n137) );
  OAI22XL U277 ( .A0(n137), .A1(n150), .B0(mid_data[5]), .B1(n137), .Y(n145)
         );
  NAND2BX1 U278 ( .AN(mid_data[2]), .B(gray_data[2]), .Y(n143) );
  OAI2BB2XL U279 ( .B0(gray_data[0]), .B1(n152), .A0N(n148), .A1N(mid_data[1]), 
        .Y(n138) );
  OAI21XL U280 ( .A0(mid_data[1]), .A1(n148), .B0(n138), .Y(n141) );
  NOR2BX1 U281 ( .AN(mid_data[2]), .B(gray_data[2]), .Y(n139) );
  OAI22XL U282 ( .A0(n139), .A1(n149), .B0(mid_data[3]), .B1(n139), .Y(n140)
         );
  AOI2BB2X1 U283 ( .B0(n141), .B1(n140), .A0N(n143), .A1N(n149), .Y(n142) );
  OAI221XL U284 ( .A0(mid_data[3]), .A1(n143), .B0(mid_data[3]), .B1(n149), 
        .C0(n142), .Y(n144) );
  OAI211X1 U285 ( .A0(gray_data[6]), .A1(n153), .B0(n145), .C0(n144), .Y(n146)
         );
  READ_DW01_inc_0_DW01_inc_1 add_191 ( .A({global_index[13:1], n121}), .SUM({
        read_addr_array_5__13_, read_addr_array_5__12_, read_addr_array_5__11_, 
        read_addr_array_5__10_, read_addr_array_5__9_, read_addr_array_5__8_, 
        read_addr_array_5__7_, read_addr_array_5__6_, read_addr_array_5__5_, 
        read_addr_array_5__4_, read_addr_array_5__3_, read_addr_array_5__2_, 
        read_addr_array_5__1_, read_addr_array_5__0_}) );
  READ_DW01_dec_0 sub_190 ( .A(global_index), .SUM({read_addr_array_4__13_, 
        read_addr_array_4__12_, read_addr_array_4__11_, read_addr_array_4__10_, 
        read_addr_array_4__9_, read_addr_array_4__8_, read_addr_array_4__7_, 
        read_addr_array_4__6_, read_addr_array_4__5_, read_addr_array_4__4_, 
        read_addr_array_4__3_, read_addr_array_4__2_, read_addr_array_4__1_, 
        read_addr_array_4__0_}) );
  DFFRX4 counter_reg_3_ ( .D(N101), .CK(clk), .RN(n157), .Q(counter[3]), .QN(
        n21) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n4, n5, n6, n_read_done;
  wire   [2:0] n_control_signal;

  BUFX12 U1 ( .A(n4), .Y(gray_addr[13]) );
  BUFX12 U2 ( .A(n5), .Y(lbp_addr[0]) );
  BUFX12 U3 ( .A(n6), .Y(lbp_valid) );
  CONTROL CONTROL ( .clk(clk), .reset(reset), .gray_ready(gray_ready), 
        .read_done(n_read_done), .current_state(n_control_signal), 
        .global_index({lbp_addr[13:1], n5}), .gray_req(gray_req), .lbp_valid(
        n6), .finish(finish) );
  READ READ ( .clk(clk), .reset(reset), .control_signal(n_control_signal), 
        .global_index({lbp_addr[13:1], n5}), .gray_data(gray_data), 
        .gray_addr({n4, gray_addr[12:0]}), .read_done(n_read_done), .result(
        lbp_data) );
endmodule

