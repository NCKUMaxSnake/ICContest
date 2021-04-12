/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 17 12:05:43 2021
/////////////////////////////////////////////////////////////


module CTRL ( clk, rst, reg_mode, read_done, proc_done, cur_state, busy, valid
 );
  input [1:0] reg_mode;
  output [3:0] cur_state;
  input clk, rst, read_done, proc_done;
  output busy, valid;
  wire   n33, n34, n8, n10, n11, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n3, n4, n5, n6, n7, n9,
         n12, n31, n32;
  wire   [3:0] next_state;

  DFFRHQX2 \cur_state_reg[3]  ( .D(next_state[3]), .CK(clk), .RN(n32), .Q(
        cur_state[3]) );
  DFFRX2 \cur_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n32), .Q(
        cur_state[0]), .QN(n11) );
  DFFRX2 \cur_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n32), .Q(
        cur_state[1]), .QN(n10) );
  DFFRX2 \cur_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n32), .Q(
        cur_state[2]), .QN(n8) );
  AOI2BB2X1 U3 ( .B0(n31), .B1(cur_state[3]), .A0N(n8), .A1N(n10), .Y(n14) );
  AND3X2 U4 ( .A(n13), .B(n11), .C(n14), .Y(n33) );
  INVX12 U5 ( .A(n33), .Y(busy) );
  BUFX12 U6 ( .A(n34), .Y(valid) );
  NOR3X1 U7 ( .A(n13), .B(cur_state[0]), .C(n14), .Y(n34) );
  XNOR2XL U8 ( .A(cur_state[2]), .B(cur_state[1]), .Y(n28) );
  AOI211XL U9 ( .A0(n23), .A1(cur_state[1]), .B0(n30), .C0(n12), .Y(n29) );
  OAI21XL U10 ( .A0(cur_state[0]), .A1(n31), .B0(cur_state[3]), .Y(n17) );
  NAND3XL U11 ( .A(cur_state[1]), .B(cur_state[2]), .C(cur_state[0]), .Y(n16)
         );
  NOR2X1 U12 ( .A(cur_state[0]), .B(cur_state[3]), .Y(n23) );
  NOR2XL U13 ( .A(n11), .B(cur_state[2]), .Y(n25) );
  NAND2XL U14 ( .A(n25), .B(cur_state[1]), .Y(n20) );
  AND2XL U15 ( .A(cur_state[3]), .B(n10), .Y(n19) );
  CLKINVX1 U16 ( .A(proc_done), .Y(n4) );
  CLKINVX1 U17 ( .A(n28), .Y(n31) );
  AOI211X1 U18 ( .A0(proc_done), .A1(n5), .B0(n19), .C0(n12), .Y(n21) );
  CLKINVX1 U19 ( .A(n17), .Y(n12) );
  CLKINVX1 U20 ( .A(n20), .Y(n6) );
  CLKINVX1 U21 ( .A(n27), .Y(n5) );
  CLKINVX1 U22 ( .A(n26), .Y(n3) );
  XNOR2X1 U23 ( .A(cur_state[3]), .B(n31), .Y(n13) );
  OAI221XL U24 ( .A0(n28), .A1(n9), .B0(proc_done), .B1(n27), .C0(n29), .Y(
        next_state[0]) );
  CLKINVX1 U25 ( .A(n23), .Y(n9) );
  NOR3X1 U26 ( .A(n26), .B(reg_mode[1]), .C(reg_mode[0]), .Y(n30) );
  OAI211X1 U27 ( .A0(n4), .A1(n7), .B0(n21), .C0(n24), .Y(next_state[1]) );
  CLKINVX1 U28 ( .A(n18), .Y(n7) );
  AOI221XL U29 ( .A0(reg_mode[0]), .A1(n3), .B0(n23), .B1(cur_state[1]), .C0(
        n6), .Y(n24) );
  OAI211X1 U30 ( .A0(n4), .A1(n20), .B0(n21), .C0(n22), .Y(next_state[2]) );
  AOI221XL U31 ( .A0(reg_mode[1]), .A1(n3), .B0(n23), .B1(cur_state[2]), .C0(
        n18), .Y(n22) );
  NOR3X1 U32 ( .A(n8), .B(cur_state[1]), .C(n11), .Y(n18) );
  OAI211X1 U33 ( .A0(n15), .A1(n4), .B0(n16), .C0(n17), .Y(next_state[3]) );
  NOR4X1 U34 ( .A(n5), .B(n6), .C(n18), .D(n19), .Y(n15) );
  NAND4X1 U35 ( .A(read_done), .B(n23), .C(n10), .D(n8), .Y(n26) );
  NAND2X1 U36 ( .A(n25), .B(n10), .Y(n27) );
  CLKINVX1 U37 ( .A(rst), .Y(n32) );
endmodule


