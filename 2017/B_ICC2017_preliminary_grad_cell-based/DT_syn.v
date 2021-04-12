/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sun Feb  7 22:12:31 2021
/////////////////////////////////////////////////////////////


module control ( clk, reset, init_done, is_object, rd_res_done, forward_done, 
        backward_done, current_state, done );
  output [3:0] current_state;
  input clk, reset, init_done, is_object, rd_res_done, forward_done,
         backward_done;
  output done;
  wire   N37, N38, N39, N40, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n1;
  wire   [3:0] next_state;

  DFFRX4 \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(reset), .Q(
        current_state[0]), .QN(n5) );
  DFFRX4 \current_state_reg[3]  ( .D(next_state[3]), .CK(clk), .RN(reset), .Q(
        current_state[3]) );
  TLATNX1 \next_state_reg[1]  ( .D(N38), .GN(current_state[3]), .Q(
        next_state[1]) );
  TLATNX1 \next_state_reg[0]  ( .D(N37), .GN(current_state[3]), .Q(
        next_state[0]) );
  TLATNX1 \next_state_reg[2]  ( .D(N39), .GN(current_state[3]), .Q(
        next_state[2]) );
  TLATNX1 \next_state_reg[3]  ( .D(N40), .GN(current_state[3]), .Q(
        next_state[3]) );
  DFFRX2 \current_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(reset), .Q(
        current_state[2]), .QN(n3) );
  DFFRX2 \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(reset), .Q(
        current_state[1]), .QN(n4) );
  CLKINVX1 U3 ( .A(backward_done), .Y(n1) );
  NOR3X1 U4 ( .A(n1), .B(n7), .C(n8), .Y(N40) );
  XOR2X1 U5 ( .A(n4), .B(n5), .Y(N38) );
  XNOR2X1 U6 ( .A(current_state[2]), .B(N38), .Y(n8) );
  AND3X2 U7 ( .A(n7), .B(current_state[3]), .C(n8), .Y(done) );
  AOI2BB2X1 U8 ( .B0(N38), .B1(current_state[2]), .A0N(n4), .A1N(n5), .Y(n7)
         );
  OAI22XL U9 ( .A0(n11), .A1(n4), .B0(current_state[1]), .B1(n12), .Y(N37) );
  OA21XL U10 ( .A0(is_object), .A1(n5), .B0(n13), .Y(n12) );
  AOI22X1 U11 ( .A0(current_state[0]), .A1(n14), .B0(rd_res_done), .B1(n5), 
        .Y(n11) );
  OAI21XL U12 ( .A0(current_state[2]), .A1(init_done), .B0(n5), .Y(n13) );
  OAI22XL U13 ( .A0(forward_done), .A1(current_state[2]), .B0(backward_done), 
        .B1(n3), .Y(n14) );
  OAI21XL U14 ( .A0(n9), .A1(n3), .B0(n10), .Y(N39) );
  NOR3X1 U15 ( .A(n1), .B(n4), .C(n5), .Y(n9) );
  NAND4X1 U16 ( .A(forward_done), .B(current_state[0]), .C(current_state[1]), 
        .D(n3), .Y(n10) );
endmodule


module rdSti_DW01_dec_0_DW01_dec_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  NAND2BXL U1 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
  OR2XL U2 ( .A(n13), .B(A[2]), .Y(n12) );
  OR2XL U3 ( .A(n12), .B(A[3]), .Y(n11) );
  CLKINVX1 U4 ( .A(n16), .Y(n2) );
  CLKINVX1 U5 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U6 ( .A(A[10]), .Y(n3) );
  CLKINVX1 U7 ( .A(A[11]), .Y(n4) );
  AO21X1 U8 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U9 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U10 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U11 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U12 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U13 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U14 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U15 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U16 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U17 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U18 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U19 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U20 ( .A0(n2), .A1(n4), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U21 ( .A(n2), .B(n4), .Y(n15) );
  OAI21XL U22 ( .A0(n6), .A1(n3), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U23 ( .A(n6), .B(n3), .Y(n16) );
  NOR2X1 U24 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U25 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U26 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U27 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U28 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U29 ( .A(n11), .B(A[4]), .Y(n10) );
endmodule


module rdSti_DW01_inc_0_DW01_inc_4 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module rdSti ( clk, reset, control_signal, global_idx );
  input [3:0] control_signal;
  output [13:0] global_idx;
  input clk, reset;
  wire   n61, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63,
         N64, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n1, n3, n38, n52, n53, n54, n55, n57, n58,
         n59, n60;

  DFFRX4 \global_idx_reg[13]  ( .D(n39), .CK(clk), .RN(reset), .Q(
        global_idx[13]) );
  DFFRX4 \global_idx_reg[5]  ( .D(n46), .CK(clk), .RN(n57), .Q(global_idx[5])
         );
  DFFRX4 \global_idx_reg[6]  ( .D(n45), .CK(clk), .RN(n57), .Q(global_idx[6])
         );
  DFFRX4 \global_idx_reg[10]  ( .D(n42), .CK(clk), .RN(n57), .Q(global_idx[10]) );
  DFFRX4 \global_idx_reg[11]  ( .D(n41), .CK(clk), .RN(n57), .Q(global_idx[11]) );
  rdSti_DW01_dec_0_DW01_dec_1 sub_189 ( .A(global_idx), .SUM({N64, N63, N62, 
        N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51}) );
  rdSti_DW01_inc_0_DW01_inc_4 r365 ( .A({global_idx[13:5], n3, global_idx[3:0]}), .SUM({N36, N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23}) );
  DFFRX1 \global_idx_reg[12]  ( .D(n40), .CK(clk), .RN(n57), .Q(global_idx[12]) );
  DFFRX1 \global_idx_reg[0]  ( .D(n51), .CK(clk), .RN(reset), .Q(n61) );
  DFFRX2 \global_idx_reg[1]  ( .D(n50), .CK(clk), .RN(n57), .Q(global_idx[1])
         );
  DFFRX1 \global_idx_reg[8]  ( .D(n44), .CK(clk), .RN(n57), .Q(global_idx[8])
         );
  DFFRX1 \global_idx_reg[9]  ( .D(n43), .CK(clk), .RN(n57), .Q(global_idx[9])
         );
  DFFRX1 \global_idx_reg[7]  ( .D(n58), .CK(clk), .RN(n57), .Q(global_idx[7])
         );
  DFFRX1 \global_idx_reg[4]  ( .D(n47), .CK(clk), .RN(reset), .QN(n1) );
  DFFRX2 \global_idx_reg[2]  ( .D(n49), .CK(clk), .RN(n57), .Q(global_idx[2])
         );
  DFFRX2 \global_idx_reg[3]  ( .D(n48), .CK(clk), .RN(n57), .Q(global_idx[3])
         );
  BUFX12 U3 ( .A(n61), .Y(global_idx[0]) );
  CLKINVX3 U4 ( .A(n1), .Y(global_idx[4]) );
  INVXL U5 ( .A(n1), .Y(n3) );
  CLKBUFX3 U6 ( .A(n8), .Y(n52) );
  NOR3BXL U7 ( .AN(control_signal[2]), .B(control_signal[0]), .C(
        control_signal[1]), .Y(n36) );
  AOI22XL U8 ( .A0(N52), .A1(n55), .B0(global_idx[1]), .B1(n52), .Y(n32) );
  AOI22XL U9 ( .A0(N54), .A1(n55), .B0(global_idx[3]), .B1(n52), .Y(n28) );
  AOI22XL U10 ( .A0(N53), .A1(n55), .B0(global_idx[2]), .B1(n52), .Y(n30) );
  NAND3X1 U11 ( .A(n10), .B(n54), .C(n11), .Y(n40) );
  NAND2X1 U12 ( .A(N35), .B(n53), .Y(n10) );
  AOI22X1 U13 ( .A0(N63), .A1(n55), .B0(global_idx[12]), .B1(n52), .Y(n11) );
  CLKINVX1 U14 ( .A(n52), .Y(n59) );
  CLKBUFX3 U15 ( .A(n7), .Y(n55) );
  AND2X2 U16 ( .A(n35), .B(n59), .Y(n7) );
  CLKBUFX3 U17 ( .A(n5), .Y(n54) );
  NAND2X1 U18 ( .A(n59), .B(n36), .Y(n5) );
  CLKBUFX3 U19 ( .A(n9), .Y(n53) );
  AND2X2 U20 ( .A(n37), .B(n59), .Y(n9) );
  NAND3X1 U21 ( .A(n33), .B(n54), .C(n34), .Y(n51) );
  NAND2X1 U22 ( .A(N23), .B(n53), .Y(n33) );
  AOI22X1 U23 ( .A0(N51), .A1(n55), .B0(global_idx[0]), .B1(n52), .Y(n34) );
  CLKBUFX3 U24 ( .A(reset), .Y(n57) );
  NAND3X1 U25 ( .A(n14), .B(n54), .C(n15), .Y(n42) );
  NAND2X1 U26 ( .A(N33), .B(n53), .Y(n14) );
  AOI22X1 U27 ( .A0(N61), .A1(n55), .B0(global_idx[10]), .B1(n52), .Y(n15) );
  NAND3X1 U28 ( .A(n12), .B(n54), .C(n13), .Y(n41) );
  NAND2X1 U29 ( .A(N34), .B(n53), .Y(n12) );
  AOI22X1 U30 ( .A0(N62), .A1(n55), .B0(global_idx[11]), .B1(n52), .Y(n13) );
  NAND3X1 U31 ( .A(n4), .B(n54), .C(n6), .Y(n39) );
  NAND2X1 U32 ( .A(N36), .B(n53), .Y(n4) );
  AOI22X1 U33 ( .A0(N64), .A1(n55), .B0(global_idx[13]), .B1(n52), .Y(n6) );
  NAND3X1 U34 ( .A(n18), .B(n54), .C(n19), .Y(n44) );
  NAND2X1 U35 ( .A(N31), .B(n53), .Y(n18) );
  AOI22X1 U36 ( .A0(N59), .A1(n55), .B0(global_idx[8]), .B1(n52), .Y(n19) );
  NAND3X1 U37 ( .A(n16), .B(n54), .C(n17), .Y(n43) );
  NAND2X1 U38 ( .A(N32), .B(n53), .Y(n16) );
  AOI22X1 U39 ( .A0(N60), .A1(n55), .B0(global_idx[9]), .B1(n52), .Y(n17) );
  CLKINVX1 U40 ( .A(n20), .Y(n58) );
  AOI222XL U41 ( .A0(global_idx[7]), .A1(n52), .B0(N30), .B1(n53), .C0(N58), 
        .C1(n55), .Y(n20) );
  NAND3X1 U42 ( .A(n21), .B(n54), .C(n22), .Y(n45) );
  NAND2X1 U43 ( .A(N29), .B(n53), .Y(n21) );
  AOI22X1 U44 ( .A0(N57), .A1(n55), .B0(global_idx[6]), .B1(n52), .Y(n22) );
  NOR2X1 U45 ( .A(n38), .B(control_signal[2]), .Y(n37) );
  XOR2X1 U46 ( .A(control_signal[0]), .B(control_signal[1]), .Y(n38) );
  OAI31XL U47 ( .A0(n36), .A1(n35), .A2(n37), .B0(n60), .Y(n8) );
  CLKINVX1 U48 ( .A(control_signal[3]), .Y(n60) );
  NAND3X1 U49 ( .A(n25), .B(n54), .C(n26), .Y(n47) );
  NAND2X1 U50 ( .A(N27), .B(n53), .Y(n25) );
  AOI22X1 U51 ( .A0(N55), .A1(n55), .B0(n3), .B1(n52), .Y(n26) );
  NAND3X1 U52 ( .A(n23), .B(n54), .C(n24), .Y(n46) );
  NAND2X1 U53 ( .A(N28), .B(n53), .Y(n23) );
  AOI22X1 U54 ( .A0(N56), .A1(n55), .B0(global_idx[5]), .B1(n52), .Y(n24) );
  AND3X2 U55 ( .A(control_signal[1]), .B(control_signal[0]), .C(
        control_signal[2]), .Y(n35) );
  NAND3X1 U56 ( .A(n27), .B(n54), .C(n28), .Y(n48) );
  NAND2X1 U57 ( .A(N26), .B(n53), .Y(n27) );
  NAND3X1 U58 ( .A(n29), .B(n54), .C(n30), .Y(n49) );
  NAND2X1 U59 ( .A(N25), .B(n53), .Y(n29) );
  NAND3X1 U60 ( .A(n31), .B(n54), .C(n32), .Y(n50) );
  NAND2X1 U61 ( .A(N24), .B(n53), .Y(n31) );
endmodule


module checkSti ( clk, reset, control_signal, global_idx, sti_di, sti_rd, 
        sti_addr, is_object );
  input [3:0] control_signal;
  input [13:0] global_idx;
  input [15:0] sti_di;
  output [9:0] sti_addr;
  input clk, reset;
  output sti_rd, is_object;
  wire   N1, N2, N3, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26;

  INVXL U2 ( .A(global_idx[1]), .Y(N1) );
  INVXL U3 ( .A(global_idx[2]), .Y(N2) );
  CLKINVX1 U4 ( .A(global_idx[0]), .Y(n11) );
  CLKINVX1 U5 ( .A(N1), .Y(n26) );
  OAI2BB2X2 U6 ( .B0(n25), .B1(N3), .A0N(N3), .A1N(n24), .Y(is_object) );
  CLKINVX1 U7 ( .A(global_idx[3]), .Y(N3) );
  NOR3BX2 U8 ( .AN(control_signal[0]), .B(control_signal[3]), .C(
        control_signal[1]), .Y(sti_rd) );
  CLKBUFX3 U9 ( .A(global_idx[13]), .Y(sti_addr[9]) );
  CLKBUFX3 U10 ( .A(global_idx[12]), .Y(sti_addr[8]) );
  CLKBUFX2 U11 ( .A(global_idx[11]), .Y(sti_addr[7]) );
  CLKBUFX2 U12 ( .A(global_idx[10]), .Y(sti_addr[6]) );
  CLKBUFX3 U13 ( .A(global_idx[9]), .Y(sti_addr[5]) );
  CLKBUFX3 U14 ( .A(global_idx[8]), .Y(sti_addr[4]) );
  CLKBUFX3 U15 ( .A(global_idx[7]), .Y(sti_addr[3]) );
  CLKBUFX2 U16 ( .A(global_idx[6]), .Y(sti_addr[2]) );
  CLKBUFX2 U17 ( .A(global_idx[5]), .Y(sti_addr[1]) );
  CLKBUFX2 U18 ( .A(global_idx[4]), .Y(sti_addr[0]) );
  AOI221X1 U19 ( .A0(sti_di[6]), .A1(n21), .B0(sti_di[7]), .B1(n20), .C0(n12), 
        .Y(n15) );
  AO22X4 U20 ( .A0(sti_di[1]), .A1(n18), .B0(sti_di[0]), .B1(n17), .Y(n13) );
  AOI221X1 U21 ( .A0(sti_di[10]), .A1(n21), .B0(sti_di[11]), .B1(n20), .C0(n19), .Y(n22) );
  AOI221X1 U22 ( .A0(sti_di[14]), .A1(n21), .B0(sti_di[15]), .B1(n20), .C0(n16), .Y(n23) );
  OA22X2 U23 ( .A0(n15), .A1(global_idx[2]), .B0(n14), .B1(N2), .Y(n25) );
  OAI22X1 U24 ( .A0(n23), .A1(global_idx[2]), .B0(n22), .B1(N2), .Y(n24) );
  NOR2X1 U25 ( .A(n26), .B(n11), .Y(n21) );
  NOR2X1 U26 ( .A(n26), .B(global_idx[0]), .Y(n20) );
  NOR2X1 U27 ( .A(global_idx[0]), .B(N1), .Y(n18) );
  NOR2X1 U28 ( .A(n11), .B(N1), .Y(n17) );
  AO22X1 U29 ( .A0(sti_di[5]), .A1(n18), .B0(sti_di[4]), .B1(n17), .Y(n12) );
  AOI221XL U30 ( .A0(sti_di[2]), .A1(n21), .B0(sti_di[3]), .B1(n20), .C0(n13), 
        .Y(n14) );
  AO22X1 U31 ( .A0(sti_di[13]), .A1(n18), .B0(sti_di[12]), .B1(n17), .Y(n16)
         );
  AO22X1 U32 ( .A0(sti_di[9]), .A1(n18), .B0(sti_di[8]), .B1(n17), .Y(n19) );
endmodule


module getSmallest ( element1, element2, element3, element4, final_result );
  input [7:0] element1;
  input [7:0] element2;
  input [7:0] element3;
  input [7:0] element4;
  output [7:0] final_result;
  wire   N3, N5, N7, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99;
  wire   [7:0] result1;
  wire   [7:0] result2;

  AO22X4 U23 ( .A0(element1[4]), .A1(n36), .B0(element2[4]), .B1(n99), .Y(
        result1[4]) );
  AO22X4 U24 ( .A0(element3[4]), .A1(n37), .B0(element4[4]), .B1(n98), .Y(
        result2[4]) );
  AO22X4 U31 ( .A0(n97), .A1(result2[1]), .B0(result1[1]), .B1(n38), .Y(
        final_result[1]) );
  AO22X4 U34 ( .A0(n97), .A1(result2[0]), .B0(result1[0]), .B1(n38), .Y(
        final_result[0]) );
  INVX3 U1 ( .A(element4[5]), .Y(n76) );
  BUFX6 U2 ( .A(n60), .Y(n1) );
  OAI222X2 U3 ( .A0(element2[6]), .A1(n41), .B0(n54), .B1(n41), .C0(
        element2[6]), .C1(n54), .Y(n52) );
  NAND2BX4 U4 ( .AN(element3[2]), .B(element4[2]), .Y(n63) );
  OR2X4 U5 ( .A(result1[3]), .B(n94), .Y(n24) );
  OR2X4 U6 ( .A(n82), .B(n94), .Y(n34) );
  INVX3 U7 ( .A(result2[3]), .Y(n94) );
  CLKAND2X2 U8 ( .A(element4[1]), .B(n98), .Y(n14) );
  OAI221X2 U9 ( .A0(element2[6]), .A1(n54), .B0(n50), .B1(n49), .C0(n48), .Y(
        n51) );
  NAND2X6 U10 ( .A(n18), .B(n19), .Y(n49) );
  AO22X2 U11 ( .A0(n97), .A1(result2[4]), .B0(result1[4]), .B1(n39), .Y(
        final_result[4]) );
  NAND2XL U12 ( .A(element3[5]), .B(n37), .Y(n26) );
  NAND2BX2 U13 ( .AN(element3[4]), .B(element4[4]), .Y(n59) );
  OA22X4 U14 ( .A0(n61), .A1(element3[3]), .B0(n61), .B1(n75), .Y(n65) );
  INVX6 U15 ( .A(element4[3]), .Y(n75) );
  NOR2BX1 U16 ( .AN(element3[2]), .B(element4[2]), .Y(n61) );
  OR2X6 U17 ( .A(element1[3]), .B(n56), .Y(n29) );
  OR2X6 U18 ( .A(element1[3]), .B(n44), .Y(n30) );
  OA22X4 U19 ( .A0(n42), .A1(element1[3]), .B0(n42), .B1(n56), .Y(n46) );
  BUFX20 U20 ( .A(N5), .Y(n2) );
  BUFX8 U21 ( .A(n2), .Y(n37) );
  AO22X2 U22 ( .A0(element3[2]), .A1(n2), .B0(element4[2]), .B1(n98), .Y(
        result2[2]) );
  AO22X4 U25 ( .A0(element3[0]), .A1(n2), .B0(element4[0]), .B1(n98), .Y(
        result2[0]) );
  INVX12 U26 ( .A(n2), .Y(n98) );
  OAI222X2 U27 ( .A0(element4[6]), .A1(n1), .B0(n73), .B1(n1), .C0(element4[6]), .C1(n73), .Y(n71) );
  AND2XL U28 ( .A(element1[1]), .B(n35), .Y(n22) );
  AOI21X4 U29 ( .A0(element1[1]), .A1(n55), .B0(element1[0]), .Y(n43) );
  AOI2BB2X4 U30 ( .B0(n43), .B1(element2[0]), .A0N(element1[1]), .A1N(n55), 
        .Y(n45) );
  AOI2BB2X2 U32 ( .B0(n81), .B1(result2[0]), .A0N(result1[1]), .A1N(n93), .Y(
        n83) );
  INVX1 U33 ( .A(result2[2]), .Y(n17) );
  CLKINVX1 U35 ( .A(element2[7]), .Y(n58) );
  OR2X2 U36 ( .A(result2[6]), .B(n79), .Y(n3) );
  OR2X4 U37 ( .A(result2[6]), .B(n92), .Y(n5) );
  OR2X6 U38 ( .A(n88), .B(n87), .Y(n32) );
  CLKINVX1 U39 ( .A(element2[1]), .Y(n55) );
  NOR2BX2 U40 ( .AN(element1[2]), .B(element2[2]), .Y(n42) );
  CLKINVX1 U41 ( .A(result2[1]), .Y(n93) );
  CLKINVX3 U42 ( .A(result2[5]), .Y(n95) );
  CLKINVX1 U43 ( .A(element4[7]), .Y(n77) );
  OR2X4 U44 ( .A(n13), .B(n14), .Y(result2[1]) );
  AND2X2 U45 ( .A(element3[1]), .B(n2), .Y(n13) );
  OR2X2 U46 ( .A(n22), .B(n23), .Y(result1[1]) );
  NAND2X2 U47 ( .A(n11), .B(n12), .Y(result1[3]) );
  NAND2X1 U48 ( .A(element1[3]), .B(n36), .Y(n11) );
  NAND2X2 U49 ( .A(n20), .B(n21), .Y(result2[3]) );
  NAND2X1 U50 ( .A(element4[3]), .B(n98), .Y(n21) );
  NAND2X1 U51 ( .A(element3[3]), .B(n37), .Y(n20) );
  NAND3X2 U52 ( .A(n3), .B(n4), .C(n5), .Y(n90) );
  AO22X1 U53 ( .A0(element3[6]), .A1(n37), .B0(element4[6]), .B1(n98), .Y(
        result2[6]) );
  INVX8 U54 ( .A(n38), .Y(n97) );
  AO22X2 U55 ( .A0(n97), .A1(result2[2]), .B0(result1[2]), .B1(n38), .Y(
        final_result[2]) );
  OAI22X1 U56 ( .A0(n66), .A1(n76), .B0(element3[5]), .B1(n66), .Y(n67) );
  NAND2BX2 U57 ( .AN(element1[4]), .B(element2[4]), .Y(n40) );
  OR3X2 U58 ( .A(n6), .B(n7), .C(n8), .Y(n41) );
  INVX8 U59 ( .A(n35), .Y(n99) );
  BUFX6 U60 ( .A(N3), .Y(n35) );
  NOR2X1 U61 ( .A(n47), .B(n57), .Y(n9) );
  CLKBUFX3 U62 ( .A(N3), .Y(n36) );
  OR2X6 U63 ( .A(n92), .B(n79), .Y(n4) );
  NOR2X1 U64 ( .A(element1[5]), .B(n57), .Y(n6) );
  NOR2X2 U65 ( .A(element1[5]), .B(n40), .Y(n7) );
  NOR2X2 U66 ( .A(n57), .B(n40), .Y(n8) );
  INVX3 U67 ( .A(element2[5]), .Y(n57) );
  NOR2X1 U68 ( .A(element1[5]), .B(n47), .Y(n10) );
  OR2X1 U69 ( .A(n9), .B(n10), .Y(n48) );
  NAND2BX2 U70 ( .AN(result1[2]), .B(result2[2]), .Y(n82) );
  NAND2X1 U71 ( .A(element2[3]), .B(n99), .Y(n12) );
  AO22X4 U72 ( .A0(n97), .A1(result2[3]), .B0(result1[3]), .B1(n39), .Y(
        final_result[3]) );
  OR2X8 U73 ( .A(result1[3]), .B(n82), .Y(n25) );
  OA22X4 U74 ( .A0(n80), .A1(result1[3]), .B0(n80), .B1(n94), .Y(n84) );
  OR2X1 U75 ( .A(element3[3]), .B(n75), .Y(n15) );
  OR2X1 U76 ( .A(element3[3]), .B(n63), .Y(n16) );
  NAND2X1 U77 ( .A(n15), .B(n16), .Y(n69) );
  CLKAND2X8 U78 ( .A(result1[2]), .B(n17), .Y(n80) );
  OR2X8 U79 ( .A(n46), .B(n45), .Y(n18) );
  OR2X1 U80 ( .A(n44), .B(n56), .Y(n19) );
  NAND2BX4 U81 ( .AN(element1[2]), .B(element2[2]), .Y(n44) );
  INVX4 U82 ( .A(element2[3]), .Y(n56) );
  AOI21X4 U83 ( .A0(element3[1]), .A1(n74), .B0(element3[0]), .Y(n62) );
  AOI2BB2X4 U84 ( .B0(n62), .B1(element4[0]), .A0N(element3[1]), .A1N(n74), 
        .Y(n64) );
  AO22X2 U85 ( .A0(element1[5]), .A1(n36), .B0(element2[5]), .B1(n99), .Y(
        result1[5]) );
  OAI22X2 U86 ( .A0(n65), .A1(n64), .B0(n63), .B1(n75), .Y(n68) );
  AND2X1 U87 ( .A(element2[1]), .B(n99), .Y(n23) );
  AOI21X4 U88 ( .A0(result1[1]), .A1(n93), .B0(result1[0]), .Y(n81) );
  AO22X2 U89 ( .A0(element1[2]), .A1(n35), .B0(element2[2]), .B1(n99), .Y(
        result1[2]) );
  NAND2X1 U90 ( .A(n24), .B(n25), .Y(n88) );
  NAND3X6 U91 ( .A(n31), .B(n32), .C(n86), .Y(n89) );
  OR2X2 U92 ( .A(result2[6]), .B(n92), .Y(n31) );
  NAND2X2 U93 ( .A(n26), .B(n27), .Y(result2[5]) );
  INVXL U94 ( .A(n39), .Y(n28) );
  NAND2XL U95 ( .A(element4[5]), .B(n98), .Y(n27) );
  CLKBUFX3 U96 ( .A(N7), .Y(n39) );
  OR2X4 U97 ( .A(n84), .B(n83), .Y(n33) );
  NAND2X4 U98 ( .A(n33), .B(n34), .Y(n87) );
  INVX3 U99 ( .A(element3[6]), .Y(n73) );
  NAND2X1 U100 ( .A(n29), .B(n30), .Y(n50) );
  NAND2BX2 U101 ( .AN(result1[4]), .B(result2[4]), .Y(n78) );
  INVX3 U102 ( .A(result1[6]), .Y(n92) );
  INVX3 U103 ( .A(element4[1]), .Y(n74) );
  BUFX16 U104 ( .A(N7), .Y(n38) );
  AO22XL U105 ( .A0(n97), .A1(result2[6]), .B0(result1[6]), .B1(n39), .Y(
        final_result[6]) );
  AO22XL U106 ( .A0(n28), .A1(result2[7]), .B0(result1[7]), .B1(n39), .Y(
        final_result[7]) );
  INVX3 U107 ( .A(element1[6]), .Y(n54) );
  AO22XL U108 ( .A0(element1[6]), .A1(n36), .B0(element2[6]), .B1(n99), .Y(
        result1[6]) );
  AO22XL U109 ( .A0(element3[7]), .A1(n37), .B0(element4[7]), .B1(n98), .Y(
        result2[7]) );
  CLKINVX1 U110 ( .A(result2[7]), .Y(n96) );
  AO22X1 U111 ( .A0(n97), .A1(result2[5]), .B0(result1[5]), .B1(n39), .Y(
        final_result[5]) );
  AO22X1 U112 ( .A0(element1[7]), .A1(n35), .B0(element2[7]), .B1(n99), .Y(
        result1[7]) );
  AO22X1 U113 ( .A0(element1[0]), .A1(n35), .B0(element2[0]), .B1(n99), .Y(
        result1[0]) );
  OAI222X2 U114 ( .A0(result1[5]), .A1(n95), .B0(result1[5]), .B1(n78), .C0(
        n95), .C1(n78), .Y(n79) );
  OAI221X2 U115 ( .A0(element4[6]), .A1(n73), .B0(n69), .B1(n68), .C0(n67), 
        .Y(n70) );
  OAI222X2 U116 ( .A0(element3[5]), .A1(n76), .B0(element3[5]), .B1(n59), .C0(
        n76), .C1(n59), .Y(n60) );
  OAI22X1 U117 ( .A0(n85), .A1(n95), .B0(result1[5]), .B1(n85), .Y(n86) );
  OAI21X4 U118 ( .A0(element1[7]), .A1(n58), .B0(n53), .Y(N3) );
  AO22X4 U119 ( .A0(n58), .A1(element1[7]), .B0(n51), .B1(n52), .Y(n53) );
  OAI21X4 U120 ( .A0(element3[7]), .A1(n77), .B0(n72), .Y(N5) );
  AO22X4 U121 ( .A0(n77), .A1(element3[7]), .B0(n71), .B1(n70), .Y(n72) );
  OAI21X4 U122 ( .A0(result1[7]), .A1(n96), .B0(n91), .Y(N7) );
  AO22X4 U123 ( .A0(n96), .A1(result1[7]), .B0(n90), .B1(n89), .Y(n91) );
  NOR2BX1 U124 ( .AN(element1[4]), .B(element2[4]), .Y(n47) );
  NOR2BX1 U125 ( .AN(element3[4]), .B(element4[4]), .Y(n66) );
  NOR2BX1 U126 ( .AN(result1[4]), .B(result2[4]), .Y(n85) );
endmodule


module wrRes_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX2 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module wrRes_DW01_inc_1_DW01_inc_3 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX4 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX4 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX4 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX2 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX2 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX4 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  INVXL U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module wrRes ( clk, reset, control_signal, global_idx, is_object, rd_idx, 
        res_di, res_do, res_wr, init_done, forward_done, backward_done );
  input [3:0] control_signal;
  input [13:0] global_idx;
  input [2:0] rd_idx;
  input [7:0] res_di;
  output [7:0] res_do;
  input clk, reset, is_object;
  output res_wr, init_done, forward_done, backward_done;
  wire   \res_data[4][7] , \res_data[4][6] , \res_data[4][5] ,
         \res_data[4][4] , \res_data[4][3] , \res_data[4][2] ,
         \res_data[4][1] , \res_data[4][0] , \res_data[3][7] ,
         \res_data[3][6] , \res_data[3][5] , \res_data[3][4] ,
         \res_data[3][2] , \res_data[3][1] , \res_data[3][0] ,
         \res_data[2][7] , \res_data[2][6] , \res_data[2][5] ,
         \res_data[2][4] , \res_data[2][3] , \res_data[2][2] ,
         \res_data[2][1] , \res_data[2][0] , \res_data[1][7] ,
         \res_data[1][6] , \res_data[1][5] , \res_data[1][4] ,
         \res_data[1][3] , \res_data[1][2] , \res_data[1][1] ,
         \res_data[1][0] , \res_data[0][7] , \res_data[0][6] ,
         \res_data[0][5] , \res_data[0][4] , \res_data[0][3] ,
         \res_data[0][2] , \res_data[0][1] , \res_data[0][0] , N30, N31, N32,
         N33, N34, N35, N36, N37, N56, N58, N59, N60, N61, N62, N63, N64, N65,
         n19, n20, n21, n22, n23, n24, n25, n26, n29, n32, n34, n35, n36, n37,
         n38, n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n1, n2, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n27, n28, n30, n31, n33, n41, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124;
  wire   [7:0] smallestResult;

  DFFRX4 \res_data_reg[2][4]  ( .D(n71), .CK(clk), .RN(n94), .Q(
        \res_data[2][4] ) );
  DFFRX4 \res_data_reg[2][2]  ( .D(n69), .CK(clk), .RN(n94), .Q(
        \res_data[2][2] ) );
  DFFRX4 \res_data_reg[1][4]  ( .D(n63), .CK(clk), .RN(n94), .Q(
        \res_data[1][4] ) );
  DFFRX4 \res_data_reg[0][4]  ( .D(n55), .CK(clk), .RN(n93), .Q(
        \res_data[0][4] ) );
  AOI222X2 U10 ( .A0(N37), .A1(n24), .B0(\res_data[4][7] ), .B1(n2), .C0(N65), 
        .C1(n26), .Y(n23) );
  AOI222X2 U16 ( .A0(N34), .A1(n24), .B0(\res_data[4][4] ), .B1(n2), .C0(N62), 
        .C1(n26), .Y(n29) );
  AOI222X2 U22 ( .A0(N31), .A1(n24), .B0(\res_data[4][1] ), .B1(n2), .C0(N59), 
        .C1(n26), .Y(n32) );
  NOR2BX4 U26 ( .AN(n34), .B(N56), .Y(n25) );
  getSmallest GETSMALLEST ( .element1({\res_data[0][7] , \res_data[0][6] , 
        \res_data[0][5] , \res_data[0][4] , \res_data[0][3] , \res_data[0][2] , 
        \res_data[0][1] , \res_data[0][0] }), .element2({\res_data[1][7] , 
        \res_data[1][6] , \res_data[1][5] , \res_data[1][4] , \res_data[1][3] , 
        \res_data[1][2] , \res_data[1][1] , \res_data[1][0] }), .element3({
        \res_data[2][7] , \res_data[2][6] , \res_data[2][5] , \res_data[2][4] , 
        \res_data[2][3] , \res_data[2][2] , \res_data[2][1] , \res_data[2][0] }), .element4({\res_data[3][7] , \res_data[3][6] , \res_data[3][5] , 
        \res_data[3][4] , n33, \res_data[3][2] , \res_data[3][1] , 
        \res_data[3][0] }), .final_result(smallestResult) );
  wrRes_DW01_inc_0_DW01_inc_2 add_286_2 ( .A(smallestResult), .SUM({N65, N64, 
        N63, N62, N61, N60, N59, N58}) );
  wrRes_DW01_inc_1_DW01_inc_3 r372 ( .A(smallestResult), .SUM({N37, N36, N35, 
        N34, N33, N32, N31, N30}) );
  EDFFX1 \res_data_reg[4][0]  ( .D(res_di[0]), .E(n85), .CK(clk), .Q(
        \res_data[4][0] ) );
  EDFFX1 \res_data_reg[4][5]  ( .D(res_di[5]), .E(n85), .CK(clk), .Q(
        \res_data[4][5] ), .QN(n8) );
  EDFFX1 \res_data_reg[4][3]  ( .D(res_di[3]), .E(n85), .CK(clk), .Q(
        \res_data[4][3] ), .QN(n9) );
  EDFFX1 \res_data_reg[4][1]  ( .D(res_di[1]), .E(n85), .CK(clk), .Q(
        \res_data[4][1] ), .QN(n10) );
  EDFFX1 \res_data_reg[4][2]  ( .D(res_di[2]), .E(n85), .CK(clk), .Q(
        \res_data[4][2] ) );
  EDFFX1 \res_data_reg[4][4]  ( .D(res_di[4]), .E(n85), .CK(clk), .Q(
        \res_data[4][4] ) );
  DFFRX1 \res_data_reg[3][7]  ( .D(n82), .CK(clk), .RN(n94), .Q(
        \res_data[3][7] ) );
  DFFRX1 \res_data_reg[1][7]  ( .D(n66), .CK(clk), .RN(n94), .Q(
        \res_data[1][7] ) );
  DFFRX1 \res_data_reg[2][7]  ( .D(n74), .CK(clk), .RN(n94), .Q(
        \res_data[2][7] ) );
  DFFRX1 \res_data_reg[0][7]  ( .D(n58), .CK(clk), .RN(n93), .Q(
        \res_data[0][7] ) );
  DFFRX1 \res_data_reg[3][0]  ( .D(n75), .CK(clk), .RN(n94), .Q(
        \res_data[3][0] ) );
  DFFRX1 \res_data_reg[1][0]  ( .D(n59), .CK(clk), .RN(n93), .Q(
        \res_data[1][0] ) );
  DFFRX1 \res_data_reg[2][0]  ( .D(n67), .CK(clk), .RN(n94), .Q(
        \res_data[2][0] ) );
  DFFRX1 \res_data_reg[1][6]  ( .D(n65), .CK(clk), .RN(n94), .Q(
        \res_data[1][6] ) );
  DFFRX1 \res_data_reg[3][6]  ( .D(n81), .CK(clk), .RN(n93), .Q(
        \res_data[3][6] ) );
  DFFRX4 \res_data_reg[3][2]  ( .D(n77), .CK(clk), .RN(n93), .Q(
        \res_data[3][2] ) );
  DFFRX1 \res_data_reg[0][6]  ( .D(n57), .CK(clk), .RN(n93), .Q(
        \res_data[0][6] ) );
  DFFRX1 \res_data_reg[2][6]  ( .D(n73), .CK(clk), .RN(n94), .Q(
        \res_data[2][6] ) );
  EDFFX1 \res_data_reg[4][6]  ( .D(res_di[6]), .E(n85), .CK(clk), .Q(
        \res_data[4][6] ) );
  DFFRX4 \res_data_reg[0][2]  ( .D(n53), .CK(clk), .RN(n93), .Q(
        \res_data[0][2] ) );
  DFFRX2 \res_data_reg[0][5]  ( .D(n56), .CK(clk), .RN(n93), .Q(
        \res_data[0][5] ) );
  DFFRX2 \res_data_reg[3][3]  ( .D(n78), .CK(clk), .RN(reset), .Q(n33) );
  EDFFXL \res_data_reg[4][7]  ( .D(res_di[7]), .E(n85), .CK(clk), .Q(
        \res_data[4][7] ), .QN(n112) );
  DFFRX2 \res_data_reg[3][4]  ( .D(n79), .CK(clk), .RN(n94), .Q(
        \res_data[3][4] ) );
  DFFRX2 \res_data_reg[1][2]  ( .D(n61), .CK(clk), .RN(n93), .Q(
        \res_data[1][2] ) );
  DFFRX2 \res_data_reg[1][1]  ( .D(n60), .CK(clk), .RN(n93), .Q(
        \res_data[1][1] ) );
  DFFRX2 \res_data_reg[1][5]  ( .D(n64), .CK(clk), .RN(n94), .Q(
        \res_data[1][5] ) );
  DFFRX1 \res_data_reg[2][1]  ( .D(n68), .CK(clk), .RN(n94), .Q(
        \res_data[2][1] ) );
  DFFRX2 \res_data_reg[2][3]  ( .D(n70), .CK(clk), .RN(n94), .Q(
        \res_data[2][3] ) );
  DFFRX2 \res_data_reg[1][3]  ( .D(n62), .CK(clk), .RN(n93), .Q(
        \res_data[1][3] ) );
  DFFRX1 \res_data_reg[0][0]  ( .D(n51), .CK(clk), .RN(n93), .Q(
        \res_data[0][0] ) );
  DFFRX2 \res_data_reg[0][1]  ( .D(n52), .CK(clk), .RN(n93), .Q(
        \res_data[0][1] ) );
  DFFRX2 \res_data_reg[0][3]  ( .D(n54), .CK(clk), .RN(n93), .Q(
        \res_data[0][3] ) );
  DFFRX2 \res_data_reg[2][5]  ( .D(n72), .CK(clk), .RN(n94), .Q(
        \res_data[2][5] ) );
  DFFRX2 \res_data_reg[3][1]  ( .D(n76), .CK(clk), .RN(n94), .Q(
        \res_data[3][1] ) );
  DFFRX2 \res_data_reg[3][5]  ( .D(n80), .CK(clk), .RN(n93), .Q(
        \res_data[3][5] ) );
  OR2X1 U3 ( .A(\res_data[4][6] ), .B(n98), .Y(n86) );
  OAI22X1 U4 ( .A0(n103), .A1(n102), .B0(n101), .B1(n9), .Y(n106) );
  OR2X1 U5 ( .A(n111), .B(n98), .Y(n87) );
  OAI221X1 U6 ( .A0(\res_data[4][6] ), .A1(n111), .B0(n107), .B1(n106), .C0(
        n105), .Y(n108) );
  INVX3 U7 ( .A(N36), .Y(n111) );
  NAND2BX4 U8 ( .AN(N34), .B(\res_data[4][4] ), .Y(n97) );
  CLKAND2X12 U9 ( .A(N56), .B(n34), .Y(n26) );
  CLKINVX8 U11 ( .A(n25), .Y(n1) );
  INVX16 U12 ( .A(n1), .Y(n2) );
  OAI22X1 U13 ( .A0(n104), .A1(n8), .B0(N35), .B1(n104), .Y(n105) );
  OAI222X2 U14 ( .A0(N35), .A1(n8), .B0(N35), .B1(n97), .C0(n8), .C1(n97), .Y(
        n98) );
  NAND3X2 U15 ( .A(n86), .B(n87), .C(n88), .Y(n109) );
  OR2X1 U17 ( .A(\res_data[4][6] ), .B(n111), .Y(n88) );
  INVX6 U18 ( .A(n32), .Y(res_do[1]) );
  AND2X2 U19 ( .A(N33), .B(n24), .Y(n17) );
  INVX6 U20 ( .A(n29), .Y(res_do[4]) );
  AND2X2 U21 ( .A(N36), .B(n24), .Y(n41) );
  AND2X2 U23 ( .A(\res_data[4][6] ), .B(n2), .Y(n83) );
  AND2X2 U24 ( .A(N61), .B(n26), .Y(n27) );
  AND2X2 U25 ( .A(N63), .B(n26), .Y(n31) );
  AND2X2 U27 ( .A(N64), .B(n26), .Y(n84) );
  OR3X6 U28 ( .A(n14), .B(n15), .C(n16), .Y(res_do[0]) );
  NAND3X6 U29 ( .A(n11), .B(n12), .C(n13), .Y(res_do[2]) );
  OR3X6 U30 ( .A(n28), .B(n30), .C(n31), .Y(res_do[5]) );
  OR3X6 U31 ( .A(n41), .B(n83), .C(n84), .Y(res_do[6]) );
  OR3X6 U32 ( .A(n17), .B(n18), .C(n27), .Y(res_do[3]) );
  NAND3XL U33 ( .A(rd_idx[0]), .B(n36), .C(rd_idx[1]), .Y(n39) );
  AND3X4 U34 ( .A(n21), .B(n115), .C(is_object), .Y(n34) );
  INVX6 U35 ( .A(n23), .Y(res_do[7]) );
  NAND2XL U36 ( .A(N32), .B(n24), .Y(n11) );
  NAND2X1 U37 ( .A(\res_data[4][2] ), .B(n2), .Y(n12) );
  NAND2X1 U38 ( .A(N60), .B(n26), .Y(n13) );
  AND3X4 U39 ( .A(is_object), .B(n115), .C(n20), .Y(n24) );
  AND2XL U40 ( .A(N30), .B(n24), .Y(n14) );
  AND2X2 U41 ( .A(\res_data[4][0] ), .B(n2), .Y(n15) );
  AND2X2 U42 ( .A(N58), .B(n26), .Y(n16) );
  AND2X2 U43 ( .A(\res_data[4][3] ), .B(n2), .Y(n18) );
  AND2X1 U44 ( .A(N35), .B(n24), .Y(n28) );
  AND2X2 U45 ( .A(\res_data[4][5] ), .B(n2), .Y(n30) );
  AND3X2 U46 ( .A(rd_idx[2]), .B(n40), .C(n42), .Y(n85) );
  NOR3BXL U47 ( .AN(control_signal[0]), .B(control_signal[2]), .C(n116), .Y(
        n20) );
  CLKBUFX3 U48 ( .A(n39), .Y(n89) );
  NOR2BX1 U49 ( .AN(n40), .B(rd_idx[2]), .Y(n36) );
  CLKBUFX3 U50 ( .A(n37), .Y(n91) );
  CLKBUFX3 U51 ( .A(n38), .Y(n90) );
  OR2XL U52 ( .A(global_idx[1]), .B(global_idx[2]), .Y(n49) );
  OR4XL U53 ( .A(global_idx[3]), .B(global_idx[4]), .C(global_idx[5]), .D(
        global_idx[6]), .Y(n48) );
  AND4XL U54 ( .A(global_idx[0]), .B(global_idx[1]), .C(global_idx[2]), .D(
        global_idx[3]), .Y(n47) );
  CLKBUFX3 U55 ( .A(n96), .Y(n95) );
  INVX3 U56 ( .A(n95), .Y(n93) );
  INVX3 U57 ( .A(n95), .Y(n94) );
  CLKINVX1 U58 ( .A(reset), .Y(n96) );
  CLKBUFX3 U59 ( .A(n35), .Y(n92) );
  NAND3X1 U60 ( .A(n113), .B(n114), .C(n36), .Y(n35) );
  NOR2X1 U61 ( .A(n43), .B(n44), .Y(init_done) );
  NOR2BX1 U62 ( .AN(N34), .B(\res_data[4][4] ), .Y(n104) );
  NOR3X1 U63 ( .A(n95), .B(rd_idx[1]), .C(rd_idx[0]), .Y(n42) );
  CLKINVX1 U64 ( .A(res_di[0]), .Y(n124) );
  CLKINVX1 U65 ( .A(res_di[1]), .Y(n123) );
  CLKINVX1 U66 ( .A(res_di[2]), .Y(n122) );
  CLKINVX1 U67 ( .A(res_di[3]), .Y(n121) );
  CLKINVX1 U68 ( .A(res_di[4]), .Y(n120) );
  CLKINVX1 U69 ( .A(res_di[5]), .Y(n119) );
  CLKINVX1 U70 ( .A(res_di[6]), .Y(n118) );
  CLKINVX1 U71 ( .A(res_di[7]), .Y(n117) );
  OAI2BB2XL U72 ( .B0(n124), .B1(n91), .A0N(\res_data[1][0] ), .A1N(n91), .Y(
        n59) );
  OAI2BB2XL U73 ( .B0(n123), .B1(n91), .A0N(\res_data[1][1] ), .A1N(n91), .Y(
        n60) );
  OAI2BB2XL U74 ( .B0(n122), .B1(n91), .A0N(\res_data[1][2] ), .A1N(n91), .Y(
        n61) );
  OAI2BB2XL U75 ( .B0(n121), .B1(n91), .A0N(\res_data[1][3] ), .A1N(n91), .Y(
        n62) );
  OAI2BB2XL U76 ( .B0(n120), .B1(n91), .A0N(\res_data[1][4] ), .A1N(n91), .Y(
        n63) );
  OAI2BB2XL U77 ( .B0(n119), .B1(n91), .A0N(\res_data[1][5] ), .A1N(n91), .Y(
        n64) );
  OAI2BB2XL U78 ( .B0(n118), .B1(n91), .A0N(\res_data[1][6] ), .A1N(n91), .Y(
        n65) );
  OAI2BB2XL U79 ( .B0(n117), .B1(n91), .A0N(\res_data[1][7] ), .A1N(n91), .Y(
        n66) );
  OAI2BB2XL U80 ( .B0(n124), .B1(n90), .A0N(\res_data[2][0] ), .A1N(n90), .Y(
        n67) );
  OAI2BB2XL U81 ( .B0(n123), .B1(n90), .A0N(\res_data[2][1] ), .A1N(n90), .Y(
        n68) );
  OAI2BB2XL U82 ( .B0(n122), .B1(n90), .A0N(\res_data[2][2] ), .A1N(n90), .Y(
        n69) );
  OAI2BB2XL U83 ( .B0(n121), .B1(n90), .A0N(\res_data[2][3] ), .A1N(n90), .Y(
        n70) );
  OAI2BB2XL U84 ( .B0(n120), .B1(n90), .A0N(\res_data[2][4] ), .A1N(n90), .Y(
        n71) );
  OAI2BB2XL U85 ( .B0(n119), .B1(n90), .A0N(\res_data[2][5] ), .A1N(n90), .Y(
        n72) );
  OAI2BB2XL U86 ( .B0(n118), .B1(n90), .A0N(\res_data[2][6] ), .A1N(n90), .Y(
        n73) );
  OAI2BB2XL U87 ( .B0(n117), .B1(n90), .A0N(\res_data[2][7] ), .A1N(n90), .Y(
        n74) );
  OAI2BB2XL U88 ( .B0(n124), .B1(n89), .A0N(\res_data[3][0] ), .A1N(n89), .Y(
        n75) );
  OAI2BB2XL U89 ( .B0(n123), .B1(n89), .A0N(\res_data[3][1] ), .A1N(n89), .Y(
        n76) );
  OAI2BB2XL U90 ( .B0(n122), .B1(n89), .A0N(\res_data[3][2] ), .A1N(n89), .Y(
        n77) );
  OAI2BB2XL U91 ( .B0(n121), .B1(n89), .A0N(n33), .A1N(n89), .Y(n78) );
  OAI2BB2XL U92 ( .B0(n120), .B1(n89), .A0N(\res_data[3][4] ), .A1N(n89), .Y(
        n79) );
  OAI2BB2XL U93 ( .B0(n119), .B1(n89), .A0N(\res_data[3][5] ), .A1N(n89), .Y(
        n80) );
  OAI2BB2XL U94 ( .B0(n118), .B1(n89), .A0N(\res_data[3][6] ), .A1N(n89), .Y(
        n81) );
  OAI2BB2XL U95 ( .B0(n117), .B1(n89), .A0N(\res_data[3][7] ), .A1N(n89), .Y(
        n82) );
  OAI2BB2XL U96 ( .B0(n92), .B1(n124), .A0N(\res_data[0][0] ), .A1N(n92), .Y(
        n51) );
  OAI2BB2XL U97 ( .B0(n92), .B1(n123), .A0N(\res_data[0][1] ), .A1N(n92), .Y(
        n52) );
  OAI2BB2XL U98 ( .B0(n92), .B1(n122), .A0N(\res_data[0][2] ), .A1N(n92), .Y(
        n53) );
  OAI2BB2XL U99 ( .B0(n92), .B1(n121), .A0N(\res_data[0][3] ), .A1N(n92), .Y(
        n54) );
  OAI2BB2XL U100 ( .B0(n92), .B1(n120), .A0N(\res_data[0][4] ), .A1N(n92), .Y(
        n55) );
  OAI2BB2XL U101 ( .B0(n92), .B1(n119), .A0N(\res_data[0][5] ), .A1N(n92), .Y(
        n56) );
  OAI2BB2XL U102 ( .B0(n92), .B1(n118), .A0N(\res_data[0][6] ), .A1N(n92), .Y(
        n57) );
  OAI2BB2XL U103 ( .B0(n92), .B1(n117), .A0N(\res_data[0][7] ), .A1N(n92), .Y(
        n58) );
  INVX3 U104 ( .A(n19), .Y(res_wr) );
  OAI31XL U105 ( .A0(n20), .A1(n21), .A2(n22), .B0(n115), .Y(n19) );
  NOR3X1 U106 ( .A(control_signal[1]), .B(control_signal[2]), .C(
        control_signal[0]), .Y(n22) );
  NOR3X1 U107 ( .A(control_signal[0]), .B(control_signal[3]), .C(n116), .Y(n40) );
  CLKINVX1 U108 ( .A(control_signal[1]), .Y(n116) );
  CLKINVX1 U109 ( .A(control_signal[3]), .Y(n115) );
  NAND3X1 U110 ( .A(n36), .B(n114), .C(rd_idx[0]), .Y(n37) );
  NAND3X1 U111 ( .A(n36), .B(n113), .C(rd_idx[1]), .Y(n38) );
  AND3X2 U112 ( .A(control_signal[1]), .B(control_signal[0]), .C(
        control_signal[2]), .Y(n21) );
  CLKINVX1 U113 ( .A(rd_idx[0]), .Y(n113) );
  CLKINVX1 U114 ( .A(rd_idx[1]), .Y(n114) );
  NOR4X1 U115 ( .A(n48), .B(n49), .C(global_idx[0]), .D(n43), .Y(backward_done) );
  NAND4X1 U116 ( .A(global_idx[5]), .B(global_idx[4]), .C(global_idx[6]), .D(
        n47), .Y(n44) );
  NOR2X1 U117 ( .A(n45), .B(n46), .Y(forward_done) );
  NAND4X1 U118 ( .A(global_idx[9]), .B(global_idx[8]), .C(global_idx[7]), .D(
        global_idx[13]), .Y(n46) );
  NAND4BXL U119 ( .AN(n44), .B(global_idx[12]), .C(global_idx[11]), .D(
        global_idx[10]), .Y(n45) );
  OR4X1 U120 ( .A(global_idx[11]), .B(global_idx[12]), .C(global_idx[10]), .D(
        n50), .Y(n43) );
  OR4X1 U121 ( .A(global_idx[9]), .B(global_idx[8]), .C(global_idx[7]), .D(
        global_idx[13]), .Y(n50) );
  OA22X2 U122 ( .A0(n99), .A1(N33), .B0(n99), .B1(n9), .Y(n103) );
  OAI21X4 U123 ( .A0(N37), .A1(n112), .B0(n110), .Y(N56) );
  AO22X4 U124 ( .A0(n112), .A1(N37), .B0(n109), .B1(n108), .Y(n110) );
  NAND2BX1 U125 ( .AN(N32), .B(\res_data[4][2] ), .Y(n101) );
  OAI22XL U126 ( .A0(N33), .A1(n9), .B0(N33), .B1(n101), .Y(n107) );
  NOR2BX1 U127 ( .AN(N32), .B(\res_data[4][2] ), .Y(n99) );
  AOI21X1 U128 ( .A0(N31), .A1(n10), .B0(N30), .Y(n100) );
  AOI2BB2X1 U129 ( .B0(n100), .B1(\res_data[4][0] ), .A0N(N31), .A1N(n10), .Y(
        n102) );
endmodule


module rdRes_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX2 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module rdRes_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;

  OR2X1 U1 ( .A(n15), .B(A[2]), .Y(n14) );
  OR2X1 U2 ( .A(n13), .B(A[4]), .Y(n12) );
  OR2X1 U3 ( .A(n9), .B(A[8]), .Y(n7) );
  OR2X1 U4 ( .A(n1), .B(n2), .Y(n18) );
  OR2X1 U5 ( .A(n9), .B(A[8]), .Y(n1) );
  NAND2X1 U6 ( .A(n4), .B(n6), .Y(n17) );
  OAI2BB1XL U7 ( .A0N(n9), .A1N(A[8]), .B0(n7), .Y(SUM[8]) );
  AO21XL U8 ( .A0(n7), .A1(A[9]), .B0(n8), .Y(SUM[9]) );
  OAI2BB1XL U9 ( .A0N(n10), .A1N(A[7]), .B0(n9), .Y(SUM[7]) );
  OAI2BB1XL U10 ( .A0N(A[0]), .A1N(A[1]), .B0(n15), .Y(SUM[1]) );
  OAI2BB1XL U11 ( .A0N(n15), .A1N(A[2]), .B0(n14), .Y(SUM[2]) );
  OR2X4 U12 ( .A(n11), .B(A[6]), .Y(n10) );
  OAI2BB1XL U13 ( .A0N(n11), .A1N(A[6]), .B0(n10), .Y(SUM[6]) );
  OAI2BB1XL U14 ( .A0N(n13), .A1N(A[4]), .B0(n12), .Y(SUM[4]) );
  OAI2BB1XL U15 ( .A0N(n12), .A1N(A[5]), .B0(n11), .Y(SUM[5]) );
  OR2X1 U16 ( .A(A[10]), .B(A[9]), .Y(n2) );
  CLKINVX1 U17 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U18 ( .A(n18), .Y(n4) );
  NAND2BX1 U19 ( .AN(A[1]), .B(SUM[0]), .Y(n15) );
  CLKINVX1 U20 ( .A(A[10]), .Y(n5) );
  CLKINVX1 U21 ( .A(A[11]), .Y(n6) );
  OAI2BB1X1 U22 ( .A0N(n14), .A1N(A[3]), .B0(n13), .Y(SUM[3]) );
  XOR2X1 U23 ( .A(A[13]), .B(n16), .Y(SUM[13]) );
  NOR2X1 U24 ( .A(A[12]), .B(n17), .Y(n16) );
  XNOR2X1 U25 ( .A(A[12]), .B(n17), .Y(SUM[12]) );
  OAI21XL U26 ( .A0(n4), .A1(n6), .B0(n17), .Y(SUM[11]) );
  OAI21XL U27 ( .A0(n8), .A1(n5), .B0(n18), .Y(SUM[10]) );
  NOR2X1 U28 ( .A(n7), .B(A[9]), .Y(n8) );
  OR2X1 U29 ( .A(n10), .B(A[7]), .Y(n9) );
  OR2X1 U30 ( .A(n12), .B(A[5]), .Y(n11) );
  OR2X1 U31 ( .A(n14), .B(A[3]), .Y(n13) );
endmodule


module rdRes ( clk, reset, control_signal, global_idx, res_rd, res_addr, 
        rd_idx, rd_res_done );
  input [3:0] control_signal;
  input [13:0] global_idx;
  output [13:0] res_addr;
  output [2:0] rd_idx;
  input clk, reset;
  output res_rd, rd_res_done;
  wire   N16, N17, \rd_addr_idx_fw[3][13] , \rd_addr_idx_fw[3][12] ,
         \rd_addr_idx_fw[3][11] , \rd_addr_idx_fw[3][10] ,
         \rd_addr_idx_fw[3][9] , \rd_addr_idx_fw[3][8] ,
         \rd_addr_idx_fw[3][7] , \rd_addr_idx_fw[3][6] ,
         \rd_addr_idx_fw[3][5] , \rd_addr_idx_fw[3][4] ,
         \rd_addr_idx_fw[3][3] , \rd_addr_idx_fw[3][2] ,
         \rd_addr_idx_fw[3][1] , \rd_addr_idx_fw[3][0] ,
         \rd_addr_idx_fw[2][13] , \rd_addr_idx_fw[2][12] ,
         \rd_addr_idx_fw[2][11] , \rd_addr_idx_fw[2][10] ,
         \rd_addr_idx_fw[2][9] , \rd_addr_idx_fw[2][8] ,
         \rd_addr_idx_fw[2][7] , \rd_addr_idx_fw[2][6] ,
         \rd_addr_idx_fw[2][5] , \rd_addr_idx_fw[2][4] ,
         \rd_addr_idx_fw[2][3] , \rd_addr_idx_fw[2][2] ,
         \rd_addr_idx_fw[2][1] , \rd_addr_idx_fw[1][13] ,
         \rd_addr_idx_fw[1][12] , \rd_addr_idx_fw[1][11] ,
         \rd_addr_idx_fw[1][10] , \rd_addr_idx_fw[1][9] ,
         \rd_addr_idx_fw[1][8] , \rd_addr_idx_fw[1][6] ,
         \rd_addr_idx_fw[1][5] , \rd_addr_idx_fw[1][4] ,
         \rd_addr_idx_fw[1][3] , \rd_addr_idx_fw[1][2] ,
         \rd_addr_idx_fw[1][1] , \rd_addr_idx_fw[1][0] ,
         \rd_addr_idx_fw[0][13] , \rd_addr_idx_fw[0][12] ,
         \rd_addr_idx_fw[0][11] , \rd_addr_idx_fw[0][10] ,
         \rd_addr_idx_fw[0][9] , \rd_addr_idx_fw[0][8] ,
         \rd_addr_idx_fw[0][7] , \rd_addr_idx_fw[0][6] ,
         \rd_addr_idx_fw[0][5] , \rd_addr_idx_fw[0][4] ,
         \rd_addr_idx_fw[0][3] , \rd_addr_idx_fw[0][2] ,
         \rd_addr_idx_fw[0][1] , \rd_addr_idx_bc[3][13] ,
         \rd_addr_idx_bc[3][12] , \rd_addr_idx_bc[3][11] ,
         \rd_addr_idx_bc[3][10] , \rd_addr_idx_bc[3][9] ,
         \rd_addr_idx_bc[3][8] , \rd_addr_idx_bc[3][7] ,
         \rd_addr_idx_bc[3][6] , \rd_addr_idx_bc[3][5] ,
         \rd_addr_idx_bc[3][4] , \rd_addr_idx_bc[3][3] ,
         \rd_addr_idx_bc[3][2] , \rd_addr_idx_bc[3][1] ,
         \rd_addr_idx_bc[3][0] , \rd_addr_idx_bc[2][13] ,
         \rd_addr_idx_bc[2][12] , \rd_addr_idx_bc[2][11] ,
         \rd_addr_idx_bc[2][10] , \rd_addr_idx_bc[2][9] ,
         \rd_addr_idx_bc[2][8] , \rd_addr_idx_bc[2][7] ,
         \rd_addr_idx_bc[2][6] , \rd_addr_idx_bc[2][5] ,
         \rd_addr_idx_bc[2][4] , \rd_addr_idx_bc[2][3] ,
         \rd_addr_idx_bc[2][2] , \rd_addr_idx_bc[2][1] ,
         \rd_addr_idx_bc[1][13] , \rd_addr_idx_bc[1][12] ,
         \rd_addr_idx_bc[1][11] , \rd_addr_idx_bc[1][10] ,
         \rd_addr_idx_bc[1][9] , \rd_addr_idx_bc[1][8] ,
         \rd_addr_idx_bc[0][13] , \rd_addr_idx_bc[0][12] ,
         \rd_addr_idx_bc[0][11] , \rd_addr_idx_bc[0][10] ,
         \rd_addr_idx_bc[0][9] , \rd_addr_idx_bc[0][8] ,
         \rd_addr_idx_bc[0][7] , \rd_addr_idx_bc[0][6] ,
         \rd_addr_idx_bc[0][5] , \rd_addr_idx_bc[0][4] ,
         \rd_addr_idx_bc[0][3] , \rd_addr_idx_bc[0][2] ,
         \rd_addr_idx_bc[0][1] , N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n50, n53, n55,
         n56, n57, n58, n59, n60, \add_363/carry[2] , \add_363/carry[3] ,
         \add_363/carry[4] , \add_363/carry[5] , \add_363/carry[6] ,
         \add_363/carry[7] , \add_363/carry[8] , \add_363/carry[9] ,
         \add_363/carry[10] , \add_363/carry[11] , \add_363/carry[12] ,
         \add_363/carry[13] , \add_362/carry[13] , \add_362/carry[12] ,
         \add_362/carry[11] , \add_362/carry[10] , \add_362/carry[9] ,
         \add_361/carry[2] , \add_361/carry[3] , \add_361/carry[4] ,
         \add_361/carry[5] , \add_361/carry[6] , \add_361/carry[7] ,
         \add_361/carry[8] , \add_361/carry[9] , \add_361/carry[10] ,
         \add_361/carry[11] , \add_361/carry[12] , \add_361/carry[13] ,
         \sub_358/carry[2] , \sub_358/carry[3] , \sub_358/carry[4] ,
         \sub_358/carry[5] , \sub_358/carry[6] , \sub_358/carry[7] ,
         \sub_358/carry[8] , \sub_358/carry[9] , \sub_358/carry[10] ,
         \sub_358/carry[11] , \sub_358/carry[12] , \sub_358/carry[13] ,
         \sub_357/carry[13] , \sub_357/carry[12] , \sub_357/carry[11] ,
         \sub_357/carry[10] , \sub_357/carry[9] , \sub_356/carry[2] ,
         \sub_356/carry[3] , \sub_356/carry[4] , \sub_356/carry[5] ,
         \sub_356/carry[6] , \sub_356/carry[7] , \sub_356/carry[8] ,
         \sub_356/carry[9] , \sub_356/carry[10] , \sub_356/carry[11] ,
         \sub_356/carry[12] , \sub_356/carry[13] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n47, n48, n49, n51, n52, n54, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106;
  assign rd_idx[0] = N16;
  assign rd_idx[1] = N17;
  assign \rd_addr_idx_fw[1][6]  = global_idx[6];
  assign \rd_addr_idx_fw[1][5]  = global_idx[5];
  assign \rd_addr_idx_fw[1][4]  = global_idx[4];
  assign \rd_addr_idx_fw[1][3]  = global_idx[3];
  assign \rd_addr_idx_fw[1][2]  = global_idx[2];
  assign \rd_addr_idx_fw[1][1]  = global_idx[1];
  assign \rd_addr_idx_fw[1][0]  = global_idx[0];

  rdRes_DW01_inc_0_DW01_inc_1 add_364 ( .A({global_idx[13], n102, 
        global_idx[11:10], n101, n100, n98, \rd_addr_idx_fw[1][6] , 
        \rd_addr_idx_fw[1][5] , \rd_addr_idx_fw[1][4] , n95, n94, n2, n3}), 
        .SUM({\rd_addr_idx_bc[3][13] , \rd_addr_idx_bc[3][12] , 
        \rd_addr_idx_bc[3][11] , \rd_addr_idx_bc[3][10] , 
        \rd_addr_idx_bc[3][9] , \rd_addr_idx_bc[3][8] , \rd_addr_idx_bc[3][7] , 
        \rd_addr_idx_bc[3][6] , \rd_addr_idx_bc[3][5] , \rd_addr_idx_bc[3][4] , 
        \rd_addr_idx_bc[3][3] , \rd_addr_idx_bc[3][2] , \rd_addr_idx_bc[3][1] , 
        \rd_addr_idx_bc[3][0] }) );
  rdRes_DW01_dec_0 sub_359 ( .A({global_idx[13], n102, global_idx[11:10], n101, 
        n100, n98, \rd_addr_idx_fw[1][6] , \rd_addr_idx_fw[1][5] , 
        \rd_addr_idx_fw[1][4] , n95, n94, n1, n96}), .SUM({
        \rd_addr_idx_fw[3][13] , \rd_addr_idx_fw[3][12] , 
        \rd_addr_idx_fw[3][11] , \rd_addr_idx_fw[3][10] , 
        \rd_addr_idx_fw[3][9] , \rd_addr_idx_fw[3][8] , \rd_addr_idx_fw[3][7] , 
        \rd_addr_idx_fw[3][6] , \rd_addr_idx_fw[3][5] , \rd_addr_idx_fw[3][4] , 
        \rd_addr_idx_fw[3][3] , \rd_addr_idx_fw[3][2] , \rd_addr_idx_fw[3][1] , 
        \rd_addr_idx_fw[3][0] }) );
  DFFRX1 \rd_idx_reg[2]  ( .D(n58), .CK(clk), .RN(reset), .Q(rd_idx[2]), .QN(
        n103) );
  DFFRX2 \rd_idx_reg[1]  ( .D(n59), .CK(clk), .RN(reset), .Q(N17), .QN(n81) );
  DFFRX2 \rd_idx_reg[0]  ( .D(n60), .CK(clk), .RN(reset), .Q(N16), .QN(n82) );
  CLKBUFX20 U3 ( .A(n93), .Y(n1) );
  CLKBUFX20 U4 ( .A(n93), .Y(n2) );
  INVX20 U5 ( .A(\rd_addr_idx_fw[1][0] ), .Y(n97) );
  AOI222X1 U6 ( .A0(N25), .A1(n87), .B0(global_idx[11]), .B1(n88), .C0(
        \rd_addr_idx_bc[0][11] ), .C1(n89), .Y(n41) );
  NAND2X2 U7 ( .A(n72), .B(n71), .Y(N25) );
  AOI222X2 U8 ( .A0(N24), .A1(n87), .B0(n102), .B1(n88), .C0(
        \rd_addr_idx_bc[0][12] ), .C1(n89), .Y(n39) );
  NAND2X2 U9 ( .A(n74), .B(n73), .Y(N24) );
  AND2X2 U10 ( .A(\sub_358/carry[4] ), .B(\rd_addr_idx_fw[1][4] ), .Y(
        \sub_358/carry[5] ) );
  OR2X2 U11 ( .A(n100), .B(\sub_358/carry[8] ), .Y(\sub_358/carry[9] ) );
  OR2X4 U12 ( .A(n100), .B(\sub_356/carry[8] ), .Y(\sub_356/carry[9] ) );
  OR2X4 U13 ( .A(\rd_addr_idx_fw[1][6] ), .B(\sub_356/carry[6] ), .Y(
        \sub_356/carry[7] ) );
  AND3X2 U14 ( .A(n4), .B(n5), .C(n6), .Y(n37) );
  NAND2X1 U15 ( .A(N23), .B(n87), .Y(n4) );
  AOI222XL U16 ( .A0(\rd_addr_idx_bc[1][13] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][13] ), .B1(n91), .C0(\rd_addr_idx_bc[3][13] ), .C1(
        n92), .Y(n38) );
  NOR2BX2 U17 ( .AN(n57), .B(control_signal[0]), .Y(res_rd) );
  NOR2XL U18 ( .A(N16), .B(N17), .Y(n78) );
  NOR2XL U19 ( .A(n82), .B(N17), .Y(n77) );
  NOR4XL U20 ( .A(N17), .B(N16), .C(n87), .D(rd_idx[2]), .Y(n20) );
  NOR3XL U21 ( .A(n87), .B(n82), .C(N17), .Y(n15) );
  INVXL U22 ( .A(n97), .Y(n3) );
  CLKBUFX3 U23 ( .A(\rd_addr_idx_fw[1][1] ), .Y(n93) );
  OR2X4 U24 ( .A(n94), .B(\sub_356/carry[2] ), .Y(\sub_356/carry[3] ) );
  BUFX2 U25 ( .A(\rd_addr_idx_fw[1][2] ), .Y(n94) );
  NAND2X4 U26 ( .A(n37), .B(n38), .Y(res_addr[13]) );
  XNOR2X1 U27 ( .A(\sub_358/carry[12] ), .B(n102), .Y(\rd_addr_idx_fw[2][12] )
         );
  AND2X2 U28 ( .A(n95), .B(\add_361/carry[3] ), .Y(\add_361/carry[4] ) );
  OR2X1 U29 ( .A(n98), .B(\add_361/carry[7] ), .Y(\add_361/carry[8] ) );
  OR2X1 U30 ( .A(n94), .B(\add_363/carry[2] ), .Y(\add_363/carry[3] ) );
  NAND2X1 U31 ( .A(global_idx[13]), .B(n88), .Y(n5) );
  NAND2X1 U32 ( .A(\rd_addr_idx_bc[0][13] ), .B(n89), .Y(n6) );
  AND2X2 U33 ( .A(\sub_358/carry[6] ), .B(\rd_addr_idx_fw[1][6] ), .Y(
        \sub_358/carry[7] ) );
  AND2X2 U34 ( .A(\rd_addr_idx_fw[1][5] ), .B(\add_361/carry[5] ), .Y(
        \add_361/carry[6] ) );
  OR2X1 U35 ( .A(global_idx[11]), .B(\sub_356/carry[11] ), .Y(
        \sub_356/carry[12] ) );
  OR2X1 U36 ( .A(global_idx[10]), .B(\sub_358/carry[10] ), .Y(
        \sub_358/carry[11] ) );
  OR2X1 U37 ( .A(\rd_addr_idx_fw[1][6] ), .B(\add_363/carry[6] ), .Y(
        \add_363/carry[7] ) );
  OR2X1 U38 ( .A(\rd_addr_idx_fw[1][4] ), .B(\add_363/carry[4] ), .Y(
        \add_363/carry[5] ) );
  OR2X1 U39 ( .A(\rd_addr_idx_fw[1][4] ), .B(\sub_356/carry[4] ), .Y(
        \sub_356/carry[5] ) );
  CLKBUFX3 U40 ( .A(\rd_addr_idx_fw[1][3] ), .Y(n95) );
  XNOR2XL U41 ( .A(\sub_356/carry[9] ), .B(n101), .Y(\rd_addr_idx_fw[0][9] )
         );
  XNOR2XL U42 ( .A(\sub_356/carry[8] ), .B(n100), .Y(\rd_addr_idx_fw[0][8] )
         );
  AND2X2 U43 ( .A(n101), .B(\add_361/carry[9] ), .Y(\add_361/carry[10] ) );
  AND2X2 U44 ( .A(n100), .B(\add_363/carry[8] ), .Y(\add_363/carry[9] ) );
  XOR2XL U45 ( .A(n100), .B(\add_363/carry[8] ), .Y(\rd_addr_idx_bc[2][8] ) );
  OR2XL U46 ( .A(n2), .B(n96), .Y(\sub_356/carry[2] ) );
  OR2XL U47 ( .A(n2), .B(n96), .Y(\add_363/carry[2] ) );
  AND2XL U48 ( .A(n2), .B(n96), .Y(\add_361/carry[2] ) );
  AND2XL U49 ( .A(n96), .B(n2), .Y(\sub_358/carry[2] ) );
  CLKINVX1 U50 ( .A(global_idx[7]), .Y(n99) );
  XNOR2XL U51 ( .A(\add_361/carry[7] ), .B(n98), .Y(\rd_addr_idx_bc[0][7] ) );
  CLKBUFX3 U52 ( .A(n19), .Y(n88) );
  XNOR2XL U53 ( .A(\sub_356/carry[3] ), .B(n95), .Y(\rd_addr_idx_fw[0][3] ) );
  XNOR2XL U54 ( .A(\add_363/carry[3] ), .B(n95), .Y(\rd_addr_idx_bc[2][3] ) );
  XOR2XL U55 ( .A(n95), .B(\sub_358/carry[3] ), .Y(\rd_addr_idx_fw[2][3] ) );
  XOR2XL U56 ( .A(n95), .B(\add_361/carry[3] ), .Y(\rd_addr_idx_bc[0][3] ) );
  XNOR2XL U57 ( .A(n96), .B(n2), .Y(\rd_addr_idx_fw[0][1] ) );
  XNOR2XL U58 ( .A(\sub_356/carry[2] ), .B(n94), .Y(\rd_addr_idx_fw[0][2] ) );
  XOR2XL U59 ( .A(n2), .B(n96), .Y(\rd_addr_idx_fw[2][1] ) );
  XNOR2XL U60 ( .A(\add_363/carry[2] ), .B(n94), .Y(\rd_addr_idx_bc[2][2] ) );
  XNOR2XL U61 ( .A(n96), .B(n2), .Y(\rd_addr_idx_bc[2][1] ) );
  XOR2XL U62 ( .A(n2), .B(n96), .Y(\rd_addr_idx_bc[0][1] ) );
  XOR2XL U63 ( .A(n94), .B(\sub_358/carry[2] ), .Y(\rd_addr_idx_fw[2][2] ) );
  XOR2XL U64 ( .A(n94), .B(\add_361/carry[2] ), .Y(\rd_addr_idx_bc[0][2] ) );
  AOI22XL U65 ( .A0(n97), .A1(n85), .B0(n96), .B1(n86), .Y(n7) );
  AOI22XL U66 ( .A0(n97), .A1(n83), .B0(\rd_addr_idx_fw[3][0] ), .B1(n84), .Y(
        n8) );
  NAND2X1 U67 ( .A(n80), .B(n79), .Y(N23) );
  XNOR2XL U68 ( .A(\sub_356/carry[10] ), .B(global_idx[10]), .Y(
        \rd_addr_idx_fw[0][10] ) );
  XNOR2XL U69 ( .A(\sub_356/carry[11] ), .B(global_idx[11]), .Y(
        \rd_addr_idx_fw[0][11] ) );
  XOR2XL U70 ( .A(global_idx[10]), .B(\add_361/carry[10] ), .Y(
        \rd_addr_idx_bc[0][10] ) );
  AND2X2 U71 ( .A(global_idx[10]), .B(\add_363/carry[10] ), .Y(
        \add_363/carry[11] ) );
  AND2X2 U72 ( .A(global_idx[11]), .B(\add_363/carry[11] ), .Y(
        \add_363/carry[12] ) );
  AND2X2 U73 ( .A(global_idx[11]), .B(\add_361/carry[11] ), .Y(
        \add_361/carry[12] ) );
  AND2X2 U74 ( .A(n102), .B(\add_363/carry[12] ), .Y(\add_363/carry[13] ) );
  XNOR2XL U75 ( .A(\sub_356/carry[6] ), .B(\rd_addr_idx_fw[1][6] ), .Y(
        \rd_addr_idx_fw[0][6] ) );
  AND2XL U76 ( .A(n102), .B(\add_361/carry[12] ), .Y(\add_361/carry[13] ) );
  XOR2X1 U77 ( .A(global_idx[13]), .B(\add_361/carry[13] ), .Y(
        \rd_addr_idx_bc[0][13] ) );
  XNOR2XL U78 ( .A(\add_363/carry[6] ), .B(\rd_addr_idx_fw[1][6] ), .Y(
        \rd_addr_idx_bc[2][6] ) );
  CLKBUFX3 U79 ( .A(n20), .Y(n89) );
  XOR2XL U80 ( .A(\rd_addr_idx_fw[1][6] ), .B(\sub_358/carry[6] ), .Y(
        \rd_addr_idx_fw[2][6] ) );
  XOR2XL U81 ( .A(\rd_addr_idx_fw[1][6] ), .B(\add_361/carry[6] ), .Y(
        \rd_addr_idx_bc[0][6] ) );
  CLKBUFX3 U82 ( .A(n18), .Y(n87) );
  XNOR2XL U83 ( .A(\sub_356/carry[5] ), .B(\rd_addr_idx_fw[1][5] ), .Y(
        \rd_addr_idx_fw[0][5] ) );
  XNOR2XL U84 ( .A(\sub_356/carry[4] ), .B(\rd_addr_idx_fw[1][4] ), .Y(
        \rd_addr_idx_fw[0][4] ) );
  XNOR2XL U85 ( .A(\add_363/carry[5] ), .B(\rd_addr_idx_fw[1][5] ), .Y(
        \rd_addr_idx_bc[2][5] ) );
  XNOR2XL U86 ( .A(\add_363/carry[4] ), .B(\rd_addr_idx_fw[1][4] ), .Y(
        \rd_addr_idx_bc[2][4] ) );
  XOR2XL U87 ( .A(\rd_addr_idx_fw[1][5] ), .B(\sub_358/carry[5] ), .Y(
        \rd_addr_idx_fw[2][5] ) );
  XOR2XL U88 ( .A(\rd_addr_idx_fw[1][4] ), .B(\sub_358/carry[4] ), .Y(
        \rd_addr_idx_fw[2][4] ) );
  XOR2XL U89 ( .A(\rd_addr_idx_fw[1][5] ), .B(\add_361/carry[5] ), .Y(
        \rd_addr_idx_bc[0][5] ) );
  XOR2XL U90 ( .A(\rd_addr_idx_fw[1][4] ), .B(\add_361/carry[4] ), .Y(
        \rd_addr_idx_bc[0][4] ) );
  INVX3 U91 ( .A(n97), .Y(n96) );
  INVX3 U92 ( .A(n99), .Y(n98) );
  CLKBUFX3 U93 ( .A(global_idx[12]), .Y(n102) );
  NAND2X1 U94 ( .A(n39), .B(n40), .Y(res_addr[12]) );
  AOI222XL U95 ( .A0(\rd_addr_idx_bc[1][12] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][12] ), .B1(n91), .C0(\rd_addr_idx_bc[3][12] ), .C1(
        n92), .Y(n40) );
  NAND2X1 U96 ( .A(n13), .B(n14), .Y(res_addr[9]) );
  AOI222XL U97 ( .A0(\rd_addr_idx_bc[1][9] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][9] ), .B1(n91), .C0(\rd_addr_idx_bc[3][9] ), .C1(
        n92), .Y(n14) );
  AOI222XL U98 ( .A0(N27), .A1(n87), .B0(n101), .B1(n88), .C0(
        \rd_addr_idx_bc[0][9] ), .C1(n89), .Y(n13) );
  NAND2X1 U99 ( .A(n21), .B(n22), .Y(res_addr[8]) );
  AOI222XL U100 ( .A0(\rd_addr_idx_bc[1][8] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][8] ), .B1(n91), .C0(\rd_addr_idx_bc[3][8] ), .C1(
        n92), .Y(n22) );
  AOI222XL U101 ( .A0(N28), .A1(n87), .B0(n100), .B1(n88), .C0(
        \rd_addr_idx_bc[0][8] ), .C1(n89), .Y(n21) );
  NAND2X1 U102 ( .A(n23), .B(n24), .Y(res_addr[7]) );
  AOI222XL U103 ( .A0(n99), .A1(n90), .B0(\rd_addr_idx_bc[2][7] ), .B1(n91), 
        .C0(\rd_addr_idx_bc[3][7] ), .C1(n92), .Y(n24) );
  AOI222XL U104 ( .A0(N29), .A1(n87), .B0(n98), .B1(n88), .C0(
        \rd_addr_idx_bc[0][7] ), .C1(n89), .Y(n23) );
  NAND2X1 U105 ( .A(n45), .B(n46), .Y(res_addr[0]) );
  AOI222XL U106 ( .A0(n96), .A1(n90), .B0(n97), .B1(n91), .C0(
        \rd_addr_idx_bc[3][0] ), .C1(n92), .Y(n46) );
  AOI222XL U107 ( .A0(N36), .A1(n87), .B0(n96), .B1(n88), .C0(n97), .C1(n89), 
        .Y(n45) );
  CLKINVX1 U108 ( .A(res_rd), .Y(n105) );
  CLKBUFX3 U109 ( .A(global_idx[8]), .Y(n100) );
  CLKBUFX3 U110 ( .A(global_idx[9]), .Y(n101) );
  NOR2X1 U111 ( .A(n103), .B(n87), .Y(n19) );
  CLKBUFX3 U112 ( .A(n75), .Y(n84) );
  NOR2X1 U113 ( .A(n81), .B(n82), .Y(n75) );
  NAND3X1 U114 ( .A(N17), .B(n103), .C(N16), .Y(n53) );
  NAND2X1 U115 ( .A(n43), .B(n44), .Y(res_addr[10]) );
  AOI222XL U116 ( .A0(\rd_addr_idx_bc[1][10] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][10] ), .B1(n91), .C0(\rd_addr_idx_bc[3][10] ), .C1(
        n92), .Y(n44) );
  AOI222XL U117 ( .A0(N26), .A1(n87), .B0(global_idx[10]), .B1(n88), .C0(
        \rd_addr_idx_bc[0][10] ), .C1(n89), .Y(n43) );
  NAND2X1 U118 ( .A(n41), .B(n42), .Y(res_addr[11]) );
  AOI222XL U119 ( .A0(\rd_addr_idx_bc[1][11] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][11] ), .B1(n91), .C0(\rd_addr_idx_bc[3][11] ), .C1(
        n92), .Y(n42) );
  NAND2X1 U120 ( .A(n25), .B(n26), .Y(res_addr[6]) );
  AOI222XL U121 ( .A0(\rd_addr_idx_fw[1][6] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][6] ), .B1(n91), .C0(\rd_addr_idx_bc[3][6] ), .C1(
        n92), .Y(n26) );
  AOI222XL U122 ( .A0(N30), .A1(n87), .B0(\rd_addr_idx_fw[1][6] ), .B1(n88), 
        .C0(\rd_addr_idx_bc[0][6] ), .C1(n89), .Y(n25) );
  NAND2X1 U123 ( .A(n29), .B(n30), .Y(res_addr[4]) );
  AOI222XL U124 ( .A0(\rd_addr_idx_fw[1][4] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][4] ), .B1(n91), .C0(\rd_addr_idx_bc[3][4] ), .C1(
        n92), .Y(n30) );
  AOI222XL U125 ( .A0(N32), .A1(n87), .B0(\rd_addr_idx_fw[1][4] ), .B1(n88), 
        .C0(\rd_addr_idx_bc[0][4] ), .C1(n89), .Y(n29) );
  NAND2X1 U126 ( .A(n27), .B(n28), .Y(res_addr[5]) );
  AOI222XL U127 ( .A0(\rd_addr_idx_fw[1][5] ), .A1(n90), .B0(
        \rd_addr_idx_bc[2][5] ), .B1(n91), .C0(\rd_addr_idx_bc[3][5] ), .C1(
        n92), .Y(n28) );
  AOI222XL U128 ( .A0(N31), .A1(n87), .B0(\rd_addr_idx_fw[1][5] ), .B1(n88), 
        .C0(\rd_addr_idx_bc[0][5] ), .C1(n89), .Y(n27) );
  NAND2X1 U129 ( .A(n31), .B(n32), .Y(res_addr[3]) );
  AOI222XL U130 ( .A0(n95), .A1(n90), .B0(\rd_addr_idx_bc[2][3] ), .B1(n91), 
        .C0(\rd_addr_idx_bc[3][3] ), .C1(n92), .Y(n32) );
  AOI222XL U131 ( .A0(N33), .A1(n87), .B0(n95), .B1(n88), .C0(
        \rd_addr_idx_bc[0][3] ), .C1(n89), .Y(n31) );
  NAND2X1 U132 ( .A(n33), .B(n34), .Y(res_addr[2]) );
  AOI222XL U133 ( .A0(n94), .A1(n90), .B0(\rd_addr_idx_bc[2][2] ), .B1(n91), 
        .C0(\rd_addr_idx_bc[3][2] ), .C1(n92), .Y(n34) );
  AOI222XL U134 ( .A0(N34), .A1(n87), .B0(n94), .B1(n88), .C0(
        \rd_addr_idx_bc[0][2] ), .C1(n89), .Y(n33) );
  NAND2X1 U135 ( .A(n35), .B(n36), .Y(res_addr[1]) );
  AOI222XL U136 ( .A0(n2), .A1(n90), .B0(\rd_addr_idx_bc[2][1] ), .B1(n91), 
        .C0(\rd_addr_idx_bc[3][1] ), .C1(n92), .Y(n36) );
  AOI222XL U137 ( .A0(N35), .A1(n87), .B0(n2), .B1(n88), .C0(
        \rd_addr_idx_bc[0][1] ), .C1(n89), .Y(n35) );
  NOR2BX1 U138 ( .AN(control_signal[1]), .B(control_signal[3]), .Y(n57) );
  NOR2X1 U139 ( .A(n105), .B(control_signal[2]), .Y(n18) );
  CLKBUFX3 U140 ( .A(n15), .Y(n90) );
  CLKBUFX3 U141 ( .A(n16), .Y(n91) );
  NOR3X1 U142 ( .A(n87), .B(n81), .C(N16), .Y(n16) );
  CLKBUFX3 U143 ( .A(n17), .Y(n92) );
  NOR3X1 U144 ( .A(n82), .B(n81), .C(n87), .Y(n17) );
  OAI32X1 U145 ( .A0(N17), .A1(n82), .A2(n105), .B0(n81), .B1(n56), .Y(n59) );
  OAI22XL U146 ( .A0(n105), .A1(N16), .B0(n82), .B1(n57), .Y(n60) );
  OAI2BB2XL U147 ( .B0(n105), .B1(n53), .A0N(rd_idx[2]), .A1N(n55), .Y(n58) );
  OAI21XL U148 ( .A0(control_signal[0]), .A1(N17), .B0(n56), .Y(n55) );
  CLKBUFX3 U149 ( .A(n76), .Y(n83) );
  NOR2X1 U150 ( .A(n81), .B(N16), .Y(n76) );
  CLKBUFX3 U151 ( .A(n78), .Y(n85) );
  CLKBUFX3 U152 ( .A(n77), .Y(n86) );
  OA21XL U153 ( .A0(control_signal[0]), .A1(N16), .B0(n57), .Y(n56) );
  OAI32X1 U154 ( .A0(n50), .A1(n103), .A2(n106), .B0(n104), .B1(n53), .Y(
        rd_res_done) );
  CLKINVX1 U155 ( .A(n87), .Y(n104) );
  CLKINVX1 U156 ( .A(control_signal[2]), .Y(n106) );
  NAND3X1 U157 ( .A(n82), .B(res_rd), .C(n81), .Y(n50) );
  NAND2X1 U158 ( .A(n8), .B(n7), .Y(N36) );
  AOI22X1 U159 ( .A0(\rd_addr_idx_fw[2][1] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][1] ), .B1(n84), .Y(n10) );
  AOI22X1 U160 ( .A0(\rd_addr_idx_fw[0][1] ), .A1(n85), .B0(n2), .B1(n86), .Y(
        n9) );
  NAND2X1 U161 ( .A(n10), .B(n9), .Y(N35) );
  AOI22X1 U162 ( .A0(\rd_addr_idx_fw[2][2] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][2] ), .B1(n84), .Y(n12) );
  AOI22X1 U163 ( .A0(\rd_addr_idx_fw[0][2] ), .A1(n85), .B0(n94), .B1(n86), 
        .Y(n11) );
  NAND2X1 U164 ( .A(n12), .B(n11), .Y(N34) );
  AOI22X1 U165 ( .A0(\rd_addr_idx_fw[2][3] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][3] ), .B1(n84), .Y(n48) );
  AOI22X1 U166 ( .A0(\rd_addr_idx_fw[0][3] ), .A1(n85), .B0(n95), .B1(n86), 
        .Y(n47) );
  NAND2X1 U167 ( .A(n48), .B(n47), .Y(N33) );
  AOI22X1 U168 ( .A0(\rd_addr_idx_fw[2][4] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][4] ), .B1(n84), .Y(n51) );
  AOI22X1 U169 ( .A0(\rd_addr_idx_fw[0][4] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][4] ), .B1(n86), .Y(n49) );
  NAND2X1 U170 ( .A(n51), .B(n49), .Y(N32) );
  AOI22X1 U171 ( .A0(\rd_addr_idx_fw[2][5] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][5] ), .B1(n84), .Y(n54) );
  AOI22X1 U172 ( .A0(\rd_addr_idx_fw[0][5] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][5] ), .B1(n86), .Y(n52) );
  NAND2X1 U173 ( .A(n54), .B(n52), .Y(N31) );
  AOI22X1 U174 ( .A0(\rd_addr_idx_fw[2][6] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][6] ), .B1(n84), .Y(n62) );
  AOI22X1 U175 ( .A0(\rd_addr_idx_fw[0][6] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][6] ), .B1(n86), .Y(n61) );
  NAND2X1 U176 ( .A(n62), .B(n61), .Y(N30) );
  AOI22X1 U177 ( .A0(\rd_addr_idx_fw[2][7] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][7] ), .B1(n84), .Y(n64) );
  AOI22X1 U178 ( .A0(\rd_addr_idx_fw[0][7] ), .A1(n85), .B0(n99), .B1(n86), 
        .Y(n63) );
  NAND2X1 U179 ( .A(n64), .B(n63), .Y(N29) );
  AOI22X1 U180 ( .A0(\rd_addr_idx_fw[2][8] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][8] ), .B1(n84), .Y(n66) );
  AOI22X1 U181 ( .A0(\rd_addr_idx_fw[0][8] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][8] ), .B1(n86), .Y(n65) );
  NAND2X1 U182 ( .A(n66), .B(n65), .Y(N28) );
  AOI22X1 U183 ( .A0(\rd_addr_idx_fw[2][9] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][9] ), .B1(n84), .Y(n68) );
  AOI22X1 U184 ( .A0(\rd_addr_idx_fw[0][9] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][9] ), .B1(n86), .Y(n67) );
  NAND2X1 U185 ( .A(n68), .B(n67), .Y(N27) );
  AOI22X1 U186 ( .A0(\rd_addr_idx_fw[2][10] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][10] ), .B1(n84), .Y(n70) );
  AOI22X1 U187 ( .A0(\rd_addr_idx_fw[0][10] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][10] ), .B1(n86), .Y(n69) );
  NAND2X1 U188 ( .A(n70), .B(n69), .Y(N26) );
  AOI22X1 U189 ( .A0(\rd_addr_idx_fw[2][11] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][11] ), .B1(n84), .Y(n72) );
  AOI22X1 U190 ( .A0(\rd_addr_idx_fw[0][11] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][11] ), .B1(n86), .Y(n71) );
  AOI22X1 U191 ( .A0(\rd_addr_idx_fw[2][12] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][12] ), .B1(n84), .Y(n74) );
  AOI22X1 U192 ( .A0(\rd_addr_idx_fw[0][12] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][12] ), .B1(n86), .Y(n73) );
  AOI22X1 U193 ( .A0(\rd_addr_idx_fw[2][13] ), .A1(n83), .B0(
        \rd_addr_idx_fw[3][13] ), .B1(n84), .Y(n80) );
  AOI22X1 U194 ( .A0(\rd_addr_idx_fw[0][13] ), .A1(n85), .B0(
        \rd_addr_idx_fw[1][13] ), .B1(n86), .Y(n79) );
  XOR2X1 U195 ( .A(global_idx[13]), .B(\add_363/carry[13] ), .Y(
        \rd_addr_idx_bc[2][13] ) );
  XOR2X1 U196 ( .A(n102), .B(\add_363/carry[12] ), .Y(\rd_addr_idx_bc[2][12] )
         );
  XOR2X1 U197 ( .A(global_idx[11]), .B(\add_363/carry[11] ), .Y(
        \rd_addr_idx_bc[2][11] ) );
  XOR2X1 U198 ( .A(global_idx[10]), .B(\add_363/carry[10] ), .Y(
        \rd_addr_idx_bc[2][10] ) );
  AND2X1 U199 ( .A(n101), .B(\add_363/carry[9] ), .Y(\add_363/carry[10] ) );
  XOR2X1 U200 ( .A(n101), .B(\add_363/carry[9] ), .Y(\rd_addr_idx_bc[2][9] )
         );
  AND2X1 U201 ( .A(n98), .B(\add_363/carry[7] ), .Y(\add_363/carry[8] ) );
  XOR2X1 U202 ( .A(n98), .B(\add_363/carry[7] ), .Y(\rd_addr_idx_bc[2][7] ) );
  OR2X1 U203 ( .A(\rd_addr_idx_fw[1][5] ), .B(\add_363/carry[5] ), .Y(
        \add_363/carry[6] ) );
  OR2X1 U204 ( .A(n95), .B(\add_363/carry[3] ), .Y(\add_363/carry[4] ) );
  XOR2X1 U205 ( .A(global_idx[13]), .B(\add_362/carry[13] ), .Y(
        \rd_addr_idx_bc[1][13] ) );
  AND2X1 U206 ( .A(n102), .B(\add_362/carry[12] ), .Y(\add_362/carry[13] ) );
  XOR2X1 U207 ( .A(n102), .B(\add_362/carry[12] ), .Y(\rd_addr_idx_bc[1][12] )
         );
  AND2X1 U208 ( .A(global_idx[11]), .B(\add_362/carry[11] ), .Y(
        \add_362/carry[12] ) );
  XOR2X1 U209 ( .A(global_idx[11]), .B(\add_362/carry[11] ), .Y(
        \rd_addr_idx_bc[1][11] ) );
  AND2X1 U210 ( .A(global_idx[10]), .B(\add_362/carry[10] ), .Y(
        \add_362/carry[11] ) );
  XOR2X1 U211 ( .A(global_idx[10]), .B(\add_362/carry[10] ), .Y(
        \rd_addr_idx_bc[1][10] ) );
  AND2X1 U212 ( .A(n101), .B(\add_362/carry[9] ), .Y(\add_362/carry[10] ) );
  XOR2X1 U213 ( .A(n101), .B(\add_362/carry[9] ), .Y(\rd_addr_idx_bc[1][9] )
         );
  AND2X1 U214 ( .A(n100), .B(n98), .Y(\add_362/carry[9] ) );
  XOR2X1 U215 ( .A(n100), .B(n98), .Y(\rd_addr_idx_bc[1][8] ) );
  XOR2X1 U216 ( .A(n102), .B(\add_361/carry[12] ), .Y(\rd_addr_idx_bc[0][12] )
         );
  XOR2X1 U217 ( .A(global_idx[11]), .B(\add_361/carry[11] ), .Y(
        \rd_addr_idx_bc[0][11] ) );
  AND2X1 U218 ( .A(global_idx[10]), .B(\add_361/carry[10] ), .Y(
        \add_361/carry[11] ) );
  XOR2X1 U219 ( .A(n101), .B(\add_361/carry[9] ), .Y(\rd_addr_idx_bc[0][9] )
         );
  AND2X1 U220 ( .A(n100), .B(\add_361/carry[8] ), .Y(\add_361/carry[9] ) );
  XOR2X1 U221 ( .A(n100), .B(\add_361/carry[8] ), .Y(\rd_addr_idx_bc[0][8] )
         );
  AND2X1 U222 ( .A(\rd_addr_idx_fw[1][6] ), .B(\add_361/carry[6] ), .Y(
        \add_361/carry[7] ) );
  AND2X1 U223 ( .A(\rd_addr_idx_fw[1][4] ), .B(\add_361/carry[4] ), .Y(
        \add_361/carry[5] ) );
  AND2X1 U224 ( .A(n94), .B(\add_361/carry[2] ), .Y(\add_361/carry[3] ) );
  XNOR2X1 U225 ( .A(global_idx[13]), .B(\sub_357/carry[13] ), .Y(
        \rd_addr_idx_fw[1][13] ) );
  OR2X1 U226 ( .A(n102), .B(\sub_357/carry[12] ), .Y(\sub_357/carry[13] ) );
  XNOR2X1 U227 ( .A(\sub_357/carry[12] ), .B(n102), .Y(\rd_addr_idx_fw[1][12] ) );
  OR2X1 U228 ( .A(global_idx[11]), .B(\sub_357/carry[11] ), .Y(
        \sub_357/carry[12] ) );
  XNOR2X1 U229 ( .A(\sub_357/carry[11] ), .B(global_idx[11]), .Y(
        \rd_addr_idx_fw[1][11] ) );
  OR2X1 U230 ( .A(global_idx[10]), .B(\sub_357/carry[10] ), .Y(
        \sub_357/carry[11] ) );
  XNOR2X1 U231 ( .A(\sub_357/carry[10] ), .B(global_idx[10]), .Y(
        \rd_addr_idx_fw[1][10] ) );
  OR2X1 U232 ( .A(n101), .B(\sub_357/carry[9] ), .Y(\sub_357/carry[10] ) );
  XNOR2X1 U233 ( .A(\sub_357/carry[9] ), .B(n101), .Y(\rd_addr_idx_fw[1][9] )
         );
  OR2X1 U234 ( .A(n100), .B(n98), .Y(\sub_357/carry[9] ) );
  XNOR2X1 U235 ( .A(n98), .B(n100), .Y(\rd_addr_idx_fw[1][8] ) );
  XNOR2X1 U236 ( .A(global_idx[13]), .B(\sub_356/carry[13] ), .Y(
        \rd_addr_idx_fw[0][13] ) );
  OR2X1 U237 ( .A(n102), .B(\sub_356/carry[12] ), .Y(\sub_356/carry[13] ) );
  XNOR2X1 U238 ( .A(\sub_356/carry[12] ), .B(n102), .Y(\rd_addr_idx_fw[0][12] ) );
  OR2X1 U239 ( .A(global_idx[10]), .B(\sub_356/carry[10] ), .Y(
        \sub_356/carry[11] ) );
  OR2X1 U240 ( .A(n101), .B(\sub_356/carry[9] ), .Y(\sub_356/carry[10] ) );
  AND2X1 U241 ( .A(\sub_356/carry[7] ), .B(n98), .Y(\sub_356/carry[8] ) );
  XOR2X1 U242 ( .A(n98), .B(\sub_356/carry[7] ), .Y(\rd_addr_idx_fw[0][7] ) );
  OR2X1 U243 ( .A(\rd_addr_idx_fw[1][5] ), .B(\sub_356/carry[5] ), .Y(
        \sub_356/carry[6] ) );
  OR2X1 U244 ( .A(n95), .B(\sub_356/carry[3] ), .Y(\sub_356/carry[4] ) );
  XNOR2X1 U245 ( .A(global_idx[13]), .B(\sub_358/carry[13] ), .Y(
        \rd_addr_idx_fw[2][13] ) );
  OR2X1 U246 ( .A(n102), .B(\sub_358/carry[12] ), .Y(\sub_358/carry[13] ) );
  OR2X1 U247 ( .A(global_idx[11]), .B(\sub_358/carry[11] ), .Y(
        \sub_358/carry[12] ) );
  XNOR2X1 U248 ( .A(\sub_358/carry[11] ), .B(global_idx[11]), .Y(
        \rd_addr_idx_fw[2][11] ) );
  XNOR2X1 U249 ( .A(\sub_358/carry[10] ), .B(global_idx[10]), .Y(
        \rd_addr_idx_fw[2][10] ) );
  OR2X1 U250 ( .A(n101), .B(\sub_358/carry[9] ), .Y(\sub_358/carry[10] ) );
  XNOR2X1 U251 ( .A(\sub_358/carry[9] ), .B(n101), .Y(\rd_addr_idx_fw[2][9] )
         );
  XNOR2X1 U252 ( .A(\sub_358/carry[8] ), .B(n100), .Y(\rd_addr_idx_fw[2][8] )
         );
  OR2X1 U253 ( .A(n98), .B(\sub_358/carry[7] ), .Y(\sub_358/carry[8] ) );
  XNOR2X1 U254 ( .A(\sub_358/carry[7] ), .B(n98), .Y(\rd_addr_idx_fw[2][7] )
         );
  AND2X1 U255 ( .A(\sub_358/carry[5] ), .B(\rd_addr_idx_fw[1][5] ), .Y(
        \sub_358/carry[6] ) );
  AND2X1 U256 ( .A(\sub_358/carry[3] ), .B(n95), .Y(\sub_358/carry[4] ) );
  AND2X1 U257 ( .A(\sub_358/carry[2] ), .B(n94), .Y(\sub_358/carry[3] ) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   n18, n19, n20, n21, _init_done, _is_object, _rd_res_done,
         _forward_done, _backward_done, n2, n3, n4, n5, n6, n7, n9, n11, n13,
         n15, n16, n17;
  wire   [3:0] _control_signal;
  wire   [13:0] _res_RDaddr;
  wire   [13:0] _global_idx;
  wire   [2:0] _rd_idx;

  control CTRL ( .clk(clk), .reset(n16), .init_done(_init_done), .is_object(
        _is_object), .rd_res_done(_rd_res_done), .forward_done(_forward_done), 
        .backward_done(_backward_done), .current_state(_control_signal), 
        .done(done) );
  rdSti RDSTI ( .clk(clk), .reset(n16), .control_signal(_control_signal), 
        .global_idx(_global_idx) );
  checkSti CHKSTI ( .clk(clk), .reset(n16), .control_signal(_control_signal), 
        .global_idx({_global_idx[13], n15, _global_idx[11:10], n13, n11, n9, 
        _global_idx[6:1], n7}), .sti_di(sti_di), .sti_rd(sti_rd), .sti_addr({
        sti_addr[9], n18, sti_addr[7:6], n19, n20, n21, sti_addr[2:0]}), 
        .is_object(_is_object) );
  wrRes WRRES ( .clk(clk), .reset(n16), .control_signal(_control_signal), 
        .global_idx({_global_idx[13], n15, _global_idx[11:10], n13, n11, n9, 
        _global_idx[6:1], n7}), .is_object(_is_object), .rd_idx(_rd_idx), 
        .res_di(res_di), .res_do(res_do), .res_wr(res_wr), .init_done(
        _init_done), .forward_done(_forward_done), .backward_done(
        _backward_done) );
  rdRes RDRES ( .clk(clk), .reset(n16), .control_signal(_control_signal), 
        .global_idx({_global_idx[13], n15, _global_idx[11:10], n13, n11, n9, 
        _global_idx[6:0]}), .res_rd(res_rd), .res_addr(_res_RDaddr), .rd_idx(
        _rd_idx), .rd_res_done(_rd_res_done) );
  NAND2X2 U18 ( .A(_res_RDaddr[13]), .B(n17), .Y(n4) );
  NAND2X8 U19 ( .A(n4), .B(n5), .Y(res_addr[13]) );
  INVX3 U20 ( .A(n6), .Y(n17) );
  CLKBUFX3 U21 ( .A(n2), .Y(n6) );
  CLKBUFX2 U22 ( .A(_global_idx[0]), .Y(n7) );
  NAND2XL U23 ( .A(_global_idx[13]), .B(n6), .Y(n5) );
  CLKBUFX3 U24 ( .A(n18), .Y(sti_addr[8]) );
  AO22X2 U25 ( .A0(_res_RDaddr[12]), .A1(n17), .B0(n15), .B1(n6), .Y(
        res_addr[12]) );
  AO22X2 U26 ( .A0(_res_RDaddr[9]), .A1(n17), .B0(n13), .B1(n6), .Y(
        res_addr[9]) );
  AO22X2 U27 ( .A0(_res_RDaddr[8]), .A1(n17), .B0(n11), .B1(n6), .Y(
        res_addr[8]) );
  AO22X2 U28 ( .A0(_res_RDaddr[7]), .A1(n17), .B0(n9), .B1(n6), .Y(res_addr[7]) );
  AO22X2 U29 ( .A0(_res_RDaddr[0]), .A1(n17), .B0(n7), .B1(n6), .Y(res_addr[0]) );
  CLKBUFX3 U30 ( .A(_global_idx[12]), .Y(n15) );
  CLKBUFX3 U31 ( .A(n21), .Y(sti_addr[3]) );
  CLKBUFX3 U32 ( .A(n20), .Y(sti_addr[4]) );
  CLKBUFX3 U33 ( .A(n19), .Y(sti_addr[5]) );
  AO22X2 U34 ( .A0(_res_RDaddr[10]), .A1(n17), .B0(_global_idx[10]), .B1(n6), 
        .Y(res_addr[10]) );
  AO22X2 U35 ( .A0(_res_RDaddr[11]), .A1(n17), .B0(_global_idx[11]), .B1(n6), 
        .Y(res_addr[11]) );
  CLKBUFX3 U36 ( .A(reset), .Y(n16) );
  AO22X2 U37 ( .A0(_res_RDaddr[6]), .A1(n17), .B0(_global_idx[6]), .B1(n6), 
        .Y(res_addr[6]) );
  CLKBUFX3 U38 ( .A(_global_idx[7]), .Y(n9) );
  AO22X2 U39 ( .A0(_res_RDaddr[4]), .A1(n17), .B0(_global_idx[4]), .B1(n6), 
        .Y(res_addr[4]) );
  AO22X2 U40 ( .A0(_res_RDaddr[5]), .A1(n17), .B0(_global_idx[5]), .B1(n6), 
        .Y(res_addr[5]) );
  AO22X2 U41 ( .A0(_res_RDaddr[3]), .A1(n17), .B0(_global_idx[3]), .B1(n6), 
        .Y(res_addr[3]) );
  AO22X2 U42 ( .A0(_res_RDaddr[2]), .A1(n17), .B0(_global_idx[2]), .B1(n6), 
        .Y(res_addr[2]) );
  AO22X2 U43 ( .A0(_res_RDaddr[1]), .A1(n17), .B0(_global_idx[1]), .B1(n6), 
        .Y(res_addr[1]) );
  CLKBUFX3 U44 ( .A(_global_idx[8]), .Y(n11) );
  CLKBUFX3 U45 ( .A(_global_idx[9]), .Y(n13) );
  NAND2X1 U46 ( .A(n3), .B(_control_signal[1]), .Y(n2) );
  NOR2X1 U47 ( .A(_control_signal[3]), .B(_control_signal[0]), .Y(n3) );
endmodule