module PROC_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module PROC ( clk, rst, en, cur_state, central, radius, mode, reg_mode, 
        read_done, proc_done, candidate );
  input [3:0] cur_state;
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [1:0] reg_mode;
  output [7:0] candidate;
  input clk, rst, en;
  output read_done, proc_done;
  wire   n261, n262, n263, n264, n265, n266, n267, n268, N43, N44, N45, N48,
         N49, N50, tmp_res, tmp_res2, N88, N89, N90, N91, N92, N93, N94, N95,
         N97, N98, N99, N100, N101, N102, N103, N104, N277, N283, n34, n35,
         n37, n38, n40, n41, n42, n44, n45, n46, n47, n49, n50, n51, n52, n54,
         n55, n56, n57, n58, n59, n60, n62, n63, n64, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n76, n77, n78, n80, n81, n82, n83, n84, n85, n86,
         n88, n89, n90, n91, n93, n94, n95, n96, n98, n99, n100, n101, n102,
         n103, n104, n106, n107, n108, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n120, n121, n122, n123, n124, n125, n126, n128,
         n129, n130, n132, n133, n134, n135, n137, n141, n143, n145, n148,
         n150, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, N287, N286,
         N285, N284, N281, N280, N279, N278, \r453/GE_LT_GT_LE ,
         \mult_318/n13 , \mult_318/n12 , \mult_318/n10 , \mult_318/n9 ,
         \mult_318/n8 , \mult_318/n7 , \mult_318/n5 , \mult_318/n4 ,
         \mult_318/n3 , \mult_318/n2 , \mult_318/n1 , \mult_317/n13 ,
         \mult_317/n12 , \mult_317/n10 , \mult_317/n9 , \mult_317/n8 ,
         \mult_317/n7 , \mult_317/n5 , \mult_317/n4 , \mult_317/n3 ,
         \mult_317/n2 , \mult_317/n1 , \mult_316/n13 , \mult_316/n12 ,
         \mult_316/n10 , \mult_316/n9 , \mult_316/n8 , \mult_316/n7 ,
         \mult_316/n5 , \mult_316/n4 , \mult_316/n3 , \mult_316/n2 ,
         \mult_316/n1 , n1, n2, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n36, n39,
         n43, n48, n53, n61, n65, n75, n79, n87, n92, n97, n105, n109, n119,
         n127, n131, n136, n138, n139, n140, n142, n144, n146, n147, n149,
         n151, n201, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, \r452/n5 , \r452/n4 , \r452/n3 , \r452/n1 ,
         \r452/carry[7] , \r452/carry[6] , \r452/carry[5] , \r452/carry[4] ;
  wire   [23:0] reg_central;
  wire   [11:0] reg_radius;
  wire   [3:0] cntX;
  wire   [3:0] cntY;
  wire   [3:0] r;
  wire   [3:0] x;
  wire   [3:0] y;
  wire   [7:0] r_sqr;
  wire   [7:0] x_sqr;
  wire   [7:0] y_sqr;

  OAI221X2 U42 ( .A0(cntY[0]), .A1(n76), .B0(n244), .B1(n35), .C0(n77), .Y(
        y_sqr[0]) );
  OAI221X2 U88 ( .A0(cntX[0]), .A1(n120), .B0(n35), .B1(n243), .C0(n121), .Y(
        x_sqr[0]) );
  ADDFXL \mult_318/U4  ( .A(\mult_318/n7 ), .B(\mult_318/n10 ), .CI(
        \mult_318/n4 ), .CO(\mult_318/n3 ), .S(y_sqr[4]) );
  ADDHXL \mult_316/U6  ( .A(r[1]), .B(\mult_316/n13 ), .CO(\mult_316/n5 ), .S(
        r_sqr[2]) );
  ADDHXL \mult_316/U5  ( .A(\mult_316/n12 ), .B(\mult_316/n5 ), .CO(
        \mult_316/n4 ), .S(r_sqr[3]) );
  ADDFXL \mult_316/U4  ( .A(\mult_316/n7 ), .B(\mult_316/n10 ), .CI(
        \mult_316/n4 ), .CO(\mult_316/n3 ), .S(r_sqr[4]) );
  ADDFXL \mult_316/U2  ( .A(\mult_316/n8 ), .B(r[3]), .CI(\mult_316/n2 ), .CO(
        \mult_316/n1 ), .S(r_sqr[6]) );
  DFFRX1 read_done_reg ( .D(n105), .CK(clk), .RN(n79), .Q(read_done) );
  DFFRX1 \reg_mode_reg[1]  ( .D(n189), .CK(clk), .RN(n79), .Q(reg_mode[1]), 
        .QN(n161) );
  DFFRX1 \reg_mode_reg[0]  ( .D(n188), .CK(clk), .RN(n79), .Q(reg_mode[0]), 
        .QN(n162) );
  EDFFX1 tmp_res2_reg ( .D(\r453/GE_LT_GT_LE ), .E(n163), .CK(clk), .Q(
        tmp_res2) );
  DFFRX1 \reg_radius_reg[3]  ( .D(n193), .CK(clk), .RN(n75), .Q(reg_radius[3])
         );
  DFFRX1 \reg_radius_reg[2]  ( .D(n192), .CK(clk), .RN(n75), .Q(reg_radius[2])
         );
  DFFRX1 \reg_radius_reg[11]  ( .D(n202), .CK(clk), .RN(n75), .Q(
        reg_radius[11]) );
  DFFRX1 \reg_radius_reg[10]  ( .D(n200), .CK(clk), .RN(n75), .Q(
        reg_radius[10]) );
  DFFRX1 \reg_radius_reg[7]  ( .D(n197), .CK(clk), .RN(n75), .Q(reg_radius[7])
         );
  DFFRX1 \reg_radius_reg[6]  ( .D(n196), .CK(clk), .RN(n75), .Q(reg_radius[6])
         );
  DFFRX1 \reg_radius_reg[1]  ( .D(n191), .CK(clk), .RN(n75), .Q(reg_radius[1])
         );
  DFFRX1 \reg_radius_reg[0]  ( .D(n190), .CK(clk), .RN(n75), .Q(reg_radius[0])
         );
  DFFRX1 \reg_radius_reg[9]  ( .D(n199), .CK(clk), .RN(n75), .Q(reg_radius[9])
         );
  DFFRX1 \reg_radius_reg[8]  ( .D(n198), .CK(clk), .RN(n75), .Q(reg_radius[8])
         );
  DFFRX1 \reg_radius_reg[5]  ( .D(n195), .CK(clk), .RN(n75), .Q(reg_radius[5])
         );
  DFFRX1 \reg_radius_reg[4]  ( .D(n194), .CK(clk), .RN(n75), .Q(reg_radius[4])
         );
  DFFRX1 \reg_central_reg[23]  ( .D(n187), .CK(clk), .RN(n79), .Q(
        reg_central[23]) );
  DFFRX1 \reg_central_reg[19]  ( .D(n183), .CK(clk), .RN(n79), .Q(
        reg_central[19]) );
  DFFRX1 \reg_central_reg[15]  ( .D(n179), .CK(clk), .RN(n79), .Q(
        reg_central[15]) );
  DFFRX1 \reg_central_reg[11]  ( .D(n175), .CK(clk), .RN(n87), .Q(
        reg_central[11]) );
  DFFRX1 \reg_central_reg[7]  ( .D(n171), .CK(clk), .RN(n87), .Q(
        reg_central[7]) );
  DFFRX1 \reg_central_reg[3]  ( .D(n167), .CK(clk), .RN(n87), .Q(
        reg_central[3]) );
  DFFRX1 \reg_central_reg[22]  ( .D(n186), .CK(clk), .RN(n79), .Q(
        reg_central[22]), .QN(n6) );
  DFFRX1 \reg_central_reg[18]  ( .D(n182), .CK(clk), .RN(n79), .Q(
        reg_central[18]), .QN(n4) );
  DFFRX1 \reg_central_reg[14]  ( .D(n178), .CK(clk), .RN(n87), .Q(
        reg_central[14]), .QN(n8) );
  DFFRX1 \reg_central_reg[10]  ( .D(n174), .CK(clk), .RN(n87), .Q(
        reg_central[10]), .QN(n5) );
  DFFRX1 \reg_central_reg[6]  ( .D(n170), .CK(clk), .RN(n87), .Q(
        reg_central[6]), .QN(n9) );
  DFFRX1 \reg_central_reg[2]  ( .D(n166), .CK(clk), .RN(n92), .Q(
        reg_central[2]), .QN(n7) );
  DFFRX1 \reg_central_reg[5]  ( .D(n169), .CK(clk), .RN(n87), .Q(
        reg_central[5]) );
  DFFRX1 \reg_central_reg[1]  ( .D(n165), .CK(clk), .RN(n92), .Q(
        reg_central[1]) );
  DFFRX1 \reg_central_reg[4]  ( .D(n168), .CK(clk), .RN(n87), .Q(
        reg_central[4]) );
  DFFRX1 \reg_central_reg[21]  ( .D(n185), .CK(clk), .RN(n79), .Q(
        reg_central[21]) );
  DFFRX1 \reg_central_reg[17]  ( .D(n181), .CK(clk), .RN(n79), .Q(
        reg_central[17]) );
  DFFRX1 \reg_central_reg[13]  ( .D(n177), .CK(clk), .RN(n87), .Q(
        reg_central[13]) );
  DFFRX1 \reg_central_reg[9]  ( .D(n173), .CK(clk), .RN(n87), .Q(
        reg_central[9]) );
  DFFRX2 \cntX_reg[1]  ( .D(n224), .CK(clk), .RN(n92), .Q(cntX[1]), .QN(n205)
         );
  DFFRX1 \cntY_reg[1]  ( .D(n220), .CK(clk), .RN(n92), .Q(cntY[1]), .QN(n208)
         );
  DFFRX1 \reg_central_reg[12]  ( .D(n176), .CK(clk), .RN(n87), .Q(
        reg_central[12]) );
  DFFRX1 \reg_central_reg[20]  ( .D(n184), .CK(clk), .RN(n79), .Q(
        reg_central[20]), .QN(n26) );
  DFFRX1 \reg_central_reg[8]  ( .D(n172), .CK(clk), .RN(n87), .Q(
        reg_central[8]) );
  DFFRX1 \reg_central_reg[16]  ( .D(n180), .CK(clk), .RN(n79), .Q(
        reg_central[16]) );
  DFFRX1 \reg_central_reg[0]  ( .D(n164), .CK(clk), .RN(n92), .Q(
        reg_central[0]) );
  DFFRX1 \cntX_reg[3]  ( .D(n226), .CK(clk), .RN(n92), .Q(cntX[3]), .QN(n203)
         );
  DFFRX1 \cntY_reg[3]  ( .D(n222), .CK(clk), .RN(n92), .Q(cntY[3]) );
  DFFRX1 \candidate_reg[0]  ( .D(n217), .CK(clk), .RN(n92), .Q(n268), .QN(n154) );
  DFFRX1 \candidate_reg[7]  ( .D(n211), .CK(clk), .RN(n87), .Q(n261), .QN(n160) );
  DFFRX1 \candidate_reg[5]  ( .D(n213), .CK(clk), .RN(n92), .Q(n263), .QN(n158) );
  DFFRX1 \candidate_reg[4]  ( .D(n214), .CK(clk), .RN(n87), .Q(n264), .QN(n157) );
  DFFRX1 \candidate_reg[3]  ( .D(n215), .CK(clk), .RN(n92), .Q(n265), .QN(n156) );
  DFFRX1 \candidate_reg[2]  ( .D(n216), .CK(clk), .RN(n92), .Q(n266), .QN(n155) );
  DFFRX1 \candidate_reg[6]  ( .D(n212), .CK(clk), .RN(n87), .Q(n262), .QN(n159) );
  DFFRX1 \candidate_reg[1]  ( .D(n218), .CK(clk), .RN(n92), .Q(n267), .QN(n153) );
  DFFSX1 \cntX_reg[0]  ( .D(n223), .CK(clk), .SN(n256), .Q(cntX[0]), .QN(n206)
         );
  DFFSX1 \cntY_reg[0]  ( .D(n219), .CK(clk), .SN(n256), .Q(cntY[0]), .QN(n209)
         );
  EDFFXL tmp_res_reg ( .D(\r453/GE_LT_GT_LE ), .E(n210), .CK(clk), .Q(tmp_res), 
        .QN(n248) );
  DFFRX2 \cntX_reg[2]  ( .D(n225), .CK(clk), .RN(n92), .Q(cntX[2]), .QN(n204)
         );
  DFFRX2 \cntY_reg[2]  ( .D(n221), .CK(clk), .RN(n92), .Q(cntY[2]), .QN(n207)
         );
  INVX3 U3 ( .A(n78), .Y(n252) );
  BUFX12 U4 ( .A(n132), .Y(n1) );
  NAND3X2 U5 ( .A(n28), .B(n29), .C(n30), .Y(n231) );
  OR2X2 U6 ( .A(r_sqr[6]), .B(n146), .Y(n28) );
  OR2X2 U7 ( .A(n235), .B(n146), .Y(n29) );
  NOR2X1 U8 ( .A(n209), .B(reg_central[16]), .Y(n63) );
  NAND3X1 U9 ( .A(n32), .B(n33), .C(n36), .Y(x[3]) );
  OR2X1 U10 ( .A(n250), .B(n82), .Y(n33) );
  OR2X1 U11 ( .A(n83), .B(n252), .Y(n36) );
  OAI222X1 U13 ( .A0(n34), .A1(n35), .B0(n250), .B1(n37), .C0(n38), .C1(n252), 
        .Y(y[3]) );
  ADDHXL U14 ( .A(y[1]), .B(\mult_318/n13 ), .CO(\mult_318/n5 ), .S(y_sqr[2])
         );
  ADDHXL U15 ( .A(x[1]), .B(\mult_317/n13 ), .CO(\mult_317/n5 ), .S(x_sqr[2])
         );
  CLKINVX1 U16 ( .A(cur_state[3]), .Y(n254) );
  NAND3X1 U17 ( .A(n43), .B(n48), .C(n53), .Y(n146) );
  NOR2X1 U18 ( .A(cur_state[1]), .B(cur_state[2]), .Y(n126) );
  NAND2X1 U19 ( .A(n31), .B(n232), .Y(\r453/GE_LT_GT_LE ) );
  INVX3 U20 ( .A(n39), .Y(n35) );
  AND2X2 U21 ( .A(cur_state[3]), .B(n137), .Y(n39) );
  NOR2X1 U22 ( .A(n20), .B(n21), .Y(n2) );
  CLKBUFX2 U23 ( .A(n256), .Y(n75) );
  CLKBUFX2 U24 ( .A(n256), .Y(n79) );
  BUFX12 U25 ( .A(n267), .Y(candidate[1]) );
  BUFX12 U26 ( .A(n262), .Y(candidate[6]) );
  BUFX12 U27 ( .A(n266), .Y(candidate[2]) );
  BUFX12 U28 ( .A(n265), .Y(candidate[3]) );
  BUFX12 U29 ( .A(n264), .Y(candidate[4]) );
  BUFX12 U30 ( .A(n263), .Y(candidate[5]) );
  BUFX12 U31 ( .A(n261), .Y(candidate[7]) );
  BUFX12 U32 ( .A(n268), .Y(candidate[0]) );
  ADDFX2 U33 ( .A(\mult_317/n7 ), .B(\mult_317/n10 ), .CI(\mult_317/n4 ), .CO(
        \mult_317/n3 ), .S(x_sqr[4]) );
  OR2X1 U34 ( .A(n147), .B(n234), .Y(n18) );
  OR2XL U35 ( .A(N93), .B(n147), .Y(n19) );
  NAND2X1 U36 ( .A(n18), .B(n19), .Y(n229) );
  AO22X2 U37 ( .A0(\mult_316/n1 ), .A1(N95), .B0(n231), .B1(n230), .Y(n232) );
  NAND3X1 U38 ( .A(n23), .B(n24), .C(n25), .Y(\mult_317/n2 ) );
  NOR2X2 U39 ( .A(n128), .B(n126), .Y(n78) );
  CLKINVX1 U40 ( .A(n103), .Y(n241) );
  ADDHXL U41 ( .A(\mult_317/n12 ), .B(\mult_317/n5 ), .CO(\mult_317/n4 ), .S(
        x_sqr[3]) );
  ADDHXL U43 ( .A(\mult_318/n12 ), .B(\mult_318/n5 ), .CO(\mult_318/n4 ), .S(
        y_sqr[3]) );
  OAI21X2 U44 ( .A0(n208), .A1(n242), .B0(reg_central[9]), .Y(n60) );
  OAI221X2 U45 ( .A0(n135), .A1(n238), .B0(n137), .B1(n254), .C0(n2), .Y(n132)
         );
  CLKBUFX3 U46 ( .A(cntY[1]), .Y(n65) );
  OR2X1 U47 ( .A(cur_state[1]), .B(cur_state[2]), .Y(n27) );
  NOR3X1 U48 ( .A(n141), .B(\r453/GE_LT_GT_LE ), .C(n248), .Y(n20) );
  ADDFXL U49 ( .A(\mult_318/n8 ), .B(y[3]), .CI(\mult_318/n2 ), .CO(
        \mult_318/n1 ), .S(y_sqr[6]) );
  XOR2X1 U50 ( .A(\mult_317/n9 ), .B(x[2]), .Y(n22) );
  XOR2X1 U51 ( .A(\mult_317/n3 ), .B(n22), .Y(x_sqr[5]) );
  AND2X2 U52 ( .A(cntX[0]), .B(n26), .Y(n107) );
  XNOR2XL U53 ( .A(n93), .B(n106), .Y(n100) );
  CLKINVX1 U54 ( .A(n143), .Y(n21) );
  NAND2XL U55 ( .A(\mult_317/n9 ), .B(\mult_317/n3 ), .Y(n23) );
  NAND2XL U56 ( .A(x[2]), .B(\mult_317/n3 ), .Y(n24) );
  NAND2XL U57 ( .A(x[2]), .B(\mult_317/n9 ), .Y(n25) );
  OAI222X4 U58 ( .A0(n35), .A1(n99), .B0(n250), .B1(n100), .C0(n252), .C1(n101), .Y(x[2]) );
  OR2X1 U59 ( .A(N95), .B(\mult_316/n1 ), .Y(n31) );
  OAI21XL U60 ( .A0(n205), .A1(n239), .B0(reg_central[21]), .Y(n108) );
  CLKINVX1 U61 ( .A(n107), .Y(n239) );
  ADDFXL U62 ( .A(r[2]), .B(\mult_316/n9 ), .CI(\mult_316/n3 ), .CO(
        \mult_316/n2 ), .S(r_sqr[5]) );
  CLKINVX1 U63 ( .A(n124), .Y(r[1]) );
  CLKINVX1 U64 ( .A(n125), .Y(r_sqr[0]) );
  NOR2X1 U65 ( .A(n209), .B(reg_central[8]), .Y(n59) );
  AOI222XL U66 ( .A0(reg_central[0]), .A1(n39), .B0(reg_central[16]), .B1(n80), 
        .C0(reg_central[8]), .C1(n78), .Y(n76) );
  ADDFX2 U67 ( .A(y[2]), .B(\mult_318/n9 ), .CI(\mult_318/n3 ), .CO(
        \mult_318/n2 ), .S(y_sqr[5]) );
  XOR2X1 U68 ( .A(n89), .B(n90), .Y(n82) );
  OR2XL U69 ( .A(n81), .B(n35), .Y(n32) );
  NOR2X1 U70 ( .A(n27), .B(cur_state[0]), .Y(n137) );
  NAND2XL U71 ( .A(n137), .B(n254), .Y(n143) );
  OR2X4 U72 ( .A(r_sqr[6]), .B(n235), .Y(n30) );
  INVX3 U73 ( .A(N94), .Y(n235) );
  OR2XL U74 ( .A(N93), .B(n144), .Y(n48) );
  ADDFXL U75 ( .A(\mult_317/n8 ), .B(x[3]), .CI(\mult_317/n2 ), .CO(
        \mult_317/n1 ), .S(x_sqr[6]) );
  NAND2XL U76 ( .A(x_sqr[0]), .B(x[3]), .Y(\mult_317/n10 ) );
  NAND2BXL U77 ( .AN(x[1]), .B(x[2]), .Y(\mult_317/n7 ) );
  INVX3 U78 ( .A(n80), .Y(n250) );
  AOI2BB2XL U79 ( .B0(n78), .B1(n59), .A0N(n240), .A1N(n250), .Y(n77) );
  OAI21XL U80 ( .A0(n205), .A1(n241), .B0(reg_central[13]), .Y(n104) );
  INVXL U81 ( .A(\r453/GE_LT_GT_LE ), .Y(n238) );
  NAND2XL U82 ( .A(y[3]), .B(y[1]), .Y(\mult_318/n9 ) );
  NAND2XL U83 ( .A(y[2]), .B(y[3]), .Y(\mult_318/n8 ) );
  NAND2XL U84 ( .A(x[3]), .B(x[1]), .Y(\mult_317/n9 ) );
  NAND2XL U85 ( .A(x[2]), .B(x[3]), .Y(\mult_317/n8 ) );
  INVX1 U86 ( .A(r_sqr[3]), .Y(n233) );
  CLKINVX1 U87 ( .A(r_sqr[5]), .Y(n234) );
  XNOR2XL U89 ( .A(n73), .B(n240), .Y(n70) );
  NOR2BX4 U90 ( .AN(n1), .B(n134), .Y(n133) );
  AND2X2 U91 ( .A(y[2]), .B(y_sqr[0]), .Y(\mult_318/n12 ) );
  AND2X2 U92 ( .A(x[2]), .B(x_sqr[0]), .Y(\mult_317/n12 ) );
  AND2X2 U93 ( .A(y[1]), .B(y_sqr[0]), .Y(\mult_318/n13 ) );
  AND2X2 U94 ( .A(x[1]), .B(x_sqr[0]), .Y(\mult_317/n13 ) );
  NAND2XL U95 ( .A(r[2]), .B(r[3]), .Y(\mult_316/n8 ) );
  INVXL U96 ( .A(n111), .Y(n243) );
  NAND2XL U97 ( .A(r[3]), .B(r[1]), .Y(\mult_316/n9 ) );
  INVXL U98 ( .A(n67), .Y(n244) );
  OAI21X1 U99 ( .A0(n134), .A1(n130), .B0(n143), .Y(n148) );
  INVXL U100 ( .A(n128), .Y(n251) );
  XNOR2XL U101 ( .A(reg_central[21]), .B(cntX[1]), .Y(n117) );
  XNOR2XL U102 ( .A(reg_central[5]), .B(cntX[1]), .Y(n118) );
  XNOR2XL U103 ( .A(reg_central[13]), .B(cntX[1]), .Y(n116) );
  XNOR2XL U104 ( .A(reg_central[17]), .B(n65), .Y(n73) );
  XNOR2XL U105 ( .A(reg_central[1]), .B(n65), .Y(n74) );
  XNOR2XL U106 ( .A(reg_central[9]), .B(n65), .Y(n72) );
  AOI32XL U107 ( .A0(cur_state[2]), .A1(n253), .A2(n251), .B0(n39), .B1(
        tmp_res2), .Y(n141) );
  NOR4XL U108 ( .A(rst), .B(n128), .C(n255), .D(n253), .Y(n163) );
  NOR4XL U109 ( .A(rst), .B(cur_state[3]), .C(cur_state[0]), .D(n126), .Y(n210) );
  AND2XL U110 ( .A(cntX[1]), .B(N277), .Y(N279) );
  AO22XL U111 ( .A0(N50), .A1(n148), .B0(n246), .B1(cntY[3]), .Y(n222) );
  INVXL U112 ( .A(cur_state[1]), .Y(n253) );
  INVXL U113 ( .A(cur_state[2]), .Y(n255) );
  NAND4XL U114 ( .A(n205), .B(n206), .C(cntX[3]), .D(n204), .Y(n130) );
  NAND4XL U115 ( .A(n208), .B(n209), .C(cntY[3]), .D(n207), .Y(n129) );
  CLKINVX1 U116 ( .A(rst), .Y(n256) );
  OR2XL U117 ( .A(N93), .B(n234), .Y(n43) );
  OR2X1 U118 ( .A(n234), .B(n144), .Y(n53) );
  NAND2BXL U119 ( .AN(N92), .B(r_sqr[4]), .Y(n144) );
  INVX3 U120 ( .A(n142), .Y(n105) );
  INVX3 U121 ( .A(n119), .Y(n109) );
  CLKBUFX3 U122 ( .A(n140), .Y(n119) );
  CLKBUFX3 U123 ( .A(n142), .Y(n131) );
  CLKBUFX3 U124 ( .A(n142), .Y(n136) );
  CLKBUFX3 U125 ( .A(n140), .Y(n138) );
  CLKBUFX3 U126 ( .A(n140), .Y(n139) );
  CLKBUFX3 U127 ( .A(n142), .Y(n127) );
  NAND2X2 U128 ( .A(n134), .B(n143), .Y(n150) );
  CLKINVX1 U129 ( .A(n148), .Y(n246) );
  XOR2X1 U130 ( .A(n94), .B(n95), .Y(n81) );
  XOR2X1 U131 ( .A(n84), .B(n85), .Y(n83) );
  XOR2X1 U132 ( .A(n50), .B(n51), .Y(n34) );
  XOR2X1 U133 ( .A(n40), .B(n41), .Y(n38) );
  XOR2X1 U134 ( .A(n45), .B(n46), .Y(n37) );
  XNOR2X1 U135 ( .A(n98), .B(n110), .Y(n99) );
  XNOR2X1 U136 ( .A(n88), .B(n102), .Y(n101) );
  OAI222X1 U137 ( .A0(n35), .A1(n55), .B0(n250), .B1(n56), .C0(n252), .C1(n57), 
        .Y(y[2]) );
  XNOR2X1 U138 ( .A(n54), .B(n66), .Y(n55) );
  XNOR2X1 U139 ( .A(n44), .B(n58), .Y(n57) );
  XNOR2X1 U140 ( .A(n49), .B(n62), .Y(n56) );
  OAI222X1 U141 ( .A0(n113), .A1(n35), .B0(n250), .B1(n114), .C0(n115), .C1(
        n252), .Y(x[1]) );
  XNOR2X1 U142 ( .A(n116), .B(n241), .Y(n115) );
  XNOR2X1 U143 ( .A(n118), .B(n243), .Y(n113) );
  XNOR2X1 U144 ( .A(n117), .B(n239), .Y(n114) );
  OAI222X1 U145 ( .A0(n69), .A1(n35), .B0(n250), .B1(n70), .C0(n71), .C1(n252), 
        .Y(y[1]) );
  XNOR2X1 U146 ( .A(n72), .B(n242), .Y(n71) );
  XNOR2X1 U147 ( .A(n74), .B(n244), .Y(n69) );
  OA22X1 U148 ( .A0(n149), .A1(n61), .B0(n227), .B1(n233), .Y(n201) );
  OA22X1 U149 ( .A0(n151), .A1(n233), .B0(N91), .B1(n151), .Y(n61) );
  CLKINVX1 U150 ( .A(n63), .Y(n240) );
  CLKINVX1 U151 ( .A(n59), .Y(n242) );
  CLKINVX1 U152 ( .A(N88), .Y(n236) );
  CLKINVX1 U153 ( .A(N89), .Y(n237) );
  CLKINVX1 U154 ( .A(n97), .Y(n140) );
  CLKINVX1 U155 ( .A(n97), .Y(n142) );
  NOR2BX1 U156 ( .AN(n130), .B(n134), .Y(N277) );
  NOR2BX1 U157 ( .AN(n129), .B(n134), .Y(N283) );
  NAND2X1 U158 ( .A(N279), .B(N278), .Y(n258) );
  NAND2X1 U159 ( .A(N285), .B(N284), .Y(n260) );
  CLKINVX1 U160 ( .A(N284), .Y(n247) );
  CLKINVX1 U161 ( .A(N278), .Y(n245) );
  AND2X2 U162 ( .A(n152), .B(n35), .Y(n134) );
  OAI21XL U163 ( .A0(n255), .A1(n253), .B0(n251), .Y(n152) );
  CLKINVX1 U164 ( .A(n141), .Y(n249) );
  AO22X1 U165 ( .A0(N48), .A1(n148), .B0(n246), .B1(n65), .Y(n220) );
  XNOR2X1 U166 ( .A(N285), .B(n247), .Y(N48) );
  NOR2X1 U167 ( .A(n129), .B(n130), .Y(proc_done) );
  CLKBUFX3 U168 ( .A(n256), .Y(n92) );
  CLKBUFX3 U169 ( .A(n256), .Y(n87) );
  AOI2BB2X1 U170 ( .B0(n103), .B1(n78), .A0N(n239), .A1N(n250), .Y(n121) );
  AOI222XL U171 ( .A0(n251), .A1(n126), .B0(tmp_res), .B1(n145), .C0(n249), 
        .C1(n248), .Y(n135) );
  NAND2X2 U172 ( .A(cur_state[0]), .B(n254), .Y(n128) );
  OAI2BB2XL U173 ( .B0(n160), .B1(n1), .A0N(N104), .A1N(n133), .Y(n211) );
  OAI2BB2XL U174 ( .B0(n159), .B1(n1), .A0N(N103), .A1N(n133), .Y(n212) );
  OAI2BB2XL U175 ( .B0(n158), .B1(n1), .A0N(N102), .A1N(n133), .Y(n213) );
  OAI2BB2XL U176 ( .B0(n157), .B1(n1), .A0N(N101), .A1N(n133), .Y(n214) );
  OAI2BB2XL U177 ( .B0(n156), .B1(n1), .A0N(N100), .A1N(n133), .Y(n215) );
  OAI2BB2XL U178 ( .B0(n155), .B1(n1), .A0N(N99), .A1N(n133), .Y(n216) );
  OAI2BB2XL U179 ( .B0(n154), .B1(n1), .A0N(N97), .A1N(n133), .Y(n217) );
  OAI2BB2XL U180 ( .B0(n153), .B1(n1), .A0N(N98), .A1N(n133), .Y(n218) );
  OAI21X1 U181 ( .A0(n65), .A1(n63), .B0(n64), .Y(n49) );
  OAI21XL U182 ( .A0(n208), .A1(n240), .B0(reg_central[17]), .Y(n64) );
  OAI21X1 U183 ( .A0(n65), .A1(n59), .B0(n60), .Y(n44) );
  NOR2X1 U184 ( .A(n209), .B(reg_central[0]), .Y(n67) );
  OAI2BB2XL U185 ( .B0(n47), .B1(n4), .A0N(n49), .A1N(n207), .Y(n45) );
  NOR2X1 U186 ( .A(n207), .B(n49), .Y(n47) );
  OAI2BB2XL U187 ( .B0(n42), .B1(n5), .A0N(n44), .A1N(n207), .Y(n40) );
  NOR2X1 U188 ( .A(n207), .B(n44), .Y(n42) );
  OAI21X1 U189 ( .A0(cntX[1]), .A1(n107), .B0(n108), .Y(n93) );
  OAI21X1 U190 ( .A0(cntX[1]), .A1(n103), .B0(n104), .Y(n88) );
  OAI21X1 U191 ( .A0(cntX[1]), .A1(n111), .B0(n112), .Y(n98) );
  OAI2BB1X1 U192 ( .A0N(n111), .A1N(cntX[1]), .B0(reg_central[5]), .Y(n112) );
  OAI21X1 U193 ( .A0(n65), .A1(n67), .B0(n68), .Y(n54) );
  OAI2BB1X1 U194 ( .A0N(n67), .A1N(n65), .B0(reg_central[1]), .Y(n68) );
  XNOR2X1 U195 ( .A(n6), .B(n204), .Y(n106) );
  XNOR2X1 U196 ( .A(n8), .B(n204), .Y(n102) );
  XNOR2X1 U197 ( .A(n9), .B(n204), .Y(n110) );
  XNOR2X1 U198 ( .A(n4), .B(n207), .Y(n62) );
  XNOR2X1 U199 ( .A(n5), .B(n207), .Y(n58) );
  XNOR2X1 U200 ( .A(n7), .B(n207), .Y(n66) );
  NOR2X1 U201 ( .A(n206), .B(reg_central[12]), .Y(n103) );
  XOR2X1 U202 ( .A(reg_central[19]), .B(cntY[3]), .Y(n46) );
  XOR2X1 U203 ( .A(reg_central[11]), .B(cntY[3]), .Y(n41) );
  XOR2X1 U204 ( .A(reg_central[3]), .B(cntY[3]), .Y(n51) );
  XOR2X1 U205 ( .A(reg_central[23]), .B(cntX[3]), .Y(n90) );
  XOR2X1 U206 ( .A(reg_central[15]), .B(cntX[3]), .Y(n85) );
  XOR2X1 U207 ( .A(reg_central[7]), .B(cntX[3]), .Y(n95) );
  NOR2X1 U208 ( .A(n206), .B(reg_central[4]), .Y(n111) );
  CLKINVX1 U209 ( .A(n122), .Y(r[3]) );
  AOI222XL U210 ( .A0(n78), .A1(reg_radius[7]), .B0(n80), .B1(reg_radius[11]), 
        .C0(n39), .C1(reg_radius[3]), .Y(n122) );
  CLKINVX1 U211 ( .A(n123), .Y(r[2]) );
  AOI222XL U212 ( .A0(n78), .A1(reg_radius[6]), .B0(n80), .B1(reg_radius[10]), 
        .C0(n39), .C1(reg_radius[2]), .Y(n123) );
  OAI2BB2XL U213 ( .B0(n91), .B1(n6), .A0N(n93), .A1N(n204), .Y(n89) );
  NOR2X1 U214 ( .A(n204), .B(n93), .Y(n91) );
  OAI2BB2XL U215 ( .B0(n52), .B1(n7), .A0N(n54), .A1N(n207), .Y(n50) );
  NOR2X1 U216 ( .A(n207), .B(n54), .Y(n52) );
  OAI2BB2XL U217 ( .B0(n86), .B1(n8), .A0N(n88), .A1N(n204), .Y(n84) );
  NOR2X1 U218 ( .A(n204), .B(n88), .Y(n86) );
  OAI2BB2XL U219 ( .B0(n96), .B1(n9), .A0N(n98), .A1N(n204), .Y(n94) );
  NOR2X1 U220 ( .A(n204), .B(n98), .Y(n96) );
  OAI2BB2XL U221 ( .B0(n105), .B1(n162), .A0N(mode[0]), .A1N(n105), .Y(n188)
         );
  OAI2BB2XL U222 ( .B0(n105), .B1(n161), .A0N(mode[1]), .A1N(n109), .Y(n189)
         );
  AO22X1 U223 ( .A0(n127), .A1(reg_central[0]), .B0(central[0]), .B1(n109), 
        .Y(n164) );
  AO22X1 U224 ( .A0(n127), .A1(reg_central[1]), .B0(central[1]), .B1(n109), 
        .Y(n165) );
  AO22X1 U225 ( .A0(n131), .A1(reg_central[2]), .B0(central[2]), .B1(n109), 
        .Y(n166) );
  AO22X1 U226 ( .A0(n131), .A1(reg_central[3]), .B0(central[3]), .B1(n109), 
        .Y(n167) );
  AO22X1 U227 ( .A0(n131), .A1(reg_central[4]), .B0(central[4]), .B1(n109), 
        .Y(n168) );
  AO22X1 U228 ( .A0(n131), .A1(reg_central[5]), .B0(central[5]), .B1(n109), 
        .Y(n169) );
  AO22X1 U229 ( .A0(n131), .A1(reg_central[6]), .B0(central[6]), .B1(n109), 
        .Y(n170) );
  AO22X1 U230 ( .A0(n131), .A1(reg_central[7]), .B0(central[7]), .B1(n109), 
        .Y(n171) );
  AO22X1 U231 ( .A0(n136), .A1(reg_central[8]), .B0(central[8]), .B1(n109), 
        .Y(n172) );
  AO22X1 U232 ( .A0(n136), .A1(reg_central[9]), .B0(central[9]), .B1(n109), 
        .Y(n173) );
  AO22X1 U233 ( .A0(n136), .A1(reg_central[10]), .B0(central[10]), .B1(n109), 
        .Y(n174) );
  AO22X1 U234 ( .A0(n136), .A1(reg_central[11]), .B0(central[11]), .B1(n109), 
        .Y(n175) );
  AO22X1 U235 ( .A0(n136), .A1(reg_central[12]), .B0(central[12]), .B1(n105), 
        .Y(n176) );
  AO22X1 U236 ( .A0(n136), .A1(reg_central[13]), .B0(central[13]), .B1(n105), 
        .Y(n177) );
  AO22X1 U237 ( .A0(n138), .A1(reg_central[14]), .B0(central[14]), .B1(n105), 
        .Y(n178) );
  AO22X1 U238 ( .A0(n138), .A1(reg_central[15]), .B0(central[15]), .B1(n105), 
        .Y(n179) );
  AO22X1 U239 ( .A0(n138), .A1(reg_central[16]), .B0(central[16]), .B1(n105), 
        .Y(n180) );
  AO22X1 U240 ( .A0(n138), .A1(reg_central[17]), .B0(central[17]), .B1(n105), 
        .Y(n181) );
  AO22X1 U241 ( .A0(n138), .A1(reg_central[18]), .B0(central[18]), .B1(n105), 
        .Y(n182) );
  AO22X1 U242 ( .A0(n138), .A1(reg_central[19]), .B0(central[19]), .B1(n105), 
        .Y(n183) );
  AO22X1 U243 ( .A0(n139), .A1(reg_central[20]), .B0(central[20]), .B1(n105), 
        .Y(n184) );
  AO22X1 U244 ( .A0(n139), .A1(reg_central[21]), .B0(central[21]), .B1(n105), 
        .Y(n185) );
  AO22X1 U245 ( .A0(n139), .A1(reg_central[22]), .B0(central[22]), .B1(n105), 
        .Y(n186) );
  AO22X1 U246 ( .A0(n139), .A1(reg_central[23]), .B0(central[23]), .B1(n109), 
        .Y(n187) );
  AO22X1 U247 ( .A0(n139), .A1(reg_radius[0]), .B0(radius[0]), .B1(n105), .Y(
        n190) );
  AO22X1 U248 ( .A0(n139), .A1(reg_radius[1]), .B0(radius[1]), .B1(n105), .Y(
        n191) );
  AO22X1 U249 ( .A0(n131), .A1(reg_radius[2]), .B0(radius[2]), .B1(n105), .Y(
        n192) );
  AO22X1 U250 ( .A0(n136), .A1(reg_radius[3]), .B0(radius[3]), .B1(n105), .Y(
        n193) );
  AO22X1 U251 ( .A0(n127), .A1(reg_radius[4]), .B0(radius[4]), .B1(n105), .Y(
        n194) );
  AO22X1 U252 ( .A0(n139), .A1(reg_radius[5]), .B0(radius[5]), .B1(n105), .Y(
        n195) );
  AO22X1 U253 ( .A0(n119), .A1(reg_radius[6]), .B0(radius[6]), .B1(n109), .Y(
        n196) );
  AO22X1 U254 ( .A0(n138), .A1(reg_radius[7]), .B0(radius[7]), .B1(n109), .Y(
        n197) );
  AO22X1 U255 ( .A0(n127), .A1(reg_radius[8]), .B0(radius[8]), .B1(n109), .Y(
        n198) );
  AO22X1 U256 ( .A0(n127), .A1(reg_radius[9]), .B0(radius[9]), .B1(n109), .Y(
        n199) );
  AO22X1 U257 ( .A0(n127), .A1(reg_radius[10]), .B0(radius[10]), .B1(n109), 
        .Y(n200) );
  AO22X1 U258 ( .A0(n127), .A1(reg_radius[11]), .B0(radius[11]), .B1(n109), 
        .Y(n202) );
  CLKBUFX3 U259 ( .A(en), .Y(n97) );
  OAI22XL U260 ( .A0(cur_state[2]), .A1(n128), .B0(tmp_res2), .B1(n35), .Y(
        n145) );
  AO22X1 U261 ( .A0(N49), .A1(n148), .B0(cntY[2]), .B1(n246), .Y(n221) );
  XNOR2X1 U262 ( .A(N286), .B(n260), .Y(N49) );
  OAI2BB2XL U263 ( .B0(n203), .B1(n150), .A0N(N45), .A1N(n150), .Y(n226) );
  XOR2X1 U264 ( .A(N281), .B(n257), .Y(N45) );
  NOR2BX1 U265 ( .AN(N280), .B(n258), .Y(n257) );
  OAI2BB2XL U266 ( .B0(n204), .B1(n150), .A0N(N44), .A1N(n150), .Y(n225) );
  XNOR2X1 U267 ( .A(N280), .B(n258), .Y(N44) );
  OAI2BB2XL U268 ( .B0(n206), .B1(n150), .A0N(n245), .A1N(n150), .Y(n223) );
  OAI2BB2XL U269 ( .B0(n205), .B1(n150), .A0N(N43), .A1N(n150), .Y(n224) );
  XNOR2X1 U270 ( .A(N279), .B(n245), .Y(N43) );
  XOR2X1 U271 ( .A(N287), .B(n259), .Y(N50) );
  NOR2BX1 U272 ( .AN(N286), .B(n260), .Y(n259) );
  AO22X1 U273 ( .A0(n247), .A1(n148), .B0(cntY[0]), .B1(n246), .Y(n219) );
  OAI32X4 U274 ( .A0(n126), .A1(cur_state[3]), .A2(cur_state[0]), .B0(n27), 
        .B1(n128), .Y(n80) );
  AOI222XL U275 ( .A0(reg_central[4]), .A1(n39), .B0(reg_central[20]), .B1(n80), .C0(reg_central[12]), .C1(n78), .Y(n120) );
  AOI222XL U276 ( .A0(n78), .A1(reg_radius[4]), .B0(n80), .B1(reg_radius[8]), 
        .C0(n39), .C1(reg_radius[0]), .Y(n125) );
  AOI222XL U277 ( .A0(n78), .A1(reg_radius[5]), .B0(n80), .B1(reg_radius[9]), 
        .C0(n39), .C1(reg_radius[1]), .Y(n124) );
  NAND2X1 U278 ( .A(r_sqr[0]), .B(r[3]), .Y(\mult_316/n10 ) );
  AND2X1 U279 ( .A(r[2]), .B(r_sqr[0]), .Y(\mult_316/n12 ) );
  AND2X1 U280 ( .A(r[1]), .B(r_sqr[0]), .Y(\mult_316/n13 ) );
  NAND2BX1 U281 ( .AN(r[1]), .B(r[2]), .Y(\mult_316/n7 ) );
  CLKINVX1 U282 ( .A(\mult_317/n1 ), .Y(x_sqr[7]) );
  NAND2X1 U283 ( .A(y_sqr[0]), .B(y[3]), .Y(\mult_318/n10 ) );
  NAND2BX1 U284 ( .AN(y[1]), .B(y[2]), .Y(\mult_318/n7 ) );
  CLKINVX1 U285 ( .A(\mult_318/n1 ), .Y(y_sqr[7]) );
  AND2X1 U286 ( .A(cntY[0]), .B(N283), .Y(N284) );
  AND2X1 U287 ( .A(n65), .B(N283), .Y(N285) );
  AND2X1 U288 ( .A(cntY[2]), .B(N283), .Y(N286) );
  AND2X1 U289 ( .A(N283), .B(cntY[3]), .Y(N287) );
  AND2X1 U290 ( .A(cntX[0]), .B(N277), .Y(N278) );
  AND2X1 U291 ( .A(cntX[2]), .B(N277), .Y(N280) );
  AND2X1 U292 ( .A(N277), .B(cntX[3]), .Y(N281) );
  NOR2BX1 U293 ( .AN(N92), .B(r_sqr[4]), .Y(n147) );
  NAND2BX1 U294 ( .AN(N90), .B(r_sqr[2]), .Y(n227) );
  NOR2BX1 U295 ( .AN(N90), .B(r_sqr[2]), .Y(n151) );
  OAI221XL U296 ( .A0(N91), .A1(n227), .B0(N91), .B1(n233), .C0(n201), .Y(n228) );
  OAI211X1 U297 ( .A0(r_sqr[6]), .A1(n235), .B0(n229), .C0(n228), .Y(n230) );
  OAI21XL U298 ( .A0(r_sqr[0]), .A1(n236), .B0(n237), .Y(n149) );
  PROC_DW01_inc_0 r454 ( .A({n261, n262, n263, n264, n265, n266, n267, n268}), 
        .SUM({N104, N103, N102, N101, N100, N99, N98, N97}) );
  XOR2X1 \r452/U9  ( .A(y_sqr[2]), .B(x_sqr[2]), .Y(N90) );
  XOR2XL \r452/U8  ( .A(y_sqr[0]), .B(x_sqr[0]), .Y(N88) );
  NAND3X1 \r452/U7  ( .A(\r452/n3 ), .B(\r452/n4 ), .C(\r452/n5 ), .Y(
        \r452/carry[6] ) );
  NAND2XL \r452/U6  ( .A(y_sqr[5]), .B(x_sqr[5]), .Y(\r452/n5 ) );
  NAND2X1 \r452/U5  ( .A(y_sqr[5]), .B(\r452/carry[5] ), .Y(\r452/n4 ) );
  NAND2X1 \r452/U4  ( .A(x_sqr[5]), .B(\r452/carry[5] ), .Y(\r452/n3 ) );
  XOR3X2 \r452/U3  ( .A(\r452/carry[5] ), .B(y_sqr[5]), .C(x_sqr[5]), .Y(N93)
         );
  AND2X2 \r452/U2  ( .A(y_sqr[0]), .B(x_sqr[0]), .Y(N89) );
  AND2X2 \r452/U1  ( .A(y_sqr[2]), .B(x_sqr[2]), .Y(\r452/n1 ) );
  XOR3X1 \r452/U1_7  ( .A(x_sqr[7]), .B(y_sqr[7]), .C(\r452/carry[7] ), .Y(N95) );
  CMPR32X2 \r452/U1_4  ( .A(x_sqr[4]), .B(y_sqr[4]), .C(\r452/carry[4] ), .CO(
        \r452/carry[5] ), .S(N92) );
  ADDFX2 \r452/U1_6  ( .A(x_sqr[6]), .B(y_sqr[6]), .CI(\r452/carry[6] ), .CO(
        \r452/carry[7] ), .S(N94) );
  ADDFXL \r452/U1_3  ( .A(x_sqr[3]), .B(y_sqr[3]), .CI(\r452/n1 ), .CO(
        \r452/carry[4] ), .S(N91) );
endmodule


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   _read_done, _proc_done;
  wire   [1:0] _reg_mode;
  wire   [3:0] _cur_state;

  CTRL CTRL ( .clk(clk), .rst(rst), .reg_mode(_reg_mode), .read_done(
        _read_done), .proc_done(_proc_done), .cur_state(_cur_state), .busy(
        busy), .valid(valid) );
  PROC PROC ( .clk(clk), .rst(rst), .en(en), .cur_state(_cur_state), .central(
        central), .radius(radius), .mode(mode), .reg_mode(_reg_mode), 
        .read_done(_read_done), .proc_done(_proc_done), .candidate(candidate)
         );
endmodule

