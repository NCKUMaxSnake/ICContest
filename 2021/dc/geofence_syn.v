/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Apr 13 18:04:40 2021
/////////////////////////////////////////////////////////////


module CTRL ( clk, reset, read_done, cross_done, hexarea_done, heptarea_done, 
        cur_state, valid );
  output [2:0] cur_state;
  input clk, reset, read_done, cross_done, hexarea_done, heptarea_done;
  output valid;
  wire   n11, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [2:0] next_state;

  DFFRX1 \cur_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n10), .Q(
        cur_state[2]), .QN(n2) );
  DFFRX2 \cur_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n10), .Q(
        cur_state[1]), .QN(n3) );
  DFFRX2 \cur_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n10), .Q(
        cur_state[0]), .QN(n4) );
  BUFX12 U3 ( .A(n11), .Y(valid) );
  NOR3X1 U4 ( .A(n2), .B(n4), .C(n3), .Y(n11) );
  OAI211XL U5 ( .A0(heptarea_done), .A1(n2), .B0(n4), .C0(cur_state[1]), .Y(n6) );
  OAI21XL U6 ( .A0(cur_state[1]), .A1(n4), .B0(n6), .Y(next_state[1]) );
  AOI31X1 U7 ( .A0(n7), .A1(n8), .A2(n9), .B0(cur_state[0]), .Y(next_state[0])
         );
  NAND3X1 U8 ( .A(n3), .B(n2), .C(read_done), .Y(n8) );
  OAI21XL U9 ( .A0(cur_state[1]), .A1(hexarea_done), .B0(cur_state[2]), .Y(n7)
         );
  NAND2X1 U10 ( .A(cross_done), .B(cur_state[1]), .Y(n9) );
  XOR2X1 U11 ( .A(n2), .B(n5), .Y(next_state[2]) );
  NAND2X1 U12 ( .A(cur_state[1]), .B(cur_state[0]), .Y(n5) );
  CLKINVX1 U13 ( .A(reset), .Y(n10) );
endmodule


module READ_DW_sqrt_0 ( a, root );
  input [19:0] a;
  output [9:0] root;
  wire   \PartRem[9][2] , \PartRem[8][3] , \PartRem[8][2] , \PartRem[7][4] ,
         \PartRem[7][3] , \PartRem[7][2] , \PartRem[6][5] , \PartRem[6][4] ,
         \PartRem[6][3] , \PartRem[6][2] , \PartRem[5][6] , \PartRem[5][5] ,
         \PartRem[5][4] , \PartRem[5][3] , \PartRem[5][2] , \PartRem[4][7] ,
         \PartRem[4][6] , \PartRem[4][5] , \PartRem[4][4] , \PartRem[4][3] ,
         \PartRem[4][2] , \PartRem[3][8] , \PartRem[3][7] , \PartRem[3][6] ,
         \PartRem[3][5] , \PartRem[3][4] , \PartRem[3][3] , \PartRem[3][2] ,
         \PartRem[2][9] , \PartRem[2][8] , \PartRem[2][7] , \PartRem[2][6] ,
         \PartRem[2][5] , \PartRem[2][4] , \PartRem[2][3] , \PartRem[2][2] ,
         \PartRoot[8][2] , \PartRoot[7][2] , \PartRoot[6][2] ,
         \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] ,
         \PartRoot[2][2] , \SumTmp[8][2] , \SumTmp[7][3] , \SumTmp[7][2] ,
         \SumTmp[6][4] , \SumTmp[6][3] , \SumTmp[6][2] , \SumTmp[5][5] ,
         \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] , \SumTmp[4][6] ,
         \SumTmp[4][5] , \SumTmp[4][4] , \SumTmp[4][3] , \SumTmp[4][2] ,
         \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , \SumTmp[3][4] ,
         \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][8] , \SumTmp[2][7] ,
         \SumTmp[2][6] , \SumTmp[2][5] , \SumTmp[2][4] , \SumTmp[2][3] ,
         \SumTmp[2][2] , \SumTmp[1][9] , \SumTmp[1][8] , \SumTmp[1][7] ,
         \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , \SumTmp[1][3] ,
         \SumTmp[1][2] , \CryTmp[8][3] , \CryTmp[8][2] , \CryTmp[7][4] ,
         \CryTmp[7][3] , \CryTmp[7][2] , \CryTmp[6][5] , \CryTmp[6][4] ,
         \CryTmp[6][3] , \CryTmp[6][2] , \CryTmp[5][6] , \CryTmp[5][5] ,
         \CryTmp[5][4] , \CryTmp[5][3] , \CryTmp[5][2] , \CryTmp[4][7] ,
         \CryTmp[4][6] , \CryTmp[4][5] , \CryTmp[4][4] , \CryTmp[4][3] ,
         \CryTmp[4][2] , \CryTmp[3][8] , \CryTmp[3][7] , \CryTmp[3][6] ,
         \CryTmp[3][5] , \CryTmp[3][4] , \CryTmp[3][3] , \CryTmp[3][2] ,
         \CryTmp[2][9] , \CryTmp[2][8] , \CryTmp[2][7] , \CryTmp[2][6] ,
         \CryTmp[2][5] , \CryTmp[2][4] , \CryTmp[2][3] , \CryTmp[2][2] ,
         \CryTmp[1][10] , \CryTmp[1][9] , \CryTmp[1][8] , \CryTmp[1][7] ,
         \CryTmp[1][6] , \CryTmp[1][5] , \CryTmp[1][4] , \CryTmp[1][3] ,
         \CryTmp[1][2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60;

  ADDFXL u_fa_PartRem_1_8 ( .A(\PartRem[2][8] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[1][8] ), .CO(\CryTmp[1][9] ), .S(\SumTmp[1][8] ) );
  ADDFXL u_fa_PartRem_2_7 ( .A(\PartRem[3][7] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[2][7] ), .CO(\CryTmp[2][8] ), .S(\SumTmp[2][7] ) );
  ADDFXL u_fa_PartRem_3_6 ( .A(\PartRem[4][6] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[3][6] ), .CO(\CryTmp[3][7] ), .S(\SumTmp[3][6] ) );
  ADDFXL u_fa_PartRem_4_5 ( .A(\PartRem[5][5] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[4][5] ), .CO(\CryTmp[4][6] ), .S(\SumTmp[4][5] ) );
  ADDFXL u_fa_PartRem_1_2 ( .A(\PartRem[2][2] ), .B(n5), .CI(\CryTmp[1][2] ), 
        .CO(\CryTmp[1][3] ), .S(\SumTmp[1][2] ) );
  ADDFXL u_fa_PartRem_6_2 ( .A(\PartRem[7][2] ), .B(n3), .CI(\CryTmp[6][2] ), 
        .CO(\CryTmp[6][3] ), .S(\SumTmp[6][2] ) );
  ADDFXL u_fa_PartRem_1_5 ( .A(\PartRem[2][5] ), .B(n8), .CI(\CryTmp[1][5] ), 
        .CO(\CryTmp[1][6] ), .S(\SumTmp[1][5] ) );
  ADDFXL u_fa_PartRem_2_4 ( .A(\PartRem[3][4] ), .B(n8), .CI(\CryTmp[2][4] ), 
        .CO(\CryTmp[2][5] ), .S(\SumTmp[2][4] ) );
  ADDFXL u_fa_PartRem_1_6 ( .A(\PartRem[2][6] ), .B(n9), .CI(\CryTmp[1][6] ), 
        .CO(\CryTmp[1][7] ), .S(\SumTmp[1][6] ) );
  ADDFXL u_fa_PartRem_2_5 ( .A(\PartRem[3][5] ), .B(n9), .CI(\CryTmp[2][5] ), 
        .CO(\CryTmp[2][6] ), .S(\SumTmp[2][5] ) );
  ADDFXL u_fa_PartRem_3_4 ( .A(\PartRem[4][4] ), .B(n9), .CI(\CryTmp[3][4] ), 
        .CO(\CryTmp[3][5] ), .S(\SumTmp[3][4] ) );
  ADDFXL u_fa_PartRem_3_2 ( .A(\PartRem[4][2] ), .B(n7), .CI(\CryTmp[3][2] ), 
        .CO(\CryTmp[3][3] ), .S(\SumTmp[3][2] ) );
  ADDFXL u_fa_PartRem_5_2 ( .A(\PartRem[6][2] ), .B(n9), .CI(\CryTmp[5][2] ), 
        .CO(\CryTmp[5][3] ), .S(\SumTmp[5][2] ) );
  ADDFXL u_fa_PartRem_7_2 ( .A(\PartRem[8][2] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[7][2] ), .CO(\CryTmp[7][3] ), .S(\SumTmp[7][2] ) );
  ADDFXL u_fa_PartRem_5_5 ( .A(\PartRem[6][5] ), .B(n4), .CI(\CryTmp[5][5] ), 
        .CO(\CryTmp[5][6] ), .S(\SumTmp[5][5] ) );
  ADDFXL u_fa_PartRem_6_4 ( .A(\PartRem[7][4] ), .B(n4), .CI(\CryTmp[6][4] ), 
        .CO(\CryTmp[6][5] ), .S(\SumTmp[6][4] ) );
  ADDFXL u_fa_PartRem_2_8 ( .A(\PartRem[3][8] ), .B(n4), .CI(\CryTmp[2][8] ), 
        .CO(\CryTmp[2][9] ), .S(\SumTmp[2][8] ) );
  ADDFXL u_fa_PartRem_3_7 ( .A(\PartRem[4][7] ), .B(n4), .CI(\CryTmp[3][7] ), 
        .CO(\CryTmp[3][8] ), .S(\SumTmp[3][7] ) );
  ADDFXL u_fa_PartRem_4_6 ( .A(\PartRem[5][6] ), .B(n4), .CI(\CryTmp[4][6] ), 
        .CO(\CryTmp[4][7] ), .S(\SumTmp[4][6] ) );
  ADDFXL u_fa_PartRem_1_9 ( .A(\PartRem[2][9] ), .B(n4), .CI(\CryTmp[1][9] ), 
        .CO(\CryTmp[1][10] ), .S(\SumTmp[1][9] ) );
  ADDFXL u_fa_PartRem_8_2 ( .A(\PartRem[9][2] ), .B(n4), .CI(\CryTmp[8][2] ), 
        .CO(\CryTmp[8][3] ), .S(\SumTmp[8][2] ) );
  ADDFXL u_fa_PartRem_6_3 ( .A(\PartRem[7][3] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[6][3] ), .CO(\CryTmp[6][4] ), .S(\SumTmp[6][3] ) );
  ADDFXL u_fa_PartRem_4_3 ( .A(\PartRem[5][3] ), .B(n9), .CI(\CryTmp[4][3] ), 
        .CO(\CryTmp[4][4] ), .S(\SumTmp[4][3] ) );
  ADDFHX2 u_fa_PartRem_1_3 ( .A(\PartRem[2][3] ), .B(n6), .CI(\CryTmp[1][3] ), 
        .CO(\CryTmp[1][4] ), .S(\SumTmp[1][3] ) );
  ADDFX2 u_fa_PartRem_2_6 ( .A(\PartRem[3][6] ), .B(n3), .CI(\CryTmp[2][6] ), 
        .CO(\CryTmp[2][7] ), .S(\SumTmp[2][6] ) );
  ADDFX2 u_fa_PartRem_1_7 ( .A(\PartRem[2][7] ), .B(n3), .CI(\CryTmp[1][7] ), 
        .CO(\CryTmp[1][8] ), .S(\SumTmp[1][7] ) );
  ADDFX2 u_fa_PartRem_3_5 ( .A(\PartRem[4][5] ), .B(n3), .CI(\CryTmp[3][5] ), 
        .CO(\CryTmp[3][6] ), .S(\SumTmp[3][5] ) );
  ADDFX2 u_fa_PartRem_7_3 ( .A(\PartRem[8][3] ), .B(n4), .CI(\CryTmp[7][3] ), 
        .CO(\CryTmp[7][4] ), .S(\SumTmp[7][3] ) );
  ADDFXL u_fa_PartRem_5_4 ( .A(\PartRem[6][4] ), .B(\PartRoot[8][2] ), .CI(
        \CryTmp[5][4] ), .CO(\CryTmp[5][5] ), .S(\SumTmp[5][4] ) );
  ADDFXL u_fa_PartRem_3_3 ( .A(\PartRem[4][3] ), .B(n8), .CI(\CryTmp[3][3] ), 
        .CO(\CryTmp[3][4] ), .S(\SumTmp[3][3] ) );
  ADDFXL u_fa_PartRem_4_2 ( .A(\PartRem[5][2] ), .B(n8), .CI(\CryTmp[4][2] ), 
        .CO(\CryTmp[4][3] ), .S(\SumTmp[4][2] ) );
  ADDFX2 u_fa_PartRem_1_4 ( .A(\PartRem[2][4] ), .B(n7), .CI(\CryTmp[1][4] ), 
        .CO(\CryTmp[1][5] ), .S(\SumTmp[1][4] ) );
  ADDFX2 u_fa_PartRem_2_3 ( .A(\PartRem[3][3] ), .B(n7), .CI(\CryTmp[2][3] ), 
        .CO(\CryTmp[2][4] ), .S(\SumTmp[2][3] ) );
  ADDFX2 u_fa_PartRem_4_4 ( .A(\PartRem[5][4] ), .B(n3), .CI(\CryTmp[4][4] ), 
        .CO(\CryTmp[4][5] ), .S(\SumTmp[4][4] ) );
  ADDFXL u_fa_PartRem_5_3 ( .A(\PartRem[6][3] ), .B(n3), .CI(\CryTmp[5][3] ), 
        .CO(\CryTmp[5][4] ), .S(\SumTmp[5][3] ) );
  ADDFX2 u_fa_PartRem_2_2 ( .A(\PartRem[3][2] ), .B(n6), .CI(\CryTmp[2][2] ), 
        .CO(\CryTmp[2][3] ), .S(\SumTmp[2][2] ) );
  OAI21XL U3 ( .A0(\CryTmp[3][2] ), .A1(n6), .B0(n50), .Y(\PartRem[3][3] ) );
  MX2XL U4 ( .A(\SumTmp[3][3] ), .B(\PartRem[4][3] ), .S0(n6), .Y(
        \PartRem[3][5] ) );
  BUFX4 U5 ( .A(\PartRoot[3][2] ), .Y(n6) );
  OA21X4 U6 ( .A0(\CryTmp[1][2] ), .A1(n41), .B0(n46), .Y(n42) );
  MXI2X2 U7 ( .A(n45), .B(n41), .S0(a[2]), .Y(n43) );
  INVX2 U8 ( .A(n41), .Y(root[1]) );
  OAI21X4 U9 ( .A0(n41), .A1(a[2]), .B0(a[3]), .Y(n46) );
  NOR2BX4 U10 ( .AN(n47), .B(\CryTmp[1][10] ), .Y(n41) );
  MX2X1 U11 ( .A(\SumTmp[4][3] ), .B(\PartRem[5][3] ), .S0(n7), .Y(
        \PartRem[4][5] ) );
  BUFX12 U12 ( .A(\PartRoot[6][2] ), .Y(n9) );
  OAI21X2 U13 ( .A0(\CryTmp[7][2] ), .A1(n3), .B0(n55), .Y(\PartRem[7][3] ) );
  OAI21X1 U14 ( .A0(n3), .A1(a[14]), .B0(a[15]), .Y(n55) );
  CLKINVX3 U15 ( .A(n1), .Y(n2) );
  CLKINVX6 U16 ( .A(n1), .Y(n3) );
  NAND2X2 U17 ( .A(n18), .B(root[9]), .Y(n22) );
  XNOR2X1 U18 ( .A(n5), .B(a[4]), .Y(\PartRem[2][2] ) );
  AND2X2 U19 ( .A(n39), .B(n38), .Y(n40) );
  OAI21XL U20 ( .A0(\CryTmp[5][2] ), .A1(n8), .B0(n48), .Y(\PartRem[5][3] ) );
  CLKINVX1 U21 ( .A(\PartRoot[7][2] ), .Y(n1) );
  NOR2BX1 U22 ( .AN(n59), .B(\CryTmp[7][4] ), .Y(\PartRoot[7][2] ) );
  NOR2BX1 U23 ( .AN(n58), .B(\CryTmp[6][5] ), .Y(\PartRoot[6][2] ) );
  NOR2BX1 U24 ( .AN(n53), .B(\CryTmp[3][8] ), .Y(\PartRoot[3][2] ) );
  OAI21XL U25 ( .A0(root[9]), .A1(n18), .B0(n19), .Y(root[0]) );
  OAI21X2 U26 ( .A0(n26), .A1(n27), .B0(n28), .Y(n23) );
  OAI22X2 U27 ( .A0(n38), .A1(n39), .B0(root[3]), .B1(n40), .Y(n35) );
  NOR2X6 U28 ( .A(a[19]), .B(a[18]), .Y(n4) );
  CLKBUFX3 U29 ( .A(\PartRoot[4][2] ), .Y(n7) );
  CLKBUFX3 U30 ( .A(\PartRoot[5][2] ), .Y(n8) );
  CLKINVX1 U31 ( .A(n8), .Y(root[5]) );
  MXI2X1 U32 ( .A(\PartRem[2][2] ), .B(\SumTmp[1][2] ), .S0(root[1]), .Y(n39)
         );
  BUFX12 U33 ( .A(\PartRoot[2][2] ), .Y(n5) );
  AOI21X4 U34 ( .A0(a[19]), .A1(a[18]), .B0(\CryTmp[8][3] ), .Y(
        \PartRoot[8][2] ) );
  AOI2BB2X1 U35 ( .B0(n7), .B1(n35), .A0N(n36), .A1N(n37), .Y(n32) );
  NOR2X1 U36 ( .A(n7), .B(n35), .Y(n36) );
  NOR2BX2 U37 ( .AN(n52), .B(\CryTmp[2][9] ), .Y(\PartRoot[2][2] ) );
  NOR2BX2 U38 ( .AN(n54), .B(\CryTmp[4][7] ), .Y(\PartRoot[4][2] ) );
  MX2XL U39 ( .A(\SumTmp[3][2] ), .B(\PartRem[4][2] ), .S0(n6), .Y(
        \PartRem[3][4] ) );
  MX2XL U40 ( .A(\SumTmp[5][3] ), .B(\PartRem[6][3] ), .S0(n8), .Y(
        \PartRem[5][5] ) );
  MX2XL U41 ( .A(\SumTmp[4][2] ), .B(\PartRem[5][2] ), .S0(n7), .Y(
        \PartRem[4][4] ) );
  MX2XL U42 ( .A(\SumTmp[2][2] ), .B(\PartRem[3][2] ), .S0(n5), .Y(
        \PartRem[2][4] ) );
  MX2XL U43 ( .A(\SumTmp[2][3] ), .B(\PartRem[3][3] ), .S0(n5), .Y(
        \PartRem[2][5] ) );
  MX2XL U44 ( .A(\SumTmp[5][2] ), .B(\PartRem[6][2] ), .S0(n8), .Y(
        \PartRem[5][4] ) );
  MX2XL U45 ( .A(\SumTmp[3][5] ), .B(\PartRem[4][5] ), .S0(n6), .Y(
        \PartRem[3][7] ) );
  MX2XL U46 ( .A(\SumTmp[4][4] ), .B(\PartRem[5][4] ), .S0(n7), .Y(
        \PartRem[4][6] ) );
  MX2XL U47 ( .A(\SumTmp[2][6] ), .B(\PartRem[3][6] ), .S0(n5), .Y(
        \PartRem[2][8] ) );
  AND2XL U48 ( .A(n32), .B(root[5]), .Y(n33) );
  MX2XL U49 ( .A(\SumTmp[6][3] ), .B(\PartRem[7][3] ), .S0(n9), .Y(
        \PartRem[6][5] ) );
  MX2XL U50 ( .A(\SumTmp[4][5] ), .B(\PartRem[5][5] ), .S0(n7), .Y(
        \PartRem[4][7] ) );
  MX2XL U51 ( .A(\SumTmp[5][4] ), .B(\PartRem[6][4] ), .S0(n8), .Y(
        \PartRem[5][6] ) );
  MX2XL U52 ( .A(\SumTmp[3][6] ), .B(\PartRem[4][6] ), .S0(n6), .Y(
        \PartRem[3][8] ) );
  MX2XL U53 ( .A(\SumTmp[2][7] ), .B(\PartRem[3][7] ), .S0(n5), .Y(
        \PartRem[2][9] ) );
  MXI2XL U54 ( .A(\PartRem[2][3] ), .B(\SumTmp[1][3] ), .S0(root[1]), .Y(n37)
         );
  CLKINVX1 U55 ( .A(n6), .Y(root[3]) );
  MXI2X1 U56 ( .A(\SumTmp[2][8] ), .B(\PartRem[3][8] ), .S0(n5), .Y(n47) );
  CLKINVX1 U57 ( .A(n3), .Y(root[7]) );
  NOR2BX1 U58 ( .AN(n56), .B(\CryTmp[5][6] ), .Y(\PartRoot[5][2] ) );
  CLKINVX1 U59 ( .A(n9), .Y(root[6]) );
  CLKINVX1 U60 ( .A(n7), .Y(root[4]) );
  CLKINVX1 U61 ( .A(\PartRoot[8][2] ), .Y(root[8]) );
  CLKINVX1 U62 ( .A(n4), .Y(root[9]) );
  MXI2X1 U63 ( .A(n20), .B(n21), .S0(root[1]), .Y(n19) );
  AO21X1 U64 ( .A0(\SumTmp[1][8] ), .A1(n22), .B0(\SumTmp[1][9] ), .Y(n21) );
  AO21X1 U65 ( .A0(n22), .A1(\PartRem[2][8] ), .B0(\PartRem[2][9] ), .Y(n20)
         );
  AOI2BB2X1 U66 ( .B0(\PartRoot[8][2] ), .B1(n23), .A0N(n24), .A1N(n25), .Y(
        n18) );
  MXI2X1 U67 ( .A(\PartRem[2][7] ), .B(\SumTmp[1][7] ), .S0(root[1]), .Y(n25)
         );
  NOR2X1 U68 ( .A(\PartRoot[8][2] ), .B(n23), .Y(n24) );
  OAI2BB1X1 U69 ( .A0N(n27), .A1N(n26), .B0(n3), .Y(n28) );
  MXI2X1 U70 ( .A(\PartRem[2][6] ), .B(\SumTmp[1][6] ), .S0(root[1]), .Y(n27)
         );
  OA21XL U71 ( .A0(n29), .A1(n30), .B0(n31), .Y(n26) );
  OAI2BB1X1 U72 ( .A0N(n30), .A1N(n29), .B0(n9), .Y(n31) );
  MXI2X1 U73 ( .A(\PartRem[2][5] ), .B(\SumTmp[1][5] ), .S0(root[1]), .Y(n30)
         );
  OA22X1 U74 ( .A0(root[5]), .A1(n32), .B0(n33), .B1(n34), .Y(n29) );
  MXI2X1 U75 ( .A(\PartRem[2][4] ), .B(\SumTmp[1][4] ), .S0(root[1]), .Y(n34)
         );
  OA21XL U76 ( .A0(n42), .A1(n43), .B0(n44), .Y(n38) );
  OAI2BB1X1 U77 ( .A0N(n43), .A1N(n42), .B0(n5), .Y(n44) );
  OR2X1 U78 ( .A(a[0]), .B(a[1]), .Y(n45) );
  CLKINVX1 U79 ( .A(n5), .Y(root[2]) );
  XNOR2X1 U80 ( .A(n9), .B(a[12]), .Y(\PartRem[6][2] ) );
  OAI21XL U81 ( .A0(n8), .A1(a[10]), .B0(a[11]), .Y(n48) );
  CLKMX2X2 U82 ( .A(\SumTmp[3][4] ), .B(\PartRem[4][4] ), .S0(n6), .Y(
        \PartRem[3][6] ) );
  XNOR2X1 U83 ( .A(n8), .B(a[10]), .Y(\PartRem[5][2] ) );
  CLKMX2X2 U84 ( .A(\SumTmp[2][5] ), .B(\PartRem[3][5] ), .S0(n5), .Y(
        \PartRem[2][7] ) );
  OAI21XL U85 ( .A0(\CryTmp[4][2] ), .A1(n7), .B0(n49), .Y(\PartRem[4][3] ) );
  OAI21XL U86 ( .A0(n7), .A1(a[8]), .B0(a[9]), .Y(n49) );
  CLKMX2X2 U87 ( .A(\SumTmp[2][4] ), .B(\PartRem[3][4] ), .S0(n5), .Y(
        \PartRem[2][6] ) );
  XNOR2X1 U88 ( .A(n7), .B(a[8]), .Y(\PartRem[4][2] ) );
  OAI21XL U89 ( .A0(n6), .A1(a[6]), .B0(a[7]), .Y(n50) );
  XNOR2X1 U90 ( .A(n6), .B(a[6]), .Y(\PartRem[3][2] ) );
  OAI21XL U91 ( .A0(\CryTmp[2][2] ), .A1(n5), .B0(n51), .Y(\PartRem[2][3] ) );
  OAI21XL U92 ( .A0(n5), .A1(a[4]), .B0(a[5]), .Y(n51) );
  MXI2X1 U93 ( .A(\PartRem[4][7] ), .B(\SumTmp[3][7] ), .S0(root[3]), .Y(n52)
         );
  MXI2X1 U94 ( .A(\PartRem[5][6] ), .B(\SumTmp[4][6] ), .S0(root[4]), .Y(n53)
         );
  CLKMX2X2 U95 ( .A(\SumTmp[6][2] ), .B(\PartRem[7][2] ), .S0(n9), .Y(
        \PartRem[6][4] ) );
  XNOR2X1 U96 ( .A(n2), .B(a[14]), .Y(\PartRem[7][2] ) );
  MXI2X1 U97 ( .A(\PartRem[6][5] ), .B(\SumTmp[5][5] ), .S0(root[5]), .Y(n54)
         );
  MXI2X1 U98 ( .A(\PartRem[7][4] ), .B(\SumTmp[6][4] ), .S0(root[6]), .Y(n56)
         );
  CLKMX2X2 U99 ( .A(\SumTmp[7][2] ), .B(\PartRem[8][2] ), .S0(n3), .Y(
        \PartRem[7][4] ) );
  XNOR2X1 U100 ( .A(\PartRoot[8][2] ), .B(a[16]), .Y(\PartRem[8][2] ) );
  OAI21XL U101 ( .A0(\CryTmp[6][2] ), .A1(n9), .B0(n57), .Y(\PartRem[6][3] )
         );
  OAI21XL U102 ( .A0(n9), .A1(a[12]), .B0(a[13]), .Y(n57) );
  MXI2X1 U103 ( .A(\PartRem[8][3] ), .B(\SumTmp[7][3] ), .S0(root[7]), .Y(n58)
         );
  MXI2X1 U104 ( .A(\PartRem[9][2] ), .B(\SumTmp[8][2] ), .S0(root[8]), .Y(n59)
         );
  NOR2X1 U105 ( .A(n4), .B(a[18]), .Y(\PartRem[9][2] ) );
  OAI21XL U106 ( .A0(\CryTmp[8][2] ), .A1(\PartRoot[8][2] ), .B0(n60), .Y(
        \PartRem[8][3] ) );
  OAI21XL U107 ( .A0(\PartRoot[8][2] ), .A1(a[16]), .B0(a[17]), .Y(n60) );
  OR2X1 U108 ( .A(a[17]), .B(a[16]), .Y(\CryTmp[8][2] ) );
  OR2X1 U109 ( .A(a[15]), .B(a[14]), .Y(\CryTmp[7][2] ) );
  OR2X1 U110 ( .A(a[13]), .B(a[12]), .Y(\CryTmp[6][2] ) );
  OR2X1 U111 ( .A(a[11]), .B(a[10]), .Y(\CryTmp[5][2] ) );
  OR2X1 U112 ( .A(a[9]), .B(a[8]), .Y(\CryTmp[4][2] ) );
  OR2X1 U113 ( .A(a[7]), .B(a[6]), .Y(\CryTmp[3][2] ) );
  OR2X1 U114 ( .A(a[5]), .B(a[4]), .Y(\CryTmp[2][2] ) );
  OR2X1 U115 ( .A(a[3]), .B(a[2]), .Y(\CryTmp[1][2] ) );
endmodule


module READ_DW_cmp_0 ( A, B, TC, GE_LT, GE_GT_EQ, GE_LT_GT_LE, EQ_NE );
  input [19:0] A;
  input [19:0] B;
  input TC, GE_LT, GE_GT_EQ;
  output GE_LT_GT_LE, EQ_NE;
  wire   n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179;

  OR2X1 U55 ( .A(n140), .B(B[19]), .Y(n119) );
  AOI2BB1XL U56 ( .A0N(n139), .A1N(A[1]), .B0(B[0]), .Y(n170) );
  NOR2BXL U57 ( .AN(B[2]), .B(A[2]), .Y(n169) );
  NAND2BXL U58 ( .AN(B[2]), .B(A[2]), .Y(n168) );
  NAND2BXL U59 ( .AN(B[7]), .B(A[7]), .Y(n172) );
  NOR2BXL U60 ( .AN(B[7]), .B(A[7]), .Y(n157) );
  INVX12 U61 ( .A(n120), .Y(GE_LT_GT_LE) );
  NOR2X1 U62 ( .A(n141), .B(n119), .Y(n121) );
  NOR2XL U63 ( .A(n142), .B(n143), .Y(n122) );
  NOR2X1 U64 ( .A(n121), .B(n122), .Y(n120) );
  CLKINVX1 U65 ( .A(n168), .Y(n130) );
  CLKINVX1 U66 ( .A(B[15]), .Y(n134) );
  CLKINVX1 U67 ( .A(A[5]), .Y(n128) );
  CLKINVX1 U68 ( .A(A[12]), .Y(n125) );
  CLKINVX1 U69 ( .A(A[8]), .Y(n127) );
  CLKINVX1 U70 ( .A(B[4]), .Y(n138) );
  CLKINVX1 U71 ( .A(B[1]), .Y(n139) );
  CLKINVX1 U72 ( .A(B[6]), .Y(n137) );
  CLKINVX1 U73 ( .A(B[13]), .Y(n135) );
  CLKINVX1 U74 ( .A(B[9]), .Y(n136) );
  CLKINVX1 U75 ( .A(A[3]), .Y(n129) );
  CLKINVX1 U76 ( .A(A[14]), .Y(n124) );
  CLKINVX1 U77 ( .A(A[10]), .Y(n126) );
  CLKINVX1 U78 ( .A(B[16]), .Y(n133) );
  CLKINVX1 U79 ( .A(B[18]), .Y(n132) );
  CLKINVX1 U80 ( .A(A[17]), .Y(n123) );
  CLKINVX1 U81 ( .A(B[19]), .Y(n131) );
  OAI22XL U82 ( .A0(A[18]), .A1(n132), .B0(A[18]), .B1(n144), .Y(n143) );
  OAI21XL U83 ( .A0(n132), .A1(n144), .B0(n131), .Y(n142) );
  OAI222XL U84 ( .A0(B[17]), .A1(n123), .B0(B[17]), .B1(n145), .C0(n123), .C1(
        n145), .Y(n144) );
  NAND2X1 U85 ( .A(A[16]), .B(n133), .Y(n145) );
  OA22X1 U86 ( .A0(n146), .A1(B[17]), .B0(n146), .B1(n123), .Y(n141) );
  NOR2X1 U87 ( .A(n133), .B(A[16]), .Y(n146) );
  OAI2BB2XL U88 ( .B0(A[18]), .B1(n132), .A0N(n147), .A1N(n148), .Y(n140) );
  OAI211X1 U89 ( .A0(A[15]), .A1(n134), .B0(n149), .C0(n150), .Y(n148) );
  OAI221XL U90 ( .A0(B[10]), .A1(n151), .B0(B[10]), .B1(n126), .C0(n152), .Y(
        n150) );
  AOI2BB2X1 U91 ( .B0(n153), .B1(n154), .A0N(n151), .A1N(n126), .Y(n152) );
  OAI22XL U92 ( .A0(n126), .A1(n155), .B0(B[10]), .B1(n155), .Y(n154) );
  OAI21XL U93 ( .A0(A[9]), .A1(n136), .B0(n156), .Y(n155) );
  OAI22XL U94 ( .A0(n157), .A1(n127), .B0(B[8]), .B1(n157), .Y(n156) );
  OAI21XL U95 ( .A0(n158), .A1(n159), .B0(n160), .Y(n153) );
  OAI222XL U96 ( .A0(A[6]), .A1(n161), .B0(n137), .B1(n161), .C0(A[6]), .C1(
        n137), .Y(n160) );
  OAI222XL U97 ( .A0(B[5]), .A1(n128), .B0(B[5]), .B1(n162), .C0(n128), .C1(
        n162), .Y(n161) );
  NAND2X1 U98 ( .A(A[4]), .B(n138), .Y(n162) );
  OAI21XL U99 ( .A0(A[6]), .A1(n137), .B0(n163), .Y(n159) );
  OAI22XL U100 ( .A0(n164), .A1(n128), .B0(B[5]), .B1(n164), .Y(n163) );
  NOR2X1 U101 ( .A(n138), .B(A[4]), .Y(n164) );
  AOI221XL U102 ( .A0(A[3]), .A1(n130), .B0(n165), .B1(n166), .C0(n167), .Y(
        n158) );
  OAI22XL U103 ( .A0(B[3]), .A1(n129), .B0(B[3]), .B1(n168), .Y(n167) );
  OAI22XL U104 ( .A0(n169), .A1(n129), .B0(B[3]), .B1(n169), .Y(n166) );
  AO22X1 U105 ( .A0(n170), .A1(A[0]), .B0(A[1]), .B1(n139), .Y(n165) );
  OAI222XL U106 ( .A0(A[9]), .A1(n171), .B0(n171), .B1(n136), .C0(A[9]), .C1(
        n136), .Y(n151) );
  OAI222XL U107 ( .A0(B[8]), .A1(n127), .B0(B[8]), .B1(n172), .C0(n172), .C1(
        n127), .Y(n171) );
  OAI22XL U108 ( .A0(n173), .A1(n124), .B0(B[14]), .B1(n173), .Y(n149) );
  OAI21XL U109 ( .A0(A[13]), .A1(n135), .B0(n174), .Y(n173) );
  OAI22XL U110 ( .A0(n175), .A1(n125), .B0(B[12]), .B1(n175), .Y(n174) );
  NOR2BX1 U111 ( .AN(B[11]), .B(A[11]), .Y(n175) );
  OAI222XL U112 ( .A0(A[15]), .A1(n176), .B0(n134), .B1(n176), .C0(A[15]), 
        .C1(n134), .Y(n147) );
  OAI222XL U113 ( .A0(B[14]), .A1(n124), .B0(B[14]), .B1(n177), .C0(n124), 
        .C1(n177), .Y(n176) );
  OAI222XL U114 ( .A0(A[13]), .A1(n178), .B0(n135), .B1(n178), .C0(A[13]), 
        .C1(n135), .Y(n177) );
  OAI222XL U115 ( .A0(B[12]), .A1(n125), .B0(B[12]), .B1(n179), .C0(n125), 
        .C1(n179), .Y(n178) );
  NAND2BX1 U116 ( .AN(B[11]), .B(A[11]), .Y(n179) );
endmodule


module READ_DW_sqrt_1 ( a, root );
  input [23:0] a;
  output [11:0] root;
  wire   n106, n107, n108, \PartRem[11][2] , \PartRem[10][3] ,
         \PartRem[10][2] , \PartRem[9][4] , \PartRem[9][3] , \PartRem[9][2] ,
         \PartRem[8][5] , \PartRem[8][4] , \PartRem[8][3] , \PartRem[8][2] ,
         \PartRem[7][6] , \PartRem[7][5] , \PartRem[7][4] , \PartRem[7][3] ,
         \PartRem[7][2] , \PartRem[6][7] , \PartRem[6][6] , \PartRem[6][5] ,
         \PartRem[6][4] , \PartRem[6][3] , \PartRem[6][2] , \PartRem[5][8] ,
         \PartRem[5][7] , \PartRem[5][6] , \PartRem[5][5] , \PartRem[5][4] ,
         \PartRem[5][3] , \PartRem[5][2] , \PartRem[4][9] , \PartRem[4][8] ,
         \PartRem[4][7] , \PartRem[4][6] , \PartRem[4][5] , \PartRem[4][4] ,
         \PartRem[4][3] , \PartRem[4][2] , \PartRem[3][10] , \PartRem[3][9] ,
         \PartRem[3][8] , \PartRem[3][7] , \PartRem[3][6] , \PartRem[3][5] ,
         \PartRem[3][4] , \PartRem[3][3] , \PartRem[3][2] , \PartRem[2][11] ,
         \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] , \PartRem[2][7] ,
         \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , \PartRem[2][3] ,
         \PartRem[2][2] , \PartRoot[9][4] , \SumTmp[10][2] , \SumTmp[9][3] ,
         \SumTmp[9][2] , \SumTmp[8][4] , \SumTmp[8][3] , \SumTmp[8][2] ,
         \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] ,
         \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] , \SumTmp[6][3] ,
         \SumTmp[6][2] , \SumTmp[5][7] , \SumTmp[5][6] , \SumTmp[5][5] ,
         \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] , \SumTmp[4][8] ,
         \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] ,
         \SumTmp[4][3] , \SumTmp[4][2] , \SumTmp[3][9] , \SumTmp[3][8] ,
         \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , \SumTmp[3][4] ,
         \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][10] , \SumTmp[2][9] ,
         \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , \SumTmp[2][5] ,
         \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] , \SumTmp[1][11] ,
         \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , \SumTmp[1][7] ,
         \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , \SumTmp[1][3] ,
         \SumTmp[1][2] , \CryTmp[10][3] , \CryTmp[10][2] , \CryTmp[9][4] ,
         \CryTmp[9][3] , \CryTmp[9][2] , \CryTmp[8][5] , \CryTmp[8][4] ,
         \CryTmp[8][3] , \CryTmp[8][2] , \CryTmp[7][6] , \CryTmp[7][5] ,
         \CryTmp[7][4] , \CryTmp[7][3] , \CryTmp[7][2] , \CryTmp[6][7] ,
         \CryTmp[6][6] , \CryTmp[6][5] , \CryTmp[6][4] , \CryTmp[6][3] ,
         \CryTmp[6][2] , \CryTmp[5][8] , \CryTmp[5][7] , \CryTmp[5][6] ,
         \CryTmp[5][5] , \CryTmp[5][4] , \CryTmp[5][3] , \CryTmp[5][2] ,
         \CryTmp[4][9] , \CryTmp[4][8] , \CryTmp[4][7] , \CryTmp[4][6] ,
         \CryTmp[4][5] , \CryTmp[4][4] , \CryTmp[4][3] , \CryTmp[4][2] ,
         \CryTmp[3][10] , \CryTmp[3][9] , \CryTmp[3][8] , \CryTmp[3][7] ,
         \CryTmp[3][6] , \CryTmp[3][5] , \CryTmp[3][4] , \CryTmp[3][3] ,
         \CryTmp[3][2] , \CryTmp[2][11] , \CryTmp[2][10] , \CryTmp[2][9] ,
         \CryTmp[2][8] , \CryTmp[2][7] , \CryTmp[2][6] , \CryTmp[2][5] ,
         \CryTmp[2][4] , \CryTmp[2][3] , \CryTmp[2][2] , \CryTmp[1][12] ,
         \CryTmp[1][11] , \CryTmp[1][10] , \CryTmp[1][9] , \CryTmp[1][8] ,
         \CryTmp[1][7] , \CryTmp[1][6] , \CryTmp[1][5] , \CryTmp[1][4] ,
         \CryTmp[1][3] , \CryTmp[1][2] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n28, n30, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105;

  ADDFXL u_fa_PartRem_5_3 ( .A(\PartRem[6][3] ), .B(n28), .CI(\CryTmp[5][3] ), 
        .CO(\CryTmp[5][4] ), .S(\SumTmp[5][3] ) );
  ADDFXL u_fa_PartRem_1_10 ( .A(\PartRem[2][10] ), .B(n59), .CI(
        \CryTmp[1][10] ), .CO(\CryTmp[1][11] ), .S(\SumTmp[1][10] ) );
  ADDFXL u_fa_PartRem_4_7 ( .A(\PartRem[5][7] ), .B(n59), .CI(\CryTmp[4][7] ), 
        .CO(\CryTmp[4][8] ), .S(\SumTmp[4][7] ) );
  ADDFXL u_fa_PartRem_5_5 ( .A(\PartRem[6][5] ), .B(n58), .CI(\CryTmp[5][5] ), 
        .CO(\CryTmp[5][6] ), .S(\SumTmp[5][5] ) );
  ADDFXL u_fa_PartRem_3_7 ( .A(\PartRem[4][7] ), .B(n58), .CI(\CryTmp[3][7] ), 
        .CO(\CryTmp[3][8] ), .S(\SumTmp[3][7] ) );
  ADDFXL u_fa_PartRem_2_8 ( .A(\PartRem[3][8] ), .B(n58), .CI(\CryTmp[2][8] ), 
        .CO(\CryTmp[2][9] ), .S(\SumTmp[2][8] ) );
  ADDFXL u_fa_PartRem_1_9 ( .A(\PartRem[2][9] ), .B(n58), .CI(\CryTmp[1][9] ), 
        .CO(\CryTmp[1][10] ), .S(\SumTmp[1][9] ) );
  ADDFXL u_fa_PartRem_4_6 ( .A(\PartRem[5][6] ), .B(n58), .CI(\CryTmp[4][6] ), 
        .CO(\CryTmp[4][7] ), .S(\SumTmp[4][6] ) );
  ADDFHX2 u_fa_PartRem_6_5 ( .A(\PartRem[7][5] ), .B(n59), .CI(\CryTmp[6][5] ), 
        .CO(\CryTmp[6][6] ), .S(\SumTmp[6][5] ) );
  ADDFHX2 u_fa_PartRem_7_4 ( .A(\PartRem[8][4] ), .B(n59), .CI(\CryTmp[7][4] ), 
        .CO(\CryTmp[7][5] ), .S(\SumTmp[7][4] ) );
  ADDFHX2 u_fa_PartRem_1_5 ( .A(\PartRem[2][5] ), .B(n56), .CI(\CryTmp[1][5] ), 
        .CO(\CryTmp[1][6] ), .S(\SumTmp[1][5] ) );
  ADDFHX2 u_fa_PartRem_2_5 ( .A(\PartRem[3][5] ), .B(n57), .CI(\CryTmp[2][5] ), 
        .CO(\CryTmp[2][6] ), .S(\SumTmp[2][5] ) );
  ADDFHX2 u_fa_PartRem_3_5 ( .A(\PartRem[4][5] ), .B(n28), .CI(\CryTmp[3][5] ), 
        .CO(\CryTmp[3][6] ), .S(\SumTmp[3][5] ) );
  ADDFHX2 u_fa_PartRem_2_6 ( .A(\PartRem[3][6] ), .B(n28), .CI(\CryTmp[2][6] ), 
        .CO(\CryTmp[2][7] ), .S(\SumTmp[2][6] ) );
  ADDFXL u_fa_PartRem_2_9 ( .A(\PartRem[3][9] ), .B(n59), .CI(\CryTmp[2][9] ), 
        .CO(\CryTmp[2][10] ), .S(\SumTmp[2][9] ) );
  ADDFXL u_fa_PartRem_5_6 ( .A(\PartRem[6][6] ), .B(n59), .CI(\CryTmp[5][6] ), 
        .CO(\CryTmp[5][7] ), .S(\SumTmp[5][6] ) );
  ADDFHX2 u_fa_PartRem_1_6 ( .A(\PartRem[2][6] ), .B(n57), .CI(\CryTmp[1][6] ), 
        .CO(\CryTmp[1][7] ), .S(\SumTmp[1][6] ) );
  ADDFHX2 u_fa_PartRem_1_11 ( .A(\PartRem[2][11] ), .B(n53), .CI(
        \CryTmp[1][11] ), .CO(\CryTmp[1][12] ), .S(\SumTmp[1][11] ) );
  ADDFHX2 u_fa_PartRem_2_10 ( .A(\PartRem[3][10] ), .B(n53), .CI(
        \CryTmp[2][10] ), .CO(\CryTmp[2][11] ), .S(\SumTmp[2][10] ) );
  ADDFHX2 u_fa_PartRem_3_9 ( .A(\PartRem[4][9] ), .B(n53), .CI(\CryTmp[3][9] ), 
        .CO(\CryTmp[3][10] ), .S(\SumTmp[3][9] ) );
  ADDFHX2 u_fa_PartRem_4_8 ( .A(\PartRem[5][8] ), .B(n53), .CI(\CryTmp[4][8] ), 
        .CO(\CryTmp[4][9] ), .S(\SumTmp[4][8] ) );
  ADDFHX2 u_fa_PartRem_5_7 ( .A(\PartRem[6][7] ), .B(n53), .CI(\CryTmp[5][7] ), 
        .CO(\CryTmp[5][8] ), .S(\SumTmp[5][7] ) );
  ADDFHX2 u_fa_PartRem_8_4 ( .A(\PartRem[9][4] ), .B(n53), .CI(\CryTmp[8][4] ), 
        .CO(\CryTmp[8][5] ), .S(\SumTmp[8][4] ) );
  ADDFHX2 u_fa_PartRem_5_4 ( .A(\PartRem[6][4] ), .B(n52), .CI(\CryTmp[5][4] ), 
        .CO(\CryTmp[5][5] ), .S(\SumTmp[5][4] ) );
  ADDFHX2 u_fa_PartRem_6_3 ( .A(\PartRem[7][3] ), .B(n52), .CI(\CryTmp[6][3] ), 
        .CO(\CryTmp[6][4] ), .S(\SumTmp[6][3] ) );
  ADDFX2 u_fa_PartRem_7_2 ( .A(\PartRem[8][2] ), .B(n52), .CI(\CryTmp[7][2] ), 
        .CO(\CryTmp[7][3] ), .S(\SumTmp[7][2] ) );
  ADDFHX2 u_fa_PartRem_6_4 ( .A(\PartRem[7][4] ), .B(n58), .CI(\CryTmp[6][4] ), 
        .CO(\CryTmp[6][5] ), .S(\SumTmp[6][4] ) );
  ADDFHX2 u_fa_PartRem_7_3 ( .A(\PartRem[8][3] ), .B(n58), .CI(\CryTmp[7][3] ), 
        .CO(\CryTmp[7][4] ), .S(\SumTmp[7][3] ) );
  ADDFX2 u_fa_PartRem_8_2 ( .A(\PartRem[9][2] ), .B(n58), .CI(\CryTmp[8][2] ), 
        .CO(\CryTmp[8][3] ), .S(\SumTmp[8][2] ) );
  ADDFHX4 u_fa_PartRem_1_3 ( .A(\PartRem[2][3] ), .B(n54), .CI(\CryTmp[1][3] ), 
        .CO(\CryTmp[1][4] ), .S(\SumTmp[1][3] ) );
  ADDFHX4 u_fa_PartRem_1_4 ( .A(\PartRem[2][4] ), .B(n55), .CI(\CryTmp[1][4] ), 
        .CO(\CryTmp[1][5] ), .S(\SumTmp[1][4] ) );
  ADDFHX4 u_fa_PartRem_2_3 ( .A(\PartRem[3][3] ), .B(n55), .CI(\CryTmp[2][3] ), 
        .CO(\CryTmp[2][4] ), .S(\SumTmp[2][3] ) );
  ADDFHX4 u_fa_PartRem_10_2 ( .A(\PartRem[11][2] ), .B(n53), .CI(
        \CryTmp[10][2] ), .CO(\CryTmp[10][3] ), .S(\SumTmp[10][2] ) );
  ADDFHX2 u_fa_PartRem_1_2 ( .A(\PartRem[2][2] ), .B(n38), .CI(\CryTmp[1][2] ), 
        .CO(\CryTmp[1][3] ), .S(\SumTmp[1][2] ) );
  ADDFHX4 u_fa_PartRem_3_3 ( .A(\PartRem[4][3] ), .B(n56), .CI(\CryTmp[3][3] ), 
        .CO(\CryTmp[3][4] ), .S(\SumTmp[3][3] ) );
  ADDFX2 u_fa_PartRem_3_6 ( .A(\PartRem[4][6] ), .B(n52), .CI(\CryTmp[3][6] ), 
        .CO(\CryTmp[3][7] ), .S(\SumTmp[3][6] ) );
  ADDFHX1 u_fa_PartRem_2_7 ( .A(\PartRem[3][7] ), .B(n52), .CI(\CryTmp[2][7] ), 
        .CO(\CryTmp[2][8] ), .S(\SumTmp[2][7] ) );
  ADDFX1 u_fa_PartRem_9_3 ( .A(\PartRem[10][3] ), .B(n53), .CI(\CryTmp[9][3] ), 
        .CO(\CryTmp[9][4] ), .S(\SumTmp[9][3] ) );
  ADDFHX1 u_fa_PartRem_7_5 ( .A(\PartRem[8][5] ), .B(n53), .CI(\CryTmp[7][5] ), 
        .CO(\CryTmp[7][6] ), .S(\SumTmp[7][5] ) );
  ADDFHX4 u_fa_PartRem_6_6 ( .A(\PartRem[7][6] ), .B(n53), .CI(\CryTmp[6][6] ), 
        .CO(\CryTmp[6][7] ), .S(\SumTmp[6][6] ) );
  ADDFHX1 u_fa_PartRem_1_7 ( .A(\PartRem[2][7] ), .B(n28), .CI(\CryTmp[1][7] ), 
        .CO(\CryTmp[1][8] ), .S(\SumTmp[1][7] ) );
  ADDFHX2 u_fa_PartRem_1_8 ( .A(\PartRem[2][8] ), .B(n52), .CI(\CryTmp[1][8] ), 
        .CO(\CryTmp[1][9] ), .S(\SumTmp[1][8] ) );
  ADDFHX4 u_fa_PartRem_3_4 ( .A(\PartRem[4][4] ), .B(n57), .CI(\CryTmp[3][4] ), 
        .CO(\CryTmp[3][5] ), .S(\SumTmp[3][4] ) );
  CMPR32X2 u_fa_PartRem_4_4 ( .A(\PartRem[5][4] ), .B(n28), .C(\CryTmp[4][4] ), 
        .CO(\CryTmp[4][5] ), .S(\SumTmp[4][4] ) );
  ADDFHX2 u_fa_PartRem_4_5 ( .A(\PartRem[5][5] ), .B(n52), .CI(\CryTmp[4][5] ), 
        .CO(\CryTmp[4][6] ), .S(\SumTmp[4][5] ) );
  ADDFHX4 u_fa_PartRem_8_3 ( .A(\PartRem[9][3] ), .B(n59), .CI(\CryTmp[8][3] ), 
        .CO(\CryTmp[8][4] ), .S(\SumTmp[8][3] ) );
  ADDFHX2 u_fa_PartRem_3_8 ( .A(\PartRem[4][8] ), .B(n59), .CI(\CryTmp[3][8] ), 
        .CO(\CryTmp[3][9] ), .S(\SumTmp[3][8] ) );
  ADDFHX2 u_fa_PartRem_6_2 ( .A(\PartRem[7][2] ), .B(n28), .CI(\CryTmp[6][2] ), 
        .CO(\CryTmp[6][3] ), .S(\SumTmp[6][2] ) );
  ADDFHX2 u_fa_PartRem_2_2 ( .A(\PartRem[3][2] ), .B(n54), .CI(\CryTmp[2][2] ), 
        .CO(\CryTmp[2][3] ), .S(\SumTmp[2][2] ) );
  ADDFX2 u_fa_PartRem_5_2 ( .A(\PartRem[6][2] ), .B(n57), .CI(\CryTmp[5][2] ), 
        .CO(\CryTmp[5][3] ), .S(\SumTmp[5][2] ) );
  ADDFX2 u_fa_PartRem_3_2 ( .A(\PartRem[4][2] ), .B(n55), .CI(\CryTmp[3][2] ), 
        .CO(\CryTmp[3][3] ), .S(\SumTmp[3][2] ) );
  ADDFHX4 u_fa_PartRem_9_2 ( .A(\PartRem[10][2] ), .B(n59), .CI(\CryTmp[9][2] ), .CO(\CryTmp[9][3] ), .S(\SumTmp[9][2] ) );
  ADDFHX4 u_fa_PartRem_2_4 ( .A(\PartRem[3][4] ), .B(n56), .CI(\CryTmp[2][4] ), 
        .CO(\CryTmp[2][5] ), .S(\SumTmp[2][4] ) );
  ADDFHX4 u_fa_PartRem_4_2 ( .A(\PartRem[5][2] ), .B(n56), .CI(\CryTmp[4][2] ), 
        .CO(\CryTmp[4][3] ), .S(\SumTmp[4][2] ) );
  OA21X4 U3 ( .A0(n88), .A1(n89), .B0(n90), .Y(n85) );
  MXI2XL U4 ( .A(\SumTmp[5][7] ), .B(\PartRem[6][7] ), .S0(n56), .Y(n99) );
  INVX20 U5 ( .A(root[5]), .Y(n56) );
  AOI2BB1X4 U6 ( .A0N(\CryTmp[8][2] ), .A1N(n52), .B0(n45), .Y(n44) );
  OA21X4 U7 ( .A0(n52), .A1(a[16]), .B0(a[17]), .Y(n45) );
  OR2X8 U8 ( .A(n2), .B(n3), .Y(\PartRem[4][3] ) );
  CLKAND2X12 U9 ( .A(n41), .B(n93), .Y(n40) );
  OA21X4 U10 ( .A0(\CryTmp[1][2] ), .A1(n40), .B0(n92), .Y(n88) );
  OAI21X4 U11 ( .A0(n40), .A1(a[2]), .B0(a[3]), .Y(n92) );
  XOR2X4 U12 ( .A(root[10]), .B(a[20]), .Y(\PartRem[10][2] ) );
  XOR2X2 U13 ( .A(root[4]), .B(a[8]), .Y(\PartRem[4][2] ) );
  INVX20 U14 ( .A(n34), .Y(root[4]) );
  MX2X4 U15 ( .A(\PartRem[8][2] ), .B(\SumTmp[7][2] ), .S0(n30), .Y(
        \PartRem[7][4] ) );
  CLKINVX6 U16 ( .A(n28), .Y(n30) );
  MX2XL U17 ( .A(\PartRem[4][2] ), .B(\SumTmp[3][2] ), .S0(root[3]), .Y(
        \PartRem[3][4] ) );
  XOR2X4 U18 ( .A(root[7]), .B(a[14]), .Y(\PartRem[7][2] ) );
  INVX20 U19 ( .A(n28), .Y(root[7]) );
  NAND2X4 U20 ( .A(n38), .B(a[4]), .Y(n15) );
  CLKINVX1 U21 ( .A(a[4]), .Y(n13) );
  CLKINVX3 U22 ( .A(\CryTmp[4][9] ), .Y(n35) );
  NAND2X1 U23 ( .A(n8), .B(n9), .Y(\PartRem[3][2] ) );
  NAND2X1 U24 ( .A(n6), .B(a[6]), .Y(n9) );
  NAND2X1 U25 ( .A(root[3]), .B(n7), .Y(n8) );
  CLKINVX1 U26 ( .A(a[6]), .Y(n7) );
  NAND3X2 U27 ( .A(n18), .B(n19), .C(n20), .Y(\CryTmp[4][4] ) );
  OAI21X2 U28 ( .A0(n54), .A1(a[6]), .B0(a[7]), .Y(n95) );
  NAND2X2 U29 ( .A(n21), .B(n22), .Y(n23) );
  NAND2X2 U30 ( .A(n24), .B(n54), .Y(n87) );
  CLKMX2X2 U31 ( .A(\PartRem[3][2] ), .B(\SumTmp[2][2] ), .S0(root[2]), .Y(
        \PartRem[2][4] ) );
  CLKINVX1 U32 ( .A(n44), .Y(\PartRem[8][3] ) );
  XOR3X1 U33 ( .A(\PartRem[5][3] ), .B(n57), .C(\CryTmp[4][3] ), .Y(
        \SumTmp[4][3] ) );
  NAND2X1 U34 ( .A(n4), .B(n5), .Y(\PartRem[3][5] ) );
  NAND2X1 U35 ( .A(\PartRem[4][3] ), .B(n6), .Y(n4) );
  CLKMX2X2 U36 ( .A(\PartRem[4][4] ), .B(\SumTmp[3][4] ), .S0(root[3]), .Y(
        \PartRem[3][6] ) );
  CLKMX2X2 U37 ( .A(\PartRem[3][5] ), .B(\SumTmp[2][5] ), .S0(root[2]), .Y(
        \PartRem[2][7] ) );
  INVX12 U38 ( .A(root[4]), .Y(n55) );
  NAND2X2 U39 ( .A(n26), .B(n104), .Y(\PartRem[9][3] ) );
  NAND2X1 U40 ( .A(n25), .B(root[9]), .Y(n26) );
  OR2X1 U41 ( .A(a[21]), .B(a[20]), .Y(\CryTmp[10][2] ) );
  MXI2X1 U42 ( .A(\SumTmp[3][9] ), .B(\PartRem[4][9] ), .S0(n54), .Y(n97) );
  CLKMX2X2 U43 ( .A(\PartRem[9][3] ), .B(\SumTmp[8][3] ), .S0(root[8]), .Y(
        \PartRem[8][5] ) );
  BUFX16 U44 ( .A(n36), .Y(n52) );
  INVX8 U45 ( .A(root[10]), .Y(n59) );
  INVX12 U46 ( .A(n36), .Y(root[8]) );
  CLKAND2X8 U47 ( .A(n37), .B(n103), .Y(n36) );
  INVX12 U48 ( .A(n107), .Y(n28) );
  INVX6 U49 ( .A(root[9]), .Y(n58) );
  BUFX16 U50 ( .A(n108), .Y(root[6]) );
  INVX16 U51 ( .A(root[6]), .Y(n57) );
  OA21X4 U52 ( .A0(n59), .A1(a[20]), .B0(a[21]), .Y(n1) );
  INVX12 U53 ( .A(n38), .Y(root[2]) );
  INVX3 U54 ( .A(n40), .Y(root[1]) );
  INVX6 U55 ( .A(root[3]), .Y(n54) );
  BUFX12 U56 ( .A(\PartRoot[9][4] ), .Y(n53) );
  CLKINVX1 U57 ( .A(n86), .Y(n22) );
  NAND2X2 U58 ( .A(n86), .B(n85), .Y(n24) );
  MXI2X1 U59 ( .A(\SumTmp[1][2] ), .B(\PartRem[2][2] ), .S0(n40), .Y(n86) );
  INVX4 U60 ( .A(\CryTmp[5][8] ), .Y(n43) );
  CLKINVX4 U61 ( .A(\CryTmp[1][12] ), .Y(n41) );
  CLKINVX4 U62 ( .A(\CryTmp[8][5] ), .Y(n37) );
  AOI2BB2X4 U63 ( .B0(n52), .B1(n70), .A0N(n71), .A1N(n72), .Y(n67) );
  NOR2X2 U64 ( .A(n52), .B(n70), .Y(n71) );
  XOR2X4 U65 ( .A(root[8]), .B(a[16]), .Y(\PartRem[8][2] ) );
  AOI2BB1X4 U66 ( .A0N(\CryTmp[6][2] ), .A1N(n57), .B0(n49), .Y(n48) );
  CLKINVX8 U67 ( .A(n48), .Y(\PartRem[6][3] ) );
  NOR2X8 U68 ( .A(n53), .B(a[22]), .Y(\PartRem[11][2] ) );
  AO21XL U69 ( .A0(n74), .A1(n73), .B0(root[7]), .Y(n75) );
  OAI21X4 U70 ( .A0(n73), .A1(n74), .B0(n75), .Y(n70) );
  AO21X4 U71 ( .A0(n65), .A1(n64), .B0(root[10]), .Y(n66) );
  OA22X2 U72 ( .A0(root[9]), .A1(n67), .B0(n68), .B1(n69), .Y(n64) );
  XOR2X4 U73 ( .A(root[5]), .B(a[10]), .Y(\PartRem[5][2] ) );
  CLKINVX20 U74 ( .A(n42), .Y(root[5]) );
  NOR2X1 U75 ( .A(\CryTmp[4][2] ), .B(n55), .Y(n2) );
  CLKINVX1 U76 ( .A(n94), .Y(n3) );
  OR2X1 U77 ( .A(a[9]), .B(a[8]), .Y(\CryTmp[4][2] ) );
  NAND2XL U78 ( .A(\SumTmp[3][3] ), .B(root[3]), .Y(n5) );
  INVX4 U79 ( .A(root[3]), .Y(n6) );
  NAND2X4 U80 ( .A(root[6]), .B(n10), .Y(n11) );
  NAND2X4 U81 ( .A(n57), .B(a[12]), .Y(n12) );
  NAND2X6 U82 ( .A(n11), .B(n12), .Y(\PartRem[6][2] ) );
  INVX1 U83 ( .A(a[12]), .Y(n10) );
  NAND2X6 U84 ( .A(root[2]), .B(n13), .Y(n14) );
  NAND2X6 U85 ( .A(n14), .B(n15), .Y(\PartRem[2][2] ) );
  AND2X1 U86 ( .A(a[23]), .B(a[22]), .Y(n16) );
  OR2X8 U87 ( .A(n16), .B(\CryTmp[10][3] ), .Y(root[10]) );
  NOR2X2 U88 ( .A(\CryTmp[10][2] ), .B(n59), .Y(n17) );
  OR2X8 U89 ( .A(n17), .B(n1), .Y(\PartRem[10][3] ) );
  NAND2X2 U90 ( .A(\CryTmp[4][3] ), .B(\PartRem[5][3] ), .Y(n18) );
  NAND2X1 U91 ( .A(n57), .B(\PartRem[5][3] ), .Y(n19) );
  NAND2X2 U92 ( .A(n57), .B(\CryTmp[4][3] ), .Y(n20) );
  CLKINVX8 U93 ( .A(n50), .Y(\PartRem[5][3] ) );
  NAND2X8 U94 ( .A(n23), .B(n87), .Y(n82) );
  CLKINVX1 U95 ( .A(n85), .Y(n21) );
  NOR2X8 U96 ( .A(n55), .B(n82), .Y(n83) );
  CLKINVX1 U97 ( .A(\CryTmp[9][2] ), .Y(n25) );
  OR2X2 U98 ( .A(a[19]), .B(a[18]), .Y(\CryTmp[9][2] ) );
  MX2X1 U99 ( .A(\PartRem[5][2] ), .B(\SumTmp[4][2] ), .S0(root[4]), .Y(
        \PartRem[4][4] ) );
  AOI2BB2X4 U100 ( .B0(n55), .B1(n82), .A0N(n83), .A1N(n84), .Y(n79) );
  OAI21X4 U101 ( .A0(n55), .A1(a[8]), .B0(a[9]), .Y(n94) );
  MXI2X4 U102 ( .A(\SumTmp[4][8] ), .B(\PartRem[5][8] ), .S0(n55), .Y(n98) );
  BUFX20 U103 ( .A(n106), .Y(root[9]) );
  XOR2X2 U104 ( .A(root[9]), .B(a[18]), .Y(\PartRem[9][2] ) );
  OAI21X4 U105 ( .A0(\CryTmp[3][2] ), .A1(n54), .B0(n95), .Y(\PartRem[3][3] )
         );
  NOR2X6 U106 ( .A(a[23]), .B(a[22]), .Y(\PartRoot[9][4] ) );
  OA22X2 U107 ( .A0(root[5]), .A1(n79), .B0(n80), .B1(n81), .Y(n76) );
  AO21X2 U108 ( .A0(n77), .A1(n76), .B0(root[6]), .Y(n78) );
  MXI2XL U109 ( .A(\SumTmp[10][2] ), .B(\PartRem[11][2] ), .S0(n59), .Y(n105)
         );
  AND2X8 U110 ( .A(n39), .B(n97), .Y(n38) );
  OAI21X2 U111 ( .A0(\CryTmp[2][2] ), .A1(n38), .B0(n96), .Y(\PartRem[2][3] )
         );
  OAI21X4 U112 ( .A0(n38), .A1(a[4]), .B0(a[5]), .Y(n96) );
  OA21X4 U113 ( .A0(n76), .A1(n77), .B0(n78), .Y(n73) );
  AO21XL U114 ( .A0(n89), .A1(n88), .B0(root[2]), .Y(n90) );
  MX2XL U115 ( .A(\PartRem[9][2] ), .B(\SumTmp[8][2] ), .S0(root[8]), .Y(
        \PartRem[8][4] ) );
  OAI21X1 U116 ( .A0(n58), .A1(a[18]), .B0(a[19]), .Y(n104) );
  MXI2X2 U117 ( .A(\SumTmp[8][4] ), .B(\PartRem[9][4] ), .S0(n52), .Y(n102) );
  OA21X4 U118 ( .A0(n64), .A1(n65), .B0(n66), .Y(n60) );
  MXI2XL U119 ( .A(\SumTmp[1][3] ), .B(\PartRem[2][3] ), .S0(n40), .Y(n84) );
  MXI2XL U120 ( .A(\SumTmp[9][3] ), .B(\PartRem[10][3] ), .S0(n58), .Y(n103)
         );
  CLKINVX4 U121 ( .A(\CryTmp[3][10] ), .Y(n33) );
  AND2X8 U122 ( .A(n33), .B(n98), .Y(n32) );
  AND2X8 U123 ( .A(n43), .B(n100), .Y(n42) );
  AND2X8 U124 ( .A(n35), .B(n99), .Y(n34) );
  OR2X1 U125 ( .A(a[7]), .B(a[6]), .Y(\CryTmp[3][2] ) );
  MX2XL U126 ( .A(\PartRem[4][8] ), .B(\SumTmp[3][8] ), .S0(root[3]), .Y(
        \PartRem[3][10] ) );
  MX2XL U127 ( .A(\PartRem[3][8] ), .B(\SumTmp[2][8] ), .S0(root[2]), .Y(
        \PartRem[2][10] ) );
  CLKINVX1 U128 ( .A(\CryTmp[2][11] ), .Y(n39) );
  CLKINVX6 U129 ( .A(n46), .Y(\PartRem[7][3] ) );
  OA21X4 U130 ( .A0(n56), .A1(a[10]), .B0(a[11]), .Y(n51) );
  MX2XL U131 ( .A(\PartRem[7][4] ), .B(\SumTmp[6][4] ), .S0(root[6]), .Y(
        \PartRem[6][6] ) );
  MX2XL U132 ( .A(\PartRem[8][3] ), .B(\SumTmp[7][3] ), .S0(root[7]), .Y(
        \PartRem[7][5] ) );
  CLKMX2X4 U133 ( .A(\PartRem[6][5] ), .B(\SumTmp[5][5] ), .S0(root[5]), .Y(
        \PartRem[5][7] ) );
  MX2XL U134 ( .A(\PartRem[7][5] ), .B(\SumTmp[6][5] ), .S0(root[6]), .Y(
        \PartRem[6][7] ) );
  MX2XL U135 ( .A(\PartRem[8][4] ), .B(\SumTmp[7][4] ), .S0(root[7]), .Y(
        \PartRem[7][6] ) );
  CLKMX2X4 U136 ( .A(\PartRem[5][7] ), .B(\SumTmp[4][7] ), .S0(root[4]), .Y(
        \PartRem[4][9] ) );
  INVX20 U137 ( .A(n32), .Y(root[3]) );
  NAND2BX4 U138 ( .AN(\CryTmp[9][4] ), .B(n105), .Y(n106) );
  AO21X4 U139 ( .A0(n61), .A1(n60), .B0(root[11]), .Y(n62) );
  OAI211X4 U140 ( .A0(n60), .A1(n61), .B0(n62), .C0(n63), .Y(root[0]) );
  MX2XL U141 ( .A(\PartRem[7][2] ), .B(\SumTmp[6][2] ), .S0(root[6]), .Y(
        \PartRem[6][4] ) );
  MX2XL U142 ( .A(\PartRem[7][3] ), .B(\SumTmp[6][3] ), .S0(root[6]), .Y(
        \PartRem[6][5] ) );
  MX2XL U143 ( .A(\PartRem[6][2] ), .B(\SumTmp[5][2] ), .S0(root[5]), .Y(
        \PartRem[5][4] ) );
  MX2XL U144 ( .A(\PartRem[10][2] ), .B(\SumTmp[9][2] ), .S0(root[9]), .Y(
        \PartRem[9][4] ) );
  MXI2XL U145 ( .A(\SumTmp[1][4] ), .B(\PartRem[2][4] ), .S0(n40), .Y(n81) );
  AOI2BB1X4 U146 ( .A0N(\CryTmp[7][2] ), .A1N(n28), .B0(n47), .Y(n46) );
  OA21X4 U147 ( .A0(n28), .A1(a[14]), .B0(a[15]), .Y(n47) );
  OA21X4 U148 ( .A0(n57), .A1(a[12]), .B0(a[13]), .Y(n49) );
  NOR2BX4 U149 ( .AN(n79), .B(n56), .Y(n80) );
  MX2XL U150 ( .A(\PartRem[5][3] ), .B(\SumTmp[4][3] ), .S0(root[4]), .Y(
        \PartRem[4][5] ) );
  MX2XL U151 ( .A(\PartRem[3][3] ), .B(\SumTmp[2][3] ), .S0(root[2]), .Y(
        \PartRem[2][5] ) );
  AOI2BB1X4 U152 ( .A0N(\CryTmp[5][2] ), .A1N(n56), .B0(n51), .Y(n50) );
  NOR2BX1 U153 ( .AN(n67), .B(n58), .Y(n68) );
  NAND2BX4 U154 ( .AN(\CryTmp[6][7] ), .B(n101), .Y(n108) );
  NAND2BX4 U155 ( .AN(\CryTmp[7][6] ), .B(n102), .Y(n107) );
  MXI2X1 U156 ( .A(\SumTmp[1][11] ), .B(\PartRem[2][11] ), .S0(n40), .Y(n63)
         );
  CLKINVX1 U157 ( .A(n53), .Y(root[11]) );
  MXI2X1 U158 ( .A(\SumTmp[1][10] ), .B(\PartRem[2][10] ), .S0(n40), .Y(n61)
         );
  MXI2X1 U159 ( .A(\SumTmp[1][9] ), .B(\PartRem[2][9] ), .S0(n40), .Y(n65) );
  MXI2X1 U160 ( .A(\SumTmp[1][8] ), .B(\PartRem[2][8] ), .S0(n40), .Y(n69) );
  MXI2X1 U161 ( .A(\SumTmp[1][7] ), .B(\PartRem[2][7] ), .S0(n40), .Y(n72) );
  MXI2X1 U162 ( .A(\SumTmp[1][6] ), .B(\PartRem[2][6] ), .S0(n40), .Y(n74) );
  MXI2X1 U163 ( .A(\SumTmp[1][5] ), .B(\PartRem[2][5] ), .S0(n40), .Y(n77) );
  MXI2X1 U164 ( .A(n91), .B(n40), .S0(a[2]), .Y(n89) );
  OR2X1 U165 ( .A(a[0]), .B(a[1]), .Y(n91) );
  MXI2X1 U166 ( .A(\SumTmp[2][10] ), .B(\PartRem[3][10] ), .S0(n38), .Y(n93)
         );
  CLKMX2X2 U167 ( .A(\PartRem[5][6] ), .B(\SumTmp[4][6] ), .S0(root[4]), .Y(
        \PartRem[4][8] ) );
  CLKMX2X2 U168 ( .A(\PartRem[6][4] ), .B(\SumTmp[5][4] ), .S0(root[5]), .Y(
        \PartRem[5][6] ) );
  CLKMX2X2 U169 ( .A(\PartRem[3][7] ), .B(\SumTmp[2][7] ), .S0(root[2]), .Y(
        \PartRem[2][9] ) );
  CLKMX2X2 U170 ( .A(\PartRem[4][5] ), .B(\SumTmp[3][5] ), .S0(root[3]), .Y(
        \PartRem[3][7] ) );
  CLKMX2X2 U171 ( .A(\PartRem[3][6] ), .B(\SumTmp[2][6] ), .S0(root[2]), .Y(
        \PartRem[2][8] ) );
  CLKMX2X2 U172 ( .A(\PartRem[3][4] ), .B(\SumTmp[2][4] ), .S0(root[2]), .Y(
        \PartRem[2][6] ) );
  CLKMX2X2 U173 ( .A(\PartRem[3][9] ), .B(\SumTmp[2][9] ), .S0(root[2]), .Y(
        \PartRem[2][11] ) );
  CLKMX2X2 U174 ( .A(\PartRem[4][7] ), .B(\SumTmp[3][7] ), .S0(root[3]), .Y(
        \PartRem[3][9] ) );
  CLKMX2X2 U175 ( .A(\PartRem[5][5] ), .B(\SumTmp[4][5] ), .S0(root[4]), .Y(
        \PartRem[4][7] ) );
  CLKMX2X2 U176 ( .A(\PartRem[6][3] ), .B(\SumTmp[5][3] ), .S0(root[5]), .Y(
        \PartRem[5][5] ) );
  CLKMX2X2 U177 ( .A(\PartRem[4][6] ), .B(\SumTmp[3][6] ), .S0(root[3]), .Y(
        \PartRem[3][8] ) );
  CLKMX2X2 U178 ( .A(\PartRem[6][6] ), .B(\SumTmp[5][6] ), .S0(root[5]), .Y(
        \PartRem[5][8] ) );
  CLKMX2X2 U179 ( .A(\PartRem[5][4] ), .B(\SumTmp[4][4] ), .S0(root[4]), .Y(
        \PartRem[4][6] ) );
  MXI2X1 U180 ( .A(\SumTmp[6][6] ), .B(\PartRem[7][6] ), .S0(n57), .Y(n100) );
  MXI2X1 U181 ( .A(\SumTmp[7][5] ), .B(\PartRem[8][5] ), .S0(n28), .Y(n101) );
  OR2X1 U182 ( .A(a[17]), .B(a[16]), .Y(\CryTmp[8][2] ) );
  OR2X1 U183 ( .A(a[15]), .B(a[14]), .Y(\CryTmp[7][2] ) );
  OR2X1 U184 ( .A(a[13]), .B(a[12]), .Y(\CryTmp[6][2] ) );
  OR2X1 U185 ( .A(a[11]), .B(a[10]), .Y(\CryTmp[5][2] ) );
  OR2X1 U186 ( .A(a[5]), .B(a[4]), .Y(\CryTmp[2][2] ) );
  OR2X1 U187 ( .A(a[3]), .B(a[2]), .Y(\CryTmp[1][2] ) );
endmodule


module READ_DW_sqrt_2 ( a, root );
  input [23:0] a;
  output [11:0] root;
  wire   \PartRem[10][3] , \PartRem[10][2] , \PartRem[9][4] , \PartRem[9][3] ,
         \PartRem[9][2] , \PartRem[8][5] , \PartRem[8][4] , \PartRem[8][3] ,
         \PartRem[8][2] , \PartRem[7][6] , \PartRem[7][5] , \PartRem[7][4] ,
         \PartRem[7][3] , \PartRem[7][2] , \PartRem[6][7] , \PartRem[6][6] ,
         \PartRem[6][5] , \PartRem[6][4] , \PartRem[6][3] , \PartRem[6][2] ,
         \PartRem[5][8] , \PartRem[5][7] , \PartRem[5][6] , \PartRem[5][5] ,
         \PartRem[5][4] , \PartRem[5][3] , \PartRem[5][2] , \PartRem[4][9] ,
         \PartRem[4][8] , \PartRem[4][7] , \PartRem[4][6] , \PartRem[4][5] ,
         \PartRem[4][4] , \PartRem[4][3] , \PartRem[4][2] , \PartRem[3][10] ,
         \PartRem[3][9] , \PartRem[3][8] , \PartRem[3][7] , \PartRem[3][6] ,
         \PartRem[3][5] , \PartRem[3][4] , \PartRem[3][3] , \PartRem[3][2] ,
         \PartRem[2][11] , \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] ,
         \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] ,
         \PartRem[2][3] , \PartRem[2][2] , \PartRoot[9][2] , \PartRoot[8][2] ,
         \PartRoot[7][2] , \PartRoot[6][2] , \PartRoot[5][2] ,
         \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] , \SumTmp[10][2] ,
         \SumTmp[9][3] , \SumTmp[9][2] , \SumTmp[8][4] , \SumTmp[8][3] ,
         \SumTmp[8][2] , \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] ,
         \SumTmp[7][2] , \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] ,
         \SumTmp[6][3] , \SumTmp[6][2] , \SumTmp[5][7] , \SumTmp[5][6] ,
         \SumTmp[5][5] , \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] ,
         \SumTmp[4][8] , \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] ,
         \SumTmp[4][4] , \SumTmp[4][3] , \SumTmp[4][2] , \SumTmp[3][9] ,
         \SumTmp[3][8] , \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] ,
         \SumTmp[3][4] , \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][10] ,
         \SumTmp[2][9] , \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] ,
         \SumTmp[2][5] , \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] ,
         \SumTmp[1][11] , \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] ,
         \SumTmp[1][7] , \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] ,
         \SumTmp[1][3] , \SumTmp[1][2] , \CryTmp[10][2] , \CryTmp[9][4] ,
         \CryTmp[9][3] , \CryTmp[9][2] , \CryTmp[8][5] , \CryTmp[8][4] ,
         \CryTmp[8][3] , \CryTmp[8][2] , \CryTmp[7][6] , \CryTmp[7][5] ,
         \CryTmp[7][4] , \CryTmp[7][3] , \CryTmp[7][2] , \CryTmp[6][7] ,
         \CryTmp[6][6] , \CryTmp[6][5] , \CryTmp[6][4] , \CryTmp[6][3] ,
         \CryTmp[6][2] , \CryTmp[5][8] , \CryTmp[5][7] , \CryTmp[5][6] ,
         \CryTmp[5][5] , \CryTmp[5][4] , \CryTmp[5][3] , \CryTmp[5][2] ,
         \CryTmp[4][9] , \CryTmp[4][8] , \CryTmp[4][7] , \CryTmp[4][6] ,
         \CryTmp[4][5] , \CryTmp[4][4] , \CryTmp[4][3] , \CryTmp[4][2] ,
         \CryTmp[3][10] , \CryTmp[3][9] , \CryTmp[3][8] , \CryTmp[3][7] ,
         \CryTmp[3][6] , \CryTmp[3][5] , \CryTmp[3][4] , \CryTmp[3][3] ,
         \CryTmp[3][2] , \CryTmp[2][11] , \CryTmp[2][10] , \CryTmp[2][9] ,
         \CryTmp[2][8] , \CryTmp[2][7] , \CryTmp[2][6] , \CryTmp[2][5] ,
         \CryTmp[2][4] , \CryTmp[2][3] , \CryTmp[2][2] , \CryTmp[1][12] ,
         \CryTmp[1][11] , \CryTmp[1][10] , \CryTmp[1][9] , \CryTmp[1][8] ,
         \CryTmp[1][7] , \CryTmp[1][6] , \CryTmp[1][5] , \CryTmp[1][4] ,
         \CryTmp[1][3] , \CryTmp[1][2] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n18, n19, n20, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n37, n38, n39, n40, n41,
         n42, n43, n44, n46, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100
;

  ADDFXL u_fa_PartRem_1_3 ( .A(\PartRem[2][3] ), .B(n38), .CI(\CryTmp[1][3] ), 
        .CO(\CryTmp[1][4] ), .S(\SumTmp[1][3] ) );
  ADDFXL u_fa_PartRem_3_5 ( .A(\PartRem[4][5] ), .B(n42), .CI(\CryTmp[3][5] ), 
        .CO(\CryTmp[3][6] ), .S(\SumTmp[3][5] ) );
  ADDFXL u_fa_PartRem_1_7 ( .A(\PartRem[2][7] ), .B(n42), .CI(\CryTmp[1][7] ), 
        .CO(\CryTmp[1][8] ), .S(\SumTmp[1][7] ) );
  ADDFXL u_fa_PartRem_4_7 ( .A(\PartRem[5][7] ), .B(n49), .CI(\CryTmp[4][7] ), 
        .CO(\CryTmp[4][8] ), .S(\SumTmp[4][7] ) );
  ADDFHX2 u_fa_PartRem_8_4 ( .A(\PartRem[9][4] ), .B(n50), .CI(\CryTmp[8][4] ), 
        .CO(\CryTmp[8][5] ), .S(\SumTmp[8][4] ) );
  ADDFHX2 u_fa_PartRem_2_10 ( .A(\PartRem[3][10] ), .B(n50), .CI(
        \CryTmp[2][10] ), .CO(\CryTmp[2][11] ), .S(\SumTmp[2][10] ) );
  ADDFHX2 u_fa_PartRem_3_6 ( .A(\PartRem[4][6] ), .B(n43), .CI(\CryTmp[3][6] ), 
        .CO(\CryTmp[3][7] ), .S(\SumTmp[3][6] ) );
  ADDFHX2 u_fa_PartRem_4_5 ( .A(\PartRem[5][5] ), .B(n43), .CI(\CryTmp[4][5] ), 
        .CO(\CryTmp[4][6] ), .S(\SumTmp[4][5] ) );
  ADDFHX2 u_fa_PartRem_6_3 ( .A(\PartRem[7][3] ), .B(n43), .CI(\CryTmp[6][3] ), 
        .CO(\CryTmp[6][4] ), .S(\SumTmp[6][3] ) );
  ADDFHX2 u_fa_PartRem_5_4 ( .A(\PartRem[6][4] ), .B(n43), .CI(\CryTmp[5][4] ), 
        .CO(\CryTmp[5][5] ), .S(\SumTmp[5][4] ) );
  ADDFX1 u_fa_PartRem_5_3 ( .A(\PartRem[6][3] ), .B(n42), .CI(\CryTmp[5][3] ), 
        .CO(\CryTmp[5][4] ), .S(\SumTmp[5][3] ) );
  ADDFHX4 u_fa_PartRem_7_2 ( .A(\PartRem[8][2] ), .B(n43), .CI(\CryTmp[7][2] ), 
        .CO(\CryTmp[7][3] ), .S(\SumTmp[7][2] ) );
  ADDFXL u_fa_PartRem_2_3 ( .A(\PartRem[3][3] ), .B(n39), .CI(\CryTmp[2][3] ), 
        .CO(\CryTmp[2][4] ), .S(\SumTmp[2][3] ) );
  ADDFHX2 u_fa_PartRem_2_7 ( .A(\PartRem[3][7] ), .B(n43), .CI(\CryTmp[2][7] ), 
        .CO(\CryTmp[2][8] ), .S(\SumTmp[2][7] ) );
  ADDFHX2 u_fa_PartRem_1_8 ( .A(\PartRem[2][8] ), .B(n43), .CI(\CryTmp[1][8] ), 
        .CO(\CryTmp[1][9] ), .S(\SumTmp[1][8] ) );
  ADDFHX4 u_fa_PartRem_8_3 ( .A(\PartRem[9][3] ), .B(n49), .CI(\CryTmp[8][3] ), 
        .CO(\CryTmp[8][4] ), .S(\SumTmp[8][3] ) );
  ADDFHX4 u_fa_PartRem_3_8 ( .A(\PartRem[4][8] ), .B(n49), .CI(\CryTmp[3][8] ), 
        .CO(\CryTmp[3][9] ), .S(\SumTmp[3][8] ) );
  ADDFHX2 u_fa_PartRem_2_9 ( .A(\PartRem[3][9] ), .B(n49), .CI(\CryTmp[2][9] ), 
        .CO(\CryTmp[2][10] ), .S(\SumTmp[2][9] ) );
  ADDFX1 u_fa_PartRem_5_2 ( .A(\PartRem[6][2] ), .B(n41), .CI(\CryTmp[5][2] ), 
        .CO(\CryTmp[5][3] ), .S(\SumTmp[5][2] ) );
  ADDFX2 u_fa_PartRem_1_11 ( .A(\PartRem[2][11] ), .B(n50), .CI(
        \CryTmp[1][11] ), .CO(\CryTmp[1][12] ), .S(\SumTmp[1][11] ) );
  ADDFXL u_fa_PartRem_1_10 ( .A(\PartRem[2][10] ), .B(n49), .CI(
        \CryTmp[1][10] ), .CO(\CryTmp[1][11] ), .S(\SumTmp[1][10] ) );
  ADDFXL u_fa_PartRem_1_9 ( .A(\PartRem[2][9] ), .B(n44), .CI(\CryTmp[1][9] ), 
        .CO(\CryTmp[1][10] ), .S(\SumTmp[1][9] ) );
  ADDFX2 u_fa_PartRem_2_8 ( .A(\PartRem[3][8] ), .B(n44), .CI(\CryTmp[2][8] ), 
        .CO(\CryTmp[2][9] ), .S(\SumTmp[2][8] ) );
  ADDFHX1 u_fa_PartRem_3_7 ( .A(\PartRem[4][7] ), .B(n44), .CI(\CryTmp[3][7] ), 
        .CO(\CryTmp[3][8] ), .S(\SumTmp[3][7] ) );
  ADDFHX1 u_fa_PartRem_6_6 ( .A(\PartRem[7][6] ), .B(n50), .CI(\CryTmp[6][6] ), 
        .CO(\CryTmp[6][7] ), .S(\SumTmp[6][6] ) );
  ADDFXL u_fa_PartRem_5_6 ( .A(\PartRem[6][6] ), .B(n49), .CI(\CryTmp[5][6] ), 
        .CO(\CryTmp[5][7] ), .S(\SumTmp[5][6] ) );
  ADDFXL u_fa_PartRem_2_5 ( .A(\PartRem[3][5] ), .B(n41), .CI(\CryTmp[2][5] ), 
        .CO(\CryTmp[2][6] ), .S(\SumTmp[2][5] ) );
  ADDFXL u_fa_PartRem_6_5 ( .A(\PartRem[7][5] ), .B(n49), .CI(\CryTmp[6][5] ), 
        .CO(\CryTmp[6][6] ), .S(\SumTmp[6][5] ) );
  ADDFX1 u_fa_PartRem_4_6 ( .A(\PartRem[5][6] ), .B(n44), .CI(\CryTmp[4][6] ), 
        .CO(\CryTmp[4][7] ), .S(\SumTmp[4][6] ) );
  ADDFXL u_fa_PartRem_5_5 ( .A(\PartRem[6][5] ), .B(n44), .CI(\CryTmp[5][5] ), 
        .CO(\CryTmp[5][6] ), .S(\SumTmp[5][5] ) );
  ADDFXL u_fa_PartRem_6_4 ( .A(\PartRem[7][4] ), .B(n44), .CI(\CryTmp[6][4] ), 
        .CO(\CryTmp[6][5] ), .S(\SumTmp[6][4] ) );
  ADDFX2 u_fa_PartRem_4_4 ( .A(\PartRem[5][4] ), .B(n42), .CI(\CryTmp[4][4] ), 
        .CO(\CryTmp[4][5] ), .S(\SumTmp[4][4] ) );
  ADDFXL u_fa_PartRem_2_4 ( .A(\PartRem[3][4] ), .B(n40), .CI(\CryTmp[2][4] ), 
        .CO(\CryTmp[2][5] ), .S(\SumTmp[2][4] ) );
  ADDFXL u_fa_PartRem_3_3 ( .A(\PartRem[4][3] ), .B(n40), .CI(\CryTmp[3][3] ), 
        .CO(\CryTmp[3][4] ), .S(\SumTmp[3][3] ) );
  ADDFXL u_fa_PartRem_4_3 ( .A(\PartRem[5][3] ), .B(n41), .CI(\CryTmp[4][3] ), 
        .CO(\CryTmp[4][4] ), .S(\SumTmp[4][3] ) );
  ADDFX2 u_fa_PartRem_7_3 ( .A(\PartRem[8][3] ), .B(n44), .CI(\CryTmp[7][3] ), 
        .CO(\CryTmp[7][4] ), .S(\SumTmp[7][3] ) );
  ADDFX2 u_fa_PartRem_8_2 ( .A(\PartRem[9][2] ), .B(n44), .CI(\CryTmp[8][2] ), 
        .CO(\CryTmp[8][3] ), .S(\SumTmp[8][2] ) );
  ADDFHX4 u_fa_PartRem_4_2 ( .A(\PartRem[5][2] ), .B(n40), .CI(\CryTmp[4][2] ), 
        .CO(\CryTmp[4][3] ), .S(\SumTmp[4][2] ) );
  ADDFHX4 u_fa_PartRem_1_2 ( .A(\PartRem[2][2] ), .B(n37), .CI(\CryTmp[1][2] ), 
        .CO(\CryTmp[1][3] ), .S(\SumTmp[1][2] ) );
  CMPR32X2 u_fa_PartRem_5_7 ( .A(\PartRem[6][7] ), .B(n50), .C(\CryTmp[5][7] ), 
        .CO(\CryTmp[5][8] ), .S(\SumTmp[5][7] ) );
  ADDFHX4 u_fa_PartRem_9_2 ( .A(\PartRem[10][2] ), .B(n49), .CI(\CryTmp[9][2] ), .CO(\CryTmp[9][3] ), .S(\SumTmp[9][2] ) );
  ADDFHX2 u_fa_PartRem_6_2 ( .A(\PartRem[7][2] ), .B(n42), .CI(\CryTmp[6][2] ), 
        .CO(\CryTmp[6][3] ), .S(\SumTmp[6][2] ) );
  CMPR32X2 u_fa_PartRem_2_6 ( .A(\PartRem[3][6] ), .B(n42), .C(\CryTmp[2][6] ), 
        .CO(\CryTmp[2][7] ), .S(\SumTmp[2][6] ) );
  ADDFX1 u_fa_PartRem_2_2 ( .A(\PartRem[3][2] ), .B(n38), .CI(\CryTmp[2][2] ), 
        .CO(\CryTmp[2][3] ), .S(\SumTmp[2][2] ) );
  CMPR32X2 u_fa_PartRem_7_5 ( .A(\PartRem[8][5] ), .B(n50), .C(\CryTmp[7][5] ), 
        .CO(\CryTmp[7][6] ), .S(\SumTmp[7][5] ) );
  CMPR32X2 u_fa_PartRem_4_8 ( .A(\PartRem[5][8] ), .B(n50), .C(\CryTmp[4][8] ), 
        .CO(\CryTmp[4][9] ), .S(\SumTmp[4][8] ) );
  CMPR32X2 u_fa_PartRem_3_9 ( .A(\PartRem[4][9] ), .B(n50), .C(\CryTmp[3][9] ), 
        .CO(\CryTmp[3][10] ), .S(\SumTmp[3][9] ) );
  ADDFX1 u_fa_PartRem_3_4 ( .A(\PartRem[4][4] ), .B(n41), .CI(\CryTmp[3][4] ), 
        .CO(\CryTmp[3][5] ), .S(\SumTmp[3][4] ) );
  ADDFX4 u_fa_PartRem_1_4 ( .A(\PartRem[2][4] ), .B(n39), .CI(\CryTmp[1][4] ), 
        .CO(\CryTmp[1][5] ), .S(\SumTmp[1][4] ) );
  ADDFHX4 u_fa_PartRem_7_4 ( .A(n4), .B(n49), .CI(\CryTmp[7][4] ), .CO(
        \CryTmp[7][5] ), .S(\SumTmp[7][4] ) );
  CMPR32X2 u_fa_PartRem_9_3 ( .A(\PartRem[10][3] ), .B(n50), .C(\CryTmp[9][3] ), .CO(\CryTmp[9][4] ), .S(\SumTmp[9][3] ) );
  ADDFX1 u_fa_PartRem_3_2 ( .A(\PartRem[4][2] ), .B(n39), .CI(\CryTmp[3][2] ), 
        .CO(\CryTmp[3][3] ), .S(\SumTmp[3][2] ) );
  CMPR32X2 u_fa_PartRem_1_6 ( .A(\PartRem[2][6] ), .B(n41), .C(\CryTmp[1][6] ), 
        .CO(\CryTmp[1][7] ), .S(\SumTmp[1][6] ) );
  CLKINVX1 U3 ( .A(n50), .Y(n1) );
  INVX16 U4 ( .A(a[22]), .Y(n50) );
  CLKBUFX2 U5 ( .A(n1), .Y(root[11]) );
  OAI21X2 U6 ( .A0(n39), .A1(a[8]), .B0(a[9]), .Y(n87) );
  MX2XL U7 ( .A(\SumTmp[3][3] ), .B(\PartRem[4][3] ), .S0(n38), .Y(
        \PartRem[3][5] ) );
  AOI2BB1X4 U8 ( .A0N(\CryTmp[2][2] ), .A1N(n37), .B0(n34), .Y(n33) );
  AND2X8 U9 ( .A(n26), .B(a[5]), .Y(n34) );
  OAI21X1 U10 ( .A0(n44), .A1(a[18]), .B0(a[19]), .Y(n99) );
  BUFX20 U11 ( .A(\PartRoot[9][2] ), .Y(n44) );
  AOI21X4 U12 ( .A0(\SumTmp[10][2] ), .A1(root[10]), .B0(\CryTmp[9][4] ), .Y(
        \PartRoot[9][2] ) );
  INVX4 U13 ( .A(n33), .Y(\PartRem[2][3] ) );
  XNOR2X4 U14 ( .A(n37), .B(a[4]), .Y(\PartRem[2][2] ) );
  BUFX20 U15 ( .A(\PartRoot[2][2] ), .Y(n37) );
  BUFX8 U16 ( .A(n59), .Y(n2) );
  NAND2X4 U17 ( .A(n14), .B(n15), .Y(\PartRem[3][2] ) );
  XNOR2X4 U18 ( .A(a[20]), .B(n49), .Y(\PartRem[10][2] ) );
  NOR2X8 U19 ( .A(a[20]), .B(n49), .Y(n100) );
  OAI22X4 U20 ( .A0(n49), .A1(\CryTmp[10][2] ), .B0(n100), .B1(n51), .Y(
        \PartRem[10][3] ) );
  CLKINVX20 U21 ( .A(root[10]), .Y(n49) );
  XOR2XL U22 ( .A(\CryTmp[1][5] ), .B(n7), .Y(\SumTmp[1][5] ) );
  NAND2BX4 U23 ( .AN(a[20]), .B(n51), .Y(\CryTmp[10][2] ) );
  CLKINVX8 U24 ( .A(a[21]), .Y(n51) );
  BUFX6 U25 ( .A(n71), .Y(n5) );
  AND2X8 U26 ( .A(n50), .B(\CryTmp[10][2] ), .Y(root[10]) );
  INVX12 U27 ( .A(n43), .Y(root[8]) );
  OAI21X2 U28 ( .A0(n43), .A1(a[16]), .B0(a[17]), .Y(n94) );
  NAND2X4 U29 ( .A(n43), .B(a[16]), .Y(n23) );
  OR2X6 U30 ( .A(\CryTmp[8][2] ), .B(n43), .Y(n25) );
  CLKBUFX20 U31 ( .A(\PartRoot[8][2] ), .Y(n43) );
  NAND2XL U32 ( .A(\PartRem[2][2] ), .B(n30), .Y(n31) );
  NAND2X6 U33 ( .A(n19), .B(n20), .Y(\PartRem[9][2] ) );
  NAND2X6 U34 ( .A(root[9]), .B(n18), .Y(n20) );
  XNOR2X4 U35 ( .A(n39), .B(a[8]), .Y(\PartRem[4][2] ) );
  BUFX20 U36 ( .A(\PartRoot[4][2] ), .Y(n39) );
  OAI21X2 U37 ( .A0(\CryTmp[5][2] ), .A1(n40), .B0(n86), .Y(\PartRem[5][3] )
         );
  OAI21X4 U38 ( .A0(n40), .A1(a[10]), .B0(a[11]), .Y(n86) );
  XNOR2X4 U39 ( .A(n40), .B(a[10]), .Y(\PartRem[5][2] ) );
  MXI2X2 U40 ( .A(n83), .B(n3), .S0(a[2]), .Y(n81) );
  BUFX12 U41 ( .A(n79), .Y(n3) );
  OA21X4 U42 ( .A0(\CryTmp[1][2] ), .A1(n3), .B0(n84), .Y(n80) );
  OAI21X2 U43 ( .A0(n3), .A1(a[2]), .B0(a[3]), .Y(n84) );
  NOR2BX4 U44 ( .AN(n85), .B(\CryTmp[1][12] ), .Y(n79) );
  INVX8 U45 ( .A(n3), .Y(root[1]) );
  XNOR2X4 U46 ( .A(n41), .B(a[12]), .Y(\PartRem[6][2] ) );
  MX2XL U47 ( .A(\SumTmp[6][2] ), .B(\PartRem[7][2] ), .S0(n41), .Y(
        \PartRem[6][4] ) );
  XNOR2X4 U48 ( .A(n42), .B(a[14]), .Y(\PartRem[7][2] ) );
  INVX1 U49 ( .A(a[16]), .Y(n22) );
  OR2X2 U50 ( .A(n37), .B(a[4]), .Y(n26) );
  CLKINVX1 U51 ( .A(n38), .Y(n12) );
  OR2X1 U52 ( .A(a[17]), .B(a[16]), .Y(\CryTmp[8][2] ) );
  OR2X1 U53 ( .A(a[13]), .B(a[12]), .Y(\CryTmp[6][2] ) );
  CLKINVX1 U54 ( .A(root[1]), .Y(n30) );
  NAND2X1 U55 ( .A(n38), .B(a[6]), .Y(n14) );
  NAND2X1 U56 ( .A(n12), .B(n13), .Y(n15) );
  CLKINVX1 U57 ( .A(a[6]), .Y(n13) );
  NAND2X1 U58 ( .A(n44), .B(a[18]), .Y(n19) );
  OR2X1 U59 ( .A(a[19]), .B(a[18]), .Y(\CryTmp[9][2] ) );
  OAI21XL U60 ( .A0(\CryTmp[4][2] ), .A1(n39), .B0(n87), .Y(\PartRem[4][3] )
         );
  NAND2X1 U61 ( .A(n16), .B(n99), .Y(\PartRem[9][3] ) );
  OR2X1 U62 ( .A(\CryTmp[9][2] ), .B(n44), .Y(n16) );
  CLKMX2X2 U63 ( .A(\SumTmp[5][3] ), .B(\PartRem[6][3] ), .S0(n40), .Y(
        \PartRem[5][5] ) );
  MXI2X1 U64 ( .A(\PartRem[2][3] ), .B(\SumTmp[1][3] ), .S0(root[1]), .Y(n76)
         );
  AND2X2 U65 ( .A(n5), .B(root[5]), .Y(n72) );
  MXI2X1 U66 ( .A(\PartRem[2][4] ), .B(\SumTmp[1][4] ), .S0(root[1]), .Y(n73)
         );
  XOR2X1 U67 ( .A(\PartRem[2][5] ), .B(n40), .Y(n7) );
  NAND3X1 U68 ( .A(n8), .B(n9), .C(n10), .Y(\CryTmp[1][6] ) );
  CLKMX2X2 U69 ( .A(\SumTmp[6][4] ), .B(\PartRem[7][4] ), .S0(n41), .Y(
        \PartRem[6][6] ) );
  MXI2X1 U70 ( .A(\PartRem[2][6] ), .B(\SumTmp[1][6] ), .S0(root[1]), .Y(n66)
         );
  INVX3 U71 ( .A(n44), .Y(root[9]) );
  OAI2BB1X1 U72 ( .A0N(n53), .A1N(n52), .B0(n50), .Y(n54) );
  BUFX3 U73 ( .A(\PartRem[8][4] ), .Y(n4) );
  BUFX20 U74 ( .A(\PartRoot[5][2] ), .Y(n40) );
  AND2X2 U75 ( .A(n2), .B(root[9]), .Y(n60) );
  OAI21X4 U76 ( .A0(n41), .A1(a[12]), .B0(a[13]), .Y(n89) );
  OAI21X4 U77 ( .A0(\CryTmp[6][2] ), .A1(n41), .B0(n89), .Y(\PartRem[6][3] )
         );
  BUFX20 U78 ( .A(\PartRoot[6][2] ), .Y(n41) );
  MX2XL U79 ( .A(\SumTmp[4][4] ), .B(\PartRem[5][4] ), .S0(n39), .Y(
        \PartRem[4][6] ) );
  OAI21X1 U80 ( .A0(\CryTmp[7][2] ), .A1(n42), .B0(n91), .Y(\PartRem[7][3] )
         );
  BUFX20 U81 ( .A(\PartRoot[7][2] ), .Y(n42) );
  AND2X2 U82 ( .A(n31), .B(n32), .Y(n6) );
  AOI2BB2X1 U83 ( .B0(n43), .B1(n62), .A0N(n63), .A1N(n64), .Y(n59) );
  CLKMX2X2 U84 ( .A(\SumTmp[2][3] ), .B(\PartRem[3][3] ), .S0(n37), .Y(
        \PartRem[2][5] ) );
  OAI2BB1X4 U85 ( .A0N(n57), .A1N(n56), .B0(n49), .Y(n58) );
  NOR2X4 U86 ( .A(n43), .B(n62), .Y(n63) );
  NAND2X2 U87 ( .A(\PartRem[2][5] ), .B(\CryTmp[1][5] ), .Y(n8) );
  NAND2X2 U88 ( .A(n40), .B(\CryTmp[1][5] ), .Y(n9) );
  NAND2XL U89 ( .A(n40), .B(\PartRem[2][5] ), .Y(n10) );
  OR2X2 U90 ( .A(\CryTmp[3][2] ), .B(n38), .Y(n11) );
  NAND2X2 U91 ( .A(n11), .B(n88), .Y(\PartRem[3][3] ) );
  OAI21X2 U92 ( .A0(n38), .A1(a[6]), .B0(a[7]), .Y(n88) );
  BUFX20 U93 ( .A(\PartRoot[3][2] ), .Y(n38) );
  MX2XL U94 ( .A(\SumTmp[2][2] ), .B(\PartRem[3][2] ), .S0(n37), .Y(
        \PartRem[2][4] ) );
  INVX1 U95 ( .A(a[18]), .Y(n18) );
  NAND2X6 U96 ( .A(root[8]), .B(n22), .Y(n24) );
  NAND2X6 U97 ( .A(n23), .B(n24), .Y(\PartRem[8][2] ) );
  NAND2X2 U98 ( .A(n25), .B(n94), .Y(\PartRem[8][3] ) );
  NAND2X1 U99 ( .A(\SumTmp[7][2] ), .B(n27), .Y(n28) );
  NAND2XL U100 ( .A(\PartRem[8][2] ), .B(n42), .Y(n29) );
  NAND2X1 U101 ( .A(n28), .B(n29), .Y(\PartRem[7][4] ) );
  CLKINVX1 U102 ( .A(n42), .Y(n27) );
  NAND2X1 U103 ( .A(\SumTmp[1][2] ), .B(root[1]), .Y(n32) );
  OAI21X4 U104 ( .A0(n42), .A1(a[14]), .B0(a[15]), .Y(n91) );
  OAI21X2 U105 ( .A0(n77), .A1(n6), .B0(n78), .Y(n74) );
  OA22X4 U106 ( .A0(root[9]), .A1(n2), .B0(n60), .B1(n61), .Y(n56) );
  OA21X4 U107 ( .A0(n68), .A1(n69), .B0(n70), .Y(n65) );
  OAI2BB1XL U108 ( .A0N(n69), .A1N(n68), .B0(n41), .Y(n70) );
  OAI21X2 U109 ( .A0(n65), .A1(n66), .B0(n67), .Y(n62) );
  OAI211X2 U110 ( .A0(n52), .A1(n53), .B0(n54), .C0(n55), .Y(root[0]) );
  MXI2X4 U111 ( .A(\PartRem[2][5] ), .B(\SumTmp[1][5] ), .S0(root[1]), .Y(n69)
         );
  MXI2X2 U112 ( .A(\PartRem[2][7] ), .B(\SumTmp[1][7] ), .S0(root[1]), .Y(n64)
         );
  OA21X4 U113 ( .A0(n80), .A1(n81), .B0(n82), .Y(n77) );
  OAI2BB1XL U114 ( .A0N(n81), .A1N(n80), .B0(n37), .Y(n82) );
  OA22X4 U115 ( .A0(root[5]), .A1(n5), .B0(n72), .B1(n73), .Y(n68) );
  OA21X4 U116 ( .A0(n56), .A1(n57), .B0(n58), .Y(n52) );
  NOR2BX4 U117 ( .AN(n96), .B(\CryTmp[6][7] ), .Y(\PartRoot[6][2] ) );
  MX2XL U118 ( .A(\SumTmp[5][6] ), .B(\PartRem[6][6] ), .S0(n40), .Y(
        \PartRem[5][8] ) );
  MX2XL U119 ( .A(\SumTmp[4][7] ), .B(\PartRem[5][7] ), .S0(n39), .Y(
        \PartRem[4][9] ) );
  MX2XL U120 ( .A(\SumTmp[2][9] ), .B(\PartRem[3][9] ), .S0(n37), .Y(
        \PartRem[2][11] ) );
  XOR2XL U121 ( .A(n50), .B(\CryTmp[10][2] ), .Y(\SumTmp[10][2] ) );
  MX2XL U122 ( .A(\SumTmp[4][6] ), .B(\PartRem[5][6] ), .S0(n39), .Y(
        \PartRem[4][8] ) );
  MX2XL U123 ( .A(\SumTmp[3][7] ), .B(\PartRem[4][7] ), .S0(n38), .Y(
        \PartRem[3][9] ) );
  MX2XL U124 ( .A(\SumTmp[2][8] ), .B(\PartRem[3][8] ), .S0(n37), .Y(
        \PartRem[2][10] ) );
  MXI2XL U125 ( .A(\PartRem[2][8] ), .B(\SumTmp[1][8] ), .S0(root[1]), .Y(n61)
         );
  NOR2BX4 U126 ( .AN(n93), .B(\CryTmp[4][9] ), .Y(\PartRoot[4][2] ) );
  NOR2BX4 U127 ( .AN(n90), .B(\CryTmp[2][11] ), .Y(\PartRoot[2][2] ) );
  NOR2BX4 U128 ( .AN(n92), .B(\CryTmp[3][10] ), .Y(\PartRoot[3][2] ) );
  MXI2XL U129 ( .A(\SumTmp[2][10] ), .B(\PartRem[3][10] ), .S0(n37), .Y(n85)
         );
  NOR2BX4 U130 ( .AN(n95), .B(\CryTmp[5][8] ), .Y(\PartRoot[5][2] ) );
  NOR2BX4 U131 ( .AN(n97), .B(\CryTmp[7][6] ), .Y(\PartRoot[7][2] ) );
  MX2XL U132 ( .A(\SumTmp[6][3] ), .B(\PartRem[7][3] ), .S0(n41), .Y(
        \PartRem[6][5] ) );
  MX2XL U133 ( .A(\SumTmp[5][2] ), .B(\PartRem[6][2] ), .S0(n40), .Y(
        \PartRem[5][4] ) );
  MX2XL U134 ( .A(\SumTmp[6][5] ), .B(\PartRem[7][5] ), .S0(n41), .Y(
        \PartRem[6][7] ) );
  MX2XL U135 ( .A(\SumTmp[7][4] ), .B(n4), .S0(n42), .Y(\PartRem[7][6] ) );
  NOR2BX4 U136 ( .AN(n98), .B(\CryTmp[8][5] ), .Y(\PartRoot[8][2] ) );
  MX2XL U137 ( .A(\SumTmp[4][2] ), .B(\PartRem[5][2] ), .S0(n39), .Y(
        \PartRem[4][4] ) );
  MX2XL U138 ( .A(\SumTmp[4][3] ), .B(\PartRem[5][3] ), .S0(n39), .Y(
        \PartRem[4][5] ) );
  MX2XL U139 ( .A(\SumTmp[3][2] ), .B(\PartRem[4][2] ), .S0(n38), .Y(
        \PartRem[3][4] ) );
  MX2XL U140 ( .A(\SumTmp[7][3] ), .B(\PartRem[8][3] ), .S0(n42), .Y(
        \PartRem[7][5] ) );
  MX2XL U141 ( .A(\SumTmp[8][2] ), .B(\PartRem[9][2] ), .S0(n43), .Y(
        \PartRem[8][4] ) );
  MX2XL U142 ( .A(\SumTmp[9][2] ), .B(\PartRem[10][2] ), .S0(n44), .Y(
        \PartRem[9][4] ) );
  MX2XL U143 ( .A(\SumTmp[8][3] ), .B(\PartRem[9][3] ), .S0(n43), .Y(
        \PartRem[8][5] ) );
  CLKINVX1 U144 ( .A(n40), .Y(root[5]) );
  CLKINVX1 U145 ( .A(n42), .Y(root[7]) );
  CLKINVX1 U146 ( .A(n38), .Y(n46) );
  MXI2X1 U147 ( .A(\PartRem[2][11] ), .B(\SumTmp[1][11] ), .S0(root[1]), .Y(
        n55) );
  MXI2X1 U148 ( .A(\PartRem[2][10] ), .B(\SumTmp[1][10] ), .S0(root[1]), .Y(
        n53) );
  MXI2X1 U149 ( .A(\PartRem[2][9] ), .B(\SumTmp[1][9] ), .S0(root[1]), .Y(n57)
         );
  OAI2BB1X1 U150 ( .A0N(n66), .A1N(n65), .B0(n42), .Y(n67) );
  AOI2BB2X1 U151 ( .B0(n39), .B1(n74), .A0N(n75), .A1N(n76), .Y(n71) );
  NOR2X1 U152 ( .A(n39), .B(n74), .Y(n75) );
  OAI2BB1X1 U153 ( .A0N(n6), .A1N(n77), .B0(n38), .Y(n78) );
  OR2X1 U154 ( .A(a[0]), .B(a[1]), .Y(n83) );
  CLKINVX1 U155 ( .A(n37), .Y(root[2]) );
  CLKMX2X2 U156 ( .A(\SumTmp[3][8] ), .B(\PartRem[4][8] ), .S0(n38), .Y(
        \PartRem[3][10] ) );
  CLKMX2X2 U157 ( .A(\SumTmp[5][4] ), .B(\PartRem[6][4] ), .S0(n40), .Y(
        \PartRem[5][6] ) );
  CLKMX2X2 U158 ( .A(\SumTmp[2][7] ), .B(\PartRem[3][7] ), .S0(n37), .Y(
        \PartRem[2][9] ) );
  CLKMX2X2 U159 ( .A(\SumTmp[3][5] ), .B(\PartRem[4][5] ), .S0(n38), .Y(
        \PartRem[3][7] ) );
  CLKMX2X2 U160 ( .A(\SumTmp[2][6] ), .B(\PartRem[3][6] ), .S0(n37), .Y(
        \PartRem[2][8] ) );
  CLKMX2X2 U161 ( .A(\SumTmp[3][4] ), .B(\PartRem[4][4] ), .S0(n38), .Y(
        \PartRem[3][6] ) );
  CLKMX2X2 U162 ( .A(\SumTmp[2][5] ), .B(\PartRem[3][5] ), .S0(n37), .Y(
        \PartRem[2][7] ) );
  CLKMX2X2 U163 ( .A(\SumTmp[2][4] ), .B(\PartRem[3][4] ), .S0(n37), .Y(
        \PartRem[2][6] ) );
  CLKMX2X2 U164 ( .A(\SumTmp[4][5] ), .B(\PartRem[5][5] ), .S0(n39), .Y(
        \PartRem[4][7] ) );
  MXI2X1 U165 ( .A(\PartRem[4][9] ), .B(\SumTmp[3][9] ), .S0(n46), .Y(n90) );
  CLKINVX1 U166 ( .A(n38), .Y(root[3]) );
  CLKMX2X2 U167 ( .A(\SumTmp[5][5] ), .B(\PartRem[6][5] ), .S0(n40), .Y(
        \PartRem[5][7] ) );
  CLKMX2X2 U168 ( .A(\SumTmp[3][6] ), .B(\PartRem[4][6] ), .S0(n38), .Y(
        \PartRem[3][8] ) );
  MXI2X1 U169 ( .A(\PartRem[5][8] ), .B(\SumTmp[4][8] ), .S0(root[4]), .Y(n92)
         );
  CLKINVX1 U170 ( .A(n39), .Y(root[4]) );
  MXI2X1 U171 ( .A(\PartRem[6][7] ), .B(\SumTmp[5][7] ), .S0(root[5]), .Y(n93)
         );
  MXI2X1 U172 ( .A(\PartRem[7][6] ), .B(\SumTmp[6][6] ), .S0(root[6]), .Y(n95)
         );
  CLKINVX1 U173 ( .A(n41), .Y(root[6]) );
  MXI2X1 U174 ( .A(\PartRem[8][5] ), .B(\SumTmp[7][5] ), .S0(root[7]), .Y(n96)
         );
  MXI2X1 U175 ( .A(\PartRem[9][4] ), .B(\SumTmp[8][4] ), .S0(root[8]), .Y(n97)
         );
  MXI2X1 U176 ( .A(\PartRem[10][3] ), .B(\SumTmp[9][3] ), .S0(root[9]), .Y(n98) );
  OR2X1 U177 ( .A(a[15]), .B(a[14]), .Y(\CryTmp[7][2] ) );
  OR2X1 U178 ( .A(a[11]), .B(a[10]), .Y(\CryTmp[5][2] ) );
  OR2X1 U179 ( .A(a[9]), .B(a[8]), .Y(\CryTmp[4][2] ) );
  OR2X1 U180 ( .A(a[7]), .B(a[6]), .Y(\CryTmp[3][2] ) );
  OR2X1 U181 ( .A(a[5]), .B(a[4]), .Y(\CryTmp[2][2] ) );
  OR2X1 U182 ( .A(a[3]), .B(a[2]), .Y(\CryTmp[1][2] ) );
endmodule


module READ_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [12:0] carry;

  ADDFXL U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n6), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_2 ( .A(A[2]), .B(n12), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n11), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n3), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CLKINVX3 U1 ( .A(B[2]), .Y(n12) );
  INVXL U2 ( .A(B[4]), .Y(n11) );
  CLKINVX4 U3 ( .A(n13), .Y(n1) );
  XNOR2XL U4 ( .A(n13), .B(A[0]), .Y(DIFF[0]) );
  INVXL U5 ( .A(B[8]), .Y(n8) );
  INVXL U6 ( .A(B[5]), .Y(n10) );
  INVXL U7 ( .A(B[3]), .Y(n4) );
  INVXL U8 ( .A(B[10]), .Y(n7) );
  CLKINVX1 U9 ( .A(B[0]), .Y(n13) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n9) );
  CLKINVX1 U11 ( .A(B[9]), .Y(n6) );
  NAND2X1 U12 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U13 ( .A(B[1]), .Y(n3) );
  CLKINVX1 U14 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U15 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U16 ( .A(carry[11]), .Y(DIFF[11]) );
endmodule


module READ_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [12:0] carry;

  ADDFXL U2_10 ( .A(A[10]), .B(n2), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFHX1 U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFHX2 U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  CLKINVX8 U1 ( .A(A[0]), .Y(n1) );
  CLKINVX3 U2 ( .A(B[5]), .Y(n7) );
  CLKINVX1 U3 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U4 ( .A(B[2]), .Y(n10) );
  INVX3 U5 ( .A(B[1]), .Y(n11) );
  INVX3 U6 ( .A(B[4]), .Y(n8) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  XNOR2XL U8 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  INVXL U9 ( .A(B[8]), .Y(n4) );
  INVXL U10 ( .A(B[3]), .Y(n9) );
  INVXL U11 ( .A(B[10]), .Y(n2) );
  NAND2X1 U12 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U13 ( .A(B[6]), .Y(n6) );
  CLKINVX1 U14 ( .A(B[9]), .Y(n3) );
  CLKINVX1 U15 ( .A(carry[11]), .Y(DIFF[11]) );
endmodule


module READ_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [12:0] carry;

  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n15), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n14), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFHX1 U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFHX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFHX2 U2_8 ( .A(A[8]), .B(n12), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX2 U2_6 ( .A(A[6]), .B(n13), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  INVXL U1 ( .A(B[4]), .Y(n15) );
  INVX1 U2 ( .A(B[2]), .Y(n16) );
  CLKINVX1 U3 ( .A(n17), .Y(n5) );
  XOR2XL U4 ( .A(n10), .B(A[9]), .Y(n1) );
  XOR2X4 U5 ( .A(carry[9]), .B(n1), .Y(DIFF[9]) );
  NAND2X1 U6 ( .A(n10), .B(carry[9]), .Y(n2) );
  NAND2X1 U7 ( .A(A[9]), .B(carry[9]), .Y(n3) );
  NAND2X1 U8 ( .A(A[9]), .B(n10), .Y(n4) );
  NAND3X2 U9 ( .A(n2), .B(n3), .C(n4), .Y(carry[10]) );
  NAND2X2 U10 ( .A(n5), .B(n6), .Y(carry[1]) );
  INVXL U11 ( .A(B[1]), .Y(n7) );
  INVXL U12 ( .A(A[0]), .Y(n6) );
  INVXL U13 ( .A(B[10]), .Y(n11) );
  CLKINVX1 U14 ( .A(B[0]), .Y(n17) );
  XNOR2X1 U15 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U16 ( .A(B[5]), .Y(n14) );
  CLKINVX1 U17 ( .A(B[6]), .Y(n13) );
  CLKINVX1 U18 ( .A(B[8]), .Y(n12) );
  CLKINVX1 U19 ( .A(B[9]), .Y(n10) );
  CLKINVX1 U20 ( .A(B[7]), .Y(n9) );
  CLKINVX1 U21 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U22 ( .A(carry[11]), .Y(DIFF[11]) );
endmodule


module READ_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [12:0] carry;

  ADDFXL U2_10 ( .A(A[10]), .B(n2), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CMPR32X2 U2_1 ( .A(A[1]), .B(n11), .C(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFHX2 U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  CMPR32X2 U2_2 ( .A(A[2]), .B(n10), .C(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  CLKINVX8 U1 ( .A(A[0]), .Y(n1) );
  CLKINVX8 U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[8]), .Y(n4) );
  INVXL U4 ( .A(B[3]), .Y(n9) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[7]), .Y(n5) );
  INVXL U7 ( .A(B[10]), .Y(n2) );
  INVXL U8 ( .A(B[0]), .Y(n12) );
  XNOR2X1 U9 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U10 ( .A(B[1]), .Y(n11) );
  NAND2X1 U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U12 ( .A(B[4]), .Y(n8) );
  CLKINVX1 U13 ( .A(B[6]), .Y(n6) );
  CLKINVX1 U14 ( .A(B[9]), .Y(n3) );
  CLKINVX1 U15 ( .A(carry[11]), .Y(DIFF[11]) );
endmodule


module READ_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [12:0] carry;

  ADDFXL U2_2 ( .A(A[2]), .B(n12), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFHX2 U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX2 U2_9 ( .A(A[9]), .B(n6), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFHX2 U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX4 U2_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_3 ( .A(A[3]), .B(n4), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFHX4 U2_4 ( .A(A[4]), .B(n11), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFHX2 U2_1 ( .A(A[1]), .B(n3), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CLKINVX2 U1 ( .A(B[2]), .Y(n12) );
  INVXL U2 ( .A(B[0]), .Y(n13) );
  AND2XL U3 ( .A(n7), .B(carry[10]), .Y(n1) );
  XNOR2XL U4 ( .A(n13), .B(A[0]), .Y(DIFF[0]) );
  INVXL U5 ( .A(B[9]), .Y(n6) );
  INVXL U6 ( .A(B[6]), .Y(n9) );
  INVXL U7 ( .A(B[4]), .Y(n11) );
  INVXL U8 ( .A(B[7]), .Y(n5) );
  INVXL U9 ( .A(B[8]), .Y(n8) );
  INVXL U10 ( .A(B[5]), .Y(n10) );
  INVXL U11 ( .A(B[3]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[10]), .Y(n7) );
  XOR2X1 U13 ( .A(n7), .B(carry[10]), .Y(DIFF[10]) );
  NAND2X1 U14 ( .A(B[0]), .B(n2), .Y(carry[1]) );
  CLKINVX1 U15 ( .A(B[1]), .Y(n3) );
  CLKINVX1 U16 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U17 ( .A(n1), .Y(DIFF[11]) );
endmodule


module READ_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [12:0] carry;

  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFHX4 U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFHX2 U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFHX1 U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX2 U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFHX1 U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX1 U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFHX4 U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  CLKINVX8 U1 ( .A(A[0]), .Y(n2) );
  NOR2X1 U2 ( .A(A[10]), .B(carry[10]), .Y(DIFF[11]) );
  XNOR2XL U3 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  INVXL U4 ( .A(B[3]), .Y(n9) );
  INVXL U5 ( .A(B[8]), .Y(n4) );
  INVXL U6 ( .A(B[5]), .Y(n7) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  XNOR2X1 U8 ( .A(A[10]), .B(carry[10]), .Y(DIFF[10]) );
  CLKINVX1 U9 ( .A(B[9]), .Y(n3) );
  CLKINVX1 U10 ( .A(B[1]), .Y(n11) );
  NAND2X1 U11 ( .A(B[0]), .B(n2), .Y(carry[1]) );
  CLKINVX1 U12 ( .A(B[2]), .Y(n10) );
  CLKINVX1 U13 ( .A(B[4]), .Y(n8) );
  CLKINVX1 U14 ( .A(B[6]), .Y(n6) );
  CLKINVX1 U15 ( .A(B[7]), .Y(n5) );
endmodule


module READ_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CMPR32X2 U2_4 ( .A(A[4]), .B(n8), .C(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CLKINVX1 U1 ( .A(B[1]), .Y(n11) );
  CLKINVX1 U2 ( .A(B[5]), .Y(n7) );
  INVXL U3 ( .A(B[4]), .Y(n8) );
  NAND2X1 U4 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVXL U5 ( .A(n12), .Y(n1) );
  INVXL U6 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U7 ( .A(B[0]), .Y(n12) );
  XNOR2X1 U8 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U9 ( .A(B[3]), .Y(n9) );
  CLKINVX1 U10 ( .A(B[2]), .Y(n10) );
  CLKINVX1 U11 ( .A(B[6]), .Y(n6) );
  CLKINVX1 U12 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U14 ( .A(B[9]), .Y(n3) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CMPR32X2 U2_5 ( .A(A[5]), .B(n6), .C(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVX1 U1 ( .A(B[4]), .Y(n7) );
  INVXL U2 ( .A(B[0]), .Y(n11) );
  INVXL U3 ( .A(B[5]), .Y(n6) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(A[0]), .Y(n1) );
  INVXL U6 ( .A(B[6]), .Y(n5) );
  INVXL U7 ( .A(B[1]), .Y(n10) );
  INVXL U8 ( .A(B[9]), .Y(n2) );
  XNOR2X1 U9 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U10 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U11 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U12 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_8 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CLKINVX1 U1 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U2 ( .A(B[0]), .Y(n11) );
  XNOR2X1 U3 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U4 ( .A(B[1]), .Y(n10) );
  NAND2X1 U5 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U7 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U8 ( .A(B[4]), .Y(n7) );
  CLKINVX1 U9 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U10 ( .A(B[6]), .Y(n5) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_9 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  CMPR32X2 U2_5 ( .A(A[5]), .B(n6), .C(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[0]), .Y(n11) );
  NAND2X1 U2 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U3 ( .A(A[0]), .Y(n1) );
  INVXL U4 ( .A(B[5]), .Y(n6) );
  INVXL U5 ( .A(B[4]), .Y(n7) );
  INVXL U6 ( .A(B[2]), .Y(n9) );
  INVXL U7 ( .A(B[6]), .Y(n5) );
  INVXL U8 ( .A(B[1]), .Y(n10) );
  XNOR2X1 U9 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U10 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_10 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n10) );
  INVXL U2 ( .A(B[2]), .Y(n9) );
  INVXL U3 ( .A(B[3]), .Y(n8) );
  INVXL U4 ( .A(B[4]), .Y(n7) );
  INVXL U5 ( .A(B[5]), .Y(n6) );
  INVXL U6 ( .A(B[6]), .Y(n5) );
  INVXL U7 ( .A(B[0]), .Y(n11) );
  NAND2X1 U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U9 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U12 ( .A(B[9]), .Y(n2) );
  XNOR2X1 U13 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_12 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_13 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2XL U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  INVXL U2 ( .A(B[1]), .Y(n10) );
  INVXL U3 ( .A(B[2]), .Y(n9) );
  INVXL U4 ( .A(B[3]), .Y(n8) );
  INVXL U5 ( .A(B[4]), .Y(n7) );
  INVXL U6 ( .A(B[5]), .Y(n6) );
  INVXL U7 ( .A(B[6]), .Y(n5) );
  INVXL U8 ( .A(B[0]), .Y(n11) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_14 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_15 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_16 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_17 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n10) );
  INVXL U2 ( .A(B[2]), .Y(n9) );
  INVXL U3 ( .A(B[3]), .Y(n8) );
  INVXL U4 ( .A(B[4]), .Y(n7) );
  INVXL U5 ( .A(B[5]), .Y(n6) );
  INVXL U6 ( .A(B[6]), .Y(n5) );
  INVXL U7 ( .A(B[0]), .Y(n11) );
  NAND2X1 U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U9 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U12 ( .A(B[9]), .Y(n2) );
  XNOR2X1 U13 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_18 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2XL U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  INVXL U2 ( .A(B[1]), .Y(n10) );
  INVXL U3 ( .A(B[2]), .Y(n9) );
  INVXL U4 ( .A(B[3]), .Y(n8) );
  INVXL U5 ( .A(B[4]), .Y(n7) );
  INVXL U6 ( .A(B[5]), .Y(n6) );
  INVXL U7 ( .A(B[6]), .Y(n5) );
  INVXL U8 ( .A(B[0]), .Y(n11) );
  NAND2X1 U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW01_sub_19 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n3), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n4), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n5), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n6), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n7), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n8), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n9), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n10), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n11), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  INVXL U1 ( .A(B[1]), .Y(n11) );
  INVXL U2 ( .A(B[2]), .Y(n10) );
  INVXL U3 ( .A(B[3]), .Y(n9) );
  INVXL U4 ( .A(B[4]), .Y(n8) );
  INVXL U5 ( .A(B[5]), .Y(n7) );
  INVXL U6 ( .A(B[6]), .Y(n6) );
  INVXL U7 ( .A(B[0]), .Y(n12) );
  CLKINVX1 U8 ( .A(n12), .Y(n1) );
  NAND2X1 U9 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX1 U10 ( .A(A[0]), .Y(n2) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n5) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n4) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n3) );
  XNOR2X1 U14 ( .A(n12), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U15 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module READ_DW_mult_uns_4 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n132,
         n133, n134, n135, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536;

  CMPR42X1 U28 ( .A(n159), .B(n37), .C(n38), .D(n31), .ICI(n34), .S(n29), 
        .ICO(n27), .CO(n28) );
  ADDFXL U29 ( .A(n147), .B(n33), .CI(n137), .CO(n30), .S(n31) );
  CMPR42X1 U31 ( .A(n138), .B(n43), .C(n39), .D(n44), .ICI(n40), .S(n36), 
        .ICO(n34), .CO(n35) );
  CMPR42X1 U32 ( .A(n436), .B(n132), .C(n172), .D(n148), .ICI(n160), .S(n39), 
        .ICO(n37), .CO(n38) );
  CMPR42X1 U33 ( .A(n51), .B(n54), .C(n45), .D(n52), .ICI(n48), .S(n42), .ICO(
        n40), .CO(n41) );
  CMPR42X1 U36 ( .A(n62), .B(n55), .C(n60), .D(n53), .ICI(n56), .S(n50), .ICO(
        n48), .CO(n49) );
  CMPR42X1 U37 ( .A(n150), .B(n174), .C(n162), .D(n140), .ICI(n59), .S(n53), 
        .ICO(n51), .CO(n52) );
  ADDFXL U38 ( .A(n133), .B(n435), .CI(n186), .CO(n54), .S(n55) );
  CMPR42X1 U39 ( .A(n63), .B(n72), .C(n70), .D(n61), .ICI(n66), .S(n58), .ICO(
        n56), .CO(n57) );
  CMPR42X1 U40 ( .A(n151), .B(n187), .C(n175), .D(n141), .ICI(n69), .S(n61), 
        .ICO(n59), .CO(n60) );
  ADDFXL U41 ( .A(n74), .B(n134), .CI(n163), .CO(n62), .S(n63) );
  CMPR42X1 U43 ( .A(n73), .B(n81), .C(n79), .D(n71), .ICI(n75), .S(n68), .ICO(
        n66), .CO(n67) );
  CMPR42X1 U44 ( .A(n152), .B(n176), .C(n164), .D(n142), .ICI(n78), .S(n71), 
        .ICO(n69), .CO(n70) );
  ADDFXL U45 ( .A(n424), .B(n74), .CI(n188), .CO(n72), .S(n73) );
  CMPR42X1 U48 ( .A(n189), .B(n143), .C(n177), .D(n165), .ICI(n86), .S(n80), 
        .ICO(n78), .CO(n79) );
  ADDFXL U49 ( .A(n153), .B(n135), .CI(n201), .CO(n81), .S(n82) );
  CMPR42X1 U51 ( .A(n202), .B(n154), .C(n190), .D(n166), .ICI(n94), .S(n88), 
        .ICO(n86), .CO(n87) );
  ADDHXL U52 ( .A(n144), .B(n125), .CO(n89), .S(n90) );
  CMPR42X1 U53 ( .A(n179), .B(n102), .C(n96), .D(n100), .ICI(n97), .S(n93), 
        .ICO(n91), .CO(n92) );
  ADDFXL U56 ( .A(n168), .B(n180), .CI(n192), .CO(n100), .S(n101) );
  ADDFXL U59 ( .A(n181), .B(n157), .CI(n205), .CO(n107), .S(n108) );
  CMPR42X1 U60 ( .A(n206), .B(n182), .C(n194), .D(n114), .ICI(n113), .S(n111), 
        .ICO(n109), .CO(n110) );
  OR2X8 U299 ( .A(n477), .B(n400), .Y(n414) );
  XOR2X2 U300 ( .A(n11), .B(n408), .Y(product[12]) );
  ADDFHX2 U301 ( .A(n36), .B(n41), .CI(n6), .CO(n5), .S(product[17]) );
  ADDFHX2 U302 ( .A(n42), .B(n49), .CI(n7), .CO(n6), .S(product[16]) );
  XOR2X1 U303 ( .A(n14), .B(n402), .Y(product[9]) );
  ADDFHX4 U304 ( .A(n111), .B(n115), .CI(n16), .CO(n15), .S(product[7]) );
  NAND2X6 U305 ( .A(n84), .B(n11), .Y(n409) );
  ADDHX4 U306 ( .A(n210), .B(n198), .CO(n123), .S(n124) );
  NOR2X1 U307 ( .A(n423), .B(n444), .Y(product[0]) );
  BUFX6 U308 ( .A(n185), .Y(n399) );
  NAND2X6 U309 ( .A(n77), .B(n11), .Y(n410) );
  CMPR32X2 U310 ( .A(n196), .B(n208), .C(n120), .CO(n117), .S(n118) );
  OR2X8 U311 ( .A(n418), .B(n419), .Y(n211) );
  NOR2X1 U312 ( .A(n466), .B(n423), .Y(n419) );
  NOR2X2 U313 ( .A(n465), .B(n428), .Y(n418) );
  NAND2X2 U314 ( .A(n416), .B(n417), .Y(n210) );
  CLKINVX6 U315 ( .A(a[0]), .Y(n438) );
  ADDFHX4 U316 ( .A(n209), .B(n399), .CI(n197), .CO(n121), .S(n122) );
  OAI22X1 U317 ( .A0(n467), .A1(n428), .B0(n468), .B1(n423), .Y(n209) );
  XOR2X4 U318 ( .A(n445), .B(n4), .Y(product[19]) );
  ADDFHX4 U319 ( .A(n35), .B(n29), .CI(n5), .CO(n4), .S(product[18]) );
  BUFX20 U320 ( .A(n464), .Y(n428) );
  CMPR42X1 U321 ( .A(n145), .B(n167), .C(n203), .D(n191), .ICI(n155), .S(n96), 
        .ICO(n94), .CO(n95) );
  XOR2X2 U322 ( .A(n440), .B(n434), .Y(n477) );
  CMPR42X1 U323 ( .A(n171), .B(n207), .C(n195), .D(n183), .ICI(n119), .S(n116), 
        .ICO(n114), .CO(n115) );
  NAND2X1 U324 ( .A(n406), .B(n407), .Y(n207) );
  NOR2X1 U325 ( .A(n430), .B(n444), .Y(n185) );
  ADDFHX2 U326 ( .A(n117), .B(n116), .CI(n17), .CO(n16), .S(product[6]) );
  ADDFHX2 U327 ( .A(n122), .B(n123), .CI(n19), .CO(n18), .S(product[4]) );
  NAND2X4 U328 ( .A(n429), .B(n532), .Y(n400) );
  NAND2X4 U329 ( .A(n430), .B(n533), .Y(n401) );
  INVX3 U330 ( .A(a[3]), .Y(n440) );
  ADDFHX4 U331 ( .A(n124), .B(n129), .CI(n20), .CO(n19), .S(product[3]) );
  OAI32X4 U332 ( .A0(n440), .A1(n434), .A2(n429), .B0(n440), .B1(n400), .Y(
        n129) );
  NAND2X4 U333 ( .A(a[1]), .B(n423), .Y(n464) );
  XOR2X1 U334 ( .A(n99), .B(n105), .Y(n402) );
  NAND2X4 U335 ( .A(n99), .B(n14), .Y(n403) );
  NAND2X4 U336 ( .A(n105), .B(n14), .Y(n404) );
  NAND2X1 U337 ( .A(n105), .B(n99), .Y(n405) );
  NAND3X4 U338 ( .A(n403), .B(n404), .C(n405), .Y(n13) );
  CMPR42X2 U339 ( .A(n204), .B(n103), .C(n104), .D(n107), .ICI(n101), .S(n99), 
        .ICO(n97), .CO(n98) );
  CMPR42X4 U340 ( .A(n193), .B(n169), .C(n112), .D(n109), .ICI(n108), .S(n106), 
        .ICO(n104), .CO(n105) );
  OR2X2 U341 ( .A(n469), .B(n428), .Y(n406) );
  OR2X1 U342 ( .A(n470), .B(n423), .Y(n407) );
  XOR2X1 U343 ( .A(n84), .B(n77), .Y(n408) );
  NAND2X4 U344 ( .A(n77), .B(n84), .Y(n411) );
  NAND3X8 U345 ( .A(n409), .B(n410), .C(n411), .Y(n10) );
  CMPR42X2 U346 ( .A(n89), .B(n82), .C(n87), .D(n80), .ICI(n83), .S(n77), 
        .ICO(n75), .CO(n76) );
  CMPR42X2 U347 ( .A(n178), .B(n90), .C(n95), .D(n88), .ICI(n91), .S(n85), 
        .ICO(n83), .CO(n84) );
  ADDFHX4 U348 ( .A(n68), .B(n76), .CI(n10), .CO(n9), .S(product[13]) );
  ADDFHX4 U349 ( .A(n85), .B(n92), .CI(n12), .CO(n11), .S(product[11]) );
  NOR2X6 U350 ( .A(n490), .B(n401), .Y(n412) );
  NOR2XL U351 ( .A(n430), .B(n491), .Y(n413) );
  OR2X8 U352 ( .A(n412), .B(n413), .Y(n184) );
  XOR2X4 U353 ( .A(n425), .B(n434), .Y(n490) );
  CLKBUFX3 U354 ( .A(n489), .Y(n430) );
  ADDHX4 U355 ( .A(n184), .B(n128), .CO(n119), .S(n120) );
  OR2X1 U356 ( .A(n429), .B(n478), .Y(n415) );
  NAND2X6 U357 ( .A(n414), .B(n415), .Y(n198) );
  BUFX8 U358 ( .A(n476), .Y(n429) );
  XOR2X1 U359 ( .A(b[1]), .B(n440), .Y(n478) );
  ADDFHX4 U360 ( .A(n106), .B(n110), .CI(n15), .CO(n14), .S(product[8]) );
  OR2X1 U361 ( .A(n466), .B(n428), .Y(n416) );
  OR2XL U362 ( .A(n467), .B(n423), .Y(n417) );
  XOR2X1 U363 ( .A(b[3]), .B(n424), .Y(n467) );
  XOR2X1 U364 ( .A(b[1]), .B(n424), .Y(n465) );
  XOR2X1 U365 ( .A(b[2]), .B(n424), .Y(n466) );
  BUFX20 U366 ( .A(n438), .Y(n423) );
  ADDFHX4 U367 ( .A(n211), .B(n199), .CI(n21), .CO(n20), .S(product[2]) );
  OAI22X2 U368 ( .A0(n434), .A1(n428), .B0(n465), .B1(n423), .Y(n212) );
  OAI21X2 U369 ( .A0(n434), .A1(n424), .B0(n428), .Y(n130) );
  ADDHX2 U370 ( .A(n130), .B(n212), .CO(n21), .S(product[1]) );
  XOR2X1 U371 ( .A(b[9]), .B(n424), .Y(n473) );
  XOR2XL U372 ( .A(a[11]), .B(a[10]), .Y(n536) );
  NOR2X4 U373 ( .A(n432), .B(n444), .Y(n171) );
  NOR2X4 U374 ( .A(n460), .B(n444), .Y(n157) );
  XOR2X4 U375 ( .A(n444), .B(a[11]), .Y(n524) );
  INVX20 U376 ( .A(n434), .Y(n444) );
  ADDFHX4 U377 ( .A(n118), .B(n121), .CI(n18), .CO(n17), .S(product[5]) );
  ADDFHX4 U378 ( .A(n93), .B(n98), .CI(n13), .CO(n12), .S(product[10]) );
  NOR2X2 U379 ( .A(n429), .B(n444), .Y(n199) );
  NOR2X2 U380 ( .A(n433), .B(n444), .Y(n145) );
  XOR2XL U381 ( .A(b[10]), .B(n440), .Y(n487) );
  XOR2XL U382 ( .A(b[10]), .B(n425), .Y(n500) );
  XOR2XL U383 ( .A(a[2]), .B(n424), .Y(n476) );
  OAI22X4 U384 ( .A0(n514), .A1(n459), .B0(n460), .B1(n515), .Y(n156) );
  ADDHX2 U385 ( .A(n156), .B(n126), .CO(n102), .S(n103) );
  CLKBUFX3 U386 ( .A(n441), .Y(n425) );
  CLKBUFX3 U387 ( .A(n463), .Y(n432) );
  XOR2X1 U388 ( .A(a[6]), .B(n425), .Y(n463) );
  OAI22X1 U389 ( .A0(n502), .A1(n431), .B0(n432), .B1(n503), .Y(n170) );
  BUFX20 U390 ( .A(b[0]), .Y(n434) );
  INVXL U391 ( .A(n74), .Y(n435) );
  CMPR42X1 U392 ( .A(n47), .B(n149), .C(n161), .D(n139), .ICI(n173), .S(n45), 
        .ICO(n43), .CO(n44) );
  AO21XL U393 ( .A0(n431), .A1(n432), .B0(n426), .Y(n456) );
  ADDFHX2 U394 ( .A(n50), .B(n57), .CI(n8), .CO(n7), .S(product[15]) );
  ADDFHX2 U395 ( .A(n58), .B(n67), .CI(n9), .CO(n8), .S(product[14]) );
  INVXL U396 ( .A(a[5]), .Y(n441) );
  ADDHX1 U397 ( .A(n170), .B(n127), .CO(n112), .S(n113) );
  OAI32XL U398 ( .A0(n426), .A1(n434), .A2(n432), .B0(n426), .B1(n431), .Y(
        n127) );
  XOR2XL U399 ( .A(b[1]), .B(n425), .Y(n491) );
  XOR2XL U400 ( .A(b[4]), .B(n424), .Y(n468) );
  XOR2XL U401 ( .A(b[5]), .B(n424), .Y(n469) );
  XOR2XL U402 ( .A(b[2]), .B(n440), .Y(n479) );
  XOR2XL U403 ( .A(b[6]), .B(n424), .Y(n470) );
  XOR2XL U404 ( .A(b[7]), .B(n424), .Y(n471) );
  XOR2XL U405 ( .A(b[2]), .B(n425), .Y(n492) );
  XOR2XL U406 ( .A(b[8]), .B(n424), .Y(n472) );
  XOR2XL U407 ( .A(b[3]), .B(n440), .Y(n480) );
  XOR2XL U408 ( .A(b[3]), .B(n425), .Y(n493) );
  XOR2XL U409 ( .A(b[4]), .B(n440), .Y(n481) );
  XOR2XL U410 ( .A(b[5]), .B(n440), .Y(n482) );
  XOR2XL U411 ( .A(b[6]), .B(n440), .Y(n483) );
  XOR2XL U412 ( .A(b[7]), .B(n440), .Y(n484) );
  XOR2XL U413 ( .A(b[8]), .B(n440), .Y(n485) );
  XOR2XL U414 ( .A(b[4]), .B(n425), .Y(n494) );
  XOR2XL U415 ( .A(b[9]), .B(n440), .Y(n486) );
  XOR2XL U416 ( .A(b[5]), .B(n425), .Y(n495) );
  XOR2XL U417 ( .A(b[6]), .B(n425), .Y(n496) );
  XOR2XL U418 ( .A(b[6]), .B(n426), .Y(n508) );
  XOR2XL U419 ( .A(b[7]), .B(n425), .Y(n497) );
  XOR2XL U420 ( .A(b[8]), .B(n425), .Y(n498) );
  XOR2XL U421 ( .A(b[9]), .B(n425), .Y(n499) );
  XOR2XL U422 ( .A(b[6]), .B(n427), .Y(n520) );
  XOR2XL U423 ( .A(b[7]), .B(n426), .Y(n509) );
  XOR2XL U424 ( .A(b[7]), .B(n427), .Y(n521) );
  XOR2XL U425 ( .A(b[1]), .B(n422), .Y(n525) );
  AO21XL U426 ( .A0(n400), .A1(n429), .B0(n440), .Y(n186) );
  XOR2XL U427 ( .A(b[11]), .B(n424), .Y(n475) );
  XOR2XL U428 ( .A(b[2]), .B(n422), .Y(n526) );
  XOR2XL U429 ( .A(b[3]), .B(n422), .Y(n527) );
  XOR2XL U430 ( .A(b[11]), .B(n440), .Y(n488) );
  XOR2XL U431 ( .A(b[4]), .B(n422), .Y(n528) );
  XNOR2X1 U432 ( .A(n448), .B(n420), .Y(n447) );
  XNOR2X1 U433 ( .A(n33), .B(n27), .Y(n420) );
  XOR2XL U434 ( .A(b[5]), .B(n422), .Y(n529) );
  XOR2XL U435 ( .A(b[11]), .B(n425), .Y(n501) );
  XOR2XL U436 ( .A(b[6]), .B(n422), .Y(n530) );
  XNOR2X1 U437 ( .A(n449), .B(n421), .Y(n446) );
  XNOR2X1 U438 ( .A(n450), .B(n451), .Y(n421) );
  XOR2XL U439 ( .A(b[7]), .B(n422), .Y(n531) );
  XOR2XL U440 ( .A(b[8]), .B(n422), .Y(n452) );
  XOR2XL U441 ( .A(a[10]), .B(n427), .Y(n454) );
  XOR2XL U442 ( .A(b[9]), .B(n422), .Y(n455) );
  NAND2XL U443 ( .A(b[1]), .B(a[11]), .Y(n74) );
  NAND2XL U444 ( .A(b[4]), .B(a[11]), .Y(n47) );
  NAND2XL U445 ( .A(b[6]), .B(a[11]), .Y(n33) );
  NAND2XL U446 ( .A(b[7]), .B(a[11]), .Y(n450) );
  CLKBUFX3 U447 ( .A(n439), .Y(n424) );
  CLKINVX1 U448 ( .A(a[1]), .Y(n439) );
  XOR2X1 U449 ( .A(a[4]), .B(n440), .Y(n489) );
  CLKBUFX3 U450 ( .A(n462), .Y(n431) );
  NAND2X1 U451 ( .A(n432), .B(n534), .Y(n462) );
  CLKBUFX3 U452 ( .A(n442), .Y(n426) );
  CLKINVX1 U453 ( .A(a[7]), .Y(n442) );
  CLKXOR2X4 U454 ( .A(a[8]), .B(n426), .Y(n460) );
  NAND2X2 U455 ( .A(n460), .B(n535), .Y(n459) );
  CLKBUFX3 U456 ( .A(n443), .Y(n427) );
  CLKINVX1 U457 ( .A(a[9]), .Y(n443) );
  CLKINVX1 U458 ( .A(n47), .Y(n436) );
  CLKBUFX3 U459 ( .A(n454), .Y(n433) );
  NAND2X2 U460 ( .A(n433), .B(n536), .Y(n453) );
  CLKBUFX3 U461 ( .A(n437), .Y(n422) );
  CLKINVX1 U462 ( .A(a[11]), .Y(n437) );
  XOR2X1 U463 ( .A(n446), .B(n447), .Y(n445) );
  XNOR2X1 U464 ( .A(n30), .B(n28), .Y(n448) );
  OAI22XL U465 ( .A0(n452), .A1(n453), .B0(n433), .B1(n455), .Y(n451) );
  XNOR2X1 U466 ( .A(n456), .B(n457), .Y(n449) );
  OAI22XL U467 ( .A0(n458), .A1(n459), .B0(n460), .B1(n461), .Y(n457) );
  XOR2X1 U468 ( .A(b[11]), .B(n427), .Y(n461) );
  OAI22XL U469 ( .A0(n468), .A1(n428), .B0(n469), .B1(n423), .Y(n208) );
  OAI22XL U470 ( .A0(n470), .A1(n428), .B0(n471), .B1(n423), .Y(n206) );
  OAI22XL U471 ( .A0(n471), .A1(n428), .B0(n472), .B1(n423), .Y(n205) );
  OAI22XL U472 ( .A0(n472), .A1(n428), .B0(n473), .B1(n423), .Y(n204) );
  OAI22XL U473 ( .A0(n473), .A1(n428), .B0(n474), .B1(n423), .Y(n203) );
  OAI22XL U474 ( .A0(n474), .A1(n428), .B0(n475), .B1(n423), .Y(n202) );
  XOR2X1 U475 ( .A(b[10]), .B(n424), .Y(n474) );
  OAI22XL U476 ( .A0(n475), .A1(n428), .B0(n424), .B1(n423), .Y(n201) );
  OAI22XL U477 ( .A0(n478), .A1(n400), .B0(n429), .B1(n479), .Y(n197) );
  OAI22XL U478 ( .A0(n479), .A1(n400), .B0(n429), .B1(n480), .Y(n196) );
  OAI22XL U479 ( .A0(n480), .A1(n400), .B0(n429), .B1(n481), .Y(n195) );
  OAI22XL U480 ( .A0(n481), .A1(n400), .B0(n429), .B1(n482), .Y(n194) );
  OAI22XL U481 ( .A0(n482), .A1(n400), .B0(n429), .B1(n483), .Y(n193) );
  OAI22XL U482 ( .A0(n483), .A1(n400), .B0(n429), .B1(n484), .Y(n192) );
  OAI22XL U483 ( .A0(n484), .A1(n400), .B0(n429), .B1(n485), .Y(n191) );
  OAI22XL U484 ( .A0(n485), .A1(n400), .B0(n429), .B1(n486), .Y(n190) );
  OAI22XL U485 ( .A0(n486), .A1(n400), .B0(n429), .B1(n487), .Y(n189) );
  OAI22XL U486 ( .A0(n487), .A1(n400), .B0(n429), .B1(n488), .Y(n188) );
  OAI22XL U487 ( .A0(n488), .A1(n400), .B0(n429), .B1(n440), .Y(n187) );
  OAI22XL U488 ( .A0(n491), .A1(n401), .B0(n430), .B1(n492), .Y(n183) );
  OAI22XL U489 ( .A0(n492), .A1(n401), .B0(n430), .B1(n493), .Y(n182) );
  OAI22XL U490 ( .A0(n493), .A1(n401), .B0(n430), .B1(n494), .Y(n181) );
  OAI22XL U491 ( .A0(n494), .A1(n401), .B0(n430), .B1(n495), .Y(n180) );
  OAI22XL U492 ( .A0(n495), .A1(n401), .B0(n430), .B1(n496), .Y(n179) );
  OAI22XL U493 ( .A0(n496), .A1(n401), .B0(n430), .B1(n497), .Y(n178) );
  OAI22XL U494 ( .A0(n497), .A1(n401), .B0(n430), .B1(n498), .Y(n177) );
  OAI22XL U495 ( .A0(n498), .A1(n401), .B0(n430), .B1(n499), .Y(n176) );
  OAI22XL U496 ( .A0(n499), .A1(n401), .B0(n430), .B1(n500), .Y(n175) );
  OAI22XL U497 ( .A0(n500), .A1(n401), .B0(n430), .B1(n501), .Y(n174) );
  OAI22XL U498 ( .A0(n501), .A1(n401), .B0(n430), .B1(n425), .Y(n173) );
  AO21X1 U499 ( .A0(n401), .A1(n430), .B0(n425), .Y(n172) );
  XOR2X1 U500 ( .A(n426), .B(n434), .Y(n502) );
  OAI22XL U501 ( .A0(n503), .A1(n431), .B0(n432), .B1(n504), .Y(n169) );
  XOR2X1 U502 ( .A(b[1]), .B(n426), .Y(n503) );
  OAI22XL U503 ( .A0(n504), .A1(n431), .B0(n432), .B1(n505), .Y(n168) );
  XOR2X1 U504 ( .A(b[2]), .B(n426), .Y(n504) );
  OAI22XL U505 ( .A0(n505), .A1(n431), .B0(n432), .B1(n506), .Y(n167) );
  XOR2X1 U506 ( .A(b[3]), .B(n426), .Y(n505) );
  OAI22XL U507 ( .A0(n506), .A1(n431), .B0(n432), .B1(n507), .Y(n166) );
  XOR2X1 U508 ( .A(b[4]), .B(n426), .Y(n506) );
  OAI22XL U509 ( .A0(n507), .A1(n431), .B0(n432), .B1(n508), .Y(n165) );
  XOR2X1 U510 ( .A(b[5]), .B(n426), .Y(n507) );
  OAI22XL U511 ( .A0(n508), .A1(n431), .B0(n432), .B1(n509), .Y(n164) );
  OAI22XL U512 ( .A0(n509), .A1(n431), .B0(n432), .B1(n510), .Y(n163) );
  OAI22XL U513 ( .A0(n510), .A1(n431), .B0(n432), .B1(n511), .Y(n162) );
  XOR2X1 U514 ( .A(b[8]), .B(n426), .Y(n510) );
  OAI22XL U515 ( .A0(n511), .A1(n431), .B0(n432), .B1(n512), .Y(n161) );
  XOR2X1 U516 ( .A(b[9]), .B(n426), .Y(n511) );
  OAI22XL U517 ( .A0(n512), .A1(n431), .B0(n432), .B1(n513), .Y(n160) );
  XOR2X1 U518 ( .A(b[10]), .B(n426), .Y(n512) );
  OAI22XL U519 ( .A0(n513), .A1(n431), .B0(n432), .B1(n426), .Y(n159) );
  XOR2X1 U520 ( .A(b[11]), .B(n426), .Y(n513) );
  XOR2X1 U521 ( .A(n427), .B(n434), .Y(n514) );
  OAI22XL U522 ( .A0(n515), .A1(n459), .B0(n460), .B1(n516), .Y(n155) );
  XOR2X1 U523 ( .A(b[1]), .B(n427), .Y(n515) );
  OAI22XL U524 ( .A0(n516), .A1(n459), .B0(n460), .B1(n517), .Y(n154) );
  XOR2X1 U525 ( .A(b[2]), .B(n427), .Y(n516) );
  OAI22XL U526 ( .A0(n517), .A1(n459), .B0(n460), .B1(n518), .Y(n153) );
  XOR2X1 U527 ( .A(b[3]), .B(n427), .Y(n517) );
  OAI22XL U528 ( .A0(n518), .A1(n459), .B0(n460), .B1(n519), .Y(n152) );
  XOR2X1 U529 ( .A(b[4]), .B(n427), .Y(n518) );
  OAI22XL U530 ( .A0(n519), .A1(n459), .B0(n460), .B1(n520), .Y(n151) );
  XOR2X1 U531 ( .A(b[5]), .B(n427), .Y(n519) );
  OAI22XL U532 ( .A0(n520), .A1(n459), .B0(n460), .B1(n521), .Y(n150) );
  OAI22XL U533 ( .A0(n521), .A1(n459), .B0(n460), .B1(n522), .Y(n149) );
  OAI22XL U534 ( .A0(n522), .A1(n459), .B0(n460), .B1(n523), .Y(n148) );
  XOR2X1 U535 ( .A(b[8]), .B(n427), .Y(n522) );
  OAI22XL U536 ( .A0(n523), .A1(n459), .B0(n460), .B1(n458), .Y(n147) );
  XOR2X1 U537 ( .A(b[10]), .B(n427), .Y(n458) );
  XOR2X1 U538 ( .A(b[9]), .B(n427), .Y(n523) );
  OAI22XL U539 ( .A0(n524), .A1(n453), .B0(n433), .B1(n525), .Y(n144) );
  OAI22XL U540 ( .A0(n525), .A1(n453), .B0(n433), .B1(n526), .Y(n143) );
  OAI22XL U541 ( .A0(n526), .A1(n453), .B0(n433), .B1(n527), .Y(n142) );
  OAI22XL U542 ( .A0(n527), .A1(n453), .B0(n433), .B1(n528), .Y(n141) );
  OAI22XL U543 ( .A0(n528), .A1(n453), .B0(n433), .B1(n529), .Y(n140) );
  OAI22XL U544 ( .A0(n529), .A1(n453), .B0(n433), .B1(n530), .Y(n139) );
  OAI22XL U545 ( .A0(n530), .A1(n453), .B0(n433), .B1(n531), .Y(n138) );
  OAI22XL U546 ( .A0(n531), .A1(n453), .B0(n433), .B1(n452), .Y(n137) );
  NOR2X1 U547 ( .A(n422), .B(n444), .Y(n135) );
  NOR2BX1 U548 ( .AN(b[2]), .B(n422), .Y(n134) );
  NOR2BX1 U549 ( .AN(b[3]), .B(n422), .Y(n133) );
  NOR2BX1 U550 ( .AN(b[5]), .B(n422), .Y(n132) );
  XOR2X1 U551 ( .A(a[3]), .B(a[2]), .Y(n532) );
  OAI32X1 U552 ( .A0(n425), .A1(n434), .A2(n430), .B0(n425), .B1(n401), .Y(
        n128) );
  XOR2X1 U553 ( .A(a[5]), .B(a[4]), .Y(n533) );
  XOR2X1 U554 ( .A(a[7]), .B(a[6]), .Y(n534) );
  OAI32X1 U555 ( .A0(n427), .A1(n434), .A2(n460), .B0(n427), .B1(n459), .Y(
        n126) );
  XOR2X1 U556 ( .A(a[9]), .B(a[8]), .Y(n535) );
  OAI32X1 U557 ( .A0(n422), .A1(n434), .A2(n433), .B0(n422), .B1(n453), .Y(
        n125) );
endmodule


module READ_DW01_add_4 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [19:1] carry;

  ADDFHX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n4), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX4 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX4 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFHX4 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX4 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX4 U1_9 ( .A(B[9]), .B(A[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  XOR3X4 U1_19 ( .A(A[19]), .B(B[19]), .C(carry[19]), .Y(SUM[19]) );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  NAND2X1 U1 ( .A(A[12]), .B(B[12]), .Y(n7) );
  INVXL U2 ( .A(carry[11]), .Y(n1) );
  CLKINVX1 U3 ( .A(n1), .Y(n2) );
  XOR3XL U4 ( .A(B[11]), .B(A[11]), .C(n2), .Y(SUM[11]) );
  BUFX6 U5 ( .A(n12), .Y(n3) );
  BUFX3 U6 ( .A(B[0]), .Y(n21) );
  NAND3X2 U7 ( .A(n15), .B(n16), .C(n17), .Y(carry[5]) );
  NAND3X4 U8 ( .A(n5), .B(n6), .C(n7), .Y(carry[13]) );
  NAND2X4 U9 ( .A(A[12]), .B(carry[12]), .Y(n6) );
  NAND3X2 U10 ( .A(n18), .B(n19), .C(n20), .Y(carry[9]) );
  NAND2X2 U11 ( .A(B[8]), .B(carry[8]), .Y(n18) );
  NAND2X4 U12 ( .A(A[8]), .B(carry[8]), .Y(n19) );
  NAND2X1 U13 ( .A(A[8]), .B(B[8]), .Y(n20) );
  NAND2X1 U14 ( .A(A[4]), .B(carry[4]), .Y(n16) );
  NAND2X1 U15 ( .A(A[4]), .B(B[4]), .Y(n17) );
  NAND2X1 U16 ( .A(B[4]), .B(carry[4]), .Y(n15) );
  XOR3X1 U17 ( .A(B[3]), .B(A[3]), .C(carry[3]), .Y(SUM[3]) );
  XOR2X1 U18 ( .A(carry[4]), .B(n14), .Y(SUM[4]) );
  XOR2X1 U19 ( .A(B[4]), .B(A[4]), .Y(n14) );
  AND2X2 U20 ( .A(n21), .B(A[0]), .Y(n4) );
  NAND3X6 U21 ( .A(n8), .B(n9), .C(n10), .Y(carry[4]) );
  NAND2X6 U22 ( .A(A[3]), .B(carry[3]), .Y(n10) );
  NAND2X4 U23 ( .A(carry[11]), .B(B[11]), .Y(n11) );
  NAND2X6 U24 ( .A(A[11]), .B(carry[11]), .Y(n13) );
  NAND3X8 U25 ( .A(n11), .B(n3), .C(n13), .Y(carry[12]) );
  XOR3XL U26 ( .A(carry[12]), .B(A[12]), .C(B[12]), .Y(SUM[12]) );
  NAND2X4 U27 ( .A(B[12]), .B(carry[12]), .Y(n5) );
  NAND2X4 U28 ( .A(carry[3]), .B(B[3]), .Y(n8) );
  NAND2X4 U29 ( .A(A[3]), .B(B[3]), .Y(n9) );
  NAND2X1 U30 ( .A(A[11]), .B(B[11]), .Y(n12) );
  XOR3XL U31 ( .A(carry[8]), .B(A[8]), .C(B[8]), .Y(SUM[8]) );
  XOR2XL U32 ( .A(n21), .B(A[0]), .Y(SUM[0]) );
endmodule


module READ_DW_mult_uns_2 ( a, b, product );
  input [10:0] a;
  input [11:0] b;
  output [22:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n32, n33, n34,
         n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487;
  assign n72 = a[1];

  ADDFXL U27 ( .A(n30), .B(n134), .CI(n125), .CO(n26), .S(n27) );
  ADDFXL U28 ( .A(n401), .B(n135), .CI(n32), .CO(n28), .S(n29) );
  CMPR42X1 U30 ( .A(n148), .B(n126), .C(n38), .D(n136), .ICI(n35), .S(n34), 
        .ICO(n32), .CO(n33) );
  CMPR42X1 U31 ( .A(n149), .B(n137), .C(n402), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  CMPR42X1 U33 ( .A(n127), .B(n50), .C(n44), .D(n48), .ICI(n45), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U34 ( .A(n138), .B(n162), .CI(n150), .CO(n43), .S(n44) );
  CMPR42X1 U35 ( .A(n403), .B(n55), .C(n56), .D(n49), .ICI(n52), .S(n47), 
        .ICO(n45), .CO(n46) );
  ADDFXL U36 ( .A(n151), .B(n139), .CI(n163), .CO(n48), .S(n49) );
  CMPR42X1 U38 ( .A(n176), .B(n164), .C(n57), .D(n62), .ICI(n58), .S(n54), 
        .ICO(n52), .CO(n53) );
  CMPR42X1 U39 ( .A(n397), .B(n128), .C(n140), .D(n152), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  CMPR42X1 U40 ( .A(n153), .B(n72), .C(n70), .D(n63), .ICI(n66), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U41 ( .A(n129), .B(n177), .C(n165), .D(n141), .ICI(n69), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U43 ( .A(n154), .B(n72), .C(n77), .D(n71), .ICI(n73), .S(n68), 
        .ICO(n66), .CO(n67) );
  CMPR42X1 U44 ( .A(n130), .B(n178), .C(n166), .D(n142), .ICI(n76), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1 U47 ( .A(n131), .B(n143), .C(n155), .D(n190), .ICI(n82), .S(n78), 
        .ICO(n76), .CO(n77) );
  CMPR42X1 U50 ( .A(n169), .B(n96), .C(n90), .D(n94), .ICI(n91), .S(n87), 
        .ICO(n85), .CO(n86) );
  ADDFXL U53 ( .A(n158), .B(n170), .CI(n182), .CO(n94), .S(n95) );
  CMPR42X1 U55 ( .A(n183), .B(n159), .C(n106), .D(n103), .ICI(n102), .S(n100), 
        .ICO(n98), .CO(n99) );
  ADDFXL U56 ( .A(n171), .B(n147), .CI(n194), .CO(n101), .S(n102) );
  ADDHXL U58 ( .A(n160), .B(n120), .CO(n106), .S(n107) );
  NAND2X4 U281 ( .A(n75), .B(n14), .Y(n386) );
  CMPR42X2 U282 ( .A(n193), .B(n97), .C(n98), .D(n101), .ICI(n95), .S(n93), 
        .ICO(n91), .CO(n92) );
  ADDHX1 U283 ( .A(n146), .B(n119), .CO(n96), .S(n97) );
  OAI22XL U284 ( .A0(n475), .A1(n383), .B0(n396), .B1(n476), .Y(n143) );
  XOR2X1 U285 ( .A(n410), .B(a[9]), .Y(n475) );
  XOR2X2 U286 ( .A(n409), .B(a[7]), .Y(n463) );
  ADDFHX4 U287 ( .A(n93), .B(n99), .CI(n17), .CO(n16), .S(product[9]) );
  ADDFHX2 U288 ( .A(n100), .B(n104), .CI(n18), .CO(n17), .S(product[8]) );
  CLKXOR2X1 U289 ( .A(a[9]), .B(a[8]), .Y(n487) );
  ADDFHX4 U290 ( .A(n28), .B(n27), .CI(n5), .CO(n4), .S(product[21]) );
  OAI22X2 U291 ( .A0(n446), .A1(n385), .B0(n394), .B1(n389), .Y(n174) );
  XOR2X1 U292 ( .A(n415), .B(a[5]), .Y(n446) );
  OAI22X1 U293 ( .A0(n451), .A1(n385), .B0(n394), .B1(n452), .Y(n169) );
  OAI22XL U294 ( .A0(n450), .A1(n385), .B0(n394), .B1(n451), .Y(n170) );
  XOR2X2 U295 ( .A(n408), .B(a[5]), .Y(n451) );
  BUFX3 U296 ( .A(n157), .Y(n379) );
  XOR2X1 U297 ( .A(n411), .B(a[7]), .Y(n461) );
  BUFX3 U298 ( .A(n196), .Y(n380) );
  OAI22X1 U299 ( .A0(n438), .A1(n384), .B0(n393), .B1(n381), .Y(n183) );
  BUFX4 U300 ( .A(n439), .Y(n381) );
  XOR2X1 U301 ( .A(n408), .B(a[3]), .Y(n438) );
  NOR2X2 U302 ( .A(n396), .B(n415), .Y(n147) );
  OAI22X1 U303 ( .A0(n473), .A1(n383), .B0(n396), .B1(n474), .Y(n145) );
  OAI22XL U304 ( .A0(n474), .A1(n383), .B0(n396), .B1(n475), .Y(n144) );
  BUFX12 U305 ( .A(n471), .Y(n396) );
  CMPR42X2 U306 ( .A(n161), .B(n380), .C(n185), .D(n173), .ICI(n113), .S(n110), 
        .ICO(n108), .CO(n109) );
  ADDFHX2 U307 ( .A(n116), .B(n117), .CI(n22), .CO(n21), .S(product[4]) );
  ADDFHX4 U308 ( .A(n47), .B(n53), .CI(n10), .CO(n9), .S(product[16]) );
  ADDFHX4 U309 ( .A(n186), .B(n197), .CI(n114), .CO(n111), .S(n112) );
  OAI22X1 U310 ( .A0(n435), .A1(n384), .B0(n393), .B1(n436), .Y(n186) );
  NAND2X8 U311 ( .A(n392), .B(a[10]), .Y(n418) );
  XOR2X1 U312 ( .A(n412), .B(a[7]), .Y(n460) );
  XOR2X1 U313 ( .A(n410), .B(a[7]), .Y(n462) );
  CLKXOR2X1 U314 ( .A(n412), .B(a[9]), .Y(n473) );
  CLKINVX8 U315 ( .A(b[5]), .Y(n408) );
  BUFX8 U316 ( .A(n447), .Y(n389) );
  XOR2X1 U317 ( .A(n412), .B(a[5]), .Y(n447) );
  XOR2X4 U318 ( .A(n408), .B(n72), .Y(n425) );
  CLKINVX8 U319 ( .A(b[6]), .Y(n407) );
  CLKINVX8 U320 ( .A(b[4]), .Y(n409) );
  NAND3X4 U321 ( .A(n386), .B(n387), .C(n388), .Y(n13) );
  NAND2X4 U322 ( .A(n80), .B(n14), .Y(n387) );
  ADDFHX4 U323 ( .A(n68), .B(n74), .CI(n13), .CO(n12), .S(product[13]) );
  OAI22X1 U324 ( .A0(n449), .A1(n385), .B0(n394), .B1(n450), .Y(n171) );
  XOR2X1 U325 ( .A(n410), .B(a[5]), .Y(n449) );
  OAI22X1 U326 ( .A0(n459), .A1(n382), .B0(n395), .B1(n460), .Y(n160) );
  XOR2X1 U327 ( .A(n409), .B(a[5]), .Y(n450) );
  ADDFHX4 U328 ( .A(n112), .B(n115), .CI(n21), .CO(n20), .S(product[5]) );
  OAI22X1 U329 ( .A0(n472), .A1(n383), .B0(n396), .B1(n473), .Y(n146) );
  OAI32XL U330 ( .A0(n400), .A1(b[0]), .A2(n396), .B0(n400), .B1(n383), .Y(
        n119) );
  OAI22X1 U331 ( .A0(n476), .A1(n383), .B0(n396), .B1(n477), .Y(n142) );
  NAND2X8 U332 ( .A(n396), .B(n487), .Y(n383) );
  ADDFHX2 U333 ( .A(n111), .B(n110), .CI(n20), .CO(n19), .S(product[6]) );
  OAI22X1 U334 ( .A0(n443), .A1(n384), .B0(n393), .B1(n444), .Y(n178) );
  OAI22X1 U335 ( .A0(n444), .A1(n384), .B0(n393), .B1(n398), .Y(n177) );
  XOR2X1 U336 ( .A(n413), .B(a[3]), .Y(n444) );
  ADDFHX4 U337 ( .A(n87), .B(n92), .CI(n16), .CO(n15), .S(product[10]) );
  ADDFHX4 U338 ( .A(n81), .B(n86), .CI(n15), .CO(n14), .S(product[11]) );
  ADDFHX4 U339 ( .A(n54), .B(n59), .CI(n11), .CO(n10), .S(product[15]) );
  ADDFHX4 U340 ( .A(n60), .B(n67), .CI(n12), .CO(n11), .S(product[14]) );
  ADDFHX4 U341 ( .A(n37), .B(n41), .CI(n8), .CO(n7), .S(product[18]) );
  ADDFHX4 U342 ( .A(n42), .B(n46), .CI(n9), .CO(n8), .S(product[17]) );
  ADDFHX4 U343 ( .A(n29), .B(n33), .CI(n6), .CO(n5), .S(product[20]) );
  ADDFHX4 U344 ( .A(n36), .B(n34), .CI(n7), .CO(n6), .S(product[19]) );
  XOR2X4 U345 ( .A(n407), .B(n72), .Y(n426) );
  XOR2X2 U346 ( .A(n415), .B(a[3]), .Y(n433) );
  CLKINVX12 U347 ( .A(b[0]), .Y(n415) );
  XOR2X2 U348 ( .A(n412), .B(a[3]), .Y(n434) );
  CLKINVX6 U349 ( .A(b[1]), .Y(n412) );
  XOR2X4 U350 ( .A(n410), .B(n72), .Y(n423) );
  XOR2X4 U351 ( .A(n412), .B(n72), .Y(n421) );
  CLKINVX6 U352 ( .A(b[11]), .Y(n413) );
  OAI22X1 U353 ( .A0(n381), .A1(n384), .B0(n393), .B1(n440), .Y(n182) );
  OAI22X1 U354 ( .A0(n440), .A1(n384), .B0(n393), .B1(n441), .Y(n181) );
  XOR2X1 U355 ( .A(n406), .B(a[3]), .Y(n440) );
  XOR2X4 U356 ( .A(n414), .B(n72), .Y(n430) );
  XOR2X4 U357 ( .A(n405), .B(a[3]), .Y(n441) );
  CMPR42X2 U358 ( .A(n195), .B(n172), .C(n184), .D(n108), .ICI(n107), .S(n105), 
        .ICO(n103), .CO(n104) );
  OAI22X1 U359 ( .A0(n426), .A1(n420), .B0(n427), .B1(n417), .Y(n195) );
  XOR2X4 U360 ( .A(n409), .B(n72), .Y(n424) );
  OAI22X2 U361 ( .A0(b[0]), .A1(n420), .B0(n421), .B1(n417), .Y(n201) );
  XOR2X4 U362 ( .A(n404), .B(n72), .Y(n429) );
  XOR2X4 U363 ( .A(n405), .B(n72), .Y(n428) );
  CLKINVX6 U364 ( .A(b[10]), .Y(n414) );
  OAI22X1 U365 ( .A0(n421), .A1(n420), .B0(n422), .B1(n417), .Y(n200) );
  OAI22X1 U366 ( .A0(n424), .A1(n420), .B0(n425), .B1(n417), .Y(n197) );
  OAI22X1 U367 ( .A0(n428), .A1(n420), .B0(n429), .B1(n417), .Y(n193) );
  ADDFHX4 U368 ( .A(n198), .B(n175), .CI(n187), .CO(n115), .S(n116) );
  OAI22X1 U369 ( .A0(n423), .A1(n420), .B0(n424), .B1(n417), .Y(n198) );
  OAI22X1 U370 ( .A0(n422), .A1(n420), .B0(n423), .B1(n417), .Y(n199) );
  OAI22X1 U371 ( .A0(n430), .A1(n420), .B0(n431), .B1(n417), .Y(n191) );
  OAI22X1 U372 ( .A0(n427), .A1(n420), .B0(n428), .B1(n417), .Y(n194) );
  XOR2XL U373 ( .A(a[5]), .B(a[4]), .Y(n485) );
  ADDHX1 U374 ( .A(n199), .B(n188), .CO(n117), .S(n118) );
  OAI22X4 U375 ( .A0(n433), .A1(n384), .B0(n393), .B1(n434), .Y(n188) );
  OAI22X1 U376 ( .A0(n429), .A1(n420), .B0(n430), .B1(n417), .Y(n192) );
  XOR2X1 U377 ( .A(n406), .B(n72), .Y(n427) );
  CLKBUFX3 U378 ( .A(n432), .Y(n393) );
  CLKBUFX3 U379 ( .A(n445), .Y(n394) );
  NAND2X1 U380 ( .A(n80), .B(n75), .Y(n388) );
  INVX3 U381 ( .A(b[8]), .Y(n405) );
  CLKBUFX3 U382 ( .A(n419), .Y(n392) );
  NAND2X2 U383 ( .A(n395), .B(n486), .Y(n382) );
  NAND2X4 U384 ( .A(n393), .B(n484), .Y(n384) );
  NAND2X4 U385 ( .A(n394), .B(n485), .Y(n385) );
  XOR3X1 U386 ( .A(n14), .B(n80), .C(n75), .Y(product[12]) );
  OAI22XL U387 ( .A0(n425), .A1(n420), .B0(n426), .B1(n417), .Y(n196) );
  CMPR42X2 U388 ( .A(n179), .B(n167), .C(n83), .D(n78), .ICI(n79), .S(n75), 
        .ICO(n73), .CO(n74) );
  CMPR42X2 U389 ( .A(n180), .B(n168), .C(n89), .D(n84), .ICI(n85), .S(n81), 
        .ICO(n79), .CO(n80) );
  OAI22X1 U390 ( .A0(n448), .A1(n385), .B0(n394), .B1(n449), .Y(n172) );
  XOR2X1 U391 ( .A(n411), .B(a[5]), .Y(n448) );
  OAI22X1 U392 ( .A0(n436), .A1(n384), .B0(n393), .B1(n437), .Y(n185) );
  OAI22X1 U393 ( .A0(n434), .A1(n384), .B0(n393), .B1(n435), .Y(n187) );
  ADDFHX2 U394 ( .A(n200), .B(n189), .CI(n24), .CO(n23), .S(product[2]) );
  OAI22X1 U395 ( .A0(n437), .A1(n384), .B0(n393), .B1(n438), .Y(n184) );
  XOR2X1 U396 ( .A(n409), .B(a[3]), .Y(n437) );
  ADDHX2 U397 ( .A(n123), .B(n201), .CO(n24), .S(product[1]) );
  CMPR42X2 U398 ( .A(n132), .B(n144), .C(n156), .D(n191), .ICI(n88), .S(n84), 
        .ICO(n82), .CO(n83) );
  CMPR42X2 U399 ( .A(n133), .B(n379), .C(n192), .D(n181), .ICI(n145), .S(n90), 
        .ICO(n88), .CO(n89) );
  OAI22X1 U400 ( .A0(n389), .A1(n385), .B0(n394), .B1(n448), .Y(n173) );
  XOR2X1 U401 ( .A(n411), .B(a[3]), .Y(n435) );
  CLKINVX8 U402 ( .A(b[2]), .Y(n411) );
  XOR2X1 U403 ( .A(n410), .B(a[3]), .Y(n436) );
  CLKINVX8 U404 ( .A(b[3]), .Y(n410) );
  XOR2X4 U405 ( .A(n411), .B(n72), .Y(n422) );
  XOR2X4 U406 ( .A(n390), .B(n391), .Y(product[22]) );
  INVX1 U407 ( .A(a[9]), .Y(n400) );
  INVX1 U408 ( .A(n72), .Y(n397) );
  CLKINVX1 U409 ( .A(a[3]), .Y(n398) );
  NOR2XL U410 ( .A(n418), .B(n413), .Y(n390) );
  XNOR2X4 U411 ( .A(n4), .B(n26), .Y(n391) );
  ADDFHX2 U412 ( .A(n105), .B(n109), .CI(n19), .CO(n18), .S(product[7]) );
  XOR2XL U413 ( .A(a[8]), .B(n399), .Y(n471) );
  XOR2XL U414 ( .A(a[4]), .B(n398), .Y(n445) );
  INVX1 U415 ( .A(a[5]), .Y(n416) );
  INVX1 U416 ( .A(a[7]), .Y(n399) );
  XOR2XL U417 ( .A(a[2]), .B(n397), .Y(n432) );
  XOR2XL U418 ( .A(n413), .B(a[5]), .Y(n457) );
  XOR2XL U419 ( .A(n413), .B(a[7]), .Y(n470) );
  INVX1 U420 ( .A(n38), .Y(n402) );
  XOR2XL U421 ( .A(n413), .B(a[9]), .Y(n483) );
  INVX1 U422 ( .A(n30), .Y(n401) );
  NOR2XL U423 ( .A(n393), .B(n415), .Y(n189) );
  NOR2XL U424 ( .A(n395), .B(n415), .Y(n161) );
  XOR2XL U425 ( .A(n407), .B(a[3]), .Y(n439) );
  XOR2XL U426 ( .A(n407), .B(a[5]), .Y(n452) );
  XOR2XL U427 ( .A(n411), .B(a[9]), .Y(n474) );
  XOR2XL U428 ( .A(n408), .B(a[7]), .Y(n464) );
  XOR2XL U429 ( .A(n409), .B(a[9]), .Y(n476) );
  XOR2XL U430 ( .A(n406), .B(a[5]), .Y(n453) );
  XOR2XL U431 ( .A(n404), .B(a[5]), .Y(n455) );
  XOR2XL U432 ( .A(n405), .B(a[5]), .Y(n454) );
  XOR2XL U433 ( .A(n404), .B(a[3]), .Y(n442) );
  XOR2XL U434 ( .A(n407), .B(a[7]), .Y(n465) );
  XOR2XL U435 ( .A(n414), .B(a[3]), .Y(n443) );
  XOR2XL U436 ( .A(n408), .B(a[9]), .Y(n477) );
  XOR2XL U437 ( .A(a[10]), .B(n400), .Y(n419) );
  XOR2XL U438 ( .A(n414), .B(a[5]), .Y(n456) );
  XOR2XL U439 ( .A(n406), .B(a[7]), .Y(n466) );
  XOR2XL U440 ( .A(n407), .B(a[9]), .Y(n478) );
  XOR2XL U441 ( .A(n406), .B(a[9]), .Y(n479) );
  XOR2XL U442 ( .A(n404), .B(a[7]), .Y(n468) );
  XOR2XL U443 ( .A(n405), .B(a[7]), .Y(n467) );
  XOR2XL U444 ( .A(n404), .B(a[9]), .Y(n481) );
  XOR2XL U445 ( .A(n405), .B(a[9]), .Y(n480) );
  XOR2XL U446 ( .A(n414), .B(a[7]), .Y(n469) );
  XOR2XL U447 ( .A(n414), .B(a[9]), .Y(n482) );
  NOR2XL U448 ( .A(n417), .B(n415), .Y(product[0]) );
  ADDHX1 U449 ( .A(n174), .B(n121), .CO(n113), .S(n114) );
  ADDFX1 U450 ( .A(n118), .B(n122), .CI(n23), .CO(n22), .S(product[3]) );
  NAND2X2 U451 ( .A(n72), .B(n417), .Y(n420) );
  INVXL U452 ( .A(n50), .Y(n403) );
  CLKBUFX3 U453 ( .A(n458), .Y(n395) );
  XOR2X1 U454 ( .A(a[6]), .B(n416), .Y(n458) );
  INVX3 U455 ( .A(a[0]), .Y(n417) );
  INVX3 U456 ( .A(b[7]), .Y(n406) );
  INVX3 U457 ( .A(b[9]), .Y(n404) );
  OAI22XL U458 ( .A0(n418), .A1(n408), .B0(n392), .B1(n407), .Y(n50) );
  OAI22XL U459 ( .A0(n418), .A1(n406), .B0(n392), .B1(n405), .Y(n38) );
  OAI22XL U460 ( .A0(n418), .A1(n404), .B0(n392), .B1(n414), .Y(n30) );
  OAI22XL U461 ( .A0(n431), .A1(n420), .B0(n397), .B1(n417), .Y(n190) );
  XOR2X1 U462 ( .A(n413), .B(n72), .Y(n431) );
  OAI22XL U463 ( .A0(n441), .A1(n384), .B0(n393), .B1(n442), .Y(n180) );
  OAI22XL U464 ( .A0(n442), .A1(n384), .B0(n393), .B1(n443), .Y(n179) );
  AO21X1 U465 ( .A0(n384), .A1(n393), .B0(n398), .Y(n176) );
  NOR2X1 U466 ( .A(n394), .B(n415), .Y(n175) );
  OAI22XL U467 ( .A0(n452), .A1(n385), .B0(n394), .B1(n453), .Y(n168) );
  OAI22XL U468 ( .A0(n453), .A1(n385), .B0(n394), .B1(n454), .Y(n167) );
  OAI22XL U469 ( .A0(n454), .A1(n385), .B0(n394), .B1(n455), .Y(n166) );
  OAI22XL U470 ( .A0(n455), .A1(n385), .B0(n394), .B1(n456), .Y(n165) );
  OAI22XL U471 ( .A0(n456), .A1(n385), .B0(n394), .B1(n457), .Y(n164) );
  OAI22XL U472 ( .A0(n457), .A1(n385), .B0(n394), .B1(n416), .Y(n163) );
  AO21X1 U473 ( .A0(n385), .A1(n394), .B0(n416), .Y(n162) );
  XOR2X1 U474 ( .A(n415), .B(a[7]), .Y(n459) );
  OAI22XL U475 ( .A0(n460), .A1(n382), .B0(n395), .B1(n461), .Y(n159) );
  OAI22XL U476 ( .A0(n461), .A1(n382), .B0(n395), .B1(n462), .Y(n158) );
  OAI22XL U477 ( .A0(n462), .A1(n382), .B0(n395), .B1(n463), .Y(n157) );
  OAI22XL U478 ( .A0(n463), .A1(n382), .B0(n395), .B1(n464), .Y(n156) );
  OAI22XL U479 ( .A0(n464), .A1(n382), .B0(n395), .B1(n465), .Y(n155) );
  OAI22XL U480 ( .A0(n465), .A1(n382), .B0(n395), .B1(n466), .Y(n154) );
  OAI22XL U481 ( .A0(n466), .A1(n382), .B0(n395), .B1(n467), .Y(n153) );
  OAI22XL U482 ( .A0(n467), .A1(n382), .B0(n395), .B1(n468), .Y(n152) );
  OAI22XL U483 ( .A0(n468), .A1(n382), .B0(n395), .B1(n469), .Y(n151) );
  OAI22XL U484 ( .A0(n469), .A1(n382), .B0(n395), .B1(n470), .Y(n150) );
  OAI22XL U485 ( .A0(n470), .A1(n382), .B0(n395), .B1(n399), .Y(n149) );
  AO21X1 U486 ( .A0(n382), .A1(n395), .B0(n399), .Y(n148) );
  XOR2X1 U487 ( .A(n415), .B(a[9]), .Y(n472) );
  OAI22XL U488 ( .A0(n477), .A1(n383), .B0(n396), .B1(n478), .Y(n141) );
  OAI22XL U489 ( .A0(n478), .A1(n383), .B0(n396), .B1(n479), .Y(n140) );
  OAI22XL U490 ( .A0(n479), .A1(n383), .B0(n396), .B1(n480), .Y(n139) );
  OAI22XL U491 ( .A0(n480), .A1(n383), .B0(n396), .B1(n481), .Y(n138) );
  OAI22XL U492 ( .A0(n481), .A1(n383), .B0(n396), .B1(n482), .Y(n137) );
  OAI22XL U493 ( .A0(n482), .A1(n383), .B0(n396), .B1(n483), .Y(n136) );
  OAI22XL U494 ( .A0(n483), .A1(n383), .B0(n396), .B1(n400), .Y(n135) );
  AO21X1 U495 ( .A0(n383), .A1(n396), .B0(n400), .Y(n134) );
  NOR2X1 U496 ( .A(n392), .B(n415), .Y(n133) );
  OAI22XL U497 ( .A0(n418), .A1(n415), .B0(n392), .B1(n412), .Y(n132) );
  OAI22XL U498 ( .A0(n418), .A1(n412), .B0(n392), .B1(n411), .Y(n131) );
  OAI22XL U499 ( .A0(n418), .A1(n411), .B0(n392), .B1(n410), .Y(n130) );
  OAI22XL U500 ( .A0(n418), .A1(n410), .B0(n392), .B1(n409), .Y(n129) );
  OAI22XL U501 ( .A0(n418), .A1(n409), .B0(n392), .B1(n408), .Y(n128) );
  OAI22XL U502 ( .A0(n418), .A1(n407), .B0(n392), .B1(n406), .Y(n127) );
  OAI22XL U503 ( .A0(n418), .A1(n405), .B0(n392), .B1(n404), .Y(n126) );
  OAI22XL U504 ( .A0(n418), .A1(n414), .B0(n392), .B1(n413), .Y(n125) );
  OAI21XL U505 ( .A0(b[0]), .A1(n397), .B0(n420), .Y(n123) );
  OAI32X1 U506 ( .A0(n398), .A1(b[0]), .A2(n393), .B0(n398), .B1(n384), .Y(
        n122) );
  XOR2X1 U507 ( .A(a[3]), .B(a[2]), .Y(n484) );
  OAI32X1 U508 ( .A0(n416), .A1(b[0]), .A2(n394), .B0(n416), .B1(n385), .Y(
        n121) );
  OAI32X1 U509 ( .A0(n399), .A1(b[0]), .A2(n395), .B0(n399), .B1(n382), .Y(
        n120) );
  XOR2X1 U510 ( .A(a[7]), .B(a[6]), .Y(n486) );
endmodule


module READ_DW_mult_uns_3 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n27, n28, n30, n31, n32, n33, n34,
         n35, n36, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n149, n150, n151, n152,
         n153, n154, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583;

  ADDHXL U26 ( .A(n147), .B(n237), .CO(n25), .S(product[1]) );
  CMPR42X1 U30 ( .A(n490), .B(n149), .C(n169), .D(n157), .ICI(n34), .S(n33), 
        .ICO(n31), .CO(n32) );
  CMPR42X1 U31 ( .A(n38), .B(n170), .C(n158), .D(n42), .ICI(n39), .S(n36), 
        .ICO(n34), .CO(n35) );
  CMPR42X1 U33 ( .A(n171), .B(n159), .C(n43), .D(n47), .ICI(n44), .S(n41), 
        .ICO(n39), .CO(n40) );
  ADDFXL U34 ( .A(n150), .B(n489), .CI(n183), .CO(n42), .S(n43) );
  ADDFXL U36 ( .A(n172), .B(n50), .CI(n160), .CO(n47), .S(n48) );
  CMPR42X1 U39 ( .A(n488), .B(n151), .C(n197), .D(n173), .ICI(n185), .S(n56), 
        .ICO(n54), .CO(n55) );
  CMPR42X1 U40 ( .A(n68), .B(n71), .C(n62), .D(n69), .ICI(n65), .S(n59), .ICO(
        n57), .CO(n58) );
  CMPR42X1 U43 ( .A(n79), .B(n72), .C(n77), .D(n70), .ICI(n73), .S(n67), .ICO(
        n65), .CO(n66) );
  CMPR42X1 U44 ( .A(n175), .B(n199), .C(n187), .D(n163), .ICI(n76), .S(n70), 
        .ICO(n68), .CO(n69) );
  ADDFXL U45 ( .A(n152), .B(n487), .CI(n211), .CO(n71), .S(n72) );
  CMPR42X1 U46 ( .A(n80), .B(n89), .C(n87), .D(n78), .ICI(n83), .S(n75), .ICO(
        n73), .CO(n74) );
  CMPR42X1 U47 ( .A(n176), .B(n212), .C(n200), .D(n164), .ICI(n86), .S(n78), 
        .ICO(n76), .CO(n77) );
  ADDFXL U48 ( .A(n91), .B(n153), .CI(n188), .CO(n79), .S(n80) );
  CMPR42X1 U50 ( .A(n90), .B(n98), .C(n96), .D(n88), .ICI(n92), .S(n85), .ICO(
        n83), .CO(n84) );
  CMPR42X1 U51 ( .A(n177), .B(n201), .C(n189), .D(n165), .ICI(n95), .S(n88), 
        .ICO(n86), .CO(n87) );
  ADDFXL U52 ( .A(n486), .B(n91), .CI(n213), .CO(n89), .S(n90) );
  CMPR42X1 U54 ( .A(n106), .B(n99), .C(n104), .D(n97), .ICI(n100), .S(n94), 
        .ICO(n92), .CO(n93) );
  CMPR42X1 U55 ( .A(n214), .B(n166), .C(n202), .D(n190), .ICI(n103), .S(n97), 
        .ICO(n95), .CO(n96) );
  ADDFXL U56 ( .A(n178), .B(n154), .CI(n226), .CO(n98), .S(n99) );
  CMPR42X1 U62 ( .A(n229), .B(n120), .C(n121), .D(n124), .ICI(n118), .S(n116), 
        .ICO(n114), .CO(n115) );
  ADDFXL U63 ( .A(n193), .B(n205), .CI(n217), .CO(n117), .S(n118) );
  CMPR42X1 U65 ( .A(n218), .B(n194), .C(n129), .D(n126), .ICI(n125), .S(n123), 
        .ICO(n121), .CO(n122) );
  ADDFXL U66 ( .A(n206), .B(n182), .CI(n230), .CO(n124), .S(n125) );
  CMPR42X1 U67 ( .A(n231), .B(n207), .C(n219), .D(n131), .ICI(n130), .S(n128), 
        .ICO(n126), .CO(n127) );
  OR2X4 U322 ( .A(n480), .B(n568), .Y(n457) );
  CLKXOR2X1 U323 ( .A(b[1]), .B(n491), .Y(n568) );
  XOR2X1 U324 ( .A(b[10]), .B(n486), .Y(n511) );
  OAI22X4 U325 ( .A0(n510), .A1(n472), .B0(n511), .B1(n492), .Y(n228) );
  INVX16 U326 ( .A(a[11]), .Y(n491) );
  CMPR22X2 U327 ( .A(n235), .B(n223), .CO(n140), .S(n141) );
  BUFX8 U328 ( .A(a[1]), .Y(n434) );
  CMPR42X2 U329 ( .A(n168), .B(n192), .C(n228), .D(n216), .ICI(n180), .S(n113), 
        .ICO(n111), .CO(n112) );
  OAI22X2 U330 ( .A0(n503), .A1(n472), .B0(n504), .B1(n492), .Y(n235) );
  XOR2X2 U331 ( .A(b[2]), .B(n486), .Y(n503) );
  CMPR42X2 U332 ( .A(n227), .B(n179), .C(n215), .D(n191), .ICI(n111), .S(n105), 
        .ICO(n103), .CO(n104) );
  OAI22X1 U333 ( .A0(n511), .A1(n472), .B0(n512), .B1(n492), .Y(n227) );
  XOR2X1 U334 ( .A(n485), .B(n481), .Y(n514) );
  NAND2X8 U335 ( .A(n478), .B(n581), .Y(n435) );
  BUFX16 U336 ( .A(n540), .Y(n478) );
  ADDFHX2 U337 ( .A(n236), .B(n224), .CI(n25), .CO(n24), .S(product[2]) );
  OAI22X1 U338 ( .A0(n526), .A1(n515), .B0(n513), .B1(n485), .Y(n212) );
  OAI22X1 U339 ( .A0(n516), .A1(n515), .B0(n513), .B1(n517), .Y(n222) );
  CMPR42X2 U340 ( .A(n184), .B(n54), .C(n55), .D(n48), .ICI(n51), .S(n46), 
        .ICO(n44), .CO(n45) );
  NAND2X2 U341 ( .A(n450), .B(n485), .Y(n452) );
  INVX1 U342 ( .A(n27), .Y(n444) );
  XOR2X1 U343 ( .A(a[8]), .B(n483), .Y(n553) );
  XOR2X1 U344 ( .A(b[11]), .B(n486), .Y(n512) );
  OAI22XL U345 ( .A0(n569), .A1(n499), .B0(n480), .B1(n570), .Y(n165) );
  XOR2X1 U346 ( .A(b[9]), .B(n485), .Y(n524) );
  XOR2X1 U347 ( .A(b[1]), .B(n484), .Y(n529) );
  OAI22XL U348 ( .A0(n525), .A1(n515), .B0(n513), .B1(n526), .Y(n213) );
  XOR2X1 U349 ( .A(b[1]), .B(n486), .Y(n502) );
  XOR2X1 U350 ( .A(b[2]), .B(n484), .Y(n530) );
  ADDFXL U351 ( .A(n141), .B(n146), .CI(n24), .CO(n23), .S(product[3]) );
  OAI22XL U352 ( .A0(n509), .A1(n472), .B0(n510), .B1(n492), .Y(n229) );
  BUFX12 U353 ( .A(n527), .Y(n477) );
  INVX4 U354 ( .A(a[5]), .Y(n484) );
  NAND2X1 U355 ( .A(n109), .B(n102), .Y(n467) );
  NAND2X2 U356 ( .A(n109), .B(n16), .Y(n466) );
  ADDFHX1 U357 ( .A(n139), .B(n140), .CI(n23), .CO(n22), .S(product[4]) );
  XOR2X1 U358 ( .A(a[6]), .B(n484), .Y(n540) );
  INVX3 U359 ( .A(a[7]), .Y(n483) );
  CMPR42X1 U360 ( .A(n161), .B(n60), .C(n56), .D(n61), .ICI(n57), .S(n53), 
        .ICO(n51), .CO(n52) );
  INVX3 U361 ( .A(a[9]), .Y(n482) );
  INVX3 U362 ( .A(n475), .Y(n555) );
  AND2X2 U363 ( .A(n479), .B(n582), .Y(n475) );
  NAND2X1 U364 ( .A(b[10]), .B(a[11]), .Y(n30) );
  NAND2X6 U365 ( .A(n30), .B(n440), .Y(n441) );
  CLKINVX6 U366 ( .A(n496), .Y(n440) );
  ADDFXL U367 ( .A(n156), .B(n30), .CI(n31), .CO(n27), .S(n28) );
  NAND2X8 U368 ( .A(n477), .B(n580), .Y(n436) );
  NAND2X1 U369 ( .A(n437), .B(n438), .Y(n195) );
  INVX6 U370 ( .A(n473), .Y(n485) );
  ADDFHX4 U371 ( .A(n67), .B(n74), .CI(n12), .CO(n11), .S(product[15]) );
  ADDFHX4 U372 ( .A(n75), .B(n84), .CI(n13), .CO(n12), .S(product[14]) );
  CMPR42X2 U373 ( .A(n203), .B(n107), .C(n112), .D(n105), .ICI(n108), .S(n102), 
        .ICO(n100), .CO(n101) );
  CMPR42X2 U374 ( .A(n204), .B(n119), .C(n113), .D(n117), .ICI(n114), .S(n110), 
        .ICO(n108), .CO(n109) );
  NAND2X6 U375 ( .A(n441), .B(n442), .Y(n495) );
  OR2XL U376 ( .A(n541), .B(n435), .Y(n437) );
  OR2XL U377 ( .A(n478), .B(n542), .Y(n438) );
  XOR2X1 U378 ( .A(b[1]), .B(n483), .Y(n542) );
  ADDFHX4 U379 ( .A(n134), .B(n133), .CI(n21), .CO(n20), .S(product[6]) );
  NAND2X4 U380 ( .A(n439), .B(n496), .Y(n442) );
  CLKINVX1 U381 ( .A(n30), .Y(n439) );
  NAND2X6 U382 ( .A(n445), .B(n446), .Y(n496) );
  NAND2X2 U383 ( .A(n4), .B(n27), .Y(n445) );
  NAND2X6 U384 ( .A(n443), .B(n444), .Y(n446) );
  CLKINVX6 U385 ( .A(n4), .Y(n443) );
  XOR3XL U386 ( .A(n9), .B(n52), .C(n46), .Y(product[18]) );
  NAND2X4 U387 ( .A(n46), .B(n9), .Y(n447) );
  NAND2X4 U388 ( .A(n52), .B(n9), .Y(n448) );
  NAND2X4 U389 ( .A(n52), .B(n46), .Y(n449) );
  NAND3X8 U390 ( .A(n447), .B(n448), .C(n449), .Y(n8) );
  ADDFHX4 U391 ( .A(n41), .B(n45), .CI(n8), .CO(n7), .S(product[19]) );
  NAND2X1 U392 ( .A(b[10]), .B(n459), .Y(n451) );
  NAND2X6 U393 ( .A(n451), .B(n452), .Y(n525) );
  INVX3 U394 ( .A(b[10]), .Y(n450) );
  OAI22X1 U395 ( .A0(n524), .A1(n515), .B0(n513), .B1(n525), .Y(n214) );
  NAND2XL U396 ( .A(a[11]), .B(n453), .Y(n454) );
  NAND2XL U397 ( .A(n491), .B(a[10]), .Y(n455) );
  NAND2X2 U398 ( .A(n454), .B(n455), .Y(n583) );
  INVX1 U399 ( .A(a[10]), .Y(n453) );
  AND2X6 U400 ( .A(n480), .B(n583), .Y(n476) );
  OR2X1 U401 ( .A(n567), .B(n499), .Y(n456) );
  NAND2X1 U402 ( .A(n456), .B(n457), .Y(n167) );
  NAND2X1 U403 ( .A(b[11]), .B(n459), .Y(n460) );
  NAND2X4 U404 ( .A(n458), .B(n485), .Y(n461) );
  NAND2X4 U405 ( .A(n460), .B(n461), .Y(n526) );
  INVX3 U406 ( .A(b[11]), .Y(n458) );
  INVXL U407 ( .A(n485), .Y(n459) );
  NAND2X1 U408 ( .A(b[2]), .B(a[11]), .Y(n463) );
  NAND2XL U409 ( .A(n462), .B(n491), .Y(n464) );
  NAND2X1 U410 ( .A(n463), .B(n464), .Y(n569) );
  INVXL U411 ( .A(b[2]), .Y(n462) );
  OAI22X1 U412 ( .A0(n568), .A1(n499), .B0(n480), .B1(n569), .Y(n166) );
  XOR3X1 U413 ( .A(n16), .B(n109), .C(n102), .Y(product[11]) );
  NAND2X2 U414 ( .A(n102), .B(n16), .Y(n465) );
  NAND3X2 U415 ( .A(n465), .B(n466), .C(n467), .Y(n15) );
  ADDFHX4 U416 ( .A(n94), .B(n101), .CI(n15), .CO(n14), .S(product[12]) );
  OR2X1 U417 ( .A(n518), .B(n515), .Y(n468) );
  OR2X1 U418 ( .A(n513), .B(n519), .Y(n469) );
  NAND2X2 U419 ( .A(n468), .B(n469), .Y(n220) );
  XOR2XL U420 ( .A(b[4]), .B(n485), .Y(n519) );
  CMPR42X2 U421 ( .A(n196), .B(n232), .C(n220), .D(n208), .ICI(n136), .S(n133), 
        .ICO(n131), .CO(n132) );
  XOR2X1 U422 ( .A(b[3]), .B(n482), .Y(n558) );
  ADDFX2 U423 ( .A(n234), .B(n210), .CI(n222), .CO(n138), .S(n139) );
  ADDFHX4 U424 ( .A(n110), .B(n115), .CI(n17), .CO(n16), .S(product[10]) );
  ADDFX2 U425 ( .A(n116), .B(n122), .CI(n18), .CO(n17), .S(product[9]) );
  INVX12 U426 ( .A(n476), .Y(n499) );
  CLKXOR2X1 U427 ( .A(b[9]), .B(n486), .Y(n510) );
  ADDFHX4 U428 ( .A(n221), .B(n233), .CI(n137), .CO(n134), .S(n135) );
  ADDHX2 U429 ( .A(n209), .B(n470), .CO(n136), .S(n137) );
  ADDFHX4 U430 ( .A(n35), .B(n33), .CI(n6), .CO(n5), .S(product[21]) );
  ADDFHX4 U431 ( .A(n40), .B(n36), .CI(n7), .CO(n6), .S(product[20]) );
  XOR2X1 U432 ( .A(n484), .B(n481), .Y(n528) );
  OAI22X1 U433 ( .A0(n512), .A1(n472), .B0(n486), .B1(n492), .Y(n226) );
  CLKXOR2X2 U434 ( .A(a[10]), .B(n482), .Y(n500) );
  OAI22X1 U435 ( .A0(n508), .A1(n472), .B0(n509), .B1(n492), .Y(n230) );
  XOR2X1 U436 ( .A(b[7]), .B(n486), .Y(n508) );
  OAI22X1 U437 ( .A0(n514), .A1(n515), .B0(n513), .B1(n516), .Y(n223) );
  OAI22X1 U438 ( .A0(n517), .A1(n515), .B0(n513), .B1(n518), .Y(n221) );
  XOR2X1 U439 ( .A(b[2]), .B(n485), .Y(n517) );
  OAI22X1 U440 ( .A0(n506), .A1(n472), .B0(n507), .B1(n492), .Y(n232) );
  XOR2X1 U441 ( .A(b[5]), .B(n486), .Y(n506) );
  BUFX12 U442 ( .A(n500), .Y(n480) );
  XOR2X1 U443 ( .A(b[3]), .B(n486), .Y(n504) );
  CLKBUFX2 U444 ( .A(n145), .Y(n470) );
  XOR2X1 U445 ( .A(b[1]), .B(n482), .Y(n556) );
  OAI22X1 U446 ( .A0(n528), .A1(n436), .B0(n477), .B1(n529), .Y(n209) );
  CLKBUFX2 U447 ( .A(n144), .Y(n471) );
  BUFX12 U448 ( .A(n501), .Y(n472) );
  BUFX8 U449 ( .A(a[3]), .Y(n473) );
  OAI22X1 U450 ( .A0(n505), .A1(n472), .B0(n506), .B1(n492), .Y(n233) );
  XOR2X1 U451 ( .A(b[4]), .B(n486), .Y(n505) );
  CLKINVX8 U452 ( .A(n434), .Y(n486) );
  XOR2X1 U453 ( .A(b[1]), .B(n485), .Y(n516) );
  XOR2X2 U454 ( .A(a[4]), .B(n485), .Y(n527) );
  CLKXOR2X8 U455 ( .A(a[2]), .B(n486), .Y(n513) );
  ADDFHX4 U456 ( .A(n135), .B(n138), .CI(n22), .CO(n21), .S(product[5]) );
  BUFX12 U457 ( .A(n553), .Y(n479) );
  ADDFHX4 U458 ( .A(n28), .B(n32), .CI(n5), .CO(n4), .S(product[22]) );
  CMPR42X1 U459 ( .A(n64), .B(n174), .C(n186), .D(n162), .ICI(n198), .S(n62), 
        .ICO(n60), .CO(n61) );
  INVX16 U460 ( .A(n474), .Y(n515) );
  NOR2X1 U461 ( .A(n478), .B(n493), .Y(n196) );
  BUFX8 U462 ( .A(b[0]), .Y(n481) );
  ADDFHX4 U463 ( .A(n53), .B(n58), .CI(n10), .CO(n9), .S(product[17]) );
  ADDFHX4 U464 ( .A(n59), .B(n66), .CI(n11), .CO(n10), .S(product[16]) );
  ADDFHX2 U465 ( .A(n85), .B(n93), .CI(n14), .CO(n13), .S(product[13]) );
  AO21XL U466 ( .A0(n436), .A1(n477), .B0(n484), .Y(n197) );
  AND2X8 U467 ( .A(n513), .B(n579), .Y(n474) );
  XOR2X4 U468 ( .A(n494), .B(n495), .Y(product[23]) );
  ADDFHX2 U469 ( .A(n123), .B(n127), .CI(n19), .CO(n18), .S(product[8]) );
  XOR2XL U470 ( .A(b[3]), .B(n485), .Y(n518) );
  XOR2XL U471 ( .A(b[3]), .B(n484), .Y(n531) );
  XOR2XL U472 ( .A(b[6]), .B(n486), .Y(n507) );
  XOR2XL U473 ( .A(b[5]), .B(n485), .Y(n520) );
  XOR2XL U474 ( .A(b[4]), .B(n484), .Y(n532) );
  XOR2XL U475 ( .A(b[5]), .B(n484), .Y(n533) );
  XOR2XL U476 ( .A(b[6]), .B(n485), .Y(n521) );
  XOR2XL U477 ( .A(b[3]), .B(n483), .Y(n544) );
  XOR2XL U478 ( .A(b[2]), .B(n483), .Y(n543) );
  XOR2XL U479 ( .A(b[4]), .B(n483), .Y(n545) );
  XOR2XL U480 ( .A(b[7]), .B(n485), .Y(n522) );
  XOR2XL U481 ( .A(b[8]), .B(n485), .Y(n523) );
  XOR2XL U482 ( .A(b[8]), .B(n486), .Y(n509) );
  XOR2XL U483 ( .A(b[2]), .B(n482), .Y(n557) );
  XOR2XL U484 ( .A(b[5]), .B(n483), .Y(n546) );
  XOR2XL U485 ( .A(b[6]), .B(n484), .Y(n534) );
  XOR2XL U486 ( .A(b[4]), .B(n482), .Y(n559) );
  XOR2XL U487 ( .A(b[7]), .B(n484), .Y(n535) );
  XOR2XL U488 ( .A(b[8]), .B(n484), .Y(n536) );
  XOR2XL U489 ( .A(b[6]), .B(n483), .Y(n547) );
  XOR2XL U490 ( .A(b[9]), .B(n484), .Y(n537) );
  XOR2XL U491 ( .A(b[5]), .B(n482), .Y(n560) );
  AO21XL U492 ( .A0(n515), .A1(n513), .B0(n485), .Y(n211) );
  XOR2XL U493 ( .A(b[7]), .B(n483), .Y(n548) );
  XOR2XL U494 ( .A(b[8]), .B(n483), .Y(n549) );
  XOR2XL U495 ( .A(b[6]), .B(n482), .Y(n561) );
  XOR2XL U496 ( .A(b[10]), .B(n484), .Y(n538) );
  XOR2XL U497 ( .A(b[11]), .B(n484), .Y(n539) );
  XOR2XL U498 ( .A(b[3]), .B(n491), .Y(n570) );
  XOR2XL U499 ( .A(b[4]), .B(n491), .Y(n571) );
  NAND2XL U500 ( .A(b[1]), .B(a[11]), .Y(n91) );
  XOR2XL U501 ( .A(b[7]), .B(n482), .Y(n562) );
  XOR2XL U502 ( .A(b[9]), .B(n483), .Y(n550) );
  XOR2XL U503 ( .A(b[8]), .B(n482), .Y(n563) );
  XOR2XL U504 ( .A(b[10]), .B(n483), .Y(n551) );
  XOR2XL U505 ( .A(b[6]), .B(n491), .Y(n573) );
  XOR2XL U506 ( .A(b[5]), .B(n491), .Y(n572) );
  XOR2XL U507 ( .A(b[10]), .B(n482), .Y(n565) );
  XOR2XL U508 ( .A(b[11]), .B(n483), .Y(n552) );
  XOR2XL U509 ( .A(b[9]), .B(n482), .Y(n564) );
  XOR2XL U510 ( .A(b[8]), .B(n491), .Y(n575) );
  XOR2XL U511 ( .A(b[7]), .B(n491), .Y(n574) );
  NAND2XL U512 ( .A(b[4]), .B(a[11]), .Y(n64) );
  AO21XL U513 ( .A0(n435), .A1(n478), .B0(n483), .Y(n183) );
  XOR2XL U514 ( .A(b[11]), .B(n482), .Y(n566) );
  XOR2XL U515 ( .A(b[9]), .B(n491), .Y(n576) );
  NAND2XL U516 ( .A(b[6]), .B(a[11]), .Y(n50) );
  AO21XL U517 ( .A0(n555), .A1(n479), .B0(n482), .Y(n169) );
  XOR2XL U518 ( .A(b[11]), .B(n491), .Y(n578) );
  XOR2XL U519 ( .A(b[10]), .B(n491), .Y(n577) );
  NAND2XL U520 ( .A(b[8]), .B(a[11]), .Y(n38) );
  OAI32XL U521 ( .A0(n484), .A1(n481), .A2(n477), .B0(n484), .B1(n436), .Y(
        n145) );
  ADDHX1 U522 ( .A(n181), .B(n143), .CO(n119), .S(n120) );
  OAI32XL U523 ( .A0(n482), .A1(n481), .A2(n479), .B0(n482), .B1(n555), .Y(
        n143) );
  XOR2XL U524 ( .A(n482), .B(n481), .Y(n554) );
  ADDHX1 U525 ( .A(n195), .B(n471), .CO(n129), .S(n130) );
  OAI32XL U526 ( .A0(n483), .A1(n481), .A2(n478), .B0(n483), .B1(n435), .Y(
        n144) );
  XOR2XL U527 ( .A(n483), .B(n481), .Y(n541) );
  ADDHX1 U528 ( .A(n167), .B(n142), .CO(n106), .S(n107) );
  OAI32XL U529 ( .A0(n491), .A1(n481), .A2(n480), .B0(n491), .B1(n499), .Y(
        n142) );
  XOR2XL U530 ( .A(n493), .B(a[11]), .Y(n567) );
  NOR2XL U531 ( .A(n492), .B(n493), .Y(product[0]) );
  ADDFXL U532 ( .A(n128), .B(n132), .CI(n20), .CO(n19), .S(product[7]) );
  CLKINVX1 U533 ( .A(n91), .Y(n487) );
  CLKINVX1 U534 ( .A(n50), .Y(n489) );
  CLKINVX1 U535 ( .A(n64), .Y(n488) );
  CLKINVX1 U536 ( .A(n38), .Y(n490) );
  NAND2X2 U537 ( .A(n434), .B(n492), .Y(n501) );
  INVX3 U538 ( .A(n481), .Y(n493) );
  INVX3 U539 ( .A(a[0]), .Y(n492) );
  XOR2X1 U540 ( .A(n497), .B(n498), .Y(n494) );
  AND2X1 U541 ( .A(b[11]), .B(a[11]), .Y(n498) );
  AO21X1 U542 ( .A0(n499), .A1(n480), .B0(n491), .Y(n497) );
  OAI22XL U543 ( .A0(n481), .A1(n472), .B0(n502), .B1(n492), .Y(n237) );
  OAI22XL U544 ( .A0(n502), .A1(n472), .B0(n503), .B1(n492), .Y(n236) );
  OAI22XL U545 ( .A0(n504), .A1(n472), .B0(n505), .B1(n492), .Y(n234) );
  OAI22XL U546 ( .A0(n507), .A1(n472), .B0(n508), .B1(n492), .Y(n231) );
  NOR2X1 U547 ( .A(n513), .B(n493), .Y(n224) );
  OAI22XL U548 ( .A0(n519), .A1(n515), .B0(n513), .B1(n520), .Y(n219) );
  OAI22XL U549 ( .A0(n520), .A1(n515), .B0(n513), .B1(n521), .Y(n218) );
  OAI22XL U550 ( .A0(n521), .A1(n515), .B0(n513), .B1(n522), .Y(n217) );
  OAI22XL U551 ( .A0(n522), .A1(n515), .B0(n513), .B1(n523), .Y(n216) );
  OAI22XL U552 ( .A0(n523), .A1(n515), .B0(n513), .B1(n524), .Y(n215) );
  NOR2X1 U553 ( .A(n477), .B(n493), .Y(n210) );
  OAI22XL U554 ( .A0(n529), .A1(n436), .B0(n477), .B1(n530), .Y(n208) );
  OAI22XL U555 ( .A0(n530), .A1(n436), .B0(n477), .B1(n531), .Y(n207) );
  OAI22XL U556 ( .A0(n531), .A1(n436), .B0(n477), .B1(n532), .Y(n206) );
  OAI22XL U557 ( .A0(n532), .A1(n436), .B0(n477), .B1(n533), .Y(n205) );
  OAI22XL U558 ( .A0(n533), .A1(n436), .B0(n477), .B1(n534), .Y(n204) );
  OAI22XL U559 ( .A0(n534), .A1(n436), .B0(n477), .B1(n535), .Y(n203) );
  OAI22XL U560 ( .A0(n535), .A1(n436), .B0(n477), .B1(n536), .Y(n202) );
  OAI22XL U561 ( .A0(n536), .A1(n436), .B0(n477), .B1(n537), .Y(n201) );
  OAI22XL U562 ( .A0(n537), .A1(n436), .B0(n477), .B1(n538), .Y(n200) );
  OAI22XL U563 ( .A0(n538), .A1(n436), .B0(n477), .B1(n539), .Y(n199) );
  OAI22XL U564 ( .A0(n539), .A1(n436), .B0(n477), .B1(n484), .Y(n198) );
  OAI22XL U565 ( .A0(n542), .A1(n435), .B0(n478), .B1(n543), .Y(n194) );
  OAI22XL U566 ( .A0(n543), .A1(n435), .B0(n478), .B1(n544), .Y(n193) );
  OAI22XL U567 ( .A0(n544), .A1(n435), .B0(n478), .B1(n545), .Y(n192) );
  OAI22XL U568 ( .A0(n545), .A1(n435), .B0(n478), .B1(n546), .Y(n191) );
  OAI22XL U569 ( .A0(n546), .A1(n435), .B0(n478), .B1(n547), .Y(n190) );
  OAI22XL U570 ( .A0(n547), .A1(n435), .B0(n478), .B1(n548), .Y(n189) );
  OAI22XL U571 ( .A0(n548), .A1(n435), .B0(n478), .B1(n549), .Y(n188) );
  OAI22XL U572 ( .A0(n549), .A1(n435), .B0(n478), .B1(n550), .Y(n187) );
  OAI22XL U573 ( .A0(n550), .A1(n435), .B0(n478), .B1(n551), .Y(n186) );
  OAI22XL U574 ( .A0(n551), .A1(n435), .B0(n478), .B1(n552), .Y(n185) );
  OAI22XL U575 ( .A0(n552), .A1(n435), .B0(n478), .B1(n483), .Y(n184) );
  NOR2X1 U576 ( .A(n479), .B(n493), .Y(n182) );
  OAI22XL U577 ( .A0(n554), .A1(n555), .B0(n479), .B1(n556), .Y(n181) );
  OAI22XL U578 ( .A0(n556), .A1(n555), .B0(n479), .B1(n557), .Y(n180) );
  OAI22XL U579 ( .A0(n557), .A1(n555), .B0(n479), .B1(n558), .Y(n179) );
  OAI22XL U580 ( .A0(n558), .A1(n555), .B0(n479), .B1(n559), .Y(n178) );
  OAI22XL U581 ( .A0(n559), .A1(n555), .B0(n479), .B1(n560), .Y(n177) );
  OAI22XL U582 ( .A0(n560), .A1(n555), .B0(n479), .B1(n561), .Y(n176) );
  OAI22XL U583 ( .A0(n561), .A1(n555), .B0(n479), .B1(n562), .Y(n175) );
  OAI22XL U584 ( .A0(n562), .A1(n555), .B0(n479), .B1(n563), .Y(n174) );
  OAI22XL U585 ( .A0(n563), .A1(n555), .B0(n479), .B1(n564), .Y(n173) );
  OAI22XL U586 ( .A0(n564), .A1(n555), .B0(n479), .B1(n565), .Y(n172) );
  OAI22XL U587 ( .A0(n565), .A1(n555), .B0(n479), .B1(n566), .Y(n171) );
  OAI22XL U588 ( .A0(n566), .A1(n555), .B0(n479), .B1(n482), .Y(n170) );
  NOR2X1 U589 ( .A(n480), .B(n493), .Y(n168) );
  OAI22XL U590 ( .A0(n570), .A1(n499), .B0(n480), .B1(n571), .Y(n164) );
  OAI22XL U591 ( .A0(n571), .A1(n499), .B0(n480), .B1(n572), .Y(n163) );
  OAI22XL U592 ( .A0(n572), .A1(n499), .B0(n480), .B1(n573), .Y(n162) );
  OAI22XL U593 ( .A0(n573), .A1(n499), .B0(n480), .B1(n574), .Y(n161) );
  OAI22XL U594 ( .A0(n574), .A1(n499), .B0(n480), .B1(n575), .Y(n160) );
  OAI22XL U595 ( .A0(n575), .A1(n499), .B0(n480), .B1(n576), .Y(n159) );
  OAI22XL U596 ( .A0(n576), .A1(n499), .B0(n480), .B1(n577), .Y(n158) );
  OAI22XL U597 ( .A0(n577), .A1(n499), .B0(n480), .B1(n578), .Y(n157) );
  OAI22XL U598 ( .A0(n578), .A1(n499), .B0(n480), .B1(n491), .Y(n156) );
  NOR2X1 U599 ( .A(n491), .B(n493), .Y(n154) );
  NOR2BX1 U600 ( .AN(b[2]), .B(n491), .Y(n153) );
  NOR2BX1 U601 ( .AN(b[3]), .B(n491), .Y(n152) );
  NOR2BX1 U602 ( .AN(b[5]), .B(n491), .Y(n151) );
  NOR2BX1 U603 ( .AN(b[7]), .B(n491), .Y(n150) );
  NOR2BX1 U604 ( .AN(b[9]), .B(n491), .Y(n149) );
  OAI21XL U605 ( .A0(n481), .A1(n486), .B0(n472), .Y(n147) );
  OAI32X1 U606 ( .A0(n485), .A1(n481), .A2(n513), .B0(n485), .B1(n515), .Y(
        n146) );
  XOR2X1 U607 ( .A(n473), .B(a[2]), .Y(n579) );
  XOR2X1 U608 ( .A(a[5]), .B(a[4]), .Y(n580) );
  XOR2X1 U609 ( .A(a[7]), .B(a[6]), .Y(n581) );
  XOR2X1 U610 ( .A(a[9]), .B(a[8]), .Y(n582) );
endmodule


module READ_DW_mult_tc_3 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n111, n112,
         n113, n114, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202;

  ADDFXL U3 ( .A(n21), .B(n20), .CI(n3), .CO(n2), .S(product[18]) );
  ADDFXL U4 ( .A(n22), .B(n24), .CI(n4), .CO(n3), .S(product[17]) );
  ADDFXL U5 ( .A(n27), .B(n25), .CI(n5), .CO(n4), .S(product[16]) );
  ADDFXL U6 ( .A(n28), .B(n30), .CI(n6), .CO(n5), .S(product[15]) );
  ADDFXL U7 ( .A(n31), .B(n35), .CI(n7), .CO(n6), .S(product[14]) );
  ADDFXL U8 ( .A(n36), .B(n40), .CI(n8), .CO(n7), .S(product[13]) );
  ADDFXL U9 ( .A(n41), .B(n46), .CI(n9), .CO(n8), .S(product[12]) );
  ADDFXL U10 ( .A(n47), .B(n53), .CI(n10), .CO(n9), .S(product[11]) );
  ADDFXL U12 ( .A(n61), .B(n65), .CI(n12), .CO(n11), .S(product[9]) );
  ADDFXL U14 ( .A(n70), .B(n73), .CI(n14), .CO(n13), .S(product[7]) );
  ADDFXL U17 ( .A(n80), .B(n131), .CI(n17), .CO(n16), .S(product[4]) );
  ADDHXL U18 ( .A(n133), .B(n18), .CO(n17), .S(product[3]) );
  ADDHXL U19 ( .A(a[1]), .B(n134), .CO(n18), .S(product[2]) );
  ADDFXL U20 ( .A(n90), .B(a[9]), .CI(n82), .CO(n19), .S(n20) );
  ADDFXL U21 ( .A(n83), .B(n91), .CI(n23), .CO(n21), .S(n22) );
  CMPR42X1 U22 ( .A(a[8]), .B(n99), .C(n92), .D(n84), .ICI(n26), .S(n25), 
        .ICO(n23), .CO(n24) );
  CMPR42X1 U23 ( .A(n100), .B(n93), .C(n85), .D(n32), .ICI(n29), .S(n28), 
        .ICO(n26), .CO(n27) );
  CMPR42X1 U24 ( .A(n101), .B(n86), .C(n33), .D(n37), .ICI(n34), .S(n31), 
        .ICO(n29), .CO(n30) );
  ADDFXL U25 ( .A(n107), .B(a[7]), .CI(n94), .CO(n32), .S(n33) );
  CMPR42X1 U26 ( .A(n102), .B(n42), .C(n43), .D(n38), .ICI(n39), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFXL U27 ( .A(n95), .B(n108), .CI(n87), .CO(n37), .S(n38) );
  CMPR42X1 U28 ( .A(n96), .B(n50), .C(n44), .D(n48), .ICI(n45), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U29 ( .A(a[6]), .B(n114), .C(n109), .D(n103), .ICI(n88), .S(n44), 
        .ICO(n42), .CO(n43) );
  CMPR42X1 U30 ( .A(n57), .B(n51), .C(n55), .D(n52), .ICI(n49), .S(n47), .ICO(
        n45), .CO(n46) );
  ADDFXL U31 ( .A(n97), .B(n104), .CI(n89), .CO(n48), .S(n49) );
  CMPR42X1 U34 ( .A(n116), .B(n62), .C(n58), .D(n59), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFXL U35 ( .A(n98), .B(n120), .CI(n111), .CO(n55), .S(n56) );
  ADDHXL U36 ( .A(a[5]), .B(n105), .CO(n57), .S(n58) );
  ADDHXL U44 ( .A(a[3]), .B(n129), .CO(n75), .S(n76) );
  ADDHXL U45 ( .A(n130), .B(n128), .CO(n77), .S(n78) );
  ADDHXL U46 ( .A(a[2]), .B(n132), .CO(n79), .S(n80) );
  NOR2X4 U123 ( .A(n198), .B(n192), .Y(n119) );
  ADDFXL U124 ( .A(n124), .B(n127), .CI(n77), .CO(n73), .S(n74) );
  NOR2X1 U125 ( .A(n198), .B(n193), .Y(n124) );
  INVX3 U126 ( .A(b[0]), .Y(n198) );
  ADDFXL U127 ( .A(n75), .B(n123), .CI(n72), .CO(n69), .S(n70) );
  CMPR42X1 U128 ( .A(n121), .B(n117), .C(n67), .D(n64), .ICI(n63), .S(n61), 
        .ICO(n59), .CO(n60) );
  ADDFXL U129 ( .A(n74), .B(n76), .CI(n15), .CO(n14), .S(product[6]) );
  ADDFXL U130 ( .A(n78), .B(n79), .CI(n16), .CO(n15), .S(product[5]) );
  ADDFXL U131 ( .A(n69), .B(n66), .CI(n13), .CO(n12), .S(product[8]) );
  ADDFXL U132 ( .A(n54), .B(n60), .CI(n11), .CO(n10), .S(product[10]) );
  INVX3 U133 ( .A(b[8]), .Y(n190) );
  ADDHX2 U134 ( .A(n126), .B(n119), .CO(n71), .S(n72) );
  INVX6 U135 ( .A(b[2]), .Y(n196) );
  INVX6 U136 ( .A(b[1]), .Y(n197) );
  NOR2XL U137 ( .A(n196), .B(n192), .Y(n117) );
  INVX6 U138 ( .A(b[5]), .Y(n193) );
  INVX6 U139 ( .A(b[4]), .Y(n194) );
  INVX6 U140 ( .A(b[3]), .Y(n195) );
  NOR2X1 U141 ( .A(n191), .B(n197), .Y(n112) );
  ADDHXL U142 ( .A(n112), .B(n106), .CO(n62), .S(n63) );
  NOR2X1 U143 ( .A(n191), .B(n198), .Y(n113) );
  CMPR42X1 U144 ( .A(n125), .B(n113), .C(n122), .D(n71), .ICI(n68), .S(n66), 
        .ICO(n64), .CO(n65) );
  NOR2X1 U145 ( .A(n197), .B(n196), .Y(n132) );
  ADDHXL U146 ( .A(a[4]), .B(n118), .CO(n67), .S(n68) );
  NOR2X1 U147 ( .A(n197), .B(n192), .Y(n118) );
  NOR2XL U148 ( .A(n196), .B(n193), .Y(n122) );
  NOR2XL U149 ( .A(n196), .B(n195), .Y(n129) );
  NAND2XL U150 ( .A(b[6]), .B(b[4]), .Y(n201) );
  NAND2XL U151 ( .A(b[3]), .B(b[7]), .Y(n202) );
  NAND2XL U152 ( .A(b[5]), .B(b[10]), .Y(n84) );
  NOR2XL U153 ( .A(n190), .B(n191), .Y(n99) );
  NOR2XL U154 ( .A(n189), .B(n192), .Y(n92) );
  CLKBUFX2 U155 ( .A(b[0]), .Y(product[0]) );
  INVX3 U156 ( .A(b[7]), .Y(n191) );
  INVX3 U157 ( .A(b[6]), .Y(n192) );
  INVX3 U158 ( .A(b[9]), .Y(n189) );
  XOR2X1 U159 ( .A(n199), .B(n200), .Y(product[19]) );
  XOR2X1 U160 ( .A(n2), .B(n19), .Y(n200) );
  NAND2X1 U161 ( .A(b[10]), .B(b[8]), .Y(n199) );
  NOR2X1 U162 ( .A(n198), .B(n189), .Y(n98) );
  NOR2X1 U163 ( .A(n189), .B(n197), .Y(n97) );
  NOR2X1 U164 ( .A(n189), .B(n196), .Y(n96) );
  NOR2X1 U165 ( .A(n189), .B(n195), .Y(n95) );
  NOR2X1 U166 ( .A(n189), .B(n194), .Y(n94) );
  NOR2X1 U167 ( .A(n189), .B(n193), .Y(n93) );
  NOR2X1 U168 ( .A(n191), .B(n189), .Y(n91) );
  NOR2X1 U169 ( .A(n190), .B(n189), .Y(n90) );
  NAND2X1 U170 ( .A(b[0]), .B(b[10]), .Y(n89) );
  NAND2X1 U171 ( .A(b[1]), .B(b[10]), .Y(n88) );
  NAND2X1 U172 ( .A(b[2]), .B(b[10]), .Y(n87) );
  NAND2X1 U173 ( .A(b[3]), .B(b[10]), .Y(n86) );
  NAND2X1 U174 ( .A(b[4]), .B(b[10]), .Y(n85) );
  NAND2X1 U175 ( .A(b[6]), .B(b[10]), .Y(n83) );
  NAND2X1 U176 ( .A(b[7]), .B(b[10]), .Y(n82) );
  XNOR2X1 U177 ( .A(n201), .B(n202), .Y(n51) );
  NAND2X1 U178 ( .A(n202), .B(n201), .Y(n50) );
  NOR2X1 U179 ( .A(n198), .B(n197), .Y(n134) );
  NOR2X1 U180 ( .A(n198), .B(n196), .Y(n133) );
  NOR2X1 U181 ( .A(n198), .B(n195), .Y(n131) );
  NOR2X1 U182 ( .A(n197), .B(n195), .Y(n130) );
  NOR2X1 U183 ( .A(n198), .B(n194), .Y(n128) );
  NOR2X1 U184 ( .A(n197), .B(n194), .Y(n127) );
  NOR2X1 U185 ( .A(n196), .B(n194), .Y(n126) );
  NOR2X1 U186 ( .A(n195), .B(n194), .Y(n125) );
  NOR2X1 U187 ( .A(n197), .B(n193), .Y(n123) );
  NOR2X1 U188 ( .A(n195), .B(n193), .Y(n121) );
  NOR2X1 U189 ( .A(n194), .B(n193), .Y(n120) );
  NOR2X1 U190 ( .A(n195), .B(n192), .Y(n116) );
  NOR2X1 U191 ( .A(n193), .B(n192), .Y(n114) );
  NOR2X1 U192 ( .A(n191), .B(n196), .Y(n111) );
  NOR2X1 U193 ( .A(n191), .B(n194), .Y(n109) );
  NOR2X1 U194 ( .A(n191), .B(n193), .Y(n108) );
  NOR2X1 U195 ( .A(n191), .B(n192), .Y(n107) );
  NOR2X1 U196 ( .A(n190), .B(n198), .Y(n106) );
  NOR2X1 U197 ( .A(n190), .B(n197), .Y(n105) );
  NOR2X1 U198 ( .A(n190), .B(n196), .Y(n104) );
  NOR2X1 U199 ( .A(n190), .B(n195), .Y(n103) );
  NOR2X1 U200 ( .A(n190), .B(n194), .Y(n102) );
  NOR2X1 U201 ( .A(n190), .B(n193), .Y(n101) );
  NOR2X1 U202 ( .A(n190), .B(n192), .Y(n100) );
endmodule


module READ_DW_mult_tc_2 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n111, n112,
         n113, n114, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202;

  ADDFXL U4 ( .A(n22), .B(n24), .CI(n4), .CO(n3), .S(product[17]) );
  ADDFXL U5 ( .A(n27), .B(n25), .CI(n5), .CO(n4), .S(product[16]) );
  ADDFXL U6 ( .A(n28), .B(n30), .CI(n6), .CO(n5), .S(product[15]) );
  ADDFXL U7 ( .A(n31), .B(n35), .CI(n7), .CO(n6), .S(product[14]) );
  ADDFXL U8 ( .A(n36), .B(n40), .CI(n8), .CO(n7), .S(product[13]) );
  ADDFXL U9 ( .A(n41), .B(n46), .CI(n9), .CO(n8), .S(product[12]) );
  ADDFXL U10 ( .A(n47), .B(n53), .CI(n10), .CO(n9), .S(product[11]) );
  ADDFXL U11 ( .A(n54), .B(n60), .CI(n11), .CO(n10), .S(product[10]) );
  ADDFXL U12 ( .A(n61), .B(n65), .CI(n12), .CO(n11), .S(product[9]) );
  ADDFXL U14 ( .A(n70), .B(n73), .CI(n14), .CO(n13), .S(product[7]) );
  ADDFXL U17 ( .A(n80), .B(n131), .CI(n17), .CO(n16), .S(product[4]) );
  ADDHXL U19 ( .A(a[1]), .B(n134), .CO(n18), .S(product[2]) );
  ADDFXL U21 ( .A(n83), .B(n91), .CI(n23), .CO(n21), .S(n22) );
  CMPR42X1 U22 ( .A(a[8]), .B(n99), .C(n92), .D(n84), .ICI(n26), .S(n25), 
        .ICO(n23), .CO(n24) );
  CMPR42X1 U23 ( .A(n100), .B(n93), .C(n85), .D(n32), .ICI(n29), .S(n28), 
        .ICO(n26), .CO(n27) );
  CMPR42X1 U24 ( .A(n101), .B(n86), .C(n33), .D(n37), .ICI(n34), .S(n31), 
        .ICO(n29), .CO(n30) );
  ADDFXL U25 ( .A(n107), .B(a[7]), .CI(n94), .CO(n32), .S(n33) );
  CMPR42X1 U26 ( .A(n102), .B(n42), .C(n43), .D(n38), .ICI(n39), .S(n36), 
        .ICO(n34), .CO(n35) );
  ADDFXL U27 ( .A(n95), .B(n108), .CI(n87), .CO(n37), .S(n38) );
  CMPR42X1 U28 ( .A(n96), .B(n50), .C(n44), .D(n48), .ICI(n45), .S(n41), .ICO(
        n39), .CO(n40) );
  CMPR42X1 U29 ( .A(a[6]), .B(n114), .C(n109), .D(n103), .ICI(n88), .S(n44), 
        .ICO(n42), .CO(n43) );
  CMPR42X1 U30 ( .A(n57), .B(n51), .C(n55), .D(n52), .ICI(n49), .S(n47), .ICO(
        n45), .CO(n46) );
  ADDFXL U31 ( .A(n97), .B(n104), .CI(n89), .CO(n48), .S(n49) );
  ADDFXL U35 ( .A(n98), .B(n120), .CI(n111), .CO(n55), .S(n56) );
  ADDHXL U36 ( .A(a[5]), .B(n105), .CO(n57), .S(n58) );
  CMPR42X1 U37 ( .A(n121), .B(n117), .C(n67), .D(n64), .ICI(n63), .S(n61), 
        .ICO(n59), .CO(n60) );
  ADDHXL U38 ( .A(n112), .B(n106), .CO(n62), .S(n63) );
  CMPR42X1 U39 ( .A(n125), .B(n113), .C(n122), .D(n71), .ICI(n68), .S(n66), 
        .ICO(n64), .CO(n65) );
  ADDHXL U44 ( .A(a[3]), .B(n129), .CO(n75), .S(n76) );
  ADDHXL U45 ( .A(n130), .B(n128), .CO(n77), .S(n78) );
  ADDHXL U46 ( .A(a[2]), .B(n132), .CO(n79), .S(n80) );
  ADDHXL U123 ( .A(n126), .B(n119), .CO(n71), .S(n72) );
  ADDFXL U124 ( .A(n124), .B(n127), .CI(n77), .CO(n73), .S(n74) );
  NOR2X1 U125 ( .A(n198), .B(n193), .Y(n124) );
  INVX3 U126 ( .A(b[1]), .Y(n197) );
  INVX3 U127 ( .A(b[3]), .Y(n195) );
  ADDHXL U128 ( .A(n133), .B(n18), .CO(n17), .S(product[3]) );
  ADDFXL U129 ( .A(n78), .B(n79), .CI(n16), .CO(n15), .S(product[5]) );
  INVX3 U130 ( .A(b[7]), .Y(n191) );
  INVX3 U131 ( .A(b[8]), .Y(n190) );
  ADDFXL U132 ( .A(n21), .B(n20), .CI(n3), .CO(n2), .S(product[18]) );
  INVX3 U133 ( .A(b[0]), .Y(n198) );
  INVX6 U134 ( .A(b[2]), .Y(n196) );
  NOR2XL U135 ( .A(n197), .B(n192), .Y(n118) );
  INVX6 U136 ( .A(b[4]), .Y(n194) );
  ADDFXL U137 ( .A(n69), .B(n66), .CI(n13), .CO(n12), .S(product[8]) );
  CMPR42X1 U138 ( .A(n116), .B(n62), .C(n58), .D(n59), .ICI(n56), .S(n54), 
        .ICO(n52), .CO(n53) );
  ADDFXL U139 ( .A(n74), .B(n76), .CI(n15), .CO(n14), .S(product[6]) );
  ADDFXL U140 ( .A(n75), .B(n123), .CI(n72), .CO(n69), .S(n70) );
  NOR2X1 U141 ( .A(n197), .B(n193), .Y(n123) );
  NOR2X1 U142 ( .A(n198), .B(n192), .Y(n119) );
  ADDHXL U143 ( .A(a[4]), .B(n118), .CO(n67), .S(n68) );
  NOR2X1 U144 ( .A(n197), .B(n196), .Y(n132) );
  ADDFXL U145 ( .A(n90), .B(a[9]), .CI(n82), .CO(n19), .S(n20) );
  NOR2XL U146 ( .A(n195), .B(n192), .Y(n116) );
  NOR2XL U147 ( .A(n197), .B(n194), .Y(n127) );
  NOR2XL U148 ( .A(n196), .B(n194), .Y(n126) );
  NOR2XL U149 ( .A(n196), .B(n195), .Y(n129) );
  NOR2XL U150 ( .A(n191), .B(n192), .Y(n107) );
  NOR2XL U151 ( .A(n189), .B(n194), .Y(n94) );
  NAND2XL U152 ( .A(b[6]), .B(b[4]), .Y(n201) );
  NAND2XL U153 ( .A(b[3]), .B(b[7]), .Y(n202) );
  NAND2XL U154 ( .A(b[5]), .B(b[10]), .Y(n84) );
  NOR2XL U155 ( .A(n190), .B(n191), .Y(n99) );
  NOR2XL U156 ( .A(n189), .B(n192), .Y(n92) );
  NAND2XL U157 ( .A(b[7]), .B(b[10]), .Y(n82) );
  NOR2XL U158 ( .A(n190), .B(n189), .Y(n90) );
  NAND2XL U159 ( .A(b[10]), .B(b[8]), .Y(n199) );
  CLKBUFX2 U160 ( .A(b[0]), .Y(product[0]) );
  INVX3 U161 ( .A(b[6]), .Y(n192) );
  INVX3 U162 ( .A(b[5]), .Y(n193) );
  INVX3 U163 ( .A(b[9]), .Y(n189) );
  XOR2X1 U164 ( .A(n199), .B(n200), .Y(product[19]) );
  XOR2X1 U165 ( .A(n2), .B(n19), .Y(n200) );
  NOR2X1 U166 ( .A(n198), .B(n189), .Y(n98) );
  NOR2X1 U167 ( .A(n189), .B(n197), .Y(n97) );
  NOR2X1 U168 ( .A(n189), .B(n196), .Y(n96) );
  NOR2X1 U169 ( .A(n189), .B(n195), .Y(n95) );
  NOR2X1 U170 ( .A(n189), .B(n193), .Y(n93) );
  NOR2X1 U171 ( .A(n191), .B(n189), .Y(n91) );
  NAND2X1 U172 ( .A(b[0]), .B(b[10]), .Y(n89) );
  NAND2X1 U173 ( .A(b[1]), .B(b[10]), .Y(n88) );
  NAND2X1 U174 ( .A(b[2]), .B(b[10]), .Y(n87) );
  NAND2X1 U175 ( .A(b[3]), .B(b[10]), .Y(n86) );
  NAND2X1 U176 ( .A(b[4]), .B(b[10]), .Y(n85) );
  NAND2X1 U177 ( .A(b[6]), .B(b[10]), .Y(n83) );
  XNOR2X1 U178 ( .A(n201), .B(n202), .Y(n51) );
  NAND2X1 U179 ( .A(n202), .B(n201), .Y(n50) );
  NOR2X1 U180 ( .A(n198), .B(n197), .Y(n134) );
  NOR2X1 U181 ( .A(n198), .B(n196), .Y(n133) );
  NOR2X1 U182 ( .A(n198), .B(n195), .Y(n131) );
  NOR2X1 U183 ( .A(n197), .B(n195), .Y(n130) );
  NOR2X1 U184 ( .A(n198), .B(n194), .Y(n128) );
  NOR2X1 U185 ( .A(n195), .B(n194), .Y(n125) );
  NOR2X1 U186 ( .A(n196), .B(n193), .Y(n122) );
  NOR2X1 U187 ( .A(n195), .B(n193), .Y(n121) );
  NOR2X1 U188 ( .A(n194), .B(n193), .Y(n120) );
  NOR2X1 U189 ( .A(n196), .B(n192), .Y(n117) );
  NOR2X1 U190 ( .A(n193), .B(n192), .Y(n114) );
  NOR2X1 U191 ( .A(n191), .B(n198), .Y(n113) );
  NOR2X1 U192 ( .A(n191), .B(n197), .Y(n112) );
  NOR2X1 U193 ( .A(n191), .B(n196), .Y(n111) );
  NOR2X1 U194 ( .A(n191), .B(n194), .Y(n109) );
  NOR2X1 U195 ( .A(n191), .B(n193), .Y(n108) );
  NOR2X1 U196 ( .A(n190), .B(n198), .Y(n106) );
  NOR2X1 U197 ( .A(n190), .B(n197), .Y(n105) );
  NOR2X1 U198 ( .A(n190), .B(n196), .Y(n104) );
  NOR2X1 U199 ( .A(n190), .B(n195), .Y(n103) );
  NOR2X1 U200 ( .A(n190), .B(n194), .Y(n102) );
  NOR2X1 U201 ( .A(n190), .B(n193), .Y(n101) );
  NOR2X1 U202 ( .A(n190), .B(n192), .Y(n100) );
endmodule


module READ_DW01_add_3 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [19:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFXL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFXL U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFXL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFXL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFXL U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR3X2 U1_19 ( .A(A[19]), .B(B[19]), .C(carry[19]), .Y(SUM[19]) );
  ADDFX2 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFXL U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2 U1 ( .A(B[2]), .B(A[2]), .Y(n1) );
  AND2X2 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[1]) );
  XOR2X1 U3 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
  XOR2X1 U4 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module READ_DW01_add_2 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n2;
  wire   [11:1] carry;

  ADDFHX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  XOR2X4 U1 ( .A(B[10]), .B(carry[10]), .Y(SUM[10]) );
  CLKAND2X12 U2 ( .A(B[0]), .B(A[0]), .Y(n2) );
  XOR2X1 U3 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2X2 U4 ( .A(B[10]), .B(carry[10]), .Y(SUM[11]) );
endmodule


module READ_DW01_add_1 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4;
  wire   [11:1] carry;

  ADDFHX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  NAND2X4 U1 ( .A(carry[7]), .B(A[7]), .Y(n2) );
  NAND2X4 U2 ( .A(B[7]), .B(carry[7]), .Y(n4) );
  XOR2X2 U3 ( .A(carry[7]), .B(B[7]), .Y(n1) );
  NAND2X2 U4 ( .A(B[7]), .B(A[7]), .Y(n3) );
  XOR2X4 U5 ( .A(A[7]), .B(n1), .Y(SUM[7]) );
  NAND3X4 U6 ( .A(n2), .B(n3), .C(n4), .Y(carry[8]) );
  AND2X4 U7 ( .A(B[0]), .B(A[0]), .Y(carry[1]) );
  XOR2X2 U8 ( .A(A[11]), .B(carry[11]), .Y(SUM[11]) );
endmodule


module READ_DW_mult_uns_1 ( a, b, product );
  input [9:0] a;
  input [9:0] b;
  output [19:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n23, n24, n26, n27, n28, n29, n30, n31, n32, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n108, n109, n110, n111, n112, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416;

  ADDFXL U5 ( .A(n24), .B(n28), .CI(n5), .CO(n4), .S(product[18]) );
  ADDFXL U6 ( .A(n31), .B(n29), .CI(n6), .CO(n5), .S(product[17]) );
  ADDFXL U7 ( .A(n36), .B(n32), .CI(n7), .CO(n6), .S(product[16]) );
  ADDFXL U8 ( .A(n37), .B(n41), .CI(n8), .CO(n7), .S(product[15]) );
  ADDFXL U9 ( .A(n42), .B(n48), .CI(n9), .CO(n8), .S(product[14]) );
  ADDFXL U10 ( .A(n49), .B(n54), .CI(n10), .CO(n9), .S(product[13]) );
  ADDFXL U11 ( .A(n55), .B(n62), .CI(n11), .CO(n10), .S(product[12]) );
  ADDFXL U12 ( .A(n63), .B(n69), .CI(n12), .CO(n11), .S(product[11]) );
  ADDFXL U13 ( .A(n70), .B(n75), .CI(n13), .CO(n12), .S(product[10]) );
  ADDFXL U14 ( .A(n76), .B(n82), .CI(n14), .CO(n13), .S(product[9]) );
  ADDFXL U15 ( .A(n83), .B(n87), .CI(n15), .CO(n14), .S(product[8]) );
  ADDFXL U16 ( .A(n88), .B(n92), .CI(n16), .CO(n15), .S(product[7]) );
  ADDFXL U17 ( .A(n94), .B(n93), .CI(n17), .CO(n16), .S(product[6]) );
  ADDFXL U18 ( .A(n95), .B(n98), .CI(n18), .CO(n17), .S(product[5]) );
  ADDFXL U19 ( .A(n99), .B(n100), .CI(n19), .CO(n18), .S(product[4]) );
  ADDFXL U20 ( .A(n101), .B(n105), .CI(n20), .CO(n19), .S(product[3]) );
  ADDFXL U21 ( .A(n170), .B(n160), .CI(n21), .CO(n20), .S(product[2]) );
  ADDHXL U22 ( .A(n106), .B(n171), .CO(n21), .S(product[1]) );
  ADDFXL U24 ( .A(n114), .B(n26), .CI(n27), .CO(n23), .S(n24) );
  CMPR42X1 U26 ( .A(n340), .B(n108), .C(n125), .D(n115), .ICI(n30), .S(n29), 
        .ICO(n27), .CO(n28) );
  CMPR42X1 U27 ( .A(n34), .B(n126), .C(n116), .D(n38), .ICI(n35), .S(n32), 
        .ICO(n30), .CO(n31) );
  CMPR42X1 U29 ( .A(n127), .B(n117), .C(n39), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  ADDFXL U30 ( .A(n109), .B(n341), .CI(n137), .CO(n38), .S(n39) );
  CMPR42X1 U31 ( .A(n138), .B(n50), .C(n51), .D(n44), .ICI(n47), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U32 ( .A(n128), .B(n46), .CI(n118), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n119), .B(n56), .C(n57), .D(n52), .ICI(n53), .S(n49), 
        .ICO(n47), .CO(n48) );
  CMPR42X1 U35 ( .A(n342), .B(n110), .C(n149), .D(n129), .ICI(n139), .S(n52), 
        .ICO(n50), .CO(n51) );
  CMPR42X1 U36 ( .A(n120), .B(n64), .C(n65), .D(n58), .ICI(n61), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U37 ( .A(n111), .B(n67), .C(n150), .D(n130), .ICI(n140), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U39 ( .A(n141), .B(n71), .C(n66), .D(n72), .ICI(n68), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U40 ( .A(n67), .B(n330), .C(n151), .D(n131), .ICI(n121), .S(n66), 
        .ICO(n64), .CO(n65) );
  CMPR42X1 U42 ( .A(n122), .B(n79), .C(n73), .D(n77), .ICI(n74), .S(n70), 
        .ICO(n68), .CO(n69) );
  CMPR42X1 U43 ( .A(n112), .B(n132), .C(n162), .D(n152), .ICI(n142), .S(n73), 
        .ICO(n71), .CO(n72) );
  CMPR42X1 U44 ( .A(n163), .B(n80), .C(n81), .D(n84), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDFXL U45 ( .A(n133), .B(n143), .CI(n153), .CO(n77), .S(n78) );
  ADDHXL U46 ( .A(n123), .B(n102), .CO(n79), .S(n80) );
  CMPR42X1 U47 ( .A(n154), .B(n134), .C(n89), .D(n86), .ICI(n85), .S(n83), 
        .ICO(n81), .CO(n82) );
  ADDFXL U48 ( .A(n144), .B(n124), .CI(n164), .CO(n84), .S(n85) );
  CMPR42X1 U49 ( .A(n165), .B(n145), .C(n155), .D(n91), .ICI(n90), .S(n88), 
        .ICO(n86), .CO(n87) );
  ADDHXL U50 ( .A(n135), .B(n103), .CO(n89), .S(n90) );
  CMPR42X1 U51 ( .A(n136), .B(n166), .C(n156), .D(n146), .ICI(n96), .S(n93), 
        .ICO(n91), .CO(n92) );
  ADDFXL U52 ( .A(n157), .B(n167), .CI(n97), .CO(n94), .S(n95) );
  ADDHXL U53 ( .A(n147), .B(n104), .CO(n96), .S(n97) );
  ADDFXL U54 ( .A(n168), .B(n148), .CI(n158), .CO(n98), .S(n99) );
  ADDHXL U55 ( .A(n169), .B(n159), .CO(n100), .S(n101) );
  CLKBUFX3 U243 ( .A(n347), .Y(n329) );
  CLKINVX1 U244 ( .A(a[3]), .Y(n347) );
  CLKBUFX3 U245 ( .A(n348), .Y(n330) );
  CLKINVX1 U246 ( .A(a[1]), .Y(n348) );
  CLKBUFX3 U247 ( .A(n367), .Y(n332) );
  XOR2X1 U248 ( .A(a[2]), .B(n330), .Y(n367) );
  CLKBUFX3 U249 ( .A(n369), .Y(n331) );
  NAND2X1 U250 ( .A(n332), .B(n413), .Y(n369) );
  NAND2X2 U251 ( .A(a[1]), .B(n349), .Y(n357) );
  INVX3 U252 ( .A(n339), .Y(n343) );
  CLKBUFX3 U253 ( .A(n346), .Y(n328) );
  CLKINVX1 U254 ( .A(a[5]), .Y(n346) );
  CLKBUFX3 U255 ( .A(n379), .Y(n334) );
  XOR2X1 U256 ( .A(a[4]), .B(n329), .Y(n379) );
  CLKBUFX3 U257 ( .A(n381), .Y(n333) );
  NAND2X1 U258 ( .A(n334), .B(n414), .Y(n381) );
  CLKBUFX3 U259 ( .A(n344), .Y(n326) );
  CLKINVX1 U260 ( .A(a[9]), .Y(n344) );
  CLKBUFX3 U261 ( .A(n345), .Y(n327) );
  CLKINVX1 U262 ( .A(a[7]), .Y(n345) );
  CLKBUFX3 U263 ( .A(n356), .Y(n338) );
  XOR2X1 U264 ( .A(a[8]), .B(n327), .Y(n356) );
  CLKBUFX3 U265 ( .A(n391), .Y(n336) );
  XOR2X1 U266 ( .A(a[6]), .B(n328), .Y(n391) );
  CLKBUFX3 U267 ( .A(n355), .Y(n337) );
  NAND2X1 U268 ( .A(n338), .B(n416), .Y(n355) );
  CLKBUFX3 U269 ( .A(n393), .Y(n335) );
  NAND2X1 U270 ( .A(n336), .B(n415), .Y(n393) );
  CLKINVX1 U271 ( .A(n67), .Y(n342) );
  CLKINVX1 U272 ( .A(n46), .Y(n341) );
  CLKINVX1 U273 ( .A(n34), .Y(n340) );
  INVX3 U274 ( .A(a[0]), .Y(n349) );
  CLKBUFX3 U275 ( .A(b[0]), .Y(n339) );
  XOR2X1 U276 ( .A(n350), .B(n351), .Y(product[19]) );
  XOR2X1 U277 ( .A(n26), .B(n352), .Y(n351) );
  XNOR2X1 U278 ( .A(n4), .B(n23), .Y(n352) );
  XOR2X1 U279 ( .A(n353), .B(n354), .Y(n350) );
  AND2X1 U280 ( .A(b[9]), .B(a[9]), .Y(n354) );
  AO21X1 U281 ( .A0(n337), .A1(n338), .B0(n326), .Y(n353) );
  NOR2X1 U282 ( .A(n349), .B(n343), .Y(product[0]) );
  NAND2X1 U283 ( .A(b[1]), .B(a[9]), .Y(n67) );
  NAND2X1 U284 ( .A(b[4]), .B(a[9]), .Y(n46) );
  NAND2X1 U285 ( .A(b[6]), .B(a[9]), .Y(n34) );
  NAND2X1 U286 ( .A(b[8]), .B(a[9]), .Y(n26) );
  OAI22XL U287 ( .A0(n339), .A1(n357), .B0(n358), .B1(n349), .Y(n171) );
  OAI22XL U288 ( .A0(n358), .A1(n357), .B0(n359), .B1(n349), .Y(n170) );
  XOR2X1 U289 ( .A(b[1]), .B(n330), .Y(n358) );
  OAI22XL U290 ( .A0(n359), .A1(n357), .B0(n360), .B1(n349), .Y(n169) );
  XOR2X1 U291 ( .A(b[2]), .B(n330), .Y(n359) );
  OAI22XL U292 ( .A0(n360), .A1(n357), .B0(n361), .B1(n349), .Y(n168) );
  XOR2X1 U293 ( .A(b[3]), .B(n330), .Y(n360) );
  OAI22XL U294 ( .A0(n361), .A1(n357), .B0(n362), .B1(n349), .Y(n167) );
  XOR2X1 U295 ( .A(b[4]), .B(n330), .Y(n361) );
  OAI22XL U296 ( .A0(n362), .A1(n357), .B0(n363), .B1(n349), .Y(n166) );
  XOR2X1 U297 ( .A(b[5]), .B(n330), .Y(n362) );
  OAI22XL U298 ( .A0(n363), .A1(n357), .B0(n364), .B1(n349), .Y(n165) );
  XOR2X1 U299 ( .A(b[6]), .B(n330), .Y(n363) );
  OAI22XL U300 ( .A0(n364), .A1(n357), .B0(n365), .B1(n349), .Y(n164) );
  XOR2X1 U301 ( .A(b[7]), .B(n330), .Y(n364) );
  OAI22XL U302 ( .A0(n365), .A1(n357), .B0(n366), .B1(n349), .Y(n163) );
  XOR2X1 U303 ( .A(b[8]), .B(n330), .Y(n365) );
  OAI22XL U304 ( .A0(n366), .A1(n357), .B0(n330), .B1(n349), .Y(n162) );
  XOR2X1 U305 ( .A(b[9]), .B(n330), .Y(n366) );
  NOR2X1 U306 ( .A(n332), .B(n343), .Y(n160) );
  OAI22XL U307 ( .A0(n368), .A1(n331), .B0(n332), .B1(n370), .Y(n159) );
  XOR2X1 U308 ( .A(n329), .B(n339), .Y(n368) );
  OAI22XL U309 ( .A0(n370), .A1(n331), .B0(n332), .B1(n371), .Y(n158) );
  XOR2X1 U310 ( .A(b[1]), .B(n329), .Y(n370) );
  OAI22XL U311 ( .A0(n371), .A1(n331), .B0(n332), .B1(n372), .Y(n157) );
  XOR2X1 U312 ( .A(b[2]), .B(n329), .Y(n371) );
  OAI22XL U313 ( .A0(n372), .A1(n331), .B0(n332), .B1(n373), .Y(n156) );
  XOR2X1 U314 ( .A(b[3]), .B(n329), .Y(n372) );
  OAI22XL U315 ( .A0(n373), .A1(n331), .B0(n332), .B1(n374), .Y(n155) );
  XOR2X1 U316 ( .A(b[4]), .B(n329), .Y(n373) );
  OAI22XL U317 ( .A0(n374), .A1(n331), .B0(n332), .B1(n375), .Y(n154) );
  XOR2X1 U318 ( .A(b[5]), .B(n329), .Y(n374) );
  OAI22XL U319 ( .A0(n375), .A1(n331), .B0(n332), .B1(n376), .Y(n153) );
  XOR2X1 U320 ( .A(b[6]), .B(n329), .Y(n375) );
  OAI22XL U321 ( .A0(n376), .A1(n331), .B0(n332), .B1(n377), .Y(n152) );
  XOR2X1 U322 ( .A(b[7]), .B(n329), .Y(n376) );
  OAI22XL U323 ( .A0(n377), .A1(n331), .B0(n332), .B1(n378), .Y(n151) );
  XOR2X1 U324 ( .A(b[8]), .B(n329), .Y(n377) );
  OAI22XL U325 ( .A0(n378), .A1(n331), .B0(n332), .B1(n329), .Y(n150) );
  XOR2X1 U326 ( .A(b[9]), .B(n329), .Y(n378) );
  AO21X1 U327 ( .A0(n331), .A1(n332), .B0(n329), .Y(n149) );
  NOR2X1 U328 ( .A(n334), .B(n343), .Y(n148) );
  OAI22XL U329 ( .A0(n380), .A1(n333), .B0(n334), .B1(n382), .Y(n147) );
  XOR2X1 U330 ( .A(n328), .B(n339), .Y(n380) );
  OAI22XL U331 ( .A0(n382), .A1(n333), .B0(n334), .B1(n383), .Y(n146) );
  XOR2X1 U332 ( .A(b[1]), .B(n328), .Y(n382) );
  OAI22XL U333 ( .A0(n383), .A1(n333), .B0(n334), .B1(n384), .Y(n145) );
  XOR2X1 U334 ( .A(b[2]), .B(n328), .Y(n383) );
  OAI22XL U335 ( .A0(n384), .A1(n333), .B0(n334), .B1(n385), .Y(n144) );
  XOR2X1 U336 ( .A(b[3]), .B(n328), .Y(n384) );
  OAI22XL U337 ( .A0(n385), .A1(n333), .B0(n334), .B1(n386), .Y(n143) );
  XOR2X1 U338 ( .A(b[4]), .B(n328), .Y(n385) );
  OAI22XL U339 ( .A0(n386), .A1(n333), .B0(n334), .B1(n387), .Y(n142) );
  XOR2X1 U340 ( .A(b[5]), .B(n328), .Y(n386) );
  OAI22XL U341 ( .A0(n387), .A1(n333), .B0(n334), .B1(n388), .Y(n141) );
  XOR2X1 U342 ( .A(b[6]), .B(n328), .Y(n387) );
  OAI22XL U343 ( .A0(n388), .A1(n333), .B0(n334), .B1(n389), .Y(n140) );
  XOR2X1 U344 ( .A(b[7]), .B(n328), .Y(n388) );
  OAI22XL U345 ( .A0(n389), .A1(n333), .B0(n334), .B1(n390), .Y(n139) );
  XOR2X1 U346 ( .A(b[8]), .B(n328), .Y(n389) );
  OAI22XL U347 ( .A0(n390), .A1(n333), .B0(n334), .B1(n328), .Y(n138) );
  XOR2X1 U348 ( .A(b[9]), .B(n328), .Y(n390) );
  AO21X1 U349 ( .A0(n333), .A1(n334), .B0(n328), .Y(n137) );
  NOR2X1 U350 ( .A(n336), .B(n343), .Y(n136) );
  OAI22XL U351 ( .A0(n392), .A1(n335), .B0(n336), .B1(n394), .Y(n135) );
  XOR2X1 U352 ( .A(n327), .B(n339), .Y(n392) );
  OAI22XL U353 ( .A0(n394), .A1(n335), .B0(n336), .B1(n395), .Y(n134) );
  XOR2X1 U354 ( .A(b[1]), .B(n327), .Y(n394) );
  OAI22XL U355 ( .A0(n395), .A1(n335), .B0(n336), .B1(n396), .Y(n133) );
  XOR2X1 U356 ( .A(b[2]), .B(n327), .Y(n395) );
  OAI22XL U357 ( .A0(n396), .A1(n335), .B0(n336), .B1(n397), .Y(n132) );
  XOR2X1 U358 ( .A(b[3]), .B(n327), .Y(n396) );
  OAI22XL U359 ( .A0(n397), .A1(n335), .B0(n336), .B1(n398), .Y(n131) );
  XOR2X1 U360 ( .A(b[4]), .B(n327), .Y(n397) );
  OAI22XL U361 ( .A0(n398), .A1(n335), .B0(n336), .B1(n399), .Y(n130) );
  XOR2X1 U362 ( .A(b[5]), .B(n327), .Y(n398) );
  OAI22XL U363 ( .A0(n399), .A1(n335), .B0(n336), .B1(n400), .Y(n129) );
  XOR2X1 U364 ( .A(b[6]), .B(n327), .Y(n399) );
  OAI22XL U365 ( .A0(n400), .A1(n335), .B0(n336), .B1(n401), .Y(n128) );
  XOR2X1 U366 ( .A(b[7]), .B(n327), .Y(n400) );
  OAI22XL U367 ( .A0(n401), .A1(n335), .B0(n336), .B1(n402), .Y(n127) );
  XOR2X1 U368 ( .A(b[8]), .B(n327), .Y(n401) );
  OAI22XL U369 ( .A0(n402), .A1(n335), .B0(n336), .B1(n327), .Y(n126) );
  XOR2X1 U370 ( .A(b[9]), .B(n327), .Y(n402) );
  AO21X1 U371 ( .A0(n335), .A1(n336), .B0(n327), .Y(n125) );
  NOR2X1 U372 ( .A(n338), .B(n343), .Y(n124) );
  OAI22XL U373 ( .A0(n403), .A1(n337), .B0(n338), .B1(n404), .Y(n123) );
  XOR2X1 U374 ( .A(n343), .B(a[9]), .Y(n403) );
  OAI22XL U375 ( .A0(n404), .A1(n337), .B0(n338), .B1(n405), .Y(n122) );
  XOR2X1 U376 ( .A(b[1]), .B(n326), .Y(n404) );
  OAI22XL U377 ( .A0(n405), .A1(n337), .B0(n338), .B1(n406), .Y(n121) );
  XOR2X1 U378 ( .A(b[2]), .B(n326), .Y(n405) );
  OAI22XL U379 ( .A0(n406), .A1(n337), .B0(n338), .B1(n407), .Y(n120) );
  XOR2X1 U380 ( .A(b[3]), .B(n326), .Y(n406) );
  OAI22XL U381 ( .A0(n407), .A1(n337), .B0(n338), .B1(n408), .Y(n119) );
  XOR2X1 U382 ( .A(b[4]), .B(n326), .Y(n407) );
  OAI22XL U383 ( .A0(n408), .A1(n337), .B0(n338), .B1(n409), .Y(n118) );
  XOR2X1 U384 ( .A(b[5]), .B(n326), .Y(n408) );
  OAI22XL U385 ( .A0(n409), .A1(n337), .B0(n338), .B1(n410), .Y(n117) );
  XOR2X1 U386 ( .A(b[6]), .B(n326), .Y(n409) );
  OAI22XL U387 ( .A0(n410), .A1(n337), .B0(n338), .B1(n411), .Y(n116) );
  XOR2X1 U388 ( .A(b[7]), .B(n326), .Y(n410) );
  OAI22XL U389 ( .A0(n411), .A1(n337), .B0(n338), .B1(n412), .Y(n115) );
  XOR2X1 U390 ( .A(b[8]), .B(n326), .Y(n411) );
  OAI22XL U391 ( .A0(n412), .A1(n337), .B0(n338), .B1(n326), .Y(n114) );
  XOR2X1 U392 ( .A(b[9]), .B(n326), .Y(n412) );
  NOR2X1 U393 ( .A(n326), .B(n343), .Y(n112) );
  NOR2BX1 U394 ( .AN(b[2]), .B(n326), .Y(n111) );
  NOR2BX1 U395 ( .AN(b[3]), .B(n326), .Y(n110) );
  NOR2BX1 U396 ( .AN(b[5]), .B(n326), .Y(n109) );
  NOR2BX1 U397 ( .AN(b[7]), .B(n326), .Y(n108) );
  OAI21XL U398 ( .A0(n339), .A1(n330), .B0(n357), .Y(n106) );
  OAI32X1 U399 ( .A0(n329), .A1(n339), .A2(n332), .B0(n329), .B1(n331), .Y(
        n105) );
  XOR2X1 U400 ( .A(a[3]), .B(a[2]), .Y(n413) );
  OAI32X1 U401 ( .A0(n328), .A1(n339), .A2(n334), .B0(n328), .B1(n333), .Y(
        n104) );
  XOR2X1 U402 ( .A(a[5]), .B(a[4]), .Y(n414) );
  OAI32X1 U403 ( .A0(n327), .A1(n339), .A2(n336), .B0(n327), .B1(n335), .Y(
        n103) );
  XOR2X1 U404 ( .A(a[7]), .B(a[6]), .Y(n415) );
  OAI32X1 U405 ( .A0(n326), .A1(n339), .A2(n338), .B0(n326), .B1(n337), .Y(
        n102) );
  XOR2X1 U406 ( .A(a[9]), .B(a[8]), .Y(n416) );
endmodule


module READ_DW_mult_uns_0 ( a, b, product );
  input [9:0] a;
  input [9:0] b;
  output [19:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n23, n24, n26, n27, n28, n29, n30, n31, n32, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n108, n109, n110, n111, n112, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416;

  ADDFXL U5 ( .A(n24), .B(n28), .CI(n5), .CO(n4), .S(product[18]) );
  ADDFXL U6 ( .A(n31), .B(n29), .CI(n6), .CO(n5), .S(product[17]) );
  ADDFXL U7 ( .A(n36), .B(n32), .CI(n7), .CO(n6), .S(product[16]) );
  ADDFXL U8 ( .A(n37), .B(n41), .CI(n8), .CO(n7), .S(product[15]) );
  ADDFXL U9 ( .A(n42), .B(n48), .CI(n9), .CO(n8), .S(product[14]) );
  ADDFXL U10 ( .A(n49), .B(n54), .CI(n10), .CO(n9), .S(product[13]) );
  ADDFXL U11 ( .A(n55), .B(n62), .CI(n11), .CO(n10), .S(product[12]) );
  ADDFXL U12 ( .A(n63), .B(n69), .CI(n12), .CO(n11), .S(product[11]) );
  ADDFXL U13 ( .A(n70), .B(n75), .CI(n13), .CO(n12), .S(product[10]) );
  ADDFXL U14 ( .A(n76), .B(n82), .CI(n14), .CO(n13), .S(product[9]) );
  ADDFXL U15 ( .A(n83), .B(n87), .CI(n15), .CO(n14), .S(product[8]) );
  ADDFXL U16 ( .A(n88), .B(n92), .CI(n16), .CO(n15), .S(product[7]) );
  ADDFXL U17 ( .A(n94), .B(n93), .CI(n17), .CO(n16), .S(product[6]) );
  ADDFXL U18 ( .A(n95), .B(n98), .CI(n18), .CO(n17), .S(product[5]) );
  ADDFXL U19 ( .A(n99), .B(n100), .CI(n19), .CO(n18), .S(product[4]) );
  ADDFXL U20 ( .A(n101), .B(n105), .CI(n20), .CO(n19), .S(product[3]) );
  ADDFXL U21 ( .A(n170), .B(n160), .CI(n21), .CO(n20), .S(product[2]) );
  ADDHXL U22 ( .A(n106), .B(n171), .CO(n21), .S(product[1]) );
  ADDFXL U24 ( .A(n114), .B(n26), .CI(n27), .CO(n23), .S(n24) );
  CMPR42X1 U26 ( .A(n340), .B(n108), .C(n125), .D(n115), .ICI(n30), .S(n29), 
        .ICO(n27), .CO(n28) );
  CMPR42X1 U27 ( .A(n34), .B(n126), .C(n116), .D(n38), .ICI(n35), .S(n32), 
        .ICO(n30), .CO(n31) );
  CMPR42X1 U29 ( .A(n127), .B(n117), .C(n39), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  ADDFXL U30 ( .A(n109), .B(n341), .CI(n137), .CO(n38), .S(n39) );
  CMPR42X1 U31 ( .A(n138), .B(n50), .C(n51), .D(n44), .ICI(n47), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U32 ( .A(n128), .B(n46), .CI(n118), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n119), .B(n56), .C(n57), .D(n52), .ICI(n53), .S(n49), 
        .ICO(n47), .CO(n48) );
  CMPR42X1 U35 ( .A(n342), .B(n110), .C(n149), .D(n129), .ICI(n139), .S(n52), 
        .ICO(n50), .CO(n51) );
  CMPR42X1 U36 ( .A(n120), .B(n64), .C(n65), .D(n58), .ICI(n61), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U37 ( .A(n111), .B(n67), .C(n150), .D(n130), .ICI(n140), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U39 ( .A(n141), .B(n71), .C(n66), .D(n72), .ICI(n68), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U40 ( .A(n67), .B(n330), .C(n151), .D(n131), .ICI(n121), .S(n66), 
        .ICO(n64), .CO(n65) );
  CMPR42X1 U42 ( .A(n122), .B(n79), .C(n73), .D(n77), .ICI(n74), .S(n70), 
        .ICO(n68), .CO(n69) );
  CMPR42X1 U43 ( .A(n112), .B(n132), .C(n162), .D(n152), .ICI(n142), .S(n73), 
        .ICO(n71), .CO(n72) );
  CMPR42X1 U44 ( .A(n163), .B(n80), .C(n81), .D(n84), .ICI(n78), .S(n76), 
        .ICO(n74), .CO(n75) );
  ADDFXL U45 ( .A(n133), .B(n143), .CI(n153), .CO(n77), .S(n78) );
  ADDHXL U46 ( .A(n123), .B(n102), .CO(n79), .S(n80) );
  CMPR42X1 U47 ( .A(n154), .B(n134), .C(n89), .D(n86), .ICI(n85), .S(n83), 
        .ICO(n81), .CO(n82) );
  ADDFXL U48 ( .A(n144), .B(n124), .CI(n164), .CO(n84), .S(n85) );
  CMPR42X1 U49 ( .A(n165), .B(n145), .C(n155), .D(n91), .ICI(n90), .S(n88), 
        .ICO(n86), .CO(n87) );
  ADDHXL U50 ( .A(n135), .B(n103), .CO(n89), .S(n90) );
  CMPR42X1 U51 ( .A(n136), .B(n166), .C(n156), .D(n146), .ICI(n96), .S(n93), 
        .ICO(n91), .CO(n92) );
  ADDFXL U52 ( .A(n157), .B(n167), .CI(n97), .CO(n94), .S(n95) );
  ADDHXL U53 ( .A(n147), .B(n104), .CO(n96), .S(n97) );
  ADDFXL U54 ( .A(n168), .B(n148), .CI(n158), .CO(n98), .S(n99) );
  ADDHXL U55 ( .A(n169), .B(n159), .CO(n100), .S(n101) );
  CLKBUFX3 U243 ( .A(n347), .Y(n329) );
  CLKINVX1 U244 ( .A(a[3]), .Y(n347) );
  CLKBUFX3 U245 ( .A(n348), .Y(n330) );
  CLKINVX1 U246 ( .A(a[1]), .Y(n348) );
  CLKBUFX3 U247 ( .A(n367), .Y(n332) );
  XOR2X1 U248 ( .A(a[2]), .B(n330), .Y(n367) );
  CLKBUFX3 U249 ( .A(n369), .Y(n331) );
  NAND2X1 U250 ( .A(n332), .B(n413), .Y(n369) );
  NAND2X2 U251 ( .A(a[1]), .B(n349), .Y(n357) );
  INVX3 U252 ( .A(n339), .Y(n343) );
  CLKBUFX3 U253 ( .A(n346), .Y(n328) );
  CLKINVX1 U254 ( .A(a[5]), .Y(n346) );
  CLKBUFX3 U255 ( .A(n379), .Y(n334) );
  XOR2X1 U256 ( .A(a[4]), .B(n329), .Y(n379) );
  CLKBUFX3 U257 ( .A(n381), .Y(n333) );
  NAND2X1 U258 ( .A(n334), .B(n414), .Y(n381) );
  CLKBUFX3 U259 ( .A(n344), .Y(n326) );
  CLKINVX1 U260 ( .A(a[9]), .Y(n344) );
  CLKBUFX3 U261 ( .A(n345), .Y(n327) );
  CLKINVX1 U262 ( .A(a[7]), .Y(n345) );
  CLKBUFX3 U263 ( .A(n356), .Y(n338) );
  XOR2X1 U264 ( .A(a[8]), .B(n327), .Y(n356) );
  CLKBUFX3 U265 ( .A(n391), .Y(n336) );
  XOR2X1 U266 ( .A(a[6]), .B(n328), .Y(n391) );
  CLKBUFX3 U267 ( .A(n355), .Y(n337) );
  NAND2X1 U268 ( .A(n338), .B(n416), .Y(n355) );
  CLKBUFX3 U269 ( .A(n393), .Y(n335) );
  NAND2X1 U270 ( .A(n336), .B(n415), .Y(n393) );
  CLKINVX1 U271 ( .A(n67), .Y(n342) );
  CLKINVX1 U272 ( .A(n46), .Y(n341) );
  CLKINVX1 U273 ( .A(n34), .Y(n340) );
  INVX3 U274 ( .A(a[0]), .Y(n349) );
  CLKBUFX3 U275 ( .A(b[0]), .Y(n339) );
  XOR2X1 U276 ( .A(n350), .B(n351), .Y(product[19]) );
  XOR2X1 U277 ( .A(n26), .B(n352), .Y(n351) );
  XNOR2X1 U278 ( .A(n4), .B(n23), .Y(n352) );
  XOR2X1 U279 ( .A(n353), .B(n354), .Y(n350) );
  AND2X1 U280 ( .A(b[9]), .B(a[9]), .Y(n354) );
  AO21X1 U281 ( .A0(n337), .A1(n338), .B0(n326), .Y(n353) );
  NOR2X1 U282 ( .A(n349), .B(n343), .Y(product[0]) );
  NAND2X1 U283 ( .A(b[1]), .B(a[9]), .Y(n67) );
  NAND2X1 U284 ( .A(b[4]), .B(a[9]), .Y(n46) );
  NAND2X1 U285 ( .A(b[6]), .B(a[9]), .Y(n34) );
  NAND2X1 U286 ( .A(b[8]), .B(a[9]), .Y(n26) );
  OAI22XL U287 ( .A0(n339), .A1(n357), .B0(n358), .B1(n349), .Y(n171) );
  OAI22XL U288 ( .A0(n358), .A1(n357), .B0(n359), .B1(n349), .Y(n170) );
  XOR2X1 U289 ( .A(b[1]), .B(n330), .Y(n358) );
  OAI22XL U290 ( .A0(n359), .A1(n357), .B0(n360), .B1(n349), .Y(n169) );
  XOR2X1 U291 ( .A(b[2]), .B(n330), .Y(n359) );
  OAI22XL U292 ( .A0(n360), .A1(n357), .B0(n361), .B1(n349), .Y(n168) );
  XOR2X1 U293 ( .A(b[3]), .B(n330), .Y(n360) );
  OAI22XL U294 ( .A0(n361), .A1(n357), .B0(n362), .B1(n349), .Y(n167) );
  XOR2X1 U295 ( .A(b[4]), .B(n330), .Y(n361) );
  OAI22XL U296 ( .A0(n362), .A1(n357), .B0(n363), .B1(n349), .Y(n166) );
  XOR2X1 U297 ( .A(b[5]), .B(n330), .Y(n362) );
  OAI22XL U298 ( .A0(n363), .A1(n357), .B0(n364), .B1(n349), .Y(n165) );
  XOR2X1 U299 ( .A(b[6]), .B(n330), .Y(n363) );
  OAI22XL U300 ( .A0(n364), .A1(n357), .B0(n365), .B1(n349), .Y(n164) );
  XOR2X1 U301 ( .A(b[7]), .B(n330), .Y(n364) );
  OAI22XL U302 ( .A0(n365), .A1(n357), .B0(n366), .B1(n349), .Y(n163) );
  XOR2X1 U303 ( .A(b[8]), .B(n330), .Y(n365) );
  OAI22XL U304 ( .A0(n366), .A1(n357), .B0(n330), .B1(n349), .Y(n162) );
  XOR2X1 U305 ( .A(b[9]), .B(n330), .Y(n366) );
  NOR2X1 U306 ( .A(n332), .B(n343), .Y(n160) );
  OAI22XL U307 ( .A0(n368), .A1(n331), .B0(n332), .B1(n370), .Y(n159) );
  XOR2X1 U308 ( .A(n329), .B(n339), .Y(n368) );
  OAI22XL U309 ( .A0(n370), .A1(n331), .B0(n332), .B1(n371), .Y(n158) );
  XOR2X1 U310 ( .A(b[1]), .B(n329), .Y(n370) );
  OAI22XL U311 ( .A0(n371), .A1(n331), .B0(n332), .B1(n372), .Y(n157) );
  XOR2X1 U312 ( .A(b[2]), .B(n329), .Y(n371) );
  OAI22XL U313 ( .A0(n372), .A1(n331), .B0(n332), .B1(n373), .Y(n156) );
  XOR2X1 U314 ( .A(b[3]), .B(n329), .Y(n372) );
  OAI22XL U315 ( .A0(n373), .A1(n331), .B0(n332), .B1(n374), .Y(n155) );
  XOR2X1 U316 ( .A(b[4]), .B(n329), .Y(n373) );
  OAI22XL U317 ( .A0(n374), .A1(n331), .B0(n332), .B1(n375), .Y(n154) );
  XOR2X1 U318 ( .A(b[5]), .B(n329), .Y(n374) );
  OAI22XL U319 ( .A0(n375), .A1(n331), .B0(n332), .B1(n376), .Y(n153) );
  XOR2X1 U320 ( .A(b[6]), .B(n329), .Y(n375) );
  OAI22XL U321 ( .A0(n376), .A1(n331), .B0(n332), .B1(n377), .Y(n152) );
  XOR2X1 U322 ( .A(b[7]), .B(n329), .Y(n376) );
  OAI22XL U323 ( .A0(n377), .A1(n331), .B0(n332), .B1(n378), .Y(n151) );
  XOR2X1 U324 ( .A(b[8]), .B(n329), .Y(n377) );
  OAI22XL U325 ( .A0(n378), .A1(n331), .B0(n332), .B1(n329), .Y(n150) );
  XOR2X1 U326 ( .A(b[9]), .B(n329), .Y(n378) );
  AO21X1 U327 ( .A0(n331), .A1(n332), .B0(n329), .Y(n149) );
  NOR2X1 U328 ( .A(n334), .B(n343), .Y(n148) );
  OAI22XL U329 ( .A0(n380), .A1(n333), .B0(n334), .B1(n382), .Y(n147) );
  XOR2X1 U330 ( .A(n328), .B(n339), .Y(n380) );
  OAI22XL U331 ( .A0(n382), .A1(n333), .B0(n334), .B1(n383), .Y(n146) );
  XOR2X1 U332 ( .A(b[1]), .B(n328), .Y(n382) );
  OAI22XL U333 ( .A0(n383), .A1(n333), .B0(n334), .B1(n384), .Y(n145) );
  XOR2X1 U334 ( .A(b[2]), .B(n328), .Y(n383) );
  OAI22XL U335 ( .A0(n384), .A1(n333), .B0(n334), .B1(n385), .Y(n144) );
  XOR2X1 U336 ( .A(b[3]), .B(n328), .Y(n384) );
  OAI22XL U337 ( .A0(n385), .A1(n333), .B0(n334), .B1(n386), .Y(n143) );
  XOR2X1 U338 ( .A(b[4]), .B(n328), .Y(n385) );
  OAI22XL U339 ( .A0(n386), .A1(n333), .B0(n334), .B1(n387), .Y(n142) );
  XOR2X1 U340 ( .A(b[5]), .B(n328), .Y(n386) );
  OAI22XL U341 ( .A0(n387), .A1(n333), .B0(n334), .B1(n388), .Y(n141) );
  XOR2X1 U342 ( .A(b[6]), .B(n328), .Y(n387) );
  OAI22XL U343 ( .A0(n388), .A1(n333), .B0(n334), .B1(n389), .Y(n140) );
  XOR2X1 U344 ( .A(b[7]), .B(n328), .Y(n388) );
  OAI22XL U345 ( .A0(n389), .A1(n333), .B0(n334), .B1(n390), .Y(n139) );
  XOR2X1 U346 ( .A(b[8]), .B(n328), .Y(n389) );
  OAI22XL U347 ( .A0(n390), .A1(n333), .B0(n334), .B1(n328), .Y(n138) );
  XOR2X1 U348 ( .A(b[9]), .B(n328), .Y(n390) );
  AO21X1 U349 ( .A0(n333), .A1(n334), .B0(n328), .Y(n137) );
  NOR2X1 U350 ( .A(n336), .B(n343), .Y(n136) );
  OAI22XL U351 ( .A0(n392), .A1(n335), .B0(n336), .B1(n394), .Y(n135) );
  XOR2X1 U352 ( .A(n327), .B(n339), .Y(n392) );
  OAI22XL U353 ( .A0(n394), .A1(n335), .B0(n336), .B1(n395), .Y(n134) );
  XOR2X1 U354 ( .A(b[1]), .B(n327), .Y(n394) );
  OAI22XL U355 ( .A0(n395), .A1(n335), .B0(n336), .B1(n396), .Y(n133) );
  XOR2X1 U356 ( .A(b[2]), .B(n327), .Y(n395) );
  OAI22XL U357 ( .A0(n396), .A1(n335), .B0(n336), .B1(n397), .Y(n132) );
  XOR2X1 U358 ( .A(b[3]), .B(n327), .Y(n396) );
  OAI22XL U359 ( .A0(n397), .A1(n335), .B0(n336), .B1(n398), .Y(n131) );
  XOR2X1 U360 ( .A(b[4]), .B(n327), .Y(n397) );
  OAI22XL U361 ( .A0(n398), .A1(n335), .B0(n336), .B1(n399), .Y(n130) );
  XOR2X1 U362 ( .A(b[5]), .B(n327), .Y(n398) );
  OAI22XL U363 ( .A0(n399), .A1(n335), .B0(n336), .B1(n400), .Y(n129) );
  XOR2X1 U364 ( .A(b[6]), .B(n327), .Y(n399) );
  OAI22XL U365 ( .A0(n400), .A1(n335), .B0(n336), .B1(n401), .Y(n128) );
  XOR2X1 U366 ( .A(b[7]), .B(n327), .Y(n400) );
  OAI22XL U367 ( .A0(n401), .A1(n335), .B0(n336), .B1(n402), .Y(n127) );
  XOR2X1 U368 ( .A(b[8]), .B(n327), .Y(n401) );
  OAI22XL U369 ( .A0(n402), .A1(n335), .B0(n336), .B1(n327), .Y(n126) );
  XOR2X1 U370 ( .A(b[9]), .B(n327), .Y(n402) );
  AO21X1 U371 ( .A0(n335), .A1(n336), .B0(n327), .Y(n125) );
  NOR2X1 U372 ( .A(n338), .B(n343), .Y(n124) );
  OAI22XL U373 ( .A0(n403), .A1(n337), .B0(n338), .B1(n404), .Y(n123) );
  XOR2X1 U374 ( .A(n343), .B(a[9]), .Y(n403) );
  OAI22XL U375 ( .A0(n404), .A1(n337), .B0(n338), .B1(n405), .Y(n122) );
  XOR2X1 U376 ( .A(b[1]), .B(n326), .Y(n404) );
  OAI22XL U377 ( .A0(n405), .A1(n337), .B0(n338), .B1(n406), .Y(n121) );
  XOR2X1 U378 ( .A(b[2]), .B(n326), .Y(n405) );
  OAI22XL U379 ( .A0(n406), .A1(n337), .B0(n338), .B1(n407), .Y(n120) );
  XOR2X1 U380 ( .A(b[3]), .B(n326), .Y(n406) );
  OAI22XL U381 ( .A0(n407), .A1(n337), .B0(n338), .B1(n408), .Y(n119) );
  XOR2X1 U382 ( .A(b[4]), .B(n326), .Y(n407) );
  OAI22XL U383 ( .A0(n408), .A1(n337), .B0(n338), .B1(n409), .Y(n118) );
  XOR2X1 U384 ( .A(b[5]), .B(n326), .Y(n408) );
  OAI22XL U385 ( .A0(n409), .A1(n337), .B0(n338), .B1(n410), .Y(n117) );
  XOR2X1 U386 ( .A(b[6]), .B(n326), .Y(n409) );
  OAI22XL U387 ( .A0(n410), .A1(n337), .B0(n338), .B1(n411), .Y(n116) );
  XOR2X1 U388 ( .A(b[7]), .B(n326), .Y(n410) );
  OAI22XL U389 ( .A0(n411), .A1(n337), .B0(n338), .B1(n412), .Y(n115) );
  XOR2X1 U390 ( .A(b[8]), .B(n326), .Y(n411) );
  OAI22XL U391 ( .A0(n412), .A1(n337), .B0(n338), .B1(n326), .Y(n114) );
  XOR2X1 U392 ( .A(b[9]), .B(n326), .Y(n412) );
  NOR2X1 U393 ( .A(n326), .B(n343), .Y(n112) );
  NOR2BX1 U394 ( .AN(b[2]), .B(n326), .Y(n111) );
  NOR2BX1 U395 ( .AN(b[3]), .B(n326), .Y(n110) );
  NOR2BX1 U396 ( .AN(b[5]), .B(n326), .Y(n109) );
  NOR2BX1 U397 ( .AN(b[7]), .B(n326), .Y(n108) );
  OAI21XL U398 ( .A0(n339), .A1(n330), .B0(n357), .Y(n106) );
  OAI32X1 U399 ( .A0(n329), .A1(n339), .A2(n332), .B0(n329), .B1(n331), .Y(
        n105) );
  XOR2X1 U400 ( .A(a[3]), .B(a[2]), .Y(n413) );
  OAI32X1 U401 ( .A0(n328), .A1(n339), .A2(n334), .B0(n328), .B1(n333), .Y(
        n104) );
  XOR2X1 U402 ( .A(a[5]), .B(a[4]), .Y(n414) );
  OAI32X1 U403 ( .A0(n327), .A1(n339), .A2(n336), .B0(n327), .B1(n335), .Y(
        n103) );
  XOR2X1 U404 ( .A(a[7]), .B(a[6]), .Y(n415) );
  OAI32X1 U405 ( .A0(n326), .A1(n339), .A2(n338), .B0(n326), .B1(n337), .Y(
        n102) );
  XOR2X1 U406 ( .A(a[9]), .B(a[8]), .Y(n416) );
endmodule


module READ_DW01_sub_20 ( A, B, CI, DIFF, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [20:0] carry;

  XOR3X1 U2_19 ( .A(A[19]), .B(n2), .C(carry[19]), .Y(DIFF[19]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n19), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_1 ( .A(A[1]), .B(n20), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFXL U2_3 ( .A(A[3]), .B(n18), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n16), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n13), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFXL U2_7 ( .A(A[7]), .B(n14), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n15), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFXL U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_9 ( .A(A[9]), .B(n12), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_17 ( .A(A[17]), .B(n4), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF[17]) );
  ADDFXL U2_18 ( .A(A[18]), .B(n3), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF[18]) );
  ADDFXL U2_12 ( .A(A[12]), .B(n9), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_11 ( .A(A[11]), .B(n10), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFXL U2_15 ( .A(A[15]), .B(n6), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFXL U2_14 ( .A(A[14]), .B(n7), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n8), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_16 ( .A(A[16]), .B(n5), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF[16]) );
  CLKINVX1 U1 ( .A(B[16]), .Y(n5) );
  CLKINVX1 U2 ( .A(B[13]), .Y(n8) );
  CLKINVX1 U3 ( .A(B[14]), .Y(n7) );
  CLKINVX1 U4 ( .A(B[15]), .Y(n6) );
  CLKINVX1 U5 ( .A(B[11]), .Y(n10) );
  CLKINVX1 U6 ( .A(B[12]), .Y(n9) );
  CLKINVX1 U7 ( .A(B[18]), .Y(n3) );
  CLKINVX1 U8 ( .A(B[17]), .Y(n4) );
  CLKINVX1 U9 ( .A(B[9]), .Y(n12) );
  CLKINVX1 U10 ( .A(B[10]), .Y(n11) );
  CLKINVX1 U11 ( .A(B[6]), .Y(n15) );
  CLKINVX1 U12 ( .A(B[7]), .Y(n14) );
  CLKINVX1 U13 ( .A(B[8]), .Y(n13) );
  CLKINVX1 U14 ( .A(B[4]), .Y(n17) );
  CLKINVX1 U15 ( .A(B[5]), .Y(n16) );
  CLKINVX1 U16 ( .A(B[3]), .Y(n18) );
  NAND2X1 U17 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U18 ( .A(B[1]), .Y(n20) );
  CLKINVX1 U19 ( .A(B[2]), .Y(n19) );
  XNOR2X1 U20 ( .A(n21), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U21 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U22 ( .A(B[0]), .Y(n21) );
  CLKINVX1 U23 ( .A(B[19]), .Y(n2) );
endmodule


module READ_DW01_add_0 ( A, B, CI, SUM, CO );
  input [19:0] A;
  input [19:0] B;
  output [19:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [19:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFXL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFXL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFXL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFXL U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFXL U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFXL U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  XOR3X1 U1_19 ( .A(A[19]), .B(B[19]), .C(carry[19]), .Y(SUM[19]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module READ_DW_mult_tc_1 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n25, n26, n27, n28, n29, n30, n32, n33, n34,
         n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n115, n116, n117,
         n118, n119, n120, n121, n122, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461;

  ADDFXL U5 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[20]) );
  ADDFXL U6 ( .A(n28), .B(n27), .CI(n6), .CO(n5), .S(product[19]) );
  ADDFXL U7 ( .A(n29), .B(n33), .CI(n7), .CO(n6), .S(product[18]) );
  ADDFXL U8 ( .A(n36), .B(n34), .CI(n8), .CO(n7), .S(product[17]) );
  ADDFXL U9 ( .A(n37), .B(n41), .CI(n9), .CO(n8), .S(product[16]) );
  ADDFXL U10 ( .A(n42), .B(n46), .CI(n10), .CO(n9), .S(product[15]) );
  ADDFXL U11 ( .A(n47), .B(n53), .CI(n11), .CO(n10), .S(product[14]) );
  ADDFXL U12 ( .A(n54), .B(n59), .CI(n12), .CO(n11), .S(product[13]) );
  ADDFXL U13 ( .A(n60), .B(n67), .CI(n13), .CO(n12), .S(product[12]) );
  ADDFXL U14 ( .A(n68), .B(n75), .CI(n14), .CO(n13), .S(product[11]) );
  ADDFXL U15 ( .A(n76), .B(n81), .CI(n15), .CO(n14), .S(product[10]) );
  ADDFXL U16 ( .A(n82), .B(n88), .CI(n16), .CO(n15), .S(product[9]) );
  ADDFXL U17 ( .A(n89), .B(n93), .CI(n17), .CO(n16), .S(product[8]) );
  ADDFXL U18 ( .A(n94), .B(n98), .CI(n18), .CO(n17), .S(product[7]) );
  ADDFXL U19 ( .A(n100), .B(n99), .CI(n19), .CO(n18), .S(product[6]) );
  ADDFXL U20 ( .A(n101), .B(n104), .CI(n20), .CO(n19), .S(product[5]) );
  ADDFXL U21 ( .A(n105), .B(n106), .CI(n21), .CO(n20), .S(product[4]) );
  ADDFXL U22 ( .A(n107), .B(n112), .CI(n22), .CO(n21), .S(product[3]) );
  ADDFXL U23 ( .A(n178), .B(n168), .CI(n23), .CO(n22), .S(product[2]) );
  ADDHXL U24 ( .A(n113), .B(n179), .CO(n23), .S(product[1]) );
  ADDFXL U26 ( .A(n30), .B(n125), .CI(n115), .CO(n26), .S(n27) );
  ADDFXL U27 ( .A(n375), .B(n116), .CI(n32), .CO(n28), .S(n29) );
  CMPR42X1 U29 ( .A(n136), .B(n126), .C(n38), .D(n117), .ICI(n35), .S(n34), 
        .ICO(n32), .CO(n33) );
  CMPR42X1 U30 ( .A(n127), .B(n118), .C(n372), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  CMPR42X1 U32 ( .A(n137), .B(n128), .C(n44), .D(n48), .ICI(n45), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U33 ( .A(n50), .B(n146), .CI(n119), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n370), .B(n55), .C(n56), .D(n49), .ICI(n52), .S(n47), 
        .ICO(n45), .CO(n46) );
  ADDFXL U35 ( .A(n129), .B(n120), .CI(n138), .CO(n48), .S(n49) );
  CMPR42X1 U37 ( .A(n139), .B(n130), .C(n57), .D(n62), .ICI(n58), .S(n54), 
        .ICO(n52), .CO(n53) );
  CMPR42X1 U38 ( .A(n157), .B(n121), .C(n64), .D(n147), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  CMPR42X1 U39 ( .A(n373), .B(n69), .C(n70), .D(n63), .ICI(n66), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U40 ( .A(n131), .B(n158), .C(n148), .D(n122), .ICI(n72), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U42 ( .A(n140), .B(n73), .C(n78), .D(n71), .ICI(n74), .S(n68), 
        .ICO(n66), .CO(n67) );
  CMPR42X1 U43 ( .A(n159), .B(n108), .C(n149), .D(n132), .ICI(n77), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1 U46 ( .A(n150), .B(n85), .C(n79), .D(n83), .ICI(n80), .S(n76), 
        .ICO(n74), .CO(n75) );
  CMPR42X1 U47 ( .A(n124), .B(n141), .C(n170), .D(n160), .ICI(n133), .S(n79), 
        .ICO(n77), .CO(n78) );
  CMPR42X1 U48 ( .A(n171), .B(n86), .C(n87), .D(n90), .ICI(n84), .S(n82), 
        .ICO(n80), .CO(n81) );
  ADDFXL U49 ( .A(n142), .B(n151), .CI(n161), .CO(n83), .S(n84) );
  ADDHXL U50 ( .A(n134), .B(n109), .CO(n85), .S(n86) );
  CMPR42X1 U51 ( .A(n162), .B(n143), .C(n95), .D(n92), .ICI(n91), .S(n89), 
        .ICO(n87), .CO(n88) );
  ADDFXL U52 ( .A(n152), .B(n135), .CI(n172), .CO(n90), .S(n91) );
  CMPR42X1 U53 ( .A(n173), .B(n153), .C(n163), .D(n97), .ICI(n96), .S(n94), 
        .ICO(n92), .CO(n93) );
  ADDHXL U54 ( .A(n144), .B(n110), .CO(n95), .S(n96) );
  CMPR42X1 U55 ( .A(n145), .B(n174), .C(n164), .D(n154), .ICI(n102), .S(n99), 
        .ICO(n97), .CO(n98) );
  ADDFXL U56 ( .A(n165), .B(n175), .CI(n103), .CO(n100), .S(n101) );
  ADDHXL U57 ( .A(n155), .B(n111), .CO(n102), .S(n103) );
  ADDFXL U58 ( .A(n176), .B(n156), .CI(n166), .CO(n104), .S(n105) );
  ADDHXL U59 ( .A(n177), .B(n167), .CO(n106), .S(n107) );
  CLKINVX1 U264 ( .A(n64), .Y(n373) );
  CLKINVX1 U265 ( .A(n50), .Y(n370) );
  CLKBUFX3 U266 ( .A(n377), .Y(n356) );
  CLKINVX1 U267 ( .A(n386), .Y(n377) );
  CLKINVX1 U268 ( .A(n38), .Y(n372) );
  INVX3 U269 ( .A(a[1]), .Y(n368) );
  CLKBUFX3 U270 ( .A(n412), .Y(n359) );
  XNOR2X1 U271 ( .A(a[2]), .B(a[1]), .Y(n412) );
  INVX3 U272 ( .A(a[0]), .Y(n367) );
  CLKINVX1 U273 ( .A(n366), .Y(n379) );
  CLKBUFX3 U274 ( .A(n369), .Y(n352) );
  CLKINVX1 U275 ( .A(a[3]), .Y(n369) );
  CLKBUFX3 U276 ( .A(n414), .Y(n358) );
  NAND2X1 U277 ( .A(n359), .B(n458), .Y(n414) );
  CLKBUFX3 U278 ( .A(n387), .Y(n357) );
  NAND2X1 U279 ( .A(a[1]), .B(n367), .Y(n387) );
  CLKBUFX3 U280 ( .A(n393), .Y(n361) );
  XNOR2X1 U281 ( .A(a[4]), .B(a[3]), .Y(n393) );
  CLKBUFX3 U282 ( .A(n371), .Y(n353) );
  CLKINVX1 U283 ( .A(a[5]), .Y(n371) );
  CLKBUFX3 U284 ( .A(n396), .Y(n360) );
  NAND2X1 U285 ( .A(n361), .B(n459), .Y(n396) );
  CLKBUFX3 U286 ( .A(n390), .Y(n362) );
  NAND2X1 U287 ( .A(n363), .B(n460), .Y(n390) );
  CLKBUFX3 U288 ( .A(n391), .Y(n363) );
  XNOR2X1 U289 ( .A(a[6]), .B(a[5]), .Y(n391) );
  CLKBUFX3 U290 ( .A(n374), .Y(n354) );
  CLKINVX1 U291 ( .A(a[7]), .Y(n374) );
  CLKBUFX3 U292 ( .A(n402), .Y(n364) );
  NAND2X1 U293 ( .A(n365), .B(n461), .Y(n402) );
  CLKBUFX3 U294 ( .A(n399), .Y(n365) );
  XNOR2X1 U295 ( .A(a[8]), .B(a[7]), .Y(n399) );
  CLKBUFX3 U296 ( .A(n376), .Y(n355) );
  CLKINVX1 U297 ( .A(a[9]), .Y(n376) );
  INVX3 U298 ( .A(a[10]), .Y(n378) );
  CLKINVX1 U299 ( .A(n30), .Y(n375) );
  CLKBUFX3 U300 ( .A(b[0]), .Y(n366) );
  XOR2X1 U301 ( .A(n380), .B(n381), .Y(product[21]) );
  NOR2BX1 U302 ( .AN(n382), .B(n356), .Y(n381) );
  XOR2X1 U303 ( .A(n25), .B(n4), .Y(n380) );
  NOR2X1 U304 ( .A(n367), .B(n379), .Y(product[0]) );
  XOR2X1 U305 ( .A(n383), .B(n384), .Y(n73) );
  NAND2BX1 U306 ( .AN(n384), .B(n383), .Y(n72) );
  NAND2X1 U307 ( .A(n385), .B(n386), .Y(n383) );
  XOR2X1 U308 ( .A(b[1]), .B(a[10]), .Y(n385) );
  OAI2BB1X1 U309 ( .A0N(n367), .A1N(n357), .B0(n388), .Y(n384) );
  OAI22XL U310 ( .A0(n389), .A1(n362), .B0(n363), .B1(n392), .Y(n64) );
  OAI22XL U311 ( .A0(n361), .A1(n394), .B0(n395), .B1(n360), .Y(n50) );
  OAI22XL U312 ( .A0(n363), .A1(n397), .B0(n398), .B1(n362), .Y(n38) );
  OAI22XL U313 ( .A0(n365), .A1(n400), .B0(n401), .B1(n364), .Y(n30) );
  NAND2X1 U314 ( .A(n382), .B(n386), .Y(n25) );
  XOR2X1 U315 ( .A(b[10]), .B(a[10]), .Y(n382) );
  OAI22XL U316 ( .A0(n366), .A1(n357), .B0(n403), .B1(n367), .Y(n179) );
  OAI22XL U317 ( .A0(n403), .A1(n357), .B0(n404), .B1(n367), .Y(n178) );
  XOR2X1 U318 ( .A(b[1]), .B(n368), .Y(n403) );
  OAI22XL U319 ( .A0(n404), .A1(n357), .B0(n405), .B1(n367), .Y(n177) );
  XOR2X1 U320 ( .A(b[2]), .B(n368), .Y(n404) );
  OAI22XL U321 ( .A0(n405), .A1(n357), .B0(n406), .B1(n367), .Y(n176) );
  XOR2X1 U322 ( .A(b[3]), .B(n368), .Y(n405) );
  OAI22XL U323 ( .A0(n406), .A1(n357), .B0(n407), .B1(n367), .Y(n175) );
  XOR2X1 U324 ( .A(b[4]), .B(n368), .Y(n406) );
  OAI22XL U325 ( .A0(n407), .A1(n357), .B0(n408), .B1(n367), .Y(n174) );
  XOR2X1 U326 ( .A(b[5]), .B(n368), .Y(n407) );
  OAI22XL U327 ( .A0(n408), .A1(n357), .B0(n409), .B1(n367), .Y(n173) );
  XOR2X1 U328 ( .A(b[6]), .B(n368), .Y(n408) );
  OAI22XL U329 ( .A0(n409), .A1(n357), .B0(n410), .B1(n367), .Y(n172) );
  XOR2X1 U330 ( .A(b[7]), .B(n368), .Y(n409) );
  OAI22XL U331 ( .A0(n410), .A1(n357), .B0(n411), .B1(n367), .Y(n171) );
  XOR2X1 U332 ( .A(b[8]), .B(n368), .Y(n410) );
  OAI2BB2XL U333 ( .B0(n411), .B1(n357), .A0N(n388), .A1N(a[0]), .Y(n170) );
  XOR2X1 U334 ( .A(b[10]), .B(a[1]), .Y(n388) );
  XOR2X1 U335 ( .A(b[9]), .B(n368), .Y(n411) );
  NOR2X1 U336 ( .A(n359), .B(n379), .Y(n168) );
  OAI22XL U337 ( .A0(n413), .A1(n358), .B0(n359), .B1(n415), .Y(n167) );
  XOR2X1 U338 ( .A(n352), .B(n366), .Y(n413) );
  OAI22XL U339 ( .A0(n415), .A1(n358), .B0(n359), .B1(n416), .Y(n166) );
  XOR2X1 U340 ( .A(b[1]), .B(n352), .Y(n415) );
  OAI22XL U341 ( .A0(n416), .A1(n358), .B0(n359), .B1(n417), .Y(n165) );
  XOR2X1 U342 ( .A(b[2]), .B(n352), .Y(n416) );
  OAI22XL U343 ( .A0(n417), .A1(n358), .B0(n359), .B1(n418), .Y(n164) );
  XOR2X1 U344 ( .A(b[3]), .B(n352), .Y(n417) );
  OAI22XL U345 ( .A0(n418), .A1(n358), .B0(n359), .B1(n419), .Y(n163) );
  XOR2X1 U346 ( .A(b[4]), .B(n352), .Y(n418) );
  OAI22XL U347 ( .A0(n419), .A1(n358), .B0(n359), .B1(n420), .Y(n162) );
  XOR2X1 U348 ( .A(b[5]), .B(n352), .Y(n419) );
  OAI22XL U349 ( .A0(n420), .A1(n358), .B0(n359), .B1(n421), .Y(n161) );
  XOR2X1 U350 ( .A(b[6]), .B(n352), .Y(n420) );
  OAI22XL U351 ( .A0(n421), .A1(n358), .B0(n359), .B1(n422), .Y(n160) );
  XOR2X1 U352 ( .A(b[7]), .B(n352), .Y(n421) );
  OAI22XL U353 ( .A0(n422), .A1(n358), .B0(n359), .B1(n423), .Y(n159) );
  XOR2X1 U354 ( .A(b[8]), .B(n352), .Y(n422) );
  OAI22XL U355 ( .A0(n423), .A1(n358), .B0(n359), .B1(n424), .Y(n158) );
  XOR2X1 U356 ( .A(b[9]), .B(n352), .Y(n423) );
  AO21X1 U357 ( .A0(n358), .A1(n359), .B0(n424), .Y(n157) );
  XOR2X1 U358 ( .A(b[10]), .B(n352), .Y(n424) );
  NOR2X1 U359 ( .A(n361), .B(n379), .Y(n156) );
  OAI22XL U360 ( .A0(n425), .A1(n360), .B0(n361), .B1(n426), .Y(n155) );
  XOR2X1 U361 ( .A(n353), .B(n366), .Y(n425) );
  OAI22XL U362 ( .A0(n426), .A1(n360), .B0(n361), .B1(n427), .Y(n154) );
  XOR2X1 U363 ( .A(b[1]), .B(n353), .Y(n426) );
  OAI22XL U364 ( .A0(n427), .A1(n360), .B0(n361), .B1(n428), .Y(n153) );
  XOR2X1 U365 ( .A(b[2]), .B(n353), .Y(n427) );
  OAI22XL U366 ( .A0(n428), .A1(n360), .B0(n361), .B1(n429), .Y(n152) );
  XOR2X1 U367 ( .A(b[3]), .B(n353), .Y(n428) );
  OAI22XL U368 ( .A0(n429), .A1(n360), .B0(n361), .B1(n430), .Y(n151) );
  XOR2X1 U369 ( .A(b[4]), .B(n353), .Y(n429) );
  OAI22XL U370 ( .A0(n430), .A1(n360), .B0(n361), .B1(n431), .Y(n150) );
  XOR2X1 U371 ( .A(b[5]), .B(n353), .Y(n430) );
  OAI22XL U372 ( .A0(n431), .A1(n360), .B0(n361), .B1(n432), .Y(n149) );
  XOR2X1 U373 ( .A(b[6]), .B(n353), .Y(n431) );
  OAI22XL U374 ( .A0(n432), .A1(n360), .B0(n361), .B1(n433), .Y(n148) );
  XOR2X1 U375 ( .A(b[7]), .B(n353), .Y(n432) );
  OAI22XL U376 ( .A0(n433), .A1(n360), .B0(n361), .B1(n395), .Y(n147) );
  XOR2X1 U377 ( .A(b[9]), .B(n353), .Y(n395) );
  XOR2X1 U378 ( .A(b[8]), .B(n353), .Y(n433) );
  AO21X1 U379 ( .A0(n360), .A1(n361), .B0(n394), .Y(n146) );
  XOR2X1 U380 ( .A(b[10]), .B(n353), .Y(n394) );
  NOR2X1 U381 ( .A(n363), .B(n379), .Y(n145) );
  OAI22XL U382 ( .A0(n434), .A1(n362), .B0(n363), .B1(n435), .Y(n144) );
  XOR2X1 U383 ( .A(n354), .B(n366), .Y(n434) );
  OAI22XL U384 ( .A0(n435), .A1(n362), .B0(n363), .B1(n436), .Y(n143) );
  XOR2X1 U385 ( .A(b[1]), .B(n354), .Y(n435) );
  OAI22XL U386 ( .A0(n436), .A1(n362), .B0(n363), .B1(n437), .Y(n142) );
  XOR2X1 U387 ( .A(b[2]), .B(n354), .Y(n436) );
  OAI22XL U388 ( .A0(n437), .A1(n362), .B0(n363), .B1(n438), .Y(n141) );
  XOR2X1 U389 ( .A(b[3]), .B(n354), .Y(n437) );
  OAI22XL U390 ( .A0(n438), .A1(n362), .B0(n363), .B1(n389), .Y(n140) );
  XOR2X1 U391 ( .A(b[5]), .B(n354), .Y(n389) );
  XOR2X1 U392 ( .A(b[4]), .B(n354), .Y(n438) );
  OAI22XL U393 ( .A0(n392), .A1(n362), .B0(n363), .B1(n439), .Y(n139) );
  XOR2X1 U394 ( .A(b[6]), .B(n354), .Y(n392) );
  OAI22XL U395 ( .A0(n439), .A1(n362), .B0(n363), .B1(n440), .Y(n138) );
  XOR2X1 U396 ( .A(b[7]), .B(n354), .Y(n439) );
  OAI22XL U397 ( .A0(n440), .A1(n362), .B0(n363), .B1(n398), .Y(n137) );
  XOR2X1 U398 ( .A(b[9]), .B(n354), .Y(n398) );
  XOR2X1 U399 ( .A(b[8]), .B(n354), .Y(n440) );
  AO21X1 U400 ( .A0(n362), .A1(n363), .B0(n397), .Y(n136) );
  XOR2X1 U401 ( .A(b[10]), .B(n354), .Y(n397) );
  NOR2X1 U402 ( .A(n365), .B(n379), .Y(n135) );
  OAI22XL U403 ( .A0(n441), .A1(n364), .B0(n365), .B1(n442), .Y(n134) );
  XOR2X1 U404 ( .A(n355), .B(n366), .Y(n441) );
  OAI22XL U405 ( .A0(n442), .A1(n364), .B0(n365), .B1(n443), .Y(n133) );
  XOR2X1 U406 ( .A(b[1]), .B(n355), .Y(n442) );
  OAI22XL U407 ( .A0(n443), .A1(n364), .B0(n365), .B1(n444), .Y(n132) );
  XOR2X1 U408 ( .A(b[2]), .B(n355), .Y(n443) );
  OAI22XL U409 ( .A0(n444), .A1(n364), .B0(n365), .B1(n445), .Y(n131) );
  XOR2X1 U410 ( .A(b[3]), .B(n355), .Y(n444) );
  OAI22XL U411 ( .A0(n445), .A1(n364), .B0(n365), .B1(n446), .Y(n130) );
  XOR2X1 U412 ( .A(b[4]), .B(n355), .Y(n445) );
  OAI22XL U413 ( .A0(n446), .A1(n364), .B0(n365), .B1(n447), .Y(n129) );
  XOR2X1 U414 ( .A(b[5]), .B(n355), .Y(n446) );
  OAI22XL U415 ( .A0(n447), .A1(n364), .B0(n365), .B1(n448), .Y(n128) );
  XOR2X1 U416 ( .A(b[6]), .B(n355), .Y(n447) );
  OAI22XL U417 ( .A0(n448), .A1(n364), .B0(n365), .B1(n449), .Y(n127) );
  XOR2X1 U418 ( .A(b[7]), .B(n355), .Y(n448) );
  OAI22XL U419 ( .A0(n449), .A1(n364), .B0(n365), .B1(n401), .Y(n126) );
  XOR2X1 U420 ( .A(b[9]), .B(n355), .Y(n401) );
  XOR2X1 U421 ( .A(b[8]), .B(n355), .Y(n449) );
  AO21X1 U422 ( .A0(n364), .A1(n365), .B0(n400), .Y(n125) );
  XOR2X1 U423 ( .A(b[10]), .B(n355), .Y(n400) );
  NOR2X1 U424 ( .A(n356), .B(n379), .Y(n124) );
  NOR2X1 U425 ( .A(n356), .B(n450), .Y(n122) );
  XOR2X1 U426 ( .A(b[2]), .B(n378), .Y(n450) );
  NOR2X1 U427 ( .A(n356), .B(n451), .Y(n121) );
  XOR2X1 U428 ( .A(b[3]), .B(n378), .Y(n451) );
  NOR2X1 U429 ( .A(n356), .B(n452), .Y(n120) );
  XOR2X1 U430 ( .A(b[4]), .B(n378), .Y(n452) );
  NOR2X1 U431 ( .A(n356), .B(n453), .Y(n119) );
  XOR2X1 U432 ( .A(b[5]), .B(n378), .Y(n453) );
  NOR2X1 U433 ( .A(n356), .B(n454), .Y(n118) );
  XOR2X1 U434 ( .A(b[6]), .B(n378), .Y(n454) );
  NOR2X1 U435 ( .A(n356), .B(n455), .Y(n117) );
  XOR2X1 U436 ( .A(b[7]), .B(n378), .Y(n455) );
  NOR2X1 U437 ( .A(n356), .B(n456), .Y(n116) );
  XOR2X1 U438 ( .A(b[8]), .B(n378), .Y(n456) );
  NOR2X1 U439 ( .A(n356), .B(n457), .Y(n115) );
  XOR2X1 U440 ( .A(b[9]), .B(n378), .Y(n457) );
  OAI21XL U441 ( .A0(n366), .A1(n368), .B0(n357), .Y(n113) );
  OAI32X1 U442 ( .A0(n352), .A1(n366), .A2(n359), .B0(n352), .B1(n358), .Y(
        n112) );
  XOR2X1 U443 ( .A(a[3]), .B(a[2]), .Y(n458) );
  OAI32X1 U444 ( .A0(n353), .A1(n366), .A2(n361), .B0(n353), .B1(n360), .Y(
        n111) );
  XOR2X1 U445 ( .A(a[5]), .B(a[4]), .Y(n459) );
  OAI32X1 U446 ( .A0(n354), .A1(n366), .A2(n363), .B0(n354), .B1(n362), .Y(
        n110) );
  XOR2X1 U447 ( .A(a[7]), .B(a[6]), .Y(n460) );
  OAI32X1 U448 ( .A0(n355), .A1(n366), .A2(n365), .B0(n355), .B1(n364), .Y(
        n109) );
  XOR2X1 U449 ( .A(a[9]), .B(a[8]), .Y(n461) );
  NOR3X1 U450 ( .A(n378), .B(n366), .C(n356), .Y(n108) );
  XNOR2X1 U451 ( .A(n378), .B(a[9]), .Y(n386) );
endmodule


module READ_DW_mult_tc_0 ( a, b, product );
  input [10:0] a;
  input [10:0] b;
  output [21:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n25, n26, n27, n28, n29, n30, n32, n33, n34,
         n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n115, n116, n117,
         n118, n119, n120, n121, n122, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461;

  ADDFXL U5 ( .A(n26), .B(n25), .CI(n5), .CO(n4), .S(product[20]) );
  ADDFXL U6 ( .A(n28), .B(n27), .CI(n6), .CO(n5), .S(product[19]) );
  ADDFXL U7 ( .A(n29), .B(n33), .CI(n7), .CO(n6), .S(product[18]) );
  ADDFXL U8 ( .A(n36), .B(n34), .CI(n8), .CO(n7), .S(product[17]) );
  ADDFXL U9 ( .A(n37), .B(n41), .CI(n9), .CO(n8), .S(product[16]) );
  ADDFXL U10 ( .A(n42), .B(n46), .CI(n10), .CO(n9), .S(product[15]) );
  ADDFXL U11 ( .A(n47), .B(n53), .CI(n11), .CO(n10), .S(product[14]) );
  ADDFXL U12 ( .A(n54), .B(n59), .CI(n12), .CO(n11), .S(product[13]) );
  ADDFXL U13 ( .A(n60), .B(n67), .CI(n13), .CO(n12), .S(product[12]) );
  ADDFXL U14 ( .A(n68), .B(n75), .CI(n14), .CO(n13), .S(product[11]) );
  ADDFXL U15 ( .A(n76), .B(n81), .CI(n15), .CO(n14), .S(product[10]) );
  ADDFXL U16 ( .A(n82), .B(n88), .CI(n16), .CO(n15), .S(product[9]) );
  ADDFXL U17 ( .A(n89), .B(n93), .CI(n17), .CO(n16), .S(product[8]) );
  ADDFXL U18 ( .A(n94), .B(n98), .CI(n18), .CO(n17), .S(product[7]) );
  ADDFXL U19 ( .A(n100), .B(n99), .CI(n19), .CO(n18), .S(product[6]) );
  ADDFXL U20 ( .A(n101), .B(n104), .CI(n20), .CO(n19), .S(product[5]) );
  ADDFXL U21 ( .A(n105), .B(n106), .CI(n21), .CO(n20), .S(product[4]) );
  ADDFXL U22 ( .A(n107), .B(n112), .CI(n22), .CO(n21), .S(product[3]) );
  ADDFXL U23 ( .A(n178), .B(n168), .CI(n23), .CO(n22), .S(product[2]) );
  ADDHXL U24 ( .A(n113), .B(n179), .CO(n23), .S(product[1]) );
  ADDFXL U26 ( .A(n30), .B(n125), .CI(n115), .CO(n26), .S(n27) );
  ADDFXL U27 ( .A(n371), .B(n116), .CI(n32), .CO(n28), .S(n29) );
  CMPR42X1 U29 ( .A(n136), .B(n126), .C(n38), .D(n117), .ICI(n35), .S(n34), 
        .ICO(n32), .CO(n33) );
  CMPR42X1 U30 ( .A(n127), .B(n118), .C(n370), .D(n43), .ICI(n40), .S(n37), 
        .ICO(n35), .CO(n36) );
  CMPR42X1 U32 ( .A(n137), .B(n128), .C(n44), .D(n48), .ICI(n45), .S(n42), 
        .ICO(n40), .CO(n41) );
  ADDFXL U33 ( .A(n50), .B(n146), .CI(n119), .CO(n43), .S(n44) );
  CMPR42X1 U34 ( .A(n369), .B(n55), .C(n56), .D(n49), .ICI(n52), .S(n47), 
        .ICO(n45), .CO(n46) );
  ADDFXL U35 ( .A(n129), .B(n120), .CI(n138), .CO(n48), .S(n49) );
  CMPR42X1 U37 ( .A(n139), .B(n130), .C(n57), .D(n62), .ICI(n58), .S(n54), 
        .ICO(n52), .CO(n53) );
  CMPR42X1 U38 ( .A(n157), .B(n121), .C(n64), .D(n147), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  CMPR42X1 U39 ( .A(n368), .B(n69), .C(n70), .D(n63), .ICI(n66), .S(n60), 
        .ICO(n58), .CO(n59) );
  CMPR42X1 U40 ( .A(n131), .B(n158), .C(n148), .D(n122), .ICI(n72), .S(n63), 
        .ICO(n61), .CO(n62) );
  CMPR42X1 U42 ( .A(n140), .B(n73), .C(n78), .D(n71), .ICI(n74), .S(n68), 
        .ICO(n66), .CO(n67) );
  CMPR42X1 U43 ( .A(n159), .B(n108), .C(n149), .D(n132), .ICI(n77), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1 U46 ( .A(n150), .B(n85), .C(n79), .D(n83), .ICI(n80), .S(n76), 
        .ICO(n74), .CO(n75) );
  CMPR42X1 U47 ( .A(n124), .B(n141), .C(n170), .D(n160), .ICI(n133), .S(n79), 
        .ICO(n77), .CO(n78) );
  CMPR42X1 U48 ( .A(n171), .B(n86), .C(n87), .D(n90), .ICI(n84), .S(n82), 
        .ICO(n80), .CO(n81) );
  ADDFXL U49 ( .A(n142), .B(n151), .CI(n161), .CO(n83), .S(n84) );
  ADDHXL U50 ( .A(n134), .B(n109), .CO(n85), .S(n86) );
  CMPR42X1 U51 ( .A(n162), .B(n143), .C(n95), .D(n92), .ICI(n91), .S(n89), 
        .ICO(n87), .CO(n88) );
  ADDFXL U52 ( .A(n152), .B(n135), .CI(n172), .CO(n90), .S(n91) );
  CMPR42X1 U53 ( .A(n173), .B(n153), .C(n163), .D(n97), .ICI(n96), .S(n94), 
        .ICO(n92), .CO(n93) );
  ADDHXL U54 ( .A(n144), .B(n110), .CO(n95), .S(n96) );
  CMPR42X1 U55 ( .A(n145), .B(n174), .C(n164), .D(n154), .ICI(n102), .S(n99), 
        .ICO(n97), .CO(n98) );
  ADDFXL U56 ( .A(n165), .B(n175), .CI(n103), .CO(n100), .S(n101) );
  ADDHXL U57 ( .A(n155), .B(n111), .CO(n102), .S(n103) );
  ADDFXL U58 ( .A(n176), .B(n156), .CI(n166), .CO(n104), .S(n105) );
  ADDHXL U59 ( .A(n177), .B(n167), .CO(n106), .S(n107) );
  CLKINVX1 U264 ( .A(n64), .Y(n368) );
  CLKINVX1 U265 ( .A(n50), .Y(n369) );
  CLKBUFX3 U266 ( .A(n378), .Y(n356) );
  CLKINVX1 U267 ( .A(n386), .Y(n378) );
  CLKINVX1 U268 ( .A(n38), .Y(n370) );
  INVX3 U269 ( .A(a[1]), .Y(n373) );
  INVX3 U270 ( .A(a[0]), .Y(n372) );
  CLKBUFX3 U271 ( .A(n412), .Y(n359) );
  XNOR2X1 U272 ( .A(a[2]), .B(a[1]), .Y(n412) );
  CLKBUFX3 U273 ( .A(n414), .Y(n358) );
  NAND2X1 U274 ( .A(n359), .B(n458), .Y(n414) );
  CLKBUFX3 U275 ( .A(n387), .Y(n357) );
  NAND2X1 U276 ( .A(a[1]), .B(n372), .Y(n387) );
  CLKINVX1 U277 ( .A(n366), .Y(n367) );
  CLKBUFX3 U278 ( .A(n374), .Y(n352) );
  CLKINVX1 U279 ( .A(a[3]), .Y(n374) );
  CLKBUFX3 U280 ( .A(n393), .Y(n361) );
  XNOR2X1 U281 ( .A(a[4]), .B(a[3]), .Y(n393) );
  CLKBUFX3 U282 ( .A(n375), .Y(n353) );
  CLKINVX1 U283 ( .A(a[5]), .Y(n375) );
  CLKBUFX3 U284 ( .A(n396), .Y(n360) );
  NAND2X1 U285 ( .A(n361), .B(n459), .Y(n396) );
  CLKBUFX3 U286 ( .A(n390), .Y(n362) );
  NAND2X1 U287 ( .A(n363), .B(n460), .Y(n390) );
  CLKBUFX3 U288 ( .A(n391), .Y(n363) );
  XNOR2X1 U289 ( .A(a[6]), .B(a[5]), .Y(n391) );
  CLKBUFX3 U290 ( .A(n376), .Y(n354) );
  CLKINVX1 U291 ( .A(a[7]), .Y(n376) );
  CLKBUFX3 U292 ( .A(n402), .Y(n364) );
  NAND2X1 U293 ( .A(n365), .B(n461), .Y(n402) );
  CLKBUFX3 U294 ( .A(n399), .Y(n365) );
  XNOR2X1 U295 ( .A(a[8]), .B(a[7]), .Y(n399) );
  CLKBUFX3 U296 ( .A(n377), .Y(n355) );
  CLKINVX1 U297 ( .A(a[9]), .Y(n377) );
  INVX3 U298 ( .A(a[10]), .Y(n379) );
  CLKINVX1 U299 ( .A(n30), .Y(n371) );
  CLKBUFX3 U300 ( .A(b[0]), .Y(n366) );
  XOR2X1 U301 ( .A(n380), .B(n381), .Y(product[21]) );
  NOR2BX1 U302 ( .AN(n382), .B(n356), .Y(n381) );
  XOR2X1 U303 ( .A(n25), .B(n4), .Y(n380) );
  NOR2X1 U304 ( .A(n372), .B(n367), .Y(product[0]) );
  XOR2X1 U305 ( .A(n383), .B(n384), .Y(n73) );
  NAND2BX1 U306 ( .AN(n384), .B(n383), .Y(n72) );
  NAND2X1 U307 ( .A(n385), .B(n386), .Y(n383) );
  XOR2X1 U308 ( .A(b[1]), .B(a[10]), .Y(n385) );
  OAI2BB1X1 U309 ( .A0N(n372), .A1N(n357), .B0(n388), .Y(n384) );
  OAI22XL U310 ( .A0(n389), .A1(n362), .B0(n363), .B1(n392), .Y(n64) );
  OAI22XL U311 ( .A0(n361), .A1(n394), .B0(n395), .B1(n360), .Y(n50) );
  OAI22XL U312 ( .A0(n363), .A1(n397), .B0(n398), .B1(n362), .Y(n38) );
  OAI22XL U313 ( .A0(n365), .A1(n400), .B0(n401), .B1(n364), .Y(n30) );
  NAND2X1 U314 ( .A(n382), .B(n386), .Y(n25) );
  XOR2X1 U315 ( .A(b[10]), .B(a[10]), .Y(n382) );
  OAI22XL U316 ( .A0(n366), .A1(n357), .B0(n403), .B1(n372), .Y(n179) );
  OAI22XL U317 ( .A0(n403), .A1(n357), .B0(n404), .B1(n372), .Y(n178) );
  XOR2X1 U318 ( .A(b[1]), .B(n373), .Y(n403) );
  OAI22XL U319 ( .A0(n404), .A1(n357), .B0(n405), .B1(n372), .Y(n177) );
  XOR2X1 U320 ( .A(b[2]), .B(n373), .Y(n404) );
  OAI22XL U321 ( .A0(n405), .A1(n357), .B0(n406), .B1(n372), .Y(n176) );
  XOR2X1 U322 ( .A(b[3]), .B(n373), .Y(n405) );
  OAI22XL U323 ( .A0(n406), .A1(n357), .B0(n407), .B1(n372), .Y(n175) );
  XOR2X1 U324 ( .A(b[4]), .B(n373), .Y(n406) );
  OAI22XL U325 ( .A0(n407), .A1(n357), .B0(n408), .B1(n372), .Y(n174) );
  XOR2X1 U326 ( .A(b[5]), .B(n373), .Y(n407) );
  OAI22XL U327 ( .A0(n408), .A1(n357), .B0(n409), .B1(n372), .Y(n173) );
  XOR2X1 U328 ( .A(b[6]), .B(n373), .Y(n408) );
  OAI22XL U329 ( .A0(n409), .A1(n357), .B0(n410), .B1(n372), .Y(n172) );
  XOR2X1 U330 ( .A(b[7]), .B(n373), .Y(n409) );
  OAI22XL U331 ( .A0(n410), .A1(n357), .B0(n411), .B1(n372), .Y(n171) );
  XOR2X1 U332 ( .A(b[8]), .B(n373), .Y(n410) );
  OAI2BB2XL U333 ( .B0(n411), .B1(n357), .A0N(n388), .A1N(a[0]), .Y(n170) );
  XOR2X1 U334 ( .A(b[10]), .B(a[1]), .Y(n388) );
  XOR2X1 U335 ( .A(b[9]), .B(n373), .Y(n411) );
  NOR2X1 U336 ( .A(n359), .B(n367), .Y(n168) );
  OAI22XL U337 ( .A0(n413), .A1(n358), .B0(n359), .B1(n415), .Y(n167) );
  XOR2X1 U338 ( .A(n352), .B(n366), .Y(n413) );
  OAI22XL U339 ( .A0(n415), .A1(n358), .B0(n359), .B1(n416), .Y(n166) );
  XOR2X1 U340 ( .A(b[1]), .B(n352), .Y(n415) );
  OAI22XL U341 ( .A0(n416), .A1(n358), .B0(n359), .B1(n417), .Y(n165) );
  XOR2X1 U342 ( .A(b[2]), .B(n352), .Y(n416) );
  OAI22XL U343 ( .A0(n417), .A1(n358), .B0(n359), .B1(n418), .Y(n164) );
  XOR2X1 U344 ( .A(b[3]), .B(n352), .Y(n417) );
  OAI22XL U345 ( .A0(n418), .A1(n358), .B0(n359), .B1(n419), .Y(n163) );
  XOR2X1 U346 ( .A(b[4]), .B(n352), .Y(n418) );
  OAI22XL U347 ( .A0(n419), .A1(n358), .B0(n359), .B1(n420), .Y(n162) );
  XOR2X1 U348 ( .A(b[5]), .B(n352), .Y(n419) );
  OAI22XL U349 ( .A0(n420), .A1(n358), .B0(n359), .B1(n421), .Y(n161) );
  XOR2X1 U350 ( .A(b[6]), .B(n352), .Y(n420) );
  OAI22XL U351 ( .A0(n421), .A1(n358), .B0(n359), .B1(n422), .Y(n160) );
  XOR2X1 U352 ( .A(b[7]), .B(n352), .Y(n421) );
  OAI22XL U353 ( .A0(n422), .A1(n358), .B0(n359), .B1(n423), .Y(n159) );
  XOR2X1 U354 ( .A(b[8]), .B(n352), .Y(n422) );
  OAI22XL U355 ( .A0(n423), .A1(n358), .B0(n359), .B1(n424), .Y(n158) );
  XOR2X1 U356 ( .A(b[9]), .B(n352), .Y(n423) );
  AO21X1 U357 ( .A0(n358), .A1(n359), .B0(n424), .Y(n157) );
  XOR2X1 U358 ( .A(b[10]), .B(n352), .Y(n424) );
  NOR2X1 U359 ( .A(n361), .B(n367), .Y(n156) );
  OAI22XL U360 ( .A0(n425), .A1(n360), .B0(n361), .B1(n426), .Y(n155) );
  XOR2X1 U361 ( .A(n353), .B(n366), .Y(n425) );
  OAI22XL U362 ( .A0(n426), .A1(n360), .B0(n361), .B1(n427), .Y(n154) );
  XOR2X1 U363 ( .A(b[1]), .B(n353), .Y(n426) );
  OAI22XL U364 ( .A0(n427), .A1(n360), .B0(n361), .B1(n428), .Y(n153) );
  XOR2X1 U365 ( .A(b[2]), .B(n353), .Y(n427) );
  OAI22XL U366 ( .A0(n428), .A1(n360), .B0(n361), .B1(n429), .Y(n152) );
  XOR2X1 U367 ( .A(b[3]), .B(n353), .Y(n428) );
  OAI22XL U368 ( .A0(n429), .A1(n360), .B0(n361), .B1(n430), .Y(n151) );
  XOR2X1 U369 ( .A(b[4]), .B(n353), .Y(n429) );
  OAI22XL U370 ( .A0(n430), .A1(n360), .B0(n361), .B1(n431), .Y(n150) );
  XOR2X1 U371 ( .A(b[5]), .B(n353), .Y(n430) );
  OAI22XL U372 ( .A0(n431), .A1(n360), .B0(n361), .B1(n432), .Y(n149) );
  XOR2X1 U373 ( .A(b[6]), .B(n353), .Y(n431) );
  OAI22XL U374 ( .A0(n432), .A1(n360), .B0(n361), .B1(n433), .Y(n148) );
  XOR2X1 U375 ( .A(b[7]), .B(n353), .Y(n432) );
  OAI22XL U376 ( .A0(n433), .A1(n360), .B0(n361), .B1(n395), .Y(n147) );
  XOR2X1 U377 ( .A(b[9]), .B(n353), .Y(n395) );
  XOR2X1 U378 ( .A(b[8]), .B(n353), .Y(n433) );
  AO21X1 U379 ( .A0(n360), .A1(n361), .B0(n394), .Y(n146) );
  XOR2X1 U380 ( .A(b[10]), .B(n353), .Y(n394) );
  NOR2X1 U381 ( .A(n363), .B(n367), .Y(n145) );
  OAI22XL U382 ( .A0(n434), .A1(n362), .B0(n363), .B1(n435), .Y(n144) );
  XOR2X1 U383 ( .A(n354), .B(n366), .Y(n434) );
  OAI22XL U384 ( .A0(n435), .A1(n362), .B0(n363), .B1(n436), .Y(n143) );
  XOR2X1 U385 ( .A(b[1]), .B(n354), .Y(n435) );
  OAI22XL U386 ( .A0(n436), .A1(n362), .B0(n363), .B1(n437), .Y(n142) );
  XOR2X1 U387 ( .A(b[2]), .B(n354), .Y(n436) );
  OAI22XL U388 ( .A0(n437), .A1(n362), .B0(n363), .B1(n438), .Y(n141) );
  XOR2X1 U389 ( .A(b[3]), .B(n354), .Y(n437) );
  OAI22XL U390 ( .A0(n438), .A1(n362), .B0(n363), .B1(n389), .Y(n140) );
  XOR2X1 U391 ( .A(b[5]), .B(n354), .Y(n389) );
  XOR2X1 U392 ( .A(b[4]), .B(n354), .Y(n438) );
  OAI22XL U393 ( .A0(n392), .A1(n362), .B0(n363), .B1(n439), .Y(n139) );
  XOR2X1 U394 ( .A(b[6]), .B(n354), .Y(n392) );
  OAI22XL U395 ( .A0(n439), .A1(n362), .B0(n363), .B1(n440), .Y(n138) );
  XOR2X1 U396 ( .A(b[7]), .B(n354), .Y(n439) );
  OAI22XL U397 ( .A0(n440), .A1(n362), .B0(n363), .B1(n398), .Y(n137) );
  XOR2X1 U398 ( .A(b[9]), .B(n354), .Y(n398) );
  XOR2X1 U399 ( .A(b[8]), .B(n354), .Y(n440) );
  AO21X1 U400 ( .A0(n362), .A1(n363), .B0(n397), .Y(n136) );
  XOR2X1 U401 ( .A(b[10]), .B(n354), .Y(n397) );
  NOR2X1 U402 ( .A(n365), .B(n367), .Y(n135) );
  OAI22XL U403 ( .A0(n441), .A1(n364), .B0(n365), .B1(n442), .Y(n134) );
  XOR2X1 U404 ( .A(n355), .B(n366), .Y(n441) );
  OAI22XL U405 ( .A0(n442), .A1(n364), .B0(n365), .B1(n443), .Y(n133) );
  XOR2X1 U406 ( .A(b[1]), .B(n355), .Y(n442) );
  OAI22XL U407 ( .A0(n443), .A1(n364), .B0(n365), .B1(n444), .Y(n132) );
  XOR2X1 U408 ( .A(b[2]), .B(n355), .Y(n443) );
  OAI22XL U409 ( .A0(n444), .A1(n364), .B0(n365), .B1(n445), .Y(n131) );
  XOR2X1 U410 ( .A(b[3]), .B(n355), .Y(n444) );
  OAI22XL U411 ( .A0(n445), .A1(n364), .B0(n365), .B1(n446), .Y(n130) );
  XOR2X1 U412 ( .A(b[4]), .B(n355), .Y(n445) );
  OAI22XL U413 ( .A0(n446), .A1(n364), .B0(n365), .B1(n447), .Y(n129) );
  XOR2X1 U414 ( .A(b[5]), .B(n355), .Y(n446) );
  OAI22XL U415 ( .A0(n447), .A1(n364), .B0(n365), .B1(n448), .Y(n128) );
  XOR2X1 U416 ( .A(b[6]), .B(n355), .Y(n447) );
  OAI22XL U417 ( .A0(n448), .A1(n364), .B0(n365), .B1(n449), .Y(n127) );
  XOR2X1 U418 ( .A(b[7]), .B(n355), .Y(n448) );
  OAI22XL U419 ( .A0(n449), .A1(n364), .B0(n365), .B1(n401), .Y(n126) );
  XOR2X1 U420 ( .A(b[9]), .B(n355), .Y(n401) );
  XOR2X1 U421 ( .A(b[8]), .B(n355), .Y(n449) );
  AO21X1 U422 ( .A0(n364), .A1(n365), .B0(n400), .Y(n125) );
  XOR2X1 U423 ( .A(b[10]), .B(n355), .Y(n400) );
  NOR2X1 U424 ( .A(n356), .B(n367), .Y(n124) );
  NOR2X1 U425 ( .A(n356), .B(n450), .Y(n122) );
  XOR2X1 U426 ( .A(b[2]), .B(n379), .Y(n450) );
  NOR2X1 U427 ( .A(n356), .B(n451), .Y(n121) );
  XOR2X1 U428 ( .A(b[3]), .B(n379), .Y(n451) );
  NOR2X1 U429 ( .A(n356), .B(n452), .Y(n120) );
  XOR2X1 U430 ( .A(b[4]), .B(n379), .Y(n452) );
  NOR2X1 U431 ( .A(n356), .B(n453), .Y(n119) );
  XOR2X1 U432 ( .A(b[5]), .B(n379), .Y(n453) );
  NOR2X1 U433 ( .A(n356), .B(n454), .Y(n118) );
  XOR2X1 U434 ( .A(b[6]), .B(n379), .Y(n454) );
  NOR2X1 U435 ( .A(n356), .B(n455), .Y(n117) );
  XOR2X1 U436 ( .A(b[7]), .B(n379), .Y(n455) );
  NOR2X1 U437 ( .A(n356), .B(n456), .Y(n116) );
  XOR2X1 U438 ( .A(b[8]), .B(n379), .Y(n456) );
  NOR2X1 U439 ( .A(n356), .B(n457), .Y(n115) );
  XOR2X1 U440 ( .A(b[9]), .B(n379), .Y(n457) );
  OAI21XL U441 ( .A0(n366), .A1(n373), .B0(n357), .Y(n113) );
  OAI32X1 U442 ( .A0(n352), .A1(n366), .A2(n359), .B0(n352), .B1(n358), .Y(
        n112) );
  XOR2X1 U443 ( .A(a[3]), .B(a[2]), .Y(n458) );
  OAI32X1 U444 ( .A0(n353), .A1(n366), .A2(n361), .B0(n353), .B1(n360), .Y(
        n111) );
  XOR2X1 U445 ( .A(a[5]), .B(a[4]), .Y(n459) );
  OAI32X1 U446 ( .A0(n354), .A1(n366), .A2(n363), .B0(n354), .B1(n362), .Y(
        n110) );
  XOR2X1 U447 ( .A(a[7]), .B(a[6]), .Y(n460) );
  OAI32X1 U448 ( .A0(n355), .A1(n366), .A2(n365), .B0(n355), .B1(n364), .Y(
        n109) );
  XOR2X1 U449 ( .A(a[9]), .B(a[8]), .Y(n461) );
  NOR3X1 U450 ( .A(n379), .B(n366), .C(n356), .Y(n108) );
  XNOR2X1 U451 ( .A(n379), .B(a[9]), .Y(n386) );
endmodule


module READ_DW01_sub_21 ( A, B, CI, DIFF, CO );
  input [21:0] A;
  input [21:0] B;
  output [21:0] DIFF;
  input CI;
  output CO;
  wire   \carry[21] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;

  XOR3X1 U2_21 ( .A(A[21]), .B(n1), .C(\carry[21] ), .Y(DIFF[21]) );
  CLKINVX1 U1 ( .A(A[11]), .Y(n6) );
  CLKINVX1 U2 ( .A(A[13]), .Y(n5) );
  CLKINVX1 U3 ( .A(A[15]), .Y(n4) );
  CLKINVX1 U4 ( .A(A[17]), .Y(n3) );
  CLKINVX1 U5 ( .A(A[7]), .Y(n8) );
  CLKINVX1 U6 ( .A(A[9]), .Y(n7) );
  CLKINVX1 U7 ( .A(A[5]), .Y(n9) );
  CLKINVX1 U8 ( .A(A[19]), .Y(n2) );
  CLKINVX1 U9 ( .A(B[21]), .Y(n1) );
  CLKINVX1 U10 ( .A(A[3]), .Y(n10) );
  CLKINVX1 U11 ( .A(A[1]), .Y(n11) );
  OAI2BB2XL U12 ( .B0(B[20]), .B1(n12), .A0N(n13), .A1N(A[20]), .Y(\carry[21] ) );
  NOR2X1 U13 ( .A(A[20]), .B(n13), .Y(n12) );
  OAI22XL U14 ( .A0(n14), .A1(n2), .B0(B[19]), .B1(n15), .Y(n13) );
  AND2X1 U15 ( .A(n14), .B(n2), .Y(n15) );
  AOI2BB2X1 U16 ( .B0(n16), .B1(A[18]), .A0N(B[18]), .A1N(n17), .Y(n14) );
  NOR2X1 U17 ( .A(A[18]), .B(n16), .Y(n17) );
  OAI22XL U18 ( .A0(n18), .A1(n3), .B0(B[17]), .B1(n19), .Y(n16) );
  AND2X1 U19 ( .A(n18), .B(n3), .Y(n19) );
  AOI2BB2X1 U20 ( .B0(n20), .B1(A[16]), .A0N(B[16]), .A1N(n21), .Y(n18) );
  NOR2X1 U21 ( .A(A[16]), .B(n20), .Y(n21) );
  OAI22XL U22 ( .A0(n22), .A1(n4), .B0(B[15]), .B1(n23), .Y(n20) );
  AND2X1 U23 ( .A(n22), .B(n4), .Y(n23) );
  AOI2BB2X1 U24 ( .B0(n24), .B1(A[14]), .A0N(B[14]), .A1N(n25), .Y(n22) );
  NOR2X1 U25 ( .A(A[14]), .B(n24), .Y(n25) );
  OAI22XL U26 ( .A0(n26), .A1(n5), .B0(B[13]), .B1(n27), .Y(n24) );
  AND2X1 U27 ( .A(n26), .B(n5), .Y(n27) );
  AOI2BB2X1 U28 ( .B0(n28), .B1(A[12]), .A0N(B[12]), .A1N(n29), .Y(n26) );
  NOR2X1 U29 ( .A(A[12]), .B(n28), .Y(n29) );
  OAI22XL U30 ( .A0(n30), .A1(n6), .B0(B[11]), .B1(n31), .Y(n28) );
  AND2X1 U31 ( .A(n30), .B(n6), .Y(n31) );
  AOI2BB2X1 U32 ( .B0(n32), .B1(A[10]), .A0N(B[10]), .A1N(n33), .Y(n30) );
  NOR2X1 U33 ( .A(A[10]), .B(n32), .Y(n33) );
  OAI22XL U34 ( .A0(n34), .A1(n7), .B0(B[9]), .B1(n35), .Y(n32) );
  AND2X1 U35 ( .A(n34), .B(n7), .Y(n35) );
  AOI2BB2X1 U36 ( .B0(n36), .B1(A[8]), .A0N(B[8]), .A1N(n37), .Y(n34) );
  NOR2X1 U37 ( .A(A[8]), .B(n36), .Y(n37) );
  OAI22XL U38 ( .A0(n38), .A1(n8), .B0(B[7]), .B1(n39), .Y(n36) );
  AND2X1 U39 ( .A(n38), .B(n8), .Y(n39) );
  AOI2BB2X1 U40 ( .B0(n40), .B1(A[6]), .A0N(B[6]), .A1N(n41), .Y(n38) );
  NOR2X1 U41 ( .A(A[6]), .B(n40), .Y(n41) );
  OAI22XL U42 ( .A0(n42), .A1(n9), .B0(B[5]), .B1(n43), .Y(n40) );
  AND2X1 U43 ( .A(n42), .B(n9), .Y(n43) );
  AOI2BB2X1 U44 ( .B0(n44), .B1(A[4]), .A0N(B[4]), .A1N(n45), .Y(n42) );
  NOR2X1 U45 ( .A(A[4]), .B(n44), .Y(n45) );
  OAI22XL U46 ( .A0(n46), .A1(n10), .B0(B[3]), .B1(n47), .Y(n44) );
  AND2X1 U47 ( .A(n46), .B(n10), .Y(n47) );
  AOI2BB2X1 U48 ( .B0(n48), .B1(A[2]), .A0N(B[2]), .A1N(n49), .Y(n46) );
  NOR2X1 U49 ( .A(A[2]), .B(n48), .Y(n49) );
  OAI22XL U50 ( .A0(n50), .A1(n11), .B0(B[1]), .B1(n51), .Y(n48) );
  AND2X1 U51 ( .A(n50), .B(n11), .Y(n51) );
  NOR2BX1 U52 ( .AN(B[0]), .B(A[0]), .Y(n50) );
endmodule


module READ ( clk, reset, cur_state, in_X, in_Y, in_R, read_done, cross_done, 
        hexarea_done, heptarea_done, is_inside );
  input [2:0] cur_state;
  input [9:0] in_X;
  input [9:0] in_Y;
  input [10:0] in_R;
  input clk, reset;
  output read_done, cross_done, hexarea_done, heptarea_done, is_inside;
  wire   N673, N674, \reach_cnt[4][2] , \reach_cnt[4][1] , \reach_cnt[4][0] ,
         \reach_cnt[3][2] , \reach_cnt[3][1] , \reach_cnt[3][0] ,
         \reach_cnt[2][2] , \reach_cnt[2][1] , \reach_cnt[2][0] ,
         \reach_cnt[1][2] , \reach_cnt[1][1] , \reach_cnt[1][0] ,
         \reach_cnt[0][2] , \reach_cnt[0][1] , \reach_cnt[0][0] , \Y[5][8] ,
         \Y[5][7] , \Y[5][6] , \Y[4][8] , \Y[4][7] , \Y[3][9] , \Y[3][2] ,
         \Y[3][0] , \Y[1][9] , \Y[1][8] , \Y[0][9] , \X[5][7] , \X[5][6] ,
         \X[4][9] , \X[4][7] , \X[3][9] , \X[1][8] , \X[0][9] , \X[0][0] ,
         \vecX[3][10] , \vecX[3][9] , \vecX[3][8] , \vecX[3][7] , \vecX[3][6] ,
         \vecX[3][5] , \vecX[3][4] , \vecX[3][3] , \vecX[3][2] , \vecX[3][1] ,
         \vecX[3][0] , \vecX[2][10] , \vecX[2][9] , \vecX[2][8] , \vecX[2][7] ,
         \vecX[2][6] , \vecX[2][5] , \vecX[2][4] , \vecX[2][3] , \vecX[2][2] ,
         \vecX[2][1] , \vecX[2][0] , \vecX[1][10] , \vecX[1][9] , \vecX[1][8] ,
         \vecX[1][7] , \vecX[1][6] , \vecX[1][5] , \vecX[1][4] , \vecX[1][3] ,
         \vecX[1][2] , \vecX[1][1] , \vecX[1][0] , \vecY[3][10] , \vecY[3][9] ,
         \vecY[3][8] , \vecY[3][7] , \vecY[3][6] , \vecY[3][5] , \vecY[3][4] ,
         \vecY[3][3] , \vecY[3][2] , \vecY[3][1] , \vecY[3][0] , \vecY[2][10] ,
         \vecY[2][9] , \vecY[2][8] , \vecY[2][7] , \vecY[2][6] , \vecY[2][5] ,
         \vecY[2][4] , \vecY[2][3] , \vecY[2][2] , \vecY[2][1] , \vecY[2][0] ,
         \vecY[1][10] , \vecY[1][9] , \vecY[1][8] , \vecY[1][7] , \vecY[1][6] ,
         \vecY[1][5] , \vecY[1][4] , \vecY[1][3] , \vecY[1][2] , \vecY[1][1] ,
         \vecY[1][0] , N2045, N2046, N2047, N2048, N2049, N2050, N2051, N2052,
         N2053, N2054, N2055, N2056, N2057, N2058, N2059, N2060, N2061, N2062,
         N2063, N2064, N2065, N2066, N2067, N2068, N2069, N2070, N2071, N2072,
         N2073, N2074, N2075, N2076, N2077, N2078, N2079, N2080, N2081, N2082,
         N2083, N2084, N2085, N2086, N2087, N2088, N2089, N2090, N2091, N2092,
         N2093, N2094, N2095, N2096, N2097, N2098, N2099, N2100, N2101, N2102,
         N2103, N2104, N2105, N2106, N2107, N2108, N2109, N2110, N2111, N2112,
         N2113, N2114, N2115, N2116, N2117, N2118, N2119, N2120, N2121, N2122,
         N2123, N2124, N2125, N2126, N2127, N2128, N2129, N2130, N2131, N2132,
         N2133, N2134, N2135, N2136, N2137, N2138, N2139, N2140, N2141, N2142,
         N2143, N2144, N2145, N2146, N2147, N2148, N2149, N2150, N2151, N2152,
         N2153, N2154, N2178, N2179, N2180, N2181, N2182, N2183, N2184, N2185,
         N2186, N2187, N2188, N2193, N2194, N2195, N2196, N2197, N2198, N2199,
         N2200, N2201, N2202, N2203, N2208, N2209, N2210, N2211, N2212, N2213,
         N2214, N2215, N2216, N2217, N2218, N2223, N2224, N2225, N2226, N2227,
         N2228, N2229, N2230, N2231, N2232, N2233, N2237, N2285, N2286, N2287,
         N2288, N2289, N2290, N2300, N2301, N2302, N2303, N2304, N2305, N2306,
         N2307, N2308, N2309, N2316, N2317, N2318, N2319, N2320, N2321, N2322,
         N2323, N2324, N2325, N2332, N2333, N2334, N2335, N2336, N2337, N2338,
         N2339, N2340, N2341, N2348, N2349, N2350, N2351, N2352, N2353, N2354,
         N2355, N2356, N2357, N2418, N2419, N2420, N2421, N2422, N2423, N2424,
         N2425, N2426, N2427, N2428, N2429, N2430, N2431, N2432, N2433, N2434,
         N2435, N2436, N2437, N2464, N2465, N2466, N2467, N2468, N2469, N2470,
         N2471, N2472, N2473, N2480, N2481, N2482, N2483, N2484, N2485, N2486,
         N2487, N2488, N2489, N2493, N2494, N2495, N2496, N2497, N2498, N2499,
         N2500, N2501, N2502, N2503, N2504, N2505, N2506, N2507, N2508, N2509,
         N2510, N2511, N2512, N2513, N2514, N2524, N2525, N2526, N2527, N2528,
         N2529, N2530, N2531, N2532, N2533, N2534, N2535, N2536, N2537, N2538,
         N2539, N2540, N2541, N2542, N2543, N2544, N2554, N2555, N2556, N2557,
         N2558, N2559, N2560, N2561, N2562, N2563, N2564, N2565, N2566, N2567,
         N2568, N2569, N2570, N2571, N2572, N2573, N2574, N2631, N2633, N2634,
         N2635, N2636, N2637, N2638, N2639, N2640, N2641, N2642, N2643, N2644,
         N2645, N2646, N2647, N2648, N2649, N2650, N2651, N2652, N2653, N2654,
         N2655, N2656, N2657, N2659, N2660, N2661, N2662, N2663, N2664, N2665,
         N2666, N2667, N2668, N2669, N2670, N2671, N2672, N2673, N2674, N2675,
         N2676, N2677, N2678, N2679, N2680, N2681, N2682, N2683, N2685, N2686,
         N2687, N2688, N2689, N2690, N2691, N2692, N2693, N2694, N2695, N2696,
         N2697, N2698, N2699, N2700, N2701, N2702, N2703, N2704, N2705, N2706,
         N2707, N2708, N2729, N2730, N2731, N2732, N2733, N2734, N2735, N2736,
         N2737, N2738, N2739, N2740, N2741, N2742, N2743, N2744, N2745, N2746,
         N2747, N2748, n106, n107, n109, n111, n115, n118, n119, n122, n123,
         n126, n127, n130, n131, n134, n135, n138, n139, n142, n143, n146,
         n147, n150, n151, n154, n156, n157, n160, n161, n164, n165, n166,
         n167, n168, n169, n171, n172, n174, n175, n177, n178, n180, n181,
         n183, n184, n186, n187, n189, n190, n192, n193, n195, n196, n201,
         n204, n207, n210, n211, n212, n213, n214, n215, n218, n219, n222,
         n223, n224, n226, n228, n229, n230, n231, n232, n233, n235, n236,
         n238, n239, n240, n243, n244, n247, n248, n251, n252, n255, n256,
         n259, n260, n263, n264, n267, n268, n271, n272, n276, n277, n278,
         n279, n280, n281, n283, n284, n285, n287, n288, n290, n291, n293,
         n294, n296, n297, n299, n300, n302, n303, n305, n306, n308, n309,
         n311, n312, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n406, n407, n409, n410, n411, n412, n413, n415, n416,
         n417, n419, n420, n421, n423, n424, n425, n427, n428, n429, n431,
         n432, n433, n435, n436, n437, n439, n440, n441, n443, n444, n445,
         n447, n448, n449, n451, n452, n453, n454, n458, n459, n463, n464,
         n468, n469, n473, n474, n478, n479, n483, n484, n488, n489, n493,
         n494, n498, n499, n501, n502, n504, n505, n507, n508, n510, n511,
         n513, n514, n516, n517, n519, n520, n522, n523, n525, n526, n530,
         n531, n533, n534, n536, n537, n539, n540, n542, n543, n545, n546,
         n548, n549, n551, n552, n554, n555, n557, n558, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n606, n607, n608, n611,
         n612, n613, n616, n617, n618, n621, n622, n623, n626, n627, n628,
         n631, n632, n633, n636, n637, n638, n641, n642, n643, n646, n647,
         n648, n651, n652, n653, n654, n658, n659, n663, n664, n668, n669,
         n673, n674, n678, n679, n683, n684, n688, n689, n693, n694, n698,
         n699, n701, n702, n704, n705, n707, n708, n710, n711, n713, n714,
         n716, n717, n719, n720, n722, n723, n725, n726, n729, n730, n731,
         n733, n735, n737, n738, n739, n741, n742, n743, n752, n753, n755,
         n756, n758, n759, n761, n762, n764, n765, n767, n768, n770, n771,
         n773, n774, n776, n777, n779, n780, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n817, n818, n819, n820, n822, n823, n824,
         n826, n827, n829, n830, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n860, n861,
         n862, n863, n864, n865, n868, n869, n870, n873, n874, n875, n878,
         n879, n880, n883, n884, n885, n888, n889, n890, n893, n894, n895,
         n898, n899, n900, n903, n904, n905, n908, n909, n910, n912, n913,
         n914, n915, n917, n918, n919, n921, n923, n925, n926, n927, n928,
         n930, n932, n933, n934, n935, n937, n940, n941, n943, n945, n947,
         n949, n952, n953, n954, n955, n956, n957, n960, n964, n965, n966,
         n967, n968, n969, n970, n972, n975, n976, n977, n978, n979, n980,
         n984, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1071, n1072, n1073, n1074, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1096, n1097, n1099, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1164, n1165, n1167, n1168, n1169,
         n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179,
         n1181, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191,
         n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201,
         n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211,
         n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221,
         n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231,
         n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241,
         n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251,
         n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261,
         n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271,
         n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281,
         n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291,
         n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301,
         n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311,
         n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321,
         n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331,
         n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341,
         n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351,
         n1352, n1353, n1354, n1355, n1357, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534,
         n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544,
         n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554,
         n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574,
         n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
         n1585, n1586, n1587, n1588, n1589, n1590, n1592, n1593, n1594, n1595,
         n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605,
         n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615,
         n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625,
         n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635,
         n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645,
         n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655,
         n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665,
         n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675,
         n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685,
         n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695,
         n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705,
         n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715,
         n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725,
         n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735,
         n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745,
         n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755,
         n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765,
         n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775,
         n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785,
         n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795,
         n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805,
         n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815,
         n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825,
         n1826, N2728, N2727, N2726, N2725, N2724, N2723, N2722, N2721, N2720,
         N2719, N2718, N2717, N2716, N2715, N2714, N2713, N2712, N2711, N2710,
         N2709, \sqr_y[9] , \sqr_y[8] , \sqr_y[7] , \sqr_y[6] , \sqr_y[5] ,
         \sqr_y[4] , \sqr_y[3] , \sqr_y[2] , \sqr_y[19] , \sqr_y[18] ,
         \sqr_y[17] , \sqr_y[16] , \sqr_y[15] , \sqr_y[14] , \sqr_y[13] ,
         \sqr_y[12] , \sqr_y[11] , \sqr_y[10] , \sqr_y[0] , \sqr_x[9] ,
         \sqr_x[8] , \sqr_x[7] , \sqr_x[6] , \sqr_x[5] , \sqr_x[4] ,
         \sqr_x[3] , \sqr_x[2] , \sqr_x[19] , \sqr_x[18] , \sqr_x[17] ,
         \sqr_x[16] , \sqr_x[15] , \sqr_x[14] , \sqr_x[13] , \sqr_x[12] ,
         \sqr_x[11] , \sqr_x[10] , \sqr_x[0] , N2601, N2600, N2599, N2598,
         N2597, N2596, N2595, N2594, N2593, N2592, N2591, N2590, N2417, N2416,
         N2415, N2414, N2413, N2412, N2411, N2410, N2409, N2408, N2407, N2406,
         N2405, N2404, N2403, N2402, N2401, N2400, N2399, N2398, N2397, N2396,
         N2395, N2394, N2393, N2392, N2391, N2390, N2389, N2388, N2387, N2386,
         N2385, N2384, N2383, N2382, N2381, N2380, N2379, N2378, N2377, N2376,
         N2375, N2374, N2373, N2372, N2371, N2370, N2369, N2368, N2367, N2366,
         N2365, N2364, N2363, N2362, N2361, N2360, N2359, N2358,
         \front_res[9] , \front_res[8] , \front_res[7] , \front_res[6] ,
         \front_res[5] , \front_res[4] , \front_res[3] , \front_res[2] ,
         \front_res[21] , \front_res[20] , \front_res[1] , \front_res[19] ,
         \front_res[18] , \front_res[17] , \front_res[16] , \front_res[15] ,
         \front_res[14] , \front_res[13] , \front_res[12] , \front_res[11] ,
         \front_res[10] , \front_res[0] , \back_res[9] , \back_res[8] ,
         \back_res[7] , \back_res[6] , \back_res[5] , \back_res[4] ,
         \back_res[3] , \back_res[2] , \back_res[21] , \back_res[20] ,
         \back_res[1] , \back_res[19] , \back_res[18] , \back_res[17] ,
         \back_res[16] , \back_res[15] , \back_res[14] , \back_res[13] ,
         \back_res[12] , \back_res[11] , \back_res[10] , \back_res[0] , n5, n6,
         n9, n10, n13, n14, n19, n20, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n108,
         n110, n112, n113, n114, n116, n117, n120, n121, n124, n125, n128,
         n129, n132, n133, n136, n137, n140, n141, n144, n145, n148, n149,
         n152, n153, n155, n158, n159, n162, n163, n170, n173, n176, n179,
         n182, n185, n188, n191, n194, n197, n198, n199, n200, n202, n203,
         n205, n206, n208, n209, n216, n217, n220, n221, n225, n227, n234,
         n237, n241, n242, n245, n246, n249, n250, n253, n254, n257, n258,
         n261, n262, n265, n266, n269, n270, n273, n274, n275, n282, n286,
         n289, n292, n295, n298, n301, n304, n307, n310, n313, n314, n315,
         n371, n405, n408, n414, n418, n422, n426, n430, n434, n438, n442,
         n446, n450, n455, n456, n457, n460, n461, n462, n465, n466, n467,
         n470, n471, n472, n475, n476, n477, n480, n481, n482, n485, n486,
         n487, n490, n491, n492, n495, n496, n497, n500, n503, n506, n509,
         n512, n515, n518, n521, n524, n527, n528, n529, n532, n535, n538,
         n541, n544, n547, n550, n553, n556, n559, n580, n604, n605, n609,
         n610, n614, n615, n619, n620, n624, n625, n629, n630, n634, n635,
         n639, n640, n644, n645, n649, n650, n655, n656, n657, n660, n661,
         n662, n665, n666, n667, n670, n671, n672, n675, n676, n677, n680,
         n681, n682, n685, n686, n687, n690, n691, n692, n695, n696, n697,
         n700, n703, n706, n709, n712, n715, n718, n721, n724, n727, n728,
         n732, n734, n736, n740, n744, n745, n746, n747, n748, n749, n750,
         n751, n754, n757, n760, n763, n766, n769, n772, n775, n778, n781,
         n793, n794, n795, n816, n821, n828, n831, n859, n866, n867, n871,
         n872, n876, n877, n881, n882, n886, n887, n891, n892, n896, n897,
         n901, n902, n906, n907, n911, n916, n920, n922, n924, n929, n931,
         n936, n938, n939, n942, n944, n946, n948, n950, n951, n958, n959,
         n961, n962, n963, n971, n973, n974, n981, n982, n983, n985, n986,
         n987, n1070, n1075, n1076, n1095, n1098, n1100, n1101, n1102, n1141,
         n1162, n1163, n1166, n1180, n1182, n1356, n1358, n1359, n1591, n1827,
         n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837,
         n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847,
         n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857,
         n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867,
         n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877,
         n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887,
         n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897,
         n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907,
         n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917,
         n1918, n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927,
         n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937,
         n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947,
         n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957,
         n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967,
         n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977,
         n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987,
         n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997,
         n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007,
         n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017,
         n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027,
         n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037,
         n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047,
         n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057,
         n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067,
         n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077,
         n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087,
         n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097,
         n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107,
         n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117,
         n2118, n2119, n2120, n2121, n2122;
  wire   [2:0] rd_cnt;
  wire   [2:0] outer_cnt;
  wire   [19:0] hex_area;
  wire   [10:0] diff_x;
  wire   [10:0] diff_y;
  wire   [19:0] sqr_sum;
  wire   [9:0] root;
  wire   [2:0] side_cnt;
  wire   [10:0] side_length;
  wire   [10:0] side_A;
  wire   [10:0] side_B;
  wire   [10:0] side_sum;
  wire   [11:0] res1;
  wire   [11:0] res2;
  wire   [11:0] res3;
  wire   [22:0] res4;
  wire   [23:0] res5;
  wire   [11:0] root1;
  wire   [11:0] root2;
  wire   [19:0] hept_area;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31;

  OAI211X2 U76 ( .A0(n1385), .A1(n155), .B0(n168), .C0(n169), .Y(side_A[8]) );
  OAI211X2 U79 ( .A0(n1386), .A1(n155), .B0(n171), .C0(n172), .Y(side_A[7]) );
  OAI211X2 U85 ( .A0(n1388), .A1(n155), .B0(n177), .C0(n178), .Y(side_A[5]) );
  OAI211X2 U1381 ( .A0(n1525), .A1(n241), .B0(n1077), .C0(n1078), .Y(N2356) );
  OAI211X2 U1385 ( .A0(n1524), .A1(n237), .B0(n1079), .C0(n1080), .Y(N2355) );
  OAI211X2 U1389 ( .A0(n1523), .A1(n237), .B0(n1081), .C0(n1082), .Y(N2354) );
  OAI211X2 U1393 ( .A0(n1522), .A1(n241), .B0(n1083), .C0(n1084), .Y(N2353) );
  OAI211X2 U1397 ( .A0(n1521), .A1(n241), .B0(n1085), .C0(n1086), .Y(N2352) );
  OAI211X2 U1401 ( .A0(n1520), .A1(n237), .B0(n1087), .C0(n1088), .Y(N2351) );
  OAI211X2 U1405 ( .A0(n1519), .A1(n237), .B0(n1089), .C0(n1090), .Y(N2350) );
  OAI211X2 U1409 ( .A0(n1518), .A1(n241), .B0(n1091), .C0(n1092), .Y(N2349) );
  OAI211X2 U1413 ( .A0(n1517), .A1(n241), .B0(n1093), .C0(n1094), .Y(N2348) );
  OAI211X2 U1462 ( .A0(n1477), .A1(n270), .B0(n1119), .C0(n1120), .Y(N2332) );
  OAI211X2 U1474 ( .A0(n1545), .A1(n273), .B0(n1123), .C0(n1124), .Y(N2324) );
  OAI211X2 U1481 ( .A0(n1544), .A1(n273), .B0(n1125), .C0(n1126), .Y(N2323) );
  OAI211X2 U1488 ( .A0(n1543), .A1(n270), .B0(n1127), .C0(n1128), .Y(N2322) );
  OAI211X2 U1495 ( .A0(n1542), .A1(n270), .B0(n1129), .C0(n1130), .Y(N2321) );
  OAI211X2 U1502 ( .A0(n1541), .A1(n270), .B0(n1131), .C0(n1132), .Y(N2320) );
  OAI211X2 U1509 ( .A0(n1540), .A1(n273), .B0(n1133), .C0(n1134), .Y(N2319) );
  OAI211X2 U1516 ( .A0(n1539), .A1(n270), .B0(n1135), .C0(n1136), .Y(N2318) );
  OAI211X2 U1523 ( .A0(n1538), .A1(n270), .B0(n1137), .C0(n1138), .Y(N2317) );
  OAI211X2 U1530 ( .A0(n1537), .A1(n270), .B0(n1139), .C0(n1140), .Y(N2316) );
  OAI211X2 U1594 ( .A0(n1457), .A1(n237), .B0(n1160), .C0(n1161), .Y(N2300) );
  OAI221X2 U1631 ( .A0(n1589), .A1(n492), .B0(n1578), .B1(n422), .C0(n1170), 
        .Y(N2232) );
  OAI221X2 U1633 ( .A0(n1588), .A1(n492), .B0(n1577), .B1(n422), .C0(n1171), 
        .Y(N2231) );
  OAI221X2 U1635 ( .A0(n1587), .A1(n492), .B0(n1576), .B1(n422), .C0(n1172), 
        .Y(N2230) );
  OAI221X2 U1637 ( .A0(n1586), .A1(n492), .B0(n1575), .B1(n422), .C0(n1173), 
        .Y(N2229) );
  OAI221X2 U1639 ( .A0(n1585), .A1(n492), .B0(n1574), .B1(n422), .C0(n1174), 
        .Y(N2228) );
  OAI221X2 U1641 ( .A0(n1584), .A1(n492), .B0(n1573), .B1(n422), .C0(n1175), 
        .Y(N2227) );
  OAI221X2 U1643 ( .A0(n1583), .A1(n492), .B0(n1572), .B1(n422), .C0(n1176), 
        .Y(N2226) );
  OAI221X2 U1645 ( .A0(n1582), .A1(n492), .B0(n1571), .B1(n422), .C0(n1177), 
        .Y(N2225) );
  OAI221X2 U1647 ( .A0(n1581), .A1(n492), .B0(n1570), .B1(n422), .C0(n1178), 
        .Y(N2224) );
  OAI221X2 U1649 ( .A0(n1580), .A1(n495), .B0(n1569), .B1(n422), .C0(n1179), 
        .Y(N2223) );
  OAI221X2 U1675 ( .A0(n1589), .A1(n234), .B0(n1578), .B1(n490), .C0(n1194), 
        .Y(N2202) );
  OAI221X2 U1677 ( .A0(n1588), .A1(n234), .B0(n1577), .B1(n490), .C0(n1195), 
        .Y(N2201) );
  OAI221X2 U1679 ( .A0(n1587), .A1(n234), .B0(n1576), .B1(n490), .C0(n1196), 
        .Y(N2200) );
  OAI221X2 U1681 ( .A0(n1586), .A1(n234), .B0(n1575), .B1(n490), .C0(n1197), 
        .Y(N2199) );
  OAI221X2 U1683 ( .A0(n1585), .A1(n227), .B0(n1574), .B1(n490), .C0(n1198), 
        .Y(N2198) );
  OAI221X2 U1685 ( .A0(n1584), .A1(n234), .B0(n1573), .B1(n490), .C0(n1199), 
        .Y(N2197) );
  OAI221X2 U1687 ( .A0(n1583), .A1(n227), .B0(n1572), .B1(n490), .C0(n1200), 
        .Y(N2196) );
  OAI221X2 U1689 ( .A0(n1582), .A1(n234), .B0(n1571), .B1(n490), .C0(n1201), 
        .Y(N2195) );
  OAI221X2 U1691 ( .A0(n1581), .A1(n227), .B0(n1570), .B1(n490), .C0(n1202), 
        .Y(N2194) );
  OAI221X2 U1693 ( .A0(n1580), .A1(n234), .B0(n1569), .B1(n490), .C0(n1203), 
        .Y(N2193) );
  READ_DW_sqrt_0 U1 ( .a(sqr_sum), .root(root) );
  READ_DW_cmp_0 gt_452 ( .A({1'b0, hex_area[19:18], n81, hex_area[16:13], n83, 
        hex_area[11:9], n79, n68, hex_area[6], n82, n80, hex_area[3], n78, 
        hex_area[1]}), .B({hept_area[19:17], n75, hept_area[15:14], n76, 
        hept_area[12:10], n77, hept_area[8:3], n74, hept_area[1:0]}), .TC(1'b0), .GE_LT(1'b0), .GE_GT_EQ(1'b1), .GE_LT_GT_LE(is_inside) );
  READ_DW_sqrt_1 U3 ( .a(res5), .root(root2) );
  READ_DW_sqrt_2 U2 ( .a({1'b0, res4[22:11], n73, res4[9:0]}), .root(root1) );
  READ_DW01_sub_0 sub_426_2 ( .A({1'b0, side_B[10:6], n48, n129, side_B[3:1], 
        n34}), .B({1'b0, n217, n816, n216, n795, n209, n46, n41, n793, n140, 
        n33, n133}), .CI(1'b0), .DIFF({N2708, N2707, N2706, N2705, N2704, 
        N2703, N2702, N2701, N2700, N2699, N2698, N2697}) );
  READ_DW01_sub_1 sub_426 ( .A({1'b0, n217, n816, n216, n145, n209, n47, n41, 
        n793, n13, n31, n136}), .B({1'b0, side_B[10:6], n48, n129, side_B[3:1], 
        n34}), .CI(1'b0), .DIFF({N2696, N2695, N2694, N2693, N2692, N2691, 
        N2690, N2689, N2688, N2687, N2686, N2685}) );
  READ_DW01_sub_2 sub_425_2 ( .A({1'b0, side_A}), .B({1'b0, n217, n816, n216, 
        n145, n209, n45, n42, n793, n10, n33, n133}), .CI(1'b0), .DIFF({N2682, 
        N2681, N2680, N2679, N2678, N2677, N2676, N2675, N2674, N2673, N2672, 
        N2671}) );
  READ_DW01_sub_3 sub_425 ( .A({1'b0, n217, n816, n216, n145, n209, n46, n43, 
        n793, n10, n32, n136}), .B({1'b0, side_A}), .CI(1'b0), .DIFF({N2670, 
        N2669, N2668, N2667, N2666, N2665, N2664, N2663, N2662, N2661, N2660, 
        N2659}) );
  READ_DW01_sub_4 sub_424_2 ( .A({1'b0, 1'b0, side_length[9:0]}), .B({1'b0, 
        n217, n816, n216, n145, n209, n46, n43, n793, n140, n31, n133}), .CI(
        1'b0), .DIFF({N2656, N2655, N2654, N2653, N2652, N2651, N2650, N2649, 
        N2648, N2647, N2646, N2645}) );
  READ_DW01_sub_5 sub_424 ( .A({1'b0, n217, n816, n216, n795, n209, n47, n41, 
        n793, n9, n32, n136}), .B({1'b0, 1'b0, side_length[9:0]}), .CI(1'b0), 
        .DIFF({N2644, N2643, N2642, N2641, N2640, N2639, N2638, N2637, N2636, 
        N2635, N2634, N2633}) );
  READ_DW01_sub_6 sub_369 ( .A({1'b0, N2554, N2555, N2556, N2557, N2558, N2559, 
        N2560, N2561, N2562, N2563}), .B({1'b0, N2480, N2481, N2482, N2483, 
        N2484, N2485, N2486, N2487, N2488, N2489}), .CI(1'b0), .DIFF({N2574, 
        N2573, N2572, N2571, N2570, N2569, N2568, N2567, N2566, N2565, N2564})
         );
  READ_DW01_sub_7 sub_365 ( .A({1'b0, \Y[0][9] , n1967, n1973, n98, n1985, 
        n1991, n1997, n2002, n2008, n55}), .B({1'b0, N2480, N2481, N2482, 
        N2483, N2484, N2485, N2486, N2487, N2488, N2489}), .CI(1'b0), .DIFF({
        N2514, N2513, N2512, N2511, N2510, N2509, N2508, N2507, N2506, N2505, 
        N2504}) );
  READ_DW01_sub_8 sub_368 ( .A({1'b0, N2524, N2525, N2526, N2527, N2528, N2529, 
        N2530, N2531, N2532, N2533}), .B({1'b0, N2464, N2465, N2466, N2467, 
        N2468, N2469, N2470, N2471, N2472, N2473}), .CI(1'b0), .DIFF({N2544, 
        N2543, N2542, N2541, N2540, N2539, N2538, N2537, N2536, N2535, N2534})
         );
  READ_DW01_sub_9 sub_364 ( .A({1'b0, \X[0][9] , n2024, n2030, n99, n2042, 
        n2048, n2054, n93, n91, n103}), .B({1'b0, N2464, N2465, N2466, N2467, 
        N2468, N2469, N2470, N2471, N2472, N2473}), .CI(1'b0), .DIFF({N2503, 
        N2502, N2501, N2500, N2499, N2498, N2497, N2496, N2495, N2494, N2493})
         );
  READ_DW01_sub_10 sub_234 ( .A({1'b0, n1957, \Y[5][8] , \Y[5][7] , \Y[5][6] , 
        n1980, n1986, n1992, n1998, n2003, n2009}), .B({1'b0, \Y[0][9] , n1967, 
        n1973, n1979, n1985, n1991, n1997, n2002, n2008, n55}), .CI(1'b0), 
        .DIFF({N2154, N2153, N2152, N2151, N2150, N2149, N2148, N2147, N2146, 
        N2145, N2144}) );
  READ_DW01_sub_11 sub_233 ( .A({1'b0, n1960, \Y[4][8] , \Y[4][7] , n1978, 
        n1984, n1990, n1996, n2001, n2007, n2013}), .B({1'b0, \Y[0][9] , n1967, 
        n1973, n1979, n1985, n1991, n1997, n2002, n2008, n101}), .CI(1'b0), 
        .DIFF({N2143, N2142, N2141, N2140, N2139, N2138, N2137, N2136, N2135, 
        N2134, N2133}) );
  READ_DW01_sub_12 sub_232 ( .A({1'b0, \Y[3][9] , n1965, n1971, n1977, n1983, 
        n1989, n1995, \Y[3][2] , n2006, \Y[3][0] }), .B({1'b0, \Y[0][9] , 
        n1967, n1973, n1979, n88, n86, n84, n92, n90, n55}), .CI(1'b0), .DIFF(
        {N2132, N2131, N2130, N2129, N2128, N2127, N2126, N2125, N2124, N2123, 
        N2122}) );
  READ_DW01_sub_13 sub_231 ( .A({1'b0, n1959, n1964, n1970, n1976, n1982, 
        n1988, n1994, n2000, n2005, n2011}), .B({1'b0, \Y[0][9] , n97, n94, 
        n1979, n1985, n1991, n1997, n2002, n2008, n100}), .CI(1'b0), .DIFF({
        N2121, N2120, N2119, N2118, N2117, N2116, N2115, N2114, N2113, N2112, 
        N2111}) );
  READ_DW01_sub_14 sub_230 ( .A({1'b0, \Y[1][9] , \Y[1][8] , n1969, n1975, 
        n1981, n1987, n1993, n1999, n2004, n2010}), .B({1'b0, \Y[0][9] , n97, 
        n94, n1979, n88, n86, n84, n92, n90, n101}), .CI(1'b0), .DIFF({N2110, 
        N2109, N2108, N2107, N2106, N2105, N2104, N2103, N2102, N2101, N2100})
         );
  READ_DW01_sub_15 sub_228 ( .A({1'b0, n2014, n2019, \X[5][7] , \X[5][6] , 
        n2037, n2043, n2049, n2055, n2061, n2067}), .B({1'b0, \X[0][9] , n2024, 
        n2030, n2036, n2042, n2048, n2054, n2060, n2066, \X[0][0] }), .CI(1'b0), .DIFF({N2099, N2098, N2097, N2096, N2095, N2094, N2093, N2092, N2091, N2090, 
        N2089}) );
  READ_DW01_sub_16 sub_227 ( .A({1'b0, \X[4][9] , n2023, \X[4][7] , n2035, 
        n2041, n2047, n2053, n2059, n2065, n2071}), .B({1'b0, \X[0][9] , n2024, 
        n2030, n2036, n2042, n2048, n2054, n2060, n2066, n103}), .CI(1'b0), 
        .DIFF({N2088, N2087, N2086, N2085, N2084, N2083, N2082, N2081, N2080, 
        N2079, N2078}) );
  READ_DW01_sub_17 sub_226 ( .A({1'b0, \X[3][9] , n2022, n2028, n2034, n2040, 
        n2046, n2052, n2058, n2064, n2070}), .B({1'b0, \X[0][9] , n2024, n2030, 
        n2036, n89, n87, n85, n2060, n2066, n104}), .CI(1'b0), .DIFF({N2077, 
        N2076, N2075, N2074, N2073, N2072, N2071, N2070, N2069, N2068, N2067})
         );
  READ_DW01_sub_18 sub_225 ( .A({1'b0, n2016, n2021, n2027, n2033, n2039, 
        n2045, n2051, n2057, n2063, n2069}), .B({1'b0, \X[0][9] , n96, n95, 
        n2036, n2042, n2048, n2054, n93, n91, n105}), .CI(1'b0), .DIFF({N2066, 
        N2065, N2064, N2063, N2062, N2061, N2060, N2059, N2058, N2057, N2056})
         );
  READ_DW01_sub_19 sub_224 ( .A({1'b0, n2015, \X[1][8] , n2026, n2032, n2038, 
        n2044, n2050, n2056, n2062, n2068}), .B({1'b0, \X[0][9] , n96, n95, 
        n2036, n89, n87, n85, n2060, n2066, n105}), .CI(1'b0), .DIFF({N2055, 
        N2054, N2053, N2052, N2051, N2050, N2049, N2048, N2047, N2046, N2045})
         );
  READ_DW_mult_uns_4 mult_441 ( .a(root1), .b(root2), .product({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, N2728, N2727, N2726, 
        N2725, N2724, N2723, N2722, N2721, N2720, N2719, N2718, N2717, N2716, 
        N2715, N2714, N2713, N2712, N2711, N2710, N2709}) );
  READ_DW01_add_4 add_441 ( .A(hept_area), .B({N2728, N2727, N2726, N2725, 
        N2724, N2723, N2722, N2721, N2720, N2719, N2718, N2717, N2716, N2715, 
        N2714, N2713, N2712, N2711, N2710, N2709}), .CI(1'b0), .SUM({N2748, 
        N2747, N2746, N2745, N2744, N2743, N2742, N2741, N2740, N2739, N2738, 
        N2737, N2736, N2735, N2734, N2733, N2732, N2731, N2730, N2729}) );
  READ_DW_mult_uns_2 mult_427 ( .a({n217, n816, n216, n145, n209, n45, n42, 
        n793, n10, n32, n133}), .b({res1[11:1], n132}), .product(res4) );
  READ_DW_mult_uns_3 mult_428 ( .a(res2), .b(res3), .product(res5) );
  READ_DW_mult_tc_3 mult_353 ( .a(diff_x), .b(diff_x), .product({
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, \sqr_x[19] , 
        \sqr_x[18] , \sqr_x[17] , \sqr_x[16] , \sqr_x[15] , \sqr_x[14] , 
        \sqr_x[13] , \sqr_x[12] , \sqr_x[11] , \sqr_x[10] , \sqr_x[9] , 
        \sqr_x[8] , \sqr_x[7] , \sqr_x[6] , \sqr_x[5] , \sqr_x[4] , \sqr_x[3] , 
        \sqr_x[2] , SYNOPSYS_UNCONNECTED__6, \sqr_x[0] }) );
  READ_DW_mult_tc_2 mult_354 ( .a(diff_y), .b(diff_y), .product({
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, \sqr_y[19] , 
        \sqr_y[18] , \sqr_y[17] , \sqr_y[16] , \sqr_y[15] , \sqr_y[14] , 
        \sqr_y[13] , \sqr_y[12] , \sqr_y[11] , \sqr_y[10] , \sqr_y[9] , 
        \sqr_y[8] , \sqr_y[7] , \sqr_y[6] , \sqr_y[5] , \sqr_y[4] , \sqr_y[3] , 
        \sqr_y[2] , SYNOPSYS_UNCONNECTED__9, \sqr_y[0] }) );
  READ_DW01_add_3 add_355 ( .A({\sqr_x[19] , \sqr_x[18] , \sqr_x[17] , 
        \sqr_x[16] , \sqr_x[15] , \sqr_x[14] , \sqr_x[13] , \sqr_x[12] , 
        \sqr_x[11] , \sqr_x[10] , \sqr_x[9] , \sqr_x[8] , \sqr_x[7] , 
        \sqr_x[6] , \sqr_x[5] , \sqr_x[4] , \sqr_x[3] , \sqr_x[2] , 1'b0, 
        \sqr_x[0] }), .B({\sqr_y[19] , \sqr_y[18] , \sqr_y[17] , \sqr_y[16] , 
        \sqr_y[15] , \sqr_y[14] , \sqr_y[13] , \sqr_y[12] , \sqr_y[11] , 
        \sqr_y[10] , \sqr_y[9] , \sqr_y[8] , \sqr_y[7] , \sqr_y[6] , 
        \sqr_y[5] , \sqr_y[4] , \sqr_y[3] , \sqr_y[2] , 1'b0, \sqr_y[0] }), 
        .CI(1'b0), .SUM(sqr_sum) );
  READ_DW01_add_2 add_1_root_add_0_root_add_403_2 ( .A({1'b0, 1'b0, 
        side_length[9:0]}), .B({1'b0, side_A}), .CI(1'b0), .SUM({N2601, N2600, 
        N2599, N2598, N2597, N2596, N2595, N2594, N2593, N2592, N2591, N2590})
         );
  READ_DW01_add_1 add_0_root_add_0_root_add_403_2 ( .A({N2601, N2600, N2599, 
        N2598, N2597, N2596, N2595, N2594, N2593, N2592, N2591, N2590}), .B({
        1'b0, side_B[10:6], n48, n129, side_B[3:1], n34}), .CI(1'b0), .SUM({
        side_sum, SYNOPSYS_UNCONNECTED__10}) );
  READ_DW_mult_uns_1 mult_334_2 ( .a({N2332, N2333, N2334, N2335, N2336, N2337, 
        N2338, N2339, N2340, N2341}), .b({N2348, N2349, N2350, N2351, N2352, 
        N2353, N2354, N2355, N2356, N2357}), .product({N2397, N2396, N2395, 
        N2394, N2393, N2392, N2391, N2390, N2389, N2388, N2387, N2386, N2385, 
        N2384, N2383, N2382, N2381, N2380, N2379, N2378}) );
  READ_DW_mult_uns_0 mult_334 ( .a({N2300, N2301, N2302, N2303, N2304, N2305, 
        N2306, N2307, N2308, N2309}), .b({N2316, N2317, N2318, N2319, N2320, 
        N2321, N2322, N2323, N2324, N2325}), .product({N2377, N2376, N2375, 
        N2374, N2373, N2372, N2371, N2370, N2369, N2368, N2367, N2366, N2365, 
        N2364, N2363, N2362, N2361, N2360, N2359, N2358}) );
  READ_DW01_sub_20 sub_334 ( .A({N2377, N2376, N2375, N2374, N2373, N2372, 
        N2371, N2370, N2369, N2368, N2367, N2366, N2365, N2364, N2363, N2362, 
        N2361, N2360, N2359, N2358}), .B({N2397, N2396, N2395, N2394, N2393, 
        N2392, N2391, N2390, N2389, N2388, N2387, N2386, N2385, N2384, N2383, 
        N2382, N2381, N2380, N2379, N2378}), .CI(1'b0), .DIFF({N2417, N2416, 
        N2415, N2414, N2413, N2412, N2411, N2410, N2409, N2408, N2407, N2406, 
        N2405, N2404, N2403, N2402, N2401, N2400, N2399, N2398}) );
  READ_DW01_add_0 add_334 ( .A({hex_area[19:8], n68, hex_area[6:0]}), .B({
        N2417, N2416, N2415, N2414, N2413, N2412, N2411, N2410, N2409, N2408, 
        N2407, N2406, N2405, N2404, N2403, N2402, N2401, N2400, N2399, N2398}), 
        .CI(1'b0), .SUM({N2437, N2436, N2435, N2434, N2433, N2432, N2431, 
        N2430, N2429, N2428, N2427, N2426, N2425, N2424, N2423, N2422, N2421, 
        N2420, N2419, N2418}) );
  READ_DW_mult_tc_1 mult_276 ( .a({N2208, N2209, N2210, N2211, N2212, N2213, 
        N2214, N2215, N2216, N2217, N2218}), .b({N2223, N2224, N2225, N2226, 
        N2227, N2228, N2229, N2230, N2231, N2232, N2233}), .product({
        \back_res[21] , \back_res[20] , \back_res[19] , \back_res[18] , 
        \back_res[17] , \back_res[16] , \back_res[15] , \back_res[14] , 
        \back_res[13] , \back_res[12] , \back_res[11] , \back_res[10] , 
        \back_res[9] , \back_res[8] , \back_res[7] , \back_res[6] , 
        \back_res[5] , \back_res[4] , \back_res[3] , \back_res[2] , 
        \back_res[1] , \back_res[0] }) );
  READ_DW_mult_tc_0 mult_275 ( .a({N2178, N2179, N2180, N2181, N2182, N2183, 
        N2184, N2185, N2186, N2187, N2188}), .b({N2193, N2194, N2195, N2196, 
        N2197, N2198, N2199, N2200, N2201, N2202, N2203}), .product({
        \front_res[21] , \front_res[20] , \front_res[19] , \front_res[18] , 
        \front_res[17] , \front_res[16] , \front_res[15] , \front_res[14] , 
        \front_res[13] , \front_res[12] , \front_res[11] , \front_res[10] , 
        \front_res[9] , \front_res[8] , \front_res[7] , \front_res[6] , 
        \front_res[5] , \front_res[4] , \front_res[3] , \front_res[2] , 
        \front_res[1] , \front_res[0] }) );
  READ_DW01_sub_21 sub_277 ( .A({\front_res[21] , \front_res[20] , 
        \front_res[19] , \front_res[18] , \front_res[17] , \front_res[16] , 
        \front_res[15] , \front_res[14] , \front_res[13] , \front_res[12] , 
        \front_res[11] , \front_res[10] , \front_res[9] , \front_res[8] , 
        \front_res[7] , \front_res[6] , \front_res[5] , \front_res[4] , 
        \front_res[3] , \front_res[2] , \front_res[1] , \front_res[0] }), .B({
        \back_res[21] , \back_res[20] , \back_res[19] , \back_res[18] , 
        \back_res[17] , \back_res[16] , \back_res[15] , \back_res[14] , 
        \back_res[13] , \back_res[12] , \back_res[11] , \back_res[10] , 
        \back_res[9] , \back_res[8] , \back_res[7] , \back_res[6] , 
        \back_res[5] , \back_res[4] , \back_res[3] , \back_res[2] , 
        \back_res[1] , \back_res[0] }), .CI(1'b0), .DIFF({N2237, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29, SYNOPSYS_UNCONNECTED__30, 
        SYNOPSYS_UNCONNECTED__31}) );
  DFFRX1 \X_reg[4][9]  ( .D(n1758), .CK(clk), .RN(n466), .Q(\X[4][9] ), .QN(
        n1437) );
  DFFRX1 \Y_reg[4][8]  ( .D(n1699), .CK(clk), .RN(n457), .Q(\Y[4][8] ), .QN(
        n1498) );
  DFFRX1 \Y_reg[5][8]  ( .D(n1690), .CK(clk), .RN(n457), .Q(\Y[5][8] ), .QN(
        n1488) );
  DFFRX1 \Y_reg[1][9]  ( .D(n1728), .CK(clk), .RN(n456), .Q(\Y[1][9] ), .QN(
        n1527) );
  DFFRX2 \side_length_reg[8]  ( .D(n1223), .CK(clk), .RN(n475), .Q(
        side_length[8]) );
  DFFRX2 \side_length_reg[5]  ( .D(n1220), .CK(clk), .RN(n475), .Q(
        side_length[5]) );
  DFFRX2 \side_length_reg[0]  ( .D(n1215), .CK(clk), .RN(n475), .Q(
        side_length[0]) );
  DFFRX1 \item2_cnt_reg[2]  ( .D(N2290), .CK(clk), .RN(n446), .Q(n197), .QN(
        n1594) );
  DFFRX1 \Y_reg[0][9]  ( .D(n1738), .CK(clk), .RN(n456), .Q(\Y[0][9] ), .QN(
        n1537) );
  DFFRX1 \X_reg[0][9]  ( .D(n1798), .CK(clk), .RN(n466), .Q(\X[0][9] ), .QN(
        n1477) );
  DFFRX1 \X_reg[3][9]  ( .D(n1768), .CK(clk), .RN(n466), .Q(\X[3][9] ), .QN(
        n1447) );
  DFFRX1 \Y_reg[0][8]  ( .D(n1739), .CK(clk), .RN(n457), .Q(n1967), .QN(n1538)
         );
  DFFRX1 \X_reg[0][8]  ( .D(n1799), .CK(clk), .RN(n467), .Q(n2024), .QN(n1478)
         );
  DFFRX1 \X_reg[0][7]  ( .D(n1800), .CK(clk), .RN(n467), .Q(n2030), .QN(n1479)
         );
  DFFRX1 \Y_reg[3][9]  ( .D(n1708), .CK(clk), .RN(n456), .Q(\Y[3][9] ), .QN(
        n1507) );
  DFFRX1 \Y_reg[3][8]  ( .D(n1709), .CK(clk), .RN(n457), .Q(n1965), .QN(n1508)
         );
  DFFRX1 \X_reg[3][8]  ( .D(n1769), .CK(clk), .RN(n466), .Q(n2022), .QN(n1448)
         );
  DFFRX1 \Y_reg[2][9]  ( .D(n1718), .CK(clk), .RN(n456), .Q(n1959), .QN(n1517)
         );
  DFFRX1 \X_reg[2][9]  ( .D(n1778), .CK(clk), .RN(n466), .Q(n2016), .QN(n1457)
         );
  DFFRX1 \X_reg[0][6]  ( .D(n1801), .CK(clk), .RN(n470), .Q(n2036), .QN(n1480)
         );
  DFFRX1 \Y_reg[0][7]  ( .D(n1740), .CK(clk), .RN(n457), .Q(n1973), .QN(n1539)
         );
  DFFRX1 \Y_reg[0][6]  ( .D(n1741), .CK(clk), .RN(n460), .Q(n1979), .QN(n1540)
         );
  DFFRX1 \Y_reg[3][7]  ( .D(n1710), .CK(clk), .RN(n457), .Q(n1971), .QN(n1509)
         );
  DFFRX1 \Y_reg[3][6]  ( .D(n1711), .CK(clk), .RN(n460), .Q(n1977), .QN(n1510)
         );
  DFFRX1 \X_reg[3][7]  ( .D(n1770), .CK(clk), .RN(n467), .Q(n2028), .QN(n1449)
         );
  DFFRX1 \X_reg[3][6]  ( .D(n1771), .CK(clk), .RN(n467), .Q(n2034), .QN(n1450)
         );
  DFFRX1 \X_reg[2][8]  ( .D(n1779), .CK(clk), .RN(n466), .Q(n2021), .QN(n1458)
         );
  DFFRX1 \X_reg[2][7]  ( .D(n1780), .CK(clk), .RN(n467), .Q(n2027), .QN(n1459)
         );
  DFFRX1 \Y_reg[2][8]  ( .D(n1719), .CK(clk), .RN(n457), .Q(n1964), .QN(n1518)
         );
  DFFRX1 \Y_reg[2][7]  ( .D(n1720), .CK(clk), .RN(n457), .Q(n1970), .QN(n1519)
         );
  DFFRX1 \X_reg[0][5]  ( .D(n1802), .CK(clk), .RN(n470), .Q(n2042), .QN(n1481)
         );
  DFFRX1 \X_reg[0][4]  ( .D(n1803), .CK(clk), .RN(n471), .Q(n2048), .QN(n1482)
         );
  DFFRX1 \Y_reg[0][5]  ( .D(n1742), .CK(clk), .RN(n460), .Q(n1985), .QN(n1541)
         );
  DFFRX1 \Y_reg[0][4]  ( .D(n1743), .CK(clk), .RN(n461), .Q(n1991), .QN(n1542)
         );
  DFFRX1 \Y_reg[3][5]  ( .D(n1712), .CK(clk), .RN(n460), .Q(n1983), .QN(n1511)
         );
  DFFRX1 \Y_reg[3][4]  ( .D(n1713), .CK(clk), .RN(n461), .Q(n1989), .QN(n1512)
         );
  DFFRX1 \X_reg[3][5]  ( .D(n1772), .CK(clk), .RN(n470), .Q(n2040), .QN(n1451)
         );
  DFFRX1 \X_reg[3][4]  ( .D(n1773), .CK(clk), .RN(n470), .Q(n2046), .QN(n1452)
         );
  DFFRX1 \X_reg[2][6]  ( .D(n1781), .CK(clk), .RN(n467), .Q(n2033), .QN(n1460)
         );
  DFFRX1 \X_reg[2][5]  ( .D(n1782), .CK(clk), .RN(n470), .Q(n2039), .QN(n1461)
         );
  DFFRX1 \X_reg[0][3]  ( .D(n1804), .CK(clk), .RN(n471), .Q(n2054), .QN(n1483)
         );
  DFFRX1 \X_reg[0][2]  ( .D(n1805), .CK(clk), .RN(n472), .Q(n2060), .QN(n1484)
         );
  DFFRX1 \Y_reg[0][3]  ( .D(n1744), .CK(clk), .RN(n461), .Q(n1997), .QN(n1543)
         );
  DFFRX1 \Y_reg[0][2]  ( .D(n1745), .CK(clk), .RN(n462), .Q(n2002), .QN(n1544)
         );
  DFFRX1 \Y_reg[3][3]  ( .D(n1714), .CK(clk), .RN(n461), .Q(n1995), .QN(n1513)
         );
  DFFRX1 \Y_reg[3][2]  ( .D(n1715), .CK(clk), .RN(n462), .Q(\Y[3][2] ), .QN(
        n1514) );
  DFFRX1 \X_reg[3][3]  ( .D(n1774), .CK(clk), .RN(n471), .Q(n2052), .QN(n1453)
         );
  DFFRX1 \X_reg[3][2]  ( .D(n1775), .CK(clk), .RN(n471), .Q(n2058), .QN(n1454)
         );
  DFFRX1 \X_reg[2][4]  ( .D(n1783), .CK(clk), .RN(n470), .Q(n2045), .QN(n1462)
         );
  DFFRX1 \X_reg[2][3]  ( .D(n1784), .CK(clk), .RN(n471), .Q(n2051), .QN(n1463)
         );
  DFFRX1 \X_reg[0][1]  ( .D(n1806), .CK(clk), .RN(n472), .Q(n2066), .QN(n1485)
         );
  DFFRX1 \Y_reg[0][1]  ( .D(n1746), .CK(clk), .RN(n462), .Q(n2008), .QN(n1545)
         );
  DFFRX1 \Y_reg[3][1]  ( .D(n1716), .CK(clk), .RN(n462), .Q(n2006), .QN(n1515)
         );
  DFFRX1 \Y_reg[3][0]  ( .D(n1717), .CK(clk), .RN(n465), .Q(\Y[3][0] ), .QN(
        n1516) );
  DFFRX1 \X_reg[3][1]  ( .D(n1776), .CK(clk), .RN(n472), .Q(n2064), .QN(n1455)
         );
  DFFRX1 \X_reg[2][2]  ( .D(n1785), .CK(clk), .RN(n471), .Q(n2057), .QN(n1464)
         );
  DFFRX1 \X_reg[2][1]  ( .D(n1786), .CK(clk), .RN(n472), .Q(n2063), .QN(n1465)
         );
  DFFRX1 \X_reg[2][0]  ( .D(n1787), .CK(clk), .RN(n472), .Q(n2069), .QN(n1466)
         );
  DFFRX1 \Y_reg[2][0]  ( .D(n1727), .CK(clk), .RN(n465), .Q(n2011), .QN(n1526)
         );
  DFFRX1 \X_reg[5][6]  ( .D(n1752), .CK(clk), .RN(n467), .Q(\X[5][6] ), .QN(
        n1430) );
  DFFRX1 \Y_reg[5][6]  ( .D(n1692), .CK(clk), .RN(n460), .Q(\Y[5][6] ), .QN(
        n1490) );
  DFFRX1 \X_reg[1][8]  ( .D(n1789), .CK(clk), .RN(n466), .Q(\X[1][8] ), .QN(
        n1468) );
  DFFRX1 \Y_reg[1][8]  ( .D(n1729), .CK(clk), .RN(n457), .Q(\Y[1][8] ), .QN(
        n1528) );
  DFFRX1 \X_reg[4][7]  ( .D(n1760), .CK(clk), .RN(n467), .Q(\X[4][7] ), .QN(
        n1439) );
  DFFRX1 \Y_reg[4][7]  ( .D(n1700), .CK(clk), .RN(n457), .Q(\Y[4][7] ), .QN(
        n1499) );
  DFFRX1 \X_reg[5][7]  ( .D(n1751), .CK(clk), .RN(n467), .Q(\X[5][7] ), .QN(
        n1429) );
  DFFRX1 \Y_reg[5][7]  ( .D(n1691), .CK(clk), .RN(n457), .Q(\Y[5][7] ), .QN(
        n1489) );
  DFFRX2 \hept_area_reg[19]  ( .D(n1619), .CK(clk), .RN(n475), .Q(
        hept_area[19]) );
  DFFSX1 \item2_cnt_reg[0]  ( .D(N2288), .CK(clk), .SN(n110), .Q(n2072), .QN(
        n1596) );
  DFFRX1 \item2_cnt_reg[1]  ( .D(N2289), .CK(clk), .RN(n112), .Q(n191), .QN(
        n1595) );
  DFFRX1 \Y_reg[2][1]  ( .D(n1726), .CK(clk), .RN(n113), .Q(n2005), .QN(n1525)
         );
  DFFRX1 \Y_reg[2][5]  ( .D(n1722), .CK(clk), .RN(n112), .Q(n1982), .QN(n1521)
         );
  DFFRX1 \Y_reg[2][3]  ( .D(n1724), .CK(clk), .RN(n110), .Q(n1994), .QN(n1523)
         );
  DFFRX1 \Y_reg[2][2]  ( .D(n1725), .CK(clk), .RN(n113), .Q(n2000), .QN(n1524)
         );
  DFFRX1 \Y_reg[2][6]  ( .D(n1721), .CK(clk), .RN(n112), .Q(n1976), .QN(n1520)
         );
  DFFRX1 \Y_reg[2][4]  ( .D(n1723), .CK(clk), .RN(n110), .Q(n1988), .QN(n1522)
         );
  DFFRX1 \X_reg[0][0]  ( .D(n1807), .CK(clk), .RN(n113), .Q(\X[0][0] ), .QN(
        n1486) );
  DFFRX1 \Y_reg[0][0]  ( .D(n1747), .CK(clk), .RN(n112), .Q(n55), .QN(n1546)
         );
  DFFRX1 \inner_cnt_reg[0]  ( .D(n1357), .CK(clk), .RN(n110), .Q(n1860), .QN(
        n1593) );
  DFFRX1 \inner_cnt_reg[2]  ( .D(n1355), .CK(clk), .RN(n113), .Q(n491), .QN(
        n67) );
  DFFRX1 \item1_cnt_reg[1]  ( .D(N2286), .CK(clk), .RN(n112), .Q(n2075), .QN(
        n1598) );
  DFFRX1 \vecY_reg[0][0]  ( .D(n1354), .CK(clk), .RN(n110), .QN(n1590) );
  DFFRX1 \vecY_reg[0][2]  ( .D(n1352), .CK(clk), .RN(n113), .QN(n1588) );
  DFFRX1 \vecY_reg[0][1]  ( .D(n1353), .CK(clk), .RN(n112), .QN(n1589) );
  DFFRX1 \inner_cnt_reg[1]  ( .D(n1859), .CK(clk), .RN(n110), .Q(n1861), .QN(
        n1592) );
  DFFRX1 \vecY_reg[4][2]  ( .D(n1308), .CK(clk), .RN(n113), .QN(n1577) );
  DFFRX1 \vecY_reg[4][0]  ( .D(n1310), .CK(clk), .RN(n112), .QN(n1579) );
  DFFRX1 \vecX_reg[4][2]  ( .D(n1253), .CK(clk), .RN(n110), .QN(n1555) );
  DFFRX1 \vecX_reg[4][1]  ( .D(n1254), .CK(clk), .RN(n113), .QN(n1556) );
  DFFRX1 \vecX_reg[4][0]  ( .D(n1255), .CK(clk), .RN(n112), .QN(n1557) );
  DFFRX1 \vecY_reg[4][1]  ( .D(n1309), .CK(clk), .RN(n110), .QN(n1578) );
  DFFRX1 \vecX_reg[0][0]  ( .D(n1299), .CK(clk), .RN(n113), .QN(n1568) );
  DFFRX1 \vecX_reg[0][2]  ( .D(n1297), .CK(clk), .RN(n112), .QN(n1566) );
  DFFRX1 \vecX_reg[0][1]  ( .D(n1298), .CK(clk), .RN(n110), .QN(n1567) );
  DFFRX1 \vecY_reg[4][3]  ( .D(n1307), .CK(clk), .RN(n113), .QN(n1576) );
  DFFRX1 \vecY_reg[0][3]  ( .D(n1351), .CK(clk), .RN(n112), .QN(n1587) );
  DFFRX1 \vecX_reg[4][3]  ( .D(n1252), .CK(clk), .RN(n110), .QN(n1554) );
  DFFRX1 \vecX_reg[0][3]  ( .D(n1296), .CK(clk), .RN(n113), .QN(n1565) );
  DFFRX1 \rd_cnt_reg[0]  ( .D(n1847), .CK(clk), .RN(n112), .QN(n1360) );
  DFFRX1 \vecY_reg[4][4]  ( .D(n1306), .CK(clk), .RN(n110), .QN(n1575) );
  DFFRX1 \vecY_reg[0][4]  ( .D(n1350), .CK(clk), .RN(n113), .QN(n1586) );
  DFFRX1 \vecX_reg[4][4]  ( .D(n1251), .CK(clk), .RN(n112), .QN(n1553) );
  DFFRX1 \vecX_reg[0][4]  ( .D(n1295), .CK(clk), .RN(n110), .QN(n1564) );
  DFFRX1 \vecY_reg[4][5]  ( .D(n1305), .CK(clk), .RN(n113), .QN(n1574) );
  DFFRX1 \vecY_reg[0][5]  ( .D(n1349), .CK(clk), .RN(n112), .QN(n1585) );
  DFFRX1 \vecX_reg[4][5]  ( .D(n1250), .CK(clk), .RN(n110), .QN(n1552) );
  DFFRX1 \vecX_reg[0][5]  ( .D(n1294), .CK(clk), .RN(n113), .QN(n1563) );
  DFFRX1 \vecY_reg[4][6]  ( .D(n1304), .CK(clk), .RN(n112), .QN(n1573) );
  DFFRX1 \vecY_reg[0][6]  ( .D(n1348), .CK(clk), .RN(n110), .QN(n1584) );
  DFFRX1 \vecX_reg[4][6]  ( .D(n1249), .CK(clk), .RN(n113), .QN(n1551) );
  DFFRX1 \vecX_reg[0][6]  ( .D(n1293), .CK(clk), .RN(n112), .QN(n1562) );
  DFFRX1 \vecY_reg[4][7]  ( .D(n1303), .CK(clk), .RN(n110), .QN(n1572) );
  DFFRX1 \vecY_reg[0][7]  ( .D(n1347), .CK(clk), .RN(n113), .QN(n1583) );
  DFFRX1 \vecX_reg[4][7]  ( .D(n1248), .CK(clk), .RN(n112), .QN(n1550) );
  DFFRX1 \vecX_reg[0][7]  ( .D(n1292), .CK(clk), .RN(n110), .QN(n1561) );
  DFFRX1 \vecY_reg[4][8]  ( .D(n1302), .CK(clk), .RN(n113), .QN(n1571) );
  DFFRX1 \vecY_reg[0][8]  ( .D(n1346), .CK(clk), .RN(n112), .QN(n1582) );
  DFFRX1 \vecX_reg[4][8]  ( .D(n1247), .CK(clk), .RN(n110), .QN(n1549) );
  DFFRX1 \vecX_reg[0][8]  ( .D(n1291), .CK(clk), .RN(n113), .QN(n1560) );
  DFFRX1 \vecY_reg[4][9]  ( .D(n1301), .CK(clk), .RN(n112), .QN(n1570) );
  DFFRX1 \vecY_reg[0][9]  ( .D(n1345), .CK(clk), .RN(n110), .QN(n1581) );
  DFFRX1 \vecX_reg[4][9]  ( .D(n1246), .CK(clk), .RN(n113), .QN(n1548) );
  DFFRX1 \vecX_reg[0][9]  ( .D(n1290), .CK(clk), .RN(n112), .QN(n1559) );
  DFFRX1 \vecY_reg[4][10]  ( .D(n1300), .CK(clk), .RN(n110), .QN(n1569) );
  DFFRX1 \vecY_reg[0][10]  ( .D(n1344), .CK(clk), .RN(n113), .QN(n1580) );
  DFFRX1 \vecX_reg[4][10]  ( .D(n1245), .CK(clk), .RN(n112), .QN(n1547) );
  DFFRX1 \vecX_reg[0][10]  ( .D(n1289), .CK(clk), .RN(n110), .QN(n1558) );
  DFFRX1 \R_reg[3][0]  ( .D(n1654), .CK(clk), .RN(n113), .Q(n1954), .QN(n1393)
         );
  DFFRX1 \R_reg[3][10]  ( .D(n1644), .CK(clk), .RN(n112), .Q(n1894), .QN(n1383) );
  DFFRX1 \R_reg[3][9]  ( .D(n1645), .CK(clk), .RN(n110), .Q(n1900), .QN(n1384)
         );
  DFFRX1 \R_reg[3][8]  ( .D(n1646), .CK(clk), .RN(n113), .Q(n1906), .QN(n1385)
         );
  DFFRX1 \R_reg[3][7]  ( .D(n1647), .CK(clk), .RN(n112), .Q(n1912), .QN(n1386)
         );
  DFFRX1 \R_reg[3][6]  ( .D(n1648), .CK(clk), .RN(n110), .Q(n1918), .QN(n1387)
         );
  DFFRX1 \R_reg[3][5]  ( .D(n1649), .CK(clk), .RN(n113), .Q(n1924), .QN(n1388)
         );
  DFFRX1 \R_reg[3][4]  ( .D(n1650), .CK(clk), .RN(n112), .Q(n1930), .QN(n1389)
         );
  DFFRX1 \R_reg[3][3]  ( .D(n1651), .CK(clk), .RN(n110), .Q(n1936), .QN(n1390)
         );
  DFFRX1 \R_reg[3][2]  ( .D(n1652), .CK(clk), .RN(n113), .Q(n1942), .QN(n1391)
         );
  DFFRX1 \R_reg[3][1]  ( .D(n1653), .CK(clk), .RN(n112), .Q(n1948), .QN(n1392)
         );
  DFFRX1 \R_reg[5][0]  ( .D(n1688), .CK(clk), .RN(n112), .Q(n1951), .QN(n1371)
         );
  DFFRX1 \R_reg[4][0]  ( .D(n1643), .CK(clk), .RN(n110), .Q(n1955), .QN(n1382)
         );
  DFFRX1 \R_reg[5][10]  ( .D(n1623), .CK(clk), .RN(n113), .Q(n1891), .QN(n1361) );
  DFFRX1 \R_reg[5][9]  ( .D(n1624), .CK(clk), .RN(n112), .Q(n1897), .QN(n1362)
         );
  DFFRX1 \R_reg[5][8]  ( .D(n1625), .CK(clk), .RN(n110), .Q(n1903), .QN(n1363)
         );
  DFFRX1 \R_reg[5][7]  ( .D(n1626), .CK(clk), .RN(n113), .Q(n1909), .QN(n1364)
         );
  DFFRX1 \R_reg[5][6]  ( .D(n1627), .CK(clk), .RN(n112), .Q(n1915), .QN(n1365)
         );
  DFFRX1 \R_reg[5][5]  ( .D(n1628), .CK(clk), .RN(n110), .Q(n1921), .QN(n1366)
         );
  DFFRX1 \R_reg[5][4]  ( .D(n1629), .CK(clk), .RN(n113), .Q(n1927), .QN(n1367)
         );
  DFFRX1 \R_reg[5][3]  ( .D(n1630), .CK(clk), .RN(n112), .Q(n1933), .QN(n1368)
         );
  DFFRX1 \R_reg[5][2]  ( .D(n1631), .CK(clk), .RN(n110), .Q(n1939), .QN(n1369)
         );
  DFFRX1 \R_reg[5][1]  ( .D(n1632), .CK(clk), .RN(n113), .Q(n1945), .QN(n1370)
         );
  DFFRX1 \R_reg[2][0]  ( .D(n1665), .CK(clk), .RN(n112), .Q(n1953), .QN(n1404)
         );
  DFFRX1 \R_reg[1][0]  ( .D(n1676), .CK(clk), .RN(n110), .Q(n1952), .QN(n1415)
         );
  DFFRX1 \R_reg[4][10]  ( .D(n1633), .CK(clk), .RN(n113), .Q(n1895), .QN(n1372) );
  DFFRX1 \R_reg[4][9]  ( .D(n1634), .CK(clk), .RN(n112), .Q(n1901), .QN(n1373)
         );
  DFFRX1 \R_reg[4][6]  ( .D(n1637), .CK(clk), .RN(n110), .Q(n1919), .QN(n1376)
         );
  DFFRX1 \R_reg[4][3]  ( .D(n1640), .CK(clk), .RN(n113), .Q(n1937), .QN(n1379)
         );
  DFFRX1 \R_reg[2][10]  ( .D(n1655), .CK(clk), .RN(n112), .Q(n1893), .QN(n1394) );
  DFFRX1 \R_reg[2][9]  ( .D(n1656), .CK(clk), .RN(n110), .Q(n1899), .QN(n1395)
         );
  DFFRX1 \R_reg[2][6]  ( .D(n1659), .CK(clk), .RN(n113), .Q(n1917), .QN(n1398)
         );
  DFFRX1 \R_reg[2][3]  ( .D(n1662), .CK(clk), .RN(n112), .Q(n1935), .QN(n1401)
         );
  DFFRX1 \R_reg[1][10]  ( .D(n1666), .CK(clk), .RN(n110), .Q(n1892), .QN(n1405) );
  DFFRX1 \R_reg[1][9]  ( .D(n1667), .CK(clk), .RN(n113), .Q(n1898), .QN(n1406)
         );
  DFFRX1 \R_reg[1][6]  ( .D(n1670), .CK(clk), .RN(n112), .Q(n1916), .QN(n1409)
         );
  DFFRX1 \R_reg[1][3]  ( .D(n1673), .CK(clk), .RN(n110), .Q(n1934), .QN(n1412)
         );
  DFFRX1 \R_reg[4][1]  ( .D(n1642), .CK(clk), .RN(n113), .Q(n1949), .QN(n1381)
         );
  DFFRX1 \R_reg[2][1]  ( .D(n1664), .CK(clk), .RN(n112), .Q(n1947), .QN(n1403)
         );
  DFFRX1 \R_reg[1][1]  ( .D(n1675), .CK(clk), .RN(n110), .Q(n1946), .QN(n1414)
         );
  DFFRX1 \R_reg[4][8]  ( .D(n1635), .CK(clk), .RN(n113), .Q(n1907), .QN(n1374)
         );
  DFFRX1 \R_reg[4][7]  ( .D(n1636), .CK(clk), .RN(n112), .Q(n1913), .QN(n1375)
         );
  DFFRX1 \R_reg[4][5]  ( .D(n1638), .CK(clk), .RN(n110), .Q(n1925), .QN(n1377)
         );
  DFFRX1 \R_reg[4][4]  ( .D(n1639), .CK(clk), .RN(n113), .Q(n1931), .QN(n1378)
         );
  DFFRX1 \R_reg[4][2]  ( .D(n1641), .CK(clk), .RN(n112), .Q(n1943), .QN(n1380)
         );
  DFFRX1 \R_reg[2][8]  ( .D(n1657), .CK(clk), .RN(n110), .Q(n1905), .QN(n1396)
         );
  DFFRX1 \R_reg[2][7]  ( .D(n1658), .CK(clk), .RN(n113), .Q(n1911), .QN(n1397)
         );
  DFFRX1 \R_reg[2][5]  ( .D(n1660), .CK(clk), .RN(n112), .Q(n1923), .QN(n1399)
         );
  DFFRX1 \R_reg[2][4]  ( .D(n1661), .CK(clk), .RN(n110), .Q(n1929), .QN(n1400)
         );
  DFFRX1 \R_reg[2][2]  ( .D(n1663), .CK(clk), .RN(n113), .Q(n1941), .QN(n1402)
         );
  DFFRX1 \R_reg[1][8]  ( .D(n1668), .CK(clk), .RN(n112), .Q(n1904), .QN(n1407)
         );
  DFFRX1 \R_reg[1][7]  ( .D(n1669), .CK(clk), .RN(n110), .Q(n1910), .QN(n1408)
         );
  DFFRX1 \R_reg[1][5]  ( .D(n1671), .CK(clk), .RN(n113), .Q(n1922), .QN(n1410)
         );
  DFFRX1 \R_reg[1][4]  ( .D(n1672), .CK(clk), .RN(n112), .Q(n1928), .QN(n1411)
         );
  DFFRX1 \R_reg[1][2]  ( .D(n1674), .CK(clk), .RN(n110), .Q(n1940), .QN(n1413)
         );
  DFFRX1 \R_reg[0][10]  ( .D(n1677), .CK(clk), .RN(n113), .Q(n1896), .QN(n1416) );
  DFFRX1 \R_reg[0][9]  ( .D(n1678), .CK(clk), .RN(n112), .Q(n1902), .QN(n1417)
         );
  DFFRX1 \R_reg[0][8]  ( .D(n1679), .CK(clk), .RN(n110), .Q(n1908), .QN(n1418)
         );
  DFFRX1 \R_reg[0][7]  ( .D(n1680), .CK(clk), .RN(n113), .Q(n1914), .QN(n1419)
         );
  DFFRX1 \R_reg[0][6]  ( .D(n1681), .CK(clk), .RN(n112), .Q(n1920), .QN(n1420)
         );
  DFFRX1 \R_reg[0][5]  ( .D(n1682), .CK(clk), .RN(n110), .Q(n1926), .QN(n1421)
         );
  DFFRX1 \R_reg[0][4]  ( .D(n1683), .CK(clk), .RN(n113), .Q(n1932), .QN(n1422)
         );
  DFFRX1 \R_reg[0][0]  ( .D(n1687), .CK(clk), .RN(n112), .Q(n1956), .QN(n1426)
         );
  DFFRX1 \R_reg[0][3]  ( .D(n1684), .CK(clk), .RN(n110), .Q(n1938), .QN(n1423)
         );
  DFFRX1 \R_reg[0][2]  ( .D(n1685), .CK(clk), .RN(n113), .Q(n1944), .QN(n1424)
         );
  DFFRX1 \R_reg[0][1]  ( .D(n1686), .CK(clk), .RN(n112), .Q(n1950), .QN(n1425)
         );
  DFFRXL \rd_cnt_reg[1]  ( .D(N673), .CK(clk), .RN(n112), .Q(rd_cnt[1]), .QN(
        n1851) );
  DFFRXL \vecY_reg[2][2]  ( .D(n1330), .CK(clk), .RN(n110), .Q(\vecY[2][2] )
         );
  DFFRXL \vecY_reg[2][0]  ( .D(n1332), .CK(clk), .RN(n113), .Q(\vecY[2][0] )
         );
  DFFRXL \vecY_reg[1][1]  ( .D(n1342), .CK(clk), .RN(n112), .Q(\vecY[1][1] )
         );
  DFFRXL \vecY_reg[1][0]  ( .D(n1343), .CK(clk), .RN(n110), .Q(\vecY[1][0] )
         );
  DFFRXL \vecY_reg[3][2]  ( .D(n1319), .CK(clk), .RN(n113), .Q(\vecY[3][2] )
         );
  DFFRXL \vecY_reg[3][1]  ( .D(n1320), .CK(clk), .RN(n112), .Q(\vecY[3][1] )
         );
  DFFRXL \vecY_reg[3][0]  ( .D(n1321), .CK(clk), .RN(n110), .Q(\vecY[3][0] )
         );
  DFFRXL \vecY_reg[2][1]  ( .D(n1331), .CK(clk), .RN(n113), .Q(\vecY[2][1] )
         );
  DFFRXL \vecY_reg[1][2]  ( .D(n1341), .CK(clk), .RN(n112), .Q(\vecY[1][2] )
         );
  DFFRXL \vecX_reg[3][2]  ( .D(n1264), .CK(clk), .RN(n110), .Q(\vecX[3][2] )
         );
  DFFRXL \vecX_reg[3][1]  ( .D(n1265), .CK(clk), .RN(n113), .Q(\vecX[3][1] )
         );
  DFFRXL \vecX_reg[3][0]  ( .D(n1266), .CK(clk), .RN(n112), .Q(\vecX[3][0] )
         );
  DFFRXL \vecX_reg[2][2]  ( .D(n1275), .CK(clk), .RN(n110), .Q(\vecX[2][2] )
         );
  DFFRXL \vecX_reg[2][1]  ( .D(n1276), .CK(clk), .RN(n113), .Q(\vecX[2][1] )
         );
  DFFRXL \vecX_reg[2][0]  ( .D(n1277), .CK(clk), .RN(n112), .Q(\vecX[2][0] )
         );
  DFFRXL \vecX_reg[1][2]  ( .D(n1286), .CK(clk), .RN(n110), .Q(\vecX[1][2] )
         );
  DFFRXL \vecX_reg[1][1]  ( .D(n1287), .CK(clk), .RN(n113), .Q(\vecX[1][1] )
         );
  DFFRXL \vecX_reg[1][0]  ( .D(n1288), .CK(clk), .RN(n112), .Q(\vecX[1][0] )
         );
  DFFRXL \vecY_reg[1][3]  ( .D(n1340), .CK(clk), .RN(n110), .Q(\vecY[1][3] )
         );
  DFFRXL \vecY_reg[3][3]  ( .D(n1318), .CK(clk), .RN(n113), .Q(\vecY[3][3] )
         );
  DFFRXL \vecY_reg[2][3]  ( .D(n1329), .CK(clk), .RN(n112), .Q(\vecY[2][3] )
         );
  DFFRXL \vecX_reg[3][3]  ( .D(n1263), .CK(clk), .RN(n110), .Q(\vecX[3][3] )
         );
  DFFRXL \vecX_reg[2][3]  ( .D(n1274), .CK(clk), .RN(n113), .Q(\vecX[2][3] )
         );
  DFFRXL \vecX_reg[1][3]  ( .D(n1285), .CK(clk), .RN(n112), .Q(\vecX[1][3] )
         );
  DFFRXL \outer_cnt_reg[2]  ( .D(n1824), .CK(clk), .RN(n110), .Q(outer_cnt[2]), 
        .QN(n1869) );
  DFFRXL \vecY_reg[3][4]  ( .D(n1317), .CK(clk), .RN(n110), .Q(\vecY[3][4] )
         );
  DFFRXL \vecY_reg[2][4]  ( .D(n1328), .CK(clk), .RN(n113), .Q(\vecY[2][4] )
         );
  DFFRXL \vecY_reg[1][4]  ( .D(n1339), .CK(clk), .RN(n112), .Q(\vecY[1][4] )
         );
  DFFRXL \vecX_reg[3][4]  ( .D(n1262), .CK(clk), .RN(n110), .Q(\vecX[3][4] )
         );
  DFFRXL \vecX_reg[2][4]  ( .D(n1273), .CK(clk), .RN(n113), .Q(\vecX[2][4] )
         );
  DFFRXL \vecX_reg[1][4]  ( .D(n1284), .CK(clk), .RN(n112), .Q(\vecX[1][4] )
         );
  DFFRXL \vecY_reg[1][5]  ( .D(n1338), .CK(clk), .RN(n113), .Q(\vecY[1][5] )
         );
  DFFRXL \vecY_reg[3][5]  ( .D(n1316), .CK(clk), .RN(n112), .Q(\vecY[3][5] )
         );
  DFFRXL \vecY_reg[2][5]  ( .D(n1327), .CK(clk), .RN(n110), .Q(\vecY[2][5] )
         );
  DFFRXL \vecX_reg[3][5]  ( .D(n1261), .CK(clk), .RN(n113), .Q(\vecX[3][5] )
         );
  DFFRXL \vecX_reg[2][5]  ( .D(n1272), .CK(clk), .RN(n112), .Q(\vecX[2][5] )
         );
  DFFRXL \vecX_reg[1][5]  ( .D(n1283), .CK(clk), .RN(n110), .Q(\vecX[1][5] )
         );
  DFFRXL \vecY_reg[3][6]  ( .D(n1315), .CK(clk), .RN(n113), .Q(\vecY[3][6] )
         );
  DFFRXL \vecY_reg[2][6]  ( .D(n1326), .CK(clk), .RN(n112), .Q(\vecY[2][6] )
         );
  DFFRXL \vecY_reg[1][6]  ( .D(n1337), .CK(clk), .RN(n110), .Q(\vecY[1][6] )
         );
  DFFRXL \vecX_reg[3][6]  ( .D(n1260), .CK(clk), .RN(n113), .Q(\vecX[3][6] )
         );
  DFFRXL \vecX_reg[2][6]  ( .D(n1271), .CK(clk), .RN(n112), .Q(\vecX[2][6] )
         );
  DFFRXL \vecX_reg[1][6]  ( .D(n1282), .CK(clk), .RN(n110), .Q(\vecX[1][6] )
         );
  DFFRXL \vecY_reg[1][7]  ( .D(n1336), .CK(clk), .RN(n113), .Q(\vecY[1][7] )
         );
  DFFRXL \vecY_reg[3][7]  ( .D(n1314), .CK(clk), .RN(n112), .Q(\vecY[3][7] )
         );
  DFFRXL \vecY_reg[2][7]  ( .D(n1325), .CK(clk), .RN(n110), .Q(\vecY[2][7] )
         );
  DFFRXL \vecX_reg[2][7]  ( .D(n1270), .CK(clk), .RN(n113), .Q(\vecX[2][7] )
         );
  DFFRXL \vecX_reg[1][7]  ( .D(n1281), .CK(clk), .RN(n112), .Q(\vecX[1][7] )
         );
  DFFRXL \vecX_reg[3][7]  ( .D(n1259), .CK(clk), .RN(n110), .Q(\vecX[3][7] )
         );
  DFFRXL \hex_area_reg[0]  ( .D(n1225), .CK(clk), .RN(n113), .Q(hex_area[0])
         );
  DFFRXL \vecY_reg[3][8]  ( .D(n1313), .CK(clk), .RN(n112), .Q(\vecY[3][8] )
         );
  DFFRXL \vecY_reg[2][8]  ( .D(n1324), .CK(clk), .RN(n110), .Q(\vecY[2][8] )
         );
  DFFRXL \vecY_reg[1][8]  ( .D(n1335), .CK(clk), .RN(n113), .Q(\vecY[1][8] )
         );
  DFFRXL \vecX_reg[3][8]  ( .D(n1258), .CK(clk), .RN(n112), .Q(\vecX[3][8] )
         );
  DFFRXL \vecX_reg[2][8]  ( .D(n1269), .CK(clk), .RN(n110), .Q(\vecX[2][8] )
         );
  DFFRXL \vecX_reg[1][8]  ( .D(n1280), .CK(clk), .RN(n113), .Q(\vecX[1][8] )
         );
  DFFRXL \vecY_reg[3][9]  ( .D(n1312), .CK(clk), .RN(n112), .Q(\vecY[3][9] )
         );
  DFFRXL \vecY_reg[2][9]  ( .D(n1323), .CK(clk), .RN(n110), .Q(\vecY[2][9] )
         );
  DFFRXL \vecY_reg[1][9]  ( .D(n1334), .CK(clk), .RN(n113), .Q(\vecY[1][9] )
         );
  DFFRXL \vecX_reg[2][9]  ( .D(n1268), .CK(clk), .RN(n112), .Q(\vecX[2][9] )
         );
  DFFRXL \vecX_reg[1][9]  ( .D(n1279), .CK(clk), .RN(n110), .Q(\vecX[1][9] )
         );
  DFFRXL \vecX_reg[3][9]  ( .D(n1257), .CK(clk), .RN(n113), .Q(\vecX[3][9] )
         );
  DFFRXL \vecY_reg[3][10]  ( .D(n1311), .CK(clk), .RN(n112), .Q(\vecY[3][10] )
         );
  DFFRXL \vecY_reg[2][10]  ( .D(n1322), .CK(clk), .RN(n110), .Q(\vecY[2][10] )
         );
  DFFRXL \vecY_reg[1][10]  ( .D(n1333), .CK(clk), .RN(n113), .Q(\vecY[1][10] )
         );
  DFFRXL \vecX_reg[3][10]  ( .D(n1256), .CK(clk), .RN(n112), .Q(\vecX[3][10] )
         );
  DFFRXL \vecX_reg[2][10]  ( .D(n1267), .CK(clk), .RN(n110), .Q(\vecX[2][10] )
         );
  DFFRXL \vecX_reg[1][10]  ( .D(n1278), .CK(clk), .RN(n113), .Q(\vecX[1][10] )
         );
  DFFRXL \hex_area_reg[1]  ( .D(n1226), .CK(clk), .RN(n112), .Q(hex_area[1])
         );
  DFFRXL \hex_area_reg[2]  ( .D(n1227), .CK(clk), .RN(n110), .Q(hex_area[2]), 
        .QN(n64) );
  DFFRXL \hex_area_reg[4]  ( .D(n1229), .CK(clk), .RN(n112), .Q(hex_area[4]), 
        .QN(n62) );
  DFFRXL \hex_area_reg[5]  ( .D(n1230), .CK(clk), .RN(n110), .Q(hex_area[5]), 
        .QN(n63) );
  DFFRXL \hex_area_reg[6]  ( .D(n1231), .CK(clk), .RN(n113), .Q(hex_area[6])
         );
  DFFRXL \hex_area_reg[8]  ( .D(n1233), .CK(clk), .RN(n110), .Q(hex_area[8]), 
        .QN(n61) );
  DFFRXL \hex_area_reg[9]  ( .D(n1234), .CK(clk), .RN(n113), .Q(hex_area[9])
         );
  DFFRXL \hex_area_reg[11]  ( .D(n1236), .CK(clk), .RN(n110), .Q(hex_area[11])
         );
  DFFRXL \hex_area_reg[12]  ( .D(n1237), .CK(clk), .RN(n113), .Q(hex_area[12]), 
        .QN(n60) );
  DFFRXL \hex_area_reg[13]  ( .D(n1238), .CK(clk), .RN(n112), .Q(hex_area[13])
         );
  DFFRXL \hex_area_reg[15]  ( .D(n1240), .CK(clk), .RN(n113), .Q(hex_area[15])
         );
  DFFRXL \hex_area_reg[17]  ( .D(n1242), .CK(clk), .RN(n113), .Q(hex_area[17]), 
        .QN(n66) );
  DFFRXL \hex_area_reg[18]  ( .D(n1243), .CK(clk), .RN(n112), .Q(hex_area[18])
         );
  DFFRXL \hept_area_reg[1]  ( .D(n1601), .CK(clk), .RN(n113), .Q(hept_area[1])
         );
  DFFRXL \hept_area_reg[2]  ( .D(n1602), .CK(clk), .RN(n112), .Q(hept_area[2]), 
        .QN(n59) );
  DFFRHQX1 \side_cnt_reg[0]  ( .D(n1622), .CK(clk), .RN(n113), .Q(side_cnt[0])
         );
  DFFRX2 \item1_cnt_reg[2]  ( .D(N2287), .CK(clk), .RN(n113), .QN(n1597) );
  DFFRX2 \Y_reg[1][0]  ( .D(n1737), .CK(clk), .RN(n465), .Q(n2010), .QN(n1536)
         );
  DFFRX2 \X_reg[1][0]  ( .D(n1797), .CK(clk), .RN(n472), .Q(n2068), .QN(n1476)
         );
  DFFRX2 \Y_reg[5][0]  ( .D(n1748), .CK(clk), .RN(n465), .Q(n2009), .QN(n1496)
         );
  DFFRX2 \X_reg[5][0]  ( .D(n1808), .CK(clk), .RN(n472), .Q(n2067), .QN(n1436)
         );
  DFFRX2 \Y_reg[4][0]  ( .D(n1707), .CK(clk), .RN(n465), .Q(n2013), .QN(n1506)
         );
  DFFRX2 \X_reg[4][0]  ( .D(n1767), .CK(clk), .RN(n472), .Q(n2071), .QN(n1446)
         );
  DFFRX1 \reach_cnt_reg[2][2]  ( .D(n1810), .CK(clk), .RN(n113), .Q(
        \reach_cnt[2][2] ), .QN(n1883) );
  DFFRX1 \reach_cnt_reg[1][0]  ( .D(n1819), .CK(clk), .RN(n112), .Q(
        \reach_cnt[1][0] ), .QN(n1887) );
  DFFRX1 \reach_cnt_reg[2][0]  ( .D(n1820), .CK(clk), .RN(n113), .Q(
        \reach_cnt[2][0] ), .QN(n1888) );
  DFFRX1 \reach_cnt_reg[4][1]  ( .D(n1817), .CK(clk), .RN(n110), .Q(
        \reach_cnt[4][1] ), .QN(n1878) );
  DFFRX2 \X_reg[3][0]  ( .D(n1777), .CK(clk), .RN(n472), .Q(n2070), .QN(n1456)
         );
  DFFRX1 \reach_cnt_reg[3][0]  ( .D(n1821), .CK(clk), .RN(n110), .Q(
        \reach_cnt[3][0] ), .QN(n1889) );
  DFFRX2 \X_reg[1][9]  ( .D(n1788), .CK(clk), .RN(n466), .Q(n2015), .QN(n1467)
         );
  DFFRX2 \X_reg[1][6]  ( .D(n1791), .CK(clk), .RN(n467), .Q(n2032), .QN(n1470)
         );
  DFFRX2 \Y_reg[1][7]  ( .D(n1730), .CK(clk), .RN(n457), .Q(n1969), .QN(n1529)
         );
  DFFRX2 \X_reg[1][7]  ( .D(n1790), .CK(clk), .RN(n467), .Q(n2026), .QN(n1469)
         );
  DFFRX2 \Y_reg[1][6]  ( .D(n1731), .CK(clk), .RN(n460), .Q(n1975), .QN(n1530)
         );
  DFFRX2 \X_reg[1][5]  ( .D(n1792), .CK(clk), .RN(n470), .Q(n2038), .QN(n1471)
         );
  DFFRX2 \X_reg[1][4]  ( .D(n1793), .CK(clk), .RN(n470), .Q(n2044), .QN(n1472)
         );
  DFFRX2 \X_reg[1][3]  ( .D(n1794), .CK(clk), .RN(n471), .Q(n2050), .QN(n1473)
         );
  DFFRX2 \X_reg[1][2]  ( .D(n1795), .CK(clk), .RN(n471), .Q(n2056), .QN(n1474)
         );
  DFFRX1 \reach_cnt_reg[1][1]  ( .D(n1814), .CK(clk), .RN(n112), .Q(
        \reach_cnt[1][1] ), .QN(n1871) );
  DFFRX1 \reach_cnt_reg[2][1]  ( .D(n1815), .CK(clk), .RN(n113), .Q(
        \reach_cnt[2][1] ), .QN(n1874) );
  DFFRX2 \Y_reg[1][5]  ( .D(n1732), .CK(clk), .RN(n460), .Q(n1981), .QN(n1531)
         );
  DFFRX2 \Y_reg[1][4]  ( .D(n1733), .CK(clk), .RN(n461), .Q(n1987), .QN(n1532)
         );
  DFFRX2 \Y_reg[1][3]  ( .D(n1734), .CK(clk), .RN(n461), .Q(n1993), .QN(n1533)
         );
  DFFRX2 \Y_reg[1][2]  ( .D(n1735), .CK(clk), .RN(n462), .Q(n1999), .QN(n1534)
         );
  DFFRX2 \Y_reg[1][1]  ( .D(n1736), .CK(clk), .RN(n462), .Q(n2004), .QN(n1535)
         );
  DFFRX2 \X_reg[1][1]  ( .D(n1796), .CK(clk), .RN(n472), .Q(n2062), .QN(n1475)
         );
  DFFRX2 \Y_reg[5][9]  ( .D(n1689), .CK(clk), .RN(n456), .Q(n1957), .QN(n1487)
         );
  DFFRX2 \X_reg[5][9]  ( .D(n1749), .CK(clk), .RN(n466), .Q(n2014), .QN(n1427)
         );
  DFFRX2 \X_reg[5][8]  ( .D(n1750), .CK(clk), .RN(n466), .Q(n2019), .QN(n1428)
         );
  DFFRX2 \X_reg[5][5]  ( .D(n1753), .CK(clk), .RN(n470), .Q(n2037), .QN(n1431)
         );
  DFFRX2 \Y_reg[5][5]  ( .D(n1693), .CK(clk), .RN(n460), .Q(n1980), .QN(n1491)
         );
  DFFRX2 \Y_reg[5][3]  ( .D(n1695), .CK(clk), .RN(n461), .Q(n1992), .QN(n1493)
         );
  DFFRX2 \Y_reg[5][4]  ( .D(n1694), .CK(clk), .RN(n461), .Q(n1986), .QN(n1492)
         );
  DFFRX2 \X_reg[5][4]  ( .D(n1754), .CK(clk), .RN(n470), .Q(n2043), .QN(n1432)
         );
  DFFRX2 \X_reg[5][3]  ( .D(n1755), .CK(clk), .RN(n471), .Q(n2049), .QN(n1433)
         );
  DFFRX2 \X_reg[5][2]  ( .D(n1756), .CK(clk), .RN(n471), .Q(n2055), .QN(n1434)
         );
  DFFRX2 \Y_reg[5][2]  ( .D(n1696), .CK(clk), .RN(n462), .Q(n1998), .QN(n1494)
         );
  DFFRX2 \Y_reg[5][1]  ( .D(n1697), .CK(clk), .RN(n462), .Q(n2003), .QN(n1495)
         );
  DFFRX2 \X_reg[5][1]  ( .D(n1757), .CK(clk), .RN(n472), .Q(n2061), .QN(n1435)
         );
  DFFRX2 \Y_reg[4][9]  ( .D(n1698), .CK(clk), .RN(n456), .Q(n1960), .QN(n1497)
         );
  DFFRX2 \X_reg[4][8]  ( .D(n1759), .CK(clk), .RN(n466), .Q(n2023), .QN(n1438)
         );
  DFFRX2 \X_reg[4][6]  ( .D(n1761), .CK(clk), .RN(n467), .Q(n2035), .QN(n1440)
         );
  DFFRX2 \Y_reg[4][6]  ( .D(n1701), .CK(clk), .RN(n460), .Q(n1978), .QN(n1500)
         );
  DFFRX2 \X_reg[4][5]  ( .D(n1762), .CK(clk), .RN(n470), .Q(n2041), .QN(n1441)
         );
  DFFRX2 \Y_reg[4][5]  ( .D(n1702), .CK(clk), .RN(n460), .Q(n1984), .QN(n1501)
         );
  DFFRX2 \Y_reg[4][3]  ( .D(n1704), .CK(clk), .RN(n461), .Q(n1996), .QN(n1503)
         );
  DFFRX2 \Y_reg[4][4]  ( .D(n1703), .CK(clk), .RN(n461), .Q(n1990), .QN(n1502)
         );
  DFFRX2 \X_reg[4][4]  ( .D(n1763), .CK(clk), .RN(n470), .Q(n2047), .QN(n1442)
         );
  DFFRX2 \X_reg[4][3]  ( .D(n1764), .CK(clk), .RN(n471), .Q(n2053), .QN(n1443)
         );
  DFFRX2 \Y_reg[4][2]  ( .D(n1705), .CK(clk), .RN(n462), .Q(n2001), .QN(n1504)
         );
  DFFRX2 \X_reg[4][2]  ( .D(n1765), .CK(clk), .RN(n471), .Q(n2059), .QN(n1444)
         );
  DFFRX2 \Y_reg[4][1]  ( .D(n1706), .CK(clk), .RN(n462), .Q(n2007), .QN(n1505)
         );
  DFFRX2 \X_reg[4][1]  ( .D(n1766), .CK(clk), .RN(n472), .Q(n2065), .QN(n1445)
         );
  DFFRX1 \hept_area_reg[7]  ( .D(n1607), .CK(clk), .RN(n113), .Q(hept_area[7])
         );
  DFFRX2 \item1_cnt_reg[0]  ( .D(N2285), .CK(clk), .RN(n110), .Q(n2074), .QN(
        n1599) );
  DFFRX1 \reach_cnt_reg[0][0]  ( .D(n1823), .CK(clk), .RN(n112), .Q(
        \reach_cnt[0][0] ), .QN(n1870) );
  DFFRX1 \rd_cnt_reg[2]  ( .D(N674), .CK(clk), .RN(n110), .Q(rd_cnt[2]), .QN(
        n1852) );
  DFFRX1 \outer_cnt_reg[0]  ( .D(n1826), .CK(clk), .RN(n112), .Q(outer_cnt[0]), 
        .QN(n1865) );
  DFFRX1 \reach_cnt_reg[0][1]  ( .D(n1818), .CK(clk), .RN(n113), .Q(
        \reach_cnt[0][1] ), .QN(n1881) );
  DFFRX1 \reach_cnt_reg[4][2]  ( .D(n1812), .CK(clk), .RN(n113), .Q(
        \reach_cnt[4][2] ), .QN(n1885) );
  DFFRX1 \reach_cnt_reg[3][2]  ( .D(n1811), .CK(clk), .RN(n110), .Q(
        \reach_cnt[3][2] ), .QN(n1884) );
  DFFRX1 \hex_area_reg[3]  ( .D(n1228), .CK(clk), .RN(n113), .Q(hex_area[3])
         );
  DFFRX1 \reach_cnt_reg[1][2]  ( .D(n1809), .CK(clk), .RN(n112), .Q(
        \reach_cnt[1][2] ), .QN(n1882) );
  DFFRX1 \reach_cnt_reg[4][0]  ( .D(n1822), .CK(clk), .RN(n110), .Q(
        \reach_cnt[4][0] ), .QN(n1890) );
  DFFRX1 \reach_cnt_reg[3][1]  ( .D(n1816), .CK(clk), .RN(n110), .Q(
        \reach_cnt[3][1] ), .QN(n1877) );
  DFFRX1 \hept_area_reg[0]  ( .D(n1600), .CK(clk), .RN(n110), .Q(hept_area[0])
         );
  DFFRX1 \reach_cnt_reg[0][2]  ( .D(n1813), .CK(clk), .RN(n112), .Q(
        \reach_cnt[0][2] ), .QN(n1886) );
  DFFRX1 \outer_cnt_reg[1]  ( .D(n1825), .CK(clk), .RN(n113), .Q(outer_cnt[1]), 
        .QN(n1868) );
  DFFRX1 \hept_area_reg[17]  ( .D(n1617), .CK(clk), .RN(n113), .Q(
        hept_area[17]) );
  DFFRX1 \hept_area_reg[14]  ( .D(n1614), .CK(clk), .RN(n113), .Q(
        hept_area[14]) );
  DFFRX1 \hept_area_reg[5]  ( .D(n1605), .CK(clk), .RN(n110), .Q(hept_area[5])
         );
  DFFRX1 \hept_area_reg[16]  ( .D(n1616), .CK(clk), .RN(n110), .Q(
        hept_area[16]), .QN(n65) );
  DFFRX1 \hept_area_reg[9]  ( .D(n1609), .CK(clk), .RN(n112), .Q(hept_area[9]), 
        .QN(n58) );
  DFFRX1 \hept_area_reg[13]  ( .D(n1613), .CK(clk), .RN(n110), .Q(
        hept_area[13]), .QN(n57) );
  DFFRX1 \side_length_reg[6]  ( .D(n1221), .CK(clk), .RN(n112), .Q(
        side_length[6]), .QN(n924) );
  DFFRX1 \side_length_reg[4]  ( .D(n1219), .CK(clk), .RN(n110), .Q(
        side_length[4]), .QN(n922) );
  DFFRX1 \side_length_reg[7]  ( .D(n1222), .CK(clk), .RN(n113), .Q(
        side_length[7]) );
  DFFRX1 \side_length_reg[1]  ( .D(n1216), .CK(clk), .RN(n112), .Q(
        side_length[1]), .QN(n920) );
  DFFRX1 \side_length_reg[2]  ( .D(n1217), .CK(clk), .RN(n113), .Q(
        side_length[2]) );
  DFFRX1 \hex_area_reg[19]  ( .D(n1244), .CK(clk), .RN(n110), .Q(hex_area[19])
         );
  DFFRX1 \hex_area_reg[16]  ( .D(n1241), .CK(clk), .RN(n110), .Q(hex_area[16])
         );
  DFFRX1 \hex_area_reg[10]  ( .D(n1235), .CK(clk), .RN(n112), .Q(hex_area[10])
         );
  DFFRX1 \hex_area_reg[7]  ( .D(n1232), .CK(clk), .RN(n112), .Q(n68) );
  DFFRX1 \hex_area_reg[14]  ( .D(n1239), .CK(clk), .RN(n110), .Q(hex_area[14])
         );
  DFFRX1 \side_length_reg[9]  ( .D(n1224), .CK(clk), .RN(n112), .Q(
        side_length[9]), .QN(n929) );
  DFFRX1 \hept_area_reg[15]  ( .D(n1615), .CK(clk), .RN(n476), .Q(
        hept_area[15]) );
  DFFRX1 \hept_area_reg[6]  ( .D(n1606), .CK(clk), .RN(n476), .Q(hept_area[6])
         );
  DFFRX1 \hept_area_reg[10]  ( .D(n1610), .CK(clk), .RN(n476), .Q(
        hept_area[10]) );
  DFFRX2 \side_length_reg[3]  ( .D(n1218), .CK(clk), .RN(n475), .Q(
        side_length[3]) );
  DFFRX1 \hept_area_reg[18]  ( .D(n1618), .CK(clk), .RN(n475), .Q(
        hept_area[18]) );
  DFFRX2 \hept_area_reg[8]  ( .D(n1608), .CK(clk), .RN(n476), .Q(hept_area[8])
         );
  DFFRX1 \hept_area_reg[4]  ( .D(n1604), .CK(clk), .RN(n477), .Q(hept_area[4])
         );
  DFFRX2 \hept_area_reg[11]  ( .D(n1611), .CK(clk), .RN(n476), .Q(
        hept_area[11]) );
  DFFRX2 \hept_area_reg[3]  ( .D(n1603), .CK(clk), .RN(n477), .Q(hept_area[3])
         );
  DFFRX2 \hept_area_reg[12]  ( .D(n1612), .CK(clk), .RN(n476), .Q(
        hept_area[12]) );
  DFFRX2 \side_cnt_reg[1]  ( .D(n1621), .CK(clk), .RN(n110), .Q(side_cnt[1]), 
        .QN(n2079) );
  DFFRX4 \side_cnt_reg[2]  ( .D(n1620), .CK(clk), .RN(n480), .Q(side_cnt[2])
         );
  AO22X2 U6 ( .A0(N2639), .A1(n220), .B0(N2651), .B1(n1843), .Y(res1[6]) );
  AOI2BB2X2 U7 ( .B0(n1835), .B1(n1834), .A0N(n1837), .A1N(n1842), .Y(n1836)
         );
  OAI21X1 U8 ( .A0(n1830), .A1(n1829), .B0(n1828), .Y(n1835) );
  OAI222X1 U9 ( .A0(n209), .A1(n1827), .B0(n1839), .B1(n1827), .C0(n209), .C1(
        n1839), .Y(n1828) );
  AOI221X2 U10 ( .A0(n778), .A1(n1935), .B0(n159), .B1(n1934), .C0(n138), .Y(
        n135) );
  AOI221XL U11 ( .A0(n778), .A1(n1923), .B0(n159), .B1(n1922), .C0(n130), .Y(
        n127) );
  AOI221X4 U12 ( .A0(n778), .A1(n1917), .B0(n159), .B1(n1916), .C0(n126), .Y(
        n123) );
  BUFX4 U13 ( .A(n107), .Y(n778) );
  OAI22X4 U14 ( .A0(n1101), .A1(n981), .B0(side_A[10]), .B1(n981), .Y(n982) );
  AOI2BB2X4 U15 ( .B0(n983), .B1(n982), .A0N(n986), .A1N(n1101), .Y(n985) );
  CLKINVX2 U16 ( .A(n217), .Y(n1101) );
  NAND3X4 U17 ( .A(n163), .B(n170), .C(n173), .Y(n986) );
  OR2X1 U18 ( .A(n816), .B(n1076), .Y(n173) );
  OAI21X4 U19 ( .A0(n816), .A1(n1840), .B0(n1832), .Y(n1833) );
  CLKBUFX4 U20 ( .A(n141), .Y(n9) );
  BUFX20 U25 ( .A(side_sum[8]), .Y(n216) );
  BUFX20 U26 ( .A(n223), .Y(n5) );
  INVX20 U29 ( .A(n70), .Y(n155) );
  AND3X1 U30 ( .A(n5), .B(n2078), .C(n226), .Y(n109) );
  NOR2X6 U33 ( .A(n2078), .B(n5), .Y(n156) );
  CLKINVX6 U34 ( .A(n289), .Y(n52) );
  INVX3 U39 ( .A(n198), .Y(n289) );
  INVX12 U40 ( .A(n52), .Y(n53) );
  INVX4 U51 ( .A(n52), .Y(n54) );
  INVX3 U52 ( .A(n49), .Y(n6) );
  NOR2X4 U53 ( .A(n5), .B(n307), .Y(n157) );
  INVX20 U54 ( .A(n49), .Y(n153) );
  INVX12 U55 ( .A(n157), .Y(n152) );
  CLKBUFX8 U56 ( .A(n152), .Y(n49) );
  OAI21X2 U57 ( .A0(n816), .A1(n1076), .B0(n974), .Y(n981) );
  OAI21X2 U58 ( .A0(n971), .A1(n963), .B0(n962), .Y(n983) );
  OAI222X4 U59 ( .A0(n209), .A1(n961), .B0(n1075), .B1(n961), .C0(n209), .C1(
        n1075), .Y(n962) );
  OAI222X2 U60 ( .A0(n816), .A1(n1141), .B0(n1141), .B1(n1840), .C0(n816), 
        .C1(n1840), .Y(n1837) );
  OAI222X4 U61 ( .A0(side_B[8]), .A1(n1100), .B0(side_B[8]), .B1(n1102), .C0(
        n1102), .C1(n1100), .Y(n1141) );
  OAI222X2 U62 ( .A0(side_length[5]), .A1(n1098), .B0(side_length[5]), .B1(
        n892), .C0(n1098), .C1(n892), .Y(n896) );
  NAND2X4 U63 ( .A(n41), .B(n922), .Y(n892) );
  AO22X4 U64 ( .A0(n1162), .A1(n136), .B0(n31), .B1(n1838), .Y(n1356) );
  BUFX20 U65 ( .A(side_sum[0]), .Y(n136) );
  OAI22X4 U66 ( .A0(n1420), .A1(n56), .B0(n39), .B1(n123), .Y(side_B[6]) );
  OAI22X1 U67 ( .A0(n1421), .A1(n56), .B0(n39), .B1(n127), .Y(side_B[5]) );
  AOI221X1 U68 ( .A0(n775), .A1(n1929), .B0(n162), .B1(n1928), .C0(n134), .Y(
        n131) );
  CLKINVX8 U69 ( .A(side_sum[2]), .Y(n137) );
  AND3XL U70 ( .A(n5), .B(n307), .C(n226), .Y(n198) );
  BUFX8 U71 ( .A(n141), .Y(n10) );
  BUFX8 U72 ( .A(n141), .Y(n13) );
  OAI222X4 U73 ( .A0(side_A[8]), .A1(n1100), .B0(side_A[8]), .B1(n936), .C0(
        n936), .C1(n1100), .Y(n938) );
  NAND2BX4 U74 ( .AN(side_A[7]), .B(n145), .Y(n936) );
  OA22X1 U75 ( .A0(n1370), .A1(n125), .B0(n1381), .B1(n760), .Y(n189) );
  BUFX20 U77 ( .A(n167), .Y(n760) );
  AOI222X2 U78 ( .A0(n36), .A1(n1950), .B0(n772), .B1(n1946), .C0(n769), .C1(
        n1947), .Y(n190) );
  INVX20 U80 ( .A(n35), .Y(n36) );
  NOR2X6 U81 ( .A(n2078), .B(n226), .Y(n107) );
  NAND2X4 U82 ( .A(side_cnt[2]), .B(n2078), .Y(n167) );
  INVX4 U83 ( .A(n307), .Y(n2078) );
  OAI222X1 U84 ( .A0(n1368), .A1(n49), .B0(n1379), .B1(n2076), .C0(n1390), 
        .C1(n2077), .Y(n138) );
  NAND2BX4 U86 ( .AN(side_A[2]), .B(n13), .Y(n944) );
  NOR2BX4 U87 ( .AN(side_A[2]), .B(n140), .Y(n942) );
  OAI211X4 U88 ( .A0(n1391), .A1(n155), .B0(n186), .C0(n187), .Y(side_A[2]) );
  INVX20 U89 ( .A(n216), .Y(n1100) );
  NAND3BX4 U90 ( .AN(n217), .B(n916), .C(n911), .Y(N2631) );
  BUFX20 U91 ( .A(n148), .Y(n769) );
  BUFX6 U92 ( .A(n867), .Y(n14) );
  OAI22X1 U93 ( .A0(n951), .A1(n1098), .B0(side_A[5]), .B1(n951), .Y(n958) );
  OAI222X4 U94 ( .A0(side_A[5]), .A1(n1098), .B0(side_A[5]), .B1(n959), .C0(
        n1098), .C1(n959), .Y(n961) );
  OAI22X2 U95 ( .A0(n887), .A1(n1098), .B0(side_length[5]), .B1(n887), .Y(n891) );
  OAI222X4 U96 ( .A0(n48), .A1(n1098), .B0(n48), .B1(n1591), .C0(n1098), .C1(
        n1591), .Y(n1827) );
  INVX20 U97 ( .A(n45), .Y(n1098) );
  NOR2BX2 U98 ( .AN(side_length[7]), .B(n145), .Y(n871) );
  NAND2BX2 U99 ( .AN(side_length[7]), .B(n795), .Y(n866) );
  NAND2X6 U100 ( .A(n121), .B(n124), .Y(n1618) );
  NAND2X6 U101 ( .A(N2747), .B(n2083), .Y(n124) );
  OAI222X2 U102 ( .A0(n816), .A1(n14), .B0(n14), .B1(n929), .C0(n816), .C1(
        n929), .Y(n916) );
  CLKBUFX12 U103 ( .A(n166), .Y(n125) );
  NAND2X1 U104 ( .A(side_cnt[2]), .B(n307), .Y(n166) );
  AOI222X2 U105 ( .A0(n36), .A1(n1956), .B0(n772), .B1(n1952), .C0(n766), .C1(
        n1953), .Y(n196) );
  AOI222X4 U106 ( .A0(n37), .A1(n1944), .B0(n772), .B1(n1940), .C0(n766), .C1(
        n1941), .Y(n187) );
  AOI222X1 U107 ( .A0(n36), .A1(n1908), .B0(n772), .B1(n1904), .C0(n766), .C1(
        n1905), .Y(n169) );
  AOI222X1 U108 ( .A0(n37), .A1(n1902), .B0(n772), .B1(n1898), .C0(n766), .C1(
        n1899), .Y(n161) );
  AOI222X1 U109 ( .A0(n36), .A1(n1896), .B0(n772), .B1(n1892), .C0(n766), .C1(
        n1893), .Y(n193) );
  AOI222X1 U110 ( .A0(n37), .A1(n90), .B0(n772), .B1(n2004), .C0(n766), .C1(
        n2005), .Y(n1033) );
  BUFX8 U111 ( .A(n148), .Y(n766) );
  OAI222X2 U112 ( .A0(n1370), .A1(n152), .B0(n1381), .B1(n2076), .C0(n1392), 
        .C1(n2077), .Y(n146) );
  BUFX3 U113 ( .A(n71), .Y(n19) );
  OR3XL U114 ( .A(side_cnt[1]), .B(side_cnt[2]), .C(n307), .Y(n71) );
  CLKINVX20 U115 ( .A(n781), .Y(n20) );
  CLKINVX20 U116 ( .A(n20), .Y(n31) );
  CLKINVX20 U117 ( .A(n20), .Y(n32) );
  CLKINVX20 U118 ( .A(n20), .Y(n33) );
  NAND2BX2 U119 ( .AN(side_length[2]), .B(n140), .Y(n877) );
  INVX4 U120 ( .A(n137), .Y(n140) );
  BUFX16 U121 ( .A(side_B[0]), .Y(n34) );
  CLKINVX20 U122 ( .A(n149), .Y(n35) );
  CLKINVX20 U123 ( .A(n35), .Y(n37) );
  NAND2BX2 U124 ( .AN(n125), .B(n2079), .Y(n182) );
  BUFX20 U125 ( .A(n164), .Y(n772) );
  NOR2BX4 U126 ( .AN(n1029), .B(side_cnt[2]), .Y(n164) );
  AND3X2 U127 ( .A(n5), .B(n2078), .C(n226), .Y(n158) );
  NOR2X6 U128 ( .A(n1029), .B(n148), .Y(n226) );
  INVX20 U129 ( .A(n292), .Y(n2076) );
  CLKINVX12 U130 ( .A(n69), .Y(n2077) );
  INVX20 U131 ( .A(n220), .Y(n1843) );
  INVX3 U132 ( .A(n828), .Y(n38) );
  INVX4 U133 ( .A(n828), .Y(n39) );
  INVX6 U134 ( .A(n828), .Y(n821) );
  BUFX12 U135 ( .A(n182), .Y(n828) );
  CLKINVX1 U136 ( .A(n821), .Y(n176) );
  AOI221X4 U137 ( .A0(n793), .A1(n931), .B0(n886), .B1(n882), .C0(n881), .Y(
        n902) );
  OAI21X4 U138 ( .A0(n902), .A1(n901), .B0(n897), .Y(n906) );
  OAI21X1 U139 ( .A0(n209), .A1(n924), .B0(n891), .Y(n901) );
  CLKINVX20 U140 ( .A(n206), .Y(n40) );
  CLKINVX20 U141 ( .A(n40), .Y(n41) );
  CLKINVX20 U142 ( .A(n40), .Y(n42) );
  CLKINVX20 U143 ( .A(n40), .Y(n43) );
  OAI22X2 U144 ( .A0(n876), .A1(n794), .B0(side_length[3]), .B1(n876), .Y(n882) );
  NOR2BX4 U145 ( .AN(side_length[2]), .B(n10), .Y(n876) );
  OAI211X2 U146 ( .A0(n816), .A1(n929), .B0(n907), .C0(n906), .Y(n911) );
  OAI22X1 U147 ( .A0(n871), .A1(n1100), .B0(side_length[8]), .B1(n871), .Y(
        n907) );
  OAI222X4 U148 ( .A0(n209), .A1(n896), .B0(n924), .B1(n896), .C0(n209), .C1(
        n924), .Y(n897) );
  NAND2XL U149 ( .A(n42), .B(n1070), .Y(n959) );
  NOR2XL U150 ( .A(n1070), .B(n41), .Y(n951) );
  NAND2XL U151 ( .A(n43), .B(n128), .Y(n1591) );
  NOR2X2 U152 ( .A(n922), .B(n42), .Y(n887) );
  OAI222X2 U153 ( .A0(side_length[8]), .A1(n1100), .B0(side_length[8]), .B1(
        n866), .C0(n866), .C1(n1100), .Y(n867) );
  CLKINVX20 U154 ( .A(n208), .Y(n44) );
  CLKINVX20 U155 ( .A(n44), .Y(n45) );
  CLKINVX20 U156 ( .A(n44), .Y(n46) );
  CLKINVX20 U157 ( .A(n44), .Y(n47) );
  BUFX8 U158 ( .A(n165), .Y(n148) );
  BUFX8 U159 ( .A(side_B[5]), .Y(n48) );
  INVX8 U160 ( .A(side_sum[3]), .Y(n794) );
  AO22X2 U161 ( .A0(N2687), .A1(N2683), .B0(N2699), .B1(n1845), .Y(res3[2]) );
  OAI211X1 U162 ( .A0(n1389), .A1(n155), .B0(n180), .C0(n181), .Y(side_A[4])
         );
  OAI221X1 U163 ( .A0(n1567), .A1(n495), .B0(n1556), .B1(n422), .C0(n1205), 
        .Y(N2187) );
  OAI221X1 U164 ( .A0(n1567), .A1(n234), .B0(n1556), .B1(n67), .C0(n1183), .Y(
        N2217) );
  AO22X2 U165 ( .A0(N2688), .A1(N2683), .B0(N2700), .B1(n1845), .Y(res3[3]) );
  AO22X2 U166 ( .A0(N2689), .A1(N2683), .B0(N2701), .B1(n1845), .Y(res3[4]) );
  CLKINVX1 U167 ( .A(side_A[4]), .Y(n1070) );
  OA22X1 U168 ( .A0(n1371), .A1(n125), .B0(n1382), .B1(n760), .Y(n195) );
  OAI211X1 U169 ( .A0(n1514), .A1(n155), .B0(n1034), .C0(n1035), .Y(N2487) );
  BUFX4 U170 ( .A(side_sum[5]), .Y(n208) );
  CLKINVX1 U171 ( .A(side_B[1]), .Y(n1838) );
  NAND2BX1 U172 ( .AN(side_B[2]), .B(n13), .Y(n1166) );
  NOR2BX1 U173 ( .AN(side_B[2]), .B(n13), .Y(n1163) );
  CLKBUFX3 U174 ( .A(N2683), .Y(n225) );
  NAND2X2 U175 ( .A(n114), .B(n116), .Y(side_B[7]) );
  OR2X1 U176 ( .A(n821), .B(n119), .Y(n116) );
  AOI221XL U177 ( .A0(n775), .A1(n1911), .B0(n162), .B1(n1910), .C0(n122), .Y(
        n119) );
  CLKBUFX3 U178 ( .A(side_sum[4]), .Y(n206) );
  INVX3 U179 ( .A(n137), .Y(n141) );
  OR2X2 U180 ( .A(n938), .B(n1076), .Y(n170) );
  OR2X2 U181 ( .A(n816), .B(n938), .Y(n163) );
  NOR2BX2 U182 ( .AN(side_A[7]), .B(n145), .Y(n973) );
  NAND2BX1 U183 ( .AN(side_B[7]), .B(n145), .Y(n1102) );
  INVX6 U184 ( .A(N2683), .Y(n1845) );
  AO22X1 U185 ( .A0(N2669), .A1(n221), .B0(N2681), .B1(n1844), .Y(res2[10]) );
  BUFX4 U186 ( .A(side_sum[7]), .Y(n795) );
  INVX6 U187 ( .A(n19), .Y(n149) );
  BUFX4 U188 ( .A(n158), .Y(n159) );
  AO22X1 U189 ( .A0(N2540), .A1(n176), .B0(N2499), .B1(heptarea_done), .Y(
        diff_x[6]) );
  AO22X1 U190 ( .A0(N2541), .A1(n828), .B0(N2500), .B1(heptarea_done), .Y(
        diff_x[7]) );
  AO22X1 U191 ( .A0(N2543), .A1(n828), .B0(N2502), .B1(heptarea_done), .Y(
        diff_x[9]) );
  INVX3 U192 ( .A(n831), .Y(heptarea_done) );
  NOR2X1 U193 ( .A(n2079), .B(n307), .Y(n165) );
  CLKAND2X3 U194 ( .A(n307), .B(n2079), .Y(n1029) );
  NAND2X1 U195 ( .A(cur_state[1]), .B(n224), .Y(n222) );
  INVX3 U196 ( .A(n222), .Y(n2083) );
  CLKBUFX3 U197 ( .A(n2082), .Y(n304) );
  CLKINVX1 U198 ( .A(n1516), .Y(n2012) );
  CLKINVX1 U199 ( .A(n1490), .Y(n1974) );
  CLKINVX1 U200 ( .A(n1489), .Y(n1968) );
  CLKINVX1 U201 ( .A(n1499), .Y(n1972) );
  CLKINVX1 U202 ( .A(n1430), .Y(n2031) );
  CLKINVX1 U203 ( .A(n1429), .Y(n2025) );
  CLKINVX1 U204 ( .A(n1439), .Y(n2029) );
  CLKINVX1 U205 ( .A(n1498), .Y(n1966) );
  CLKINVX1 U206 ( .A(n1488), .Y(n1962) );
  NAND2X1 U207 ( .A(hept_area[18]), .B(n304), .Y(n121) );
  OAI222X2 U208 ( .A0(n1367), .A1(n152), .B0(n1378), .B1(n2076), .C0(n1389), 
        .C1(n2077), .Y(n134) );
  OA22XL U209 ( .A0(n1369), .A1(n125), .B0(n1380), .B1(n760), .Y(n186) );
  OA22XL U210 ( .A0(n1368), .A1(n125), .B0(n1379), .B1(n760), .Y(n183) );
  OA22XL U211 ( .A0(n1367), .A1(n125), .B0(n1378), .B1(n760), .Y(n180) );
  OA22XL U212 ( .A0(n1366), .A1(n125), .B0(n1377), .B1(n760), .Y(n177) );
  NOR2X8 U213 ( .A(n226), .B(n307), .Y(n69) );
  CLKBUFX2 U214 ( .A(n107), .Y(n50) );
  CLKBUFX2 U215 ( .A(n107), .Y(n51) );
  BUFX8 U216 ( .A(n107), .Y(n775) );
  BUFX12 U217 ( .A(side_cnt[0]), .Y(n307) );
  AND2X8 U218 ( .A(n289), .B(n182), .Y(n56) );
  INVX12 U219 ( .A(n795), .Y(n144) );
  CLKBUFX2 U220 ( .A(n182), .Y(n831) );
  CLKBUFX2 U221 ( .A(n182), .Y(n859) );
  AND2X2 U222 ( .A(side_cnt[1]), .B(n307), .Y(n70) );
  AO22X2 U223 ( .A0(N2670), .A1(n221), .B0(N2682), .B1(n1844), .Y(res2[11]) );
  INVX3 U224 ( .A(n128), .Y(n129) );
  CLKINVX1 U225 ( .A(side_B[4]), .Y(n128) );
  AND2X2 U226 ( .A(n2074), .B(n2075), .Y(n72) );
  CLKBUFX2 U227 ( .A(res4[10]), .Y(n73) );
  NOR3X1 U228 ( .A(\reach_cnt[4][1] ), .B(\reach_cnt[4][2] ), .C(n1890), .Y(
        n819) );
  NOR3X1 U229 ( .A(n1887), .B(\reach_cnt[1][2] ), .C(n1871), .Y(n733) );
  NOR3X1 U230 ( .A(\reach_cnt[1][0] ), .B(\reach_cnt[1][2] ), .C(n1871), .Y(
        n784) );
  INVXL U231 ( .A(n59), .Y(n74) );
  INVXL U232 ( .A(n65), .Y(n75) );
  INVXL U233 ( .A(n57), .Y(n76) );
  INVXL U234 ( .A(n58), .Y(n77) );
  INVXL U235 ( .A(n64), .Y(n78) );
  INVXL U236 ( .A(n61), .Y(n79) );
  INVXL U237 ( .A(n62), .Y(n80) );
  NOR3X1 U238 ( .A(n1889), .B(n1884), .C(n1877), .Y(n912) );
  INVXL U239 ( .A(n66), .Y(n81) );
  INVXL U240 ( .A(n63), .Y(n82) );
  AOI221X1 U241 ( .A0(\reach_cnt[0][0] ), .A1(n179), .B0(\reach_cnt[4][0] ), 
        .B1(outer_cnt[2]), .C0(n975), .Y(n957) );
  NOR3X1 U242 ( .A(\reach_cnt[4][1] ), .B(\reach_cnt[4][2] ), .C(
        \reach_cnt[4][0] ), .Y(n856) );
  INVXL U243 ( .A(n60), .Y(n83) );
  NAND3XL U244 ( .A(n1890), .B(n1878), .C(\reach_cnt[4][2] ), .Y(n934) );
  NAND3XL U245 ( .A(n1865), .B(n1868), .C(outer_cnt[2]), .Y(n980) );
  AND3X1 U246 ( .A(n1868), .B(n422), .C(n1865), .Y(n179) );
  AOI31XL U247 ( .A0(\reach_cnt[0][0] ), .A1(\reach_cnt[0][2] ), .A2(
        \reach_cnt[0][1] ), .B0(n921), .Y(n923) );
  INVXL U248 ( .A(n1543), .Y(n84) );
  INVXL U249 ( .A(n1483), .Y(n85) );
  INVXL U250 ( .A(n1542), .Y(n86) );
  INVXL U251 ( .A(n1482), .Y(n87) );
  OAI31X1 U252 ( .A0(n2090), .A1(cur_state[0]), .A2(n2089), .B0(n295), .Y(n224) );
  INVXL U253 ( .A(n1541), .Y(n88) );
  INVXL U254 ( .A(n1481), .Y(n89) );
  INVXL U255 ( .A(n1545), .Y(n90) );
  INVXL U256 ( .A(n1485), .Y(n91) );
  AO22XL U257 ( .A0(n75), .A1(n304), .B0(N2745), .B1(n2083), .Y(n1616) );
  AO22XL U258 ( .A0(n76), .A1(n304), .B0(N2742), .B1(n2083), .Y(n1613) );
  AO22XL U259 ( .A0(hept_area[7]), .A1(n304), .B0(N2736), .B1(n2083), .Y(n1607) );
  AO22XL U260 ( .A0(n77), .A1(n304), .B0(N2738), .B1(n2083), .Y(n1609) );
  NAND3XL U261 ( .A(n1889), .B(n1877), .C(\reach_cnt[3][2] ), .Y(n933) );
  INVXL U262 ( .A(n1544), .Y(n92) );
  INVXL U263 ( .A(n1484), .Y(n93) );
  INVXL U264 ( .A(n1539), .Y(n94) );
  INVXL U265 ( .A(n1479), .Y(n95) );
  INVXL U266 ( .A(n1478), .Y(n96) );
  INVXL U267 ( .A(n1538), .Y(n97) );
  NAND3XL U268 ( .A(\reach_cnt[4][0] ), .B(n1885), .C(\reach_cnt[4][1] ), .Y(
        n738) );
  NAND3XL U269 ( .A(n1890), .B(n1885), .C(\reach_cnt[4][1] ), .Y(n788) );
  INVXL U270 ( .A(n1540), .Y(n98) );
  INVXL U271 ( .A(n1480), .Y(n99) );
  NAND3XL U272 ( .A(n1888), .B(n1874), .C(\reach_cnt[2][2] ), .Y(n930) );
  INVXL U273 ( .A(n1546), .Y(n100) );
  INVXL U274 ( .A(n1546), .Y(n101) );
  CLKINVX1 U275 ( .A(\X[0][0] ), .Y(n102) );
  INVXL U276 ( .A(n102), .Y(n103) );
  INVXL U277 ( .A(n102), .Y(n104) );
  INVXL U278 ( .A(n102), .Y(n105) );
  OAI31XL U279 ( .A0(n1871), .A1(n1882), .A2(n1887), .B0(n918), .Y(n921) );
  NOR3XL U280 ( .A(n1871), .B(n1882), .C(n1887), .Y(n919) );
  NOR3XL U281 ( .A(n1888), .B(n1883), .C(n1874), .Y(n913) );
  NAND3XL U282 ( .A(n1874), .B(n1883), .C(n1888), .Y(n855) );
  NAND3XL U283 ( .A(n1888), .B(n1883), .C(\reach_cnt[2][1] ), .Y(n785) );
  AOI22XL U284 ( .A0(n2068), .A1(n159), .B0(n2069), .B1(n778), .Y(n1009) );
  AOI22XL U285 ( .A0(n2010), .A1(n159), .B0(n2011), .B1(n778), .Y(n989) );
  AND3X1 U286 ( .A(n1597), .B(n1598), .C(n2074), .Y(n1073) );
  AND3X1 U287 ( .A(n1597), .B(n1598), .C(n2074), .Y(n265) );
  INVX3 U288 ( .A(n2091), .Y(n108) );
  INVX16 U289 ( .A(n108), .Y(n110) );
  INVX16 U290 ( .A(n108), .Y(n112) );
  INVX16 U291 ( .A(n108), .Y(n113) );
  OAI211X4 U292 ( .A0(n1486), .A1(n53), .B0(n1009), .C0(n1010), .Y(N2533) );
  OAI211X4 U293 ( .A0(n1384), .A1(n155), .B0(n160), .C0(n161), .Y(side_A[9])
         );
  OR2X1 U294 ( .A(n1419), .B(n56), .Y(n114) );
  AO22X4 U295 ( .A0(N2696), .A1(N2683), .B0(N2708), .B1(n301), .Y(res3[11]) );
  OR2X4 U296 ( .A(n1425), .B(n56), .Y(n117) );
  OR2X6 U297 ( .A(n39), .B(n143), .Y(n120) );
  NAND2X8 U298 ( .A(n117), .B(n120), .Y(side_B[1]) );
  AO22X1 U299 ( .A0(N2666), .A1(n221), .B0(N2678), .B1(n1844), .Y(res2[7]) );
  OAI22X1 U300 ( .A0(n1422), .A1(n56), .B0(n821), .B1(n131), .Y(side_B[4]) );
  OAI222X2 U301 ( .A0(n1371), .A1(n152), .B0(n1382), .B1(n2076), .C0(n1393), 
        .C1(n2077), .Y(n154) );
  AOI221X2 U302 ( .A0(n50), .A1(n1947), .B0(n159), .B1(n1946), .C0(n146), .Y(
        n143) );
  AO22X4 U303 ( .A0(N2695), .A1(N2683), .B0(N2707), .B1(n301), .Y(res3[10]) );
  OAI22X4 U304 ( .A0(n1424), .A1(n56), .B0(n821), .B1(n139), .Y(side_B[2]) );
  BUFX8 U305 ( .A(res1[0]), .Y(n132) );
  AO22X1 U306 ( .A0(N2633), .A1(n220), .B0(N2645), .B1(n1843), .Y(res1[0]) );
  OAI22X4 U307 ( .A0(n1423), .A1(n56), .B0(n821), .B1(n135), .Y(side_B[3]) );
  AOI221X2 U308 ( .A0(n107), .A1(n1953), .B0(n162), .B1(n1952), .C0(n154), .Y(
        n151) );
  CLKBUFX2 U309 ( .A(n1845), .Y(n301) );
  OAI221X4 U310 ( .A0(side_B[10]), .A1(n1837), .B0(side_B[10]), .B1(n1842), 
        .C0(n1836), .Y(N2683) );
  CLKBUFX4 U311 ( .A(side_sum[0]), .Y(n133) );
  AO22X4 U312 ( .A0(N2668), .A1(n221), .B0(N2680), .B1(n1844), .Y(res2[9]) );
  INVX20 U313 ( .A(n221), .Y(n1844) );
  BUFX20 U314 ( .A(side_sum[9]), .Y(n816) );
  CLKINVX20 U315 ( .A(n144), .Y(n145) );
  OAI22X1 U316 ( .A0(n1831), .A1(n1100), .B0(side_B[8]), .B1(n1831), .Y(n1832)
         );
  AO22X1 U317 ( .A0(N2664), .A1(n221), .B0(N2676), .B1(n1844), .Y(res2[5]) );
  OAI22X1 U318 ( .A0(n1842), .A1(n1833), .B0(side_B[10]), .B1(n1833), .Y(n1834) );
  OAI22X1 U319 ( .A0(n973), .A1(n1100), .B0(side_A[8]), .B1(n973), .Y(n974) );
  OAI222X1 U320 ( .A0(n1369), .A1(n152), .B0(n1380), .B1(n2076), .C0(n1391), 
        .C1(n2077), .Y(n142) );
  BUFX20 U321 ( .A(n156), .Y(n292) );
  OAI211X4 U322 ( .A0(n1392), .A1(n155), .B0(n189), .C0(n190), .Y(side_A[1])
         );
  OAI211X4 U323 ( .A0(n1390), .A1(n155), .B0(n183), .C0(n184), .Y(side_A[3])
         );
  OAI211X4 U324 ( .A0(n1387), .A1(n155), .B0(n174), .C0(n175), .Y(side_A[6])
         );
  OAI211X4 U325 ( .A0(n1383), .A1(n155), .B0(n192), .C0(n193), .Y(side_A[10])
         );
  OAI211X4 U326 ( .A0(n1516), .A1(n155), .B0(n1030), .C0(n1031), .Y(N2489) );
  AO22X1 U327 ( .A0(N2662), .A1(n221), .B0(N2674), .B1(n1844), .Y(res2[3]) );
  OAI22X4 U328 ( .A0(n1426), .A1(n56), .B0(n38), .B1(n151), .Y(side_B[0]) );
  AOI221X4 U329 ( .A0(n51), .A1(n1941), .B0(n162), .B1(n1940), .C0(n142), .Y(
        n139) );
  BUFX12 U330 ( .A(n109), .Y(n162) );
  BUFX16 U331 ( .A(N2657), .Y(n221) );
  INVX12 U332 ( .A(n794), .Y(n793) );
  AO22X1 U333 ( .A0(N2660), .A1(n221), .B0(N2672), .B1(n1844), .Y(res2[1]) );
  AO22XL U334 ( .A0(N2661), .A1(n221), .B0(N2673), .B1(n1844), .Y(res2[2]) );
  AO22XL U335 ( .A0(N2663), .A1(n221), .B0(N2675), .B1(n1844), .Y(res2[4]) );
  INVXL U336 ( .A(side_A[6]), .Y(n1075) );
  OAI21XL U337 ( .A0(n209), .A1(n1075), .B0(n958), .Y(n963) );
  AOI221XL U338 ( .A0(n793), .A1(n1095), .B0(n950), .B1(n948), .C0(n946), .Y(
        n971) );
  AO22XL U339 ( .A0(N2685), .A1(N2683), .B0(N2697), .B1(n1845), .Y(res3[0]) );
  OAI22XL U340 ( .A0(n942), .A1(n794), .B0(side_A[3]), .B1(n942), .Y(n948) );
  OAI22XL U341 ( .A0(side_A[3]), .A1(n794), .B0(side_A[3]), .B1(n944), .Y(n946) );
  AOI2BB1XL U342 ( .A0N(n987), .A1N(n31), .B0(side_A[0]), .Y(n939) );
  INVXL U343 ( .A(side_A[1]), .Y(n987) );
  BUFX8 U344 ( .A(N2631), .Y(n220) );
  AO22X1 U345 ( .A0(N2570), .A1(n176), .B0(N2510), .B1(heptarea_done), .Y(
        diff_y[6]) );
  INVXL U346 ( .A(side_A[9]), .Y(n1076) );
  OAI221X2 U347 ( .A0(side_A[10]), .A1(n986), .B0(side_A[10]), .B1(n1101), 
        .C0(n985), .Y(N2657) );
  BUFX12 U348 ( .A(side_sum[6]), .Y(n209) );
  AO22X4 U349 ( .A0(N2686), .A1(N2683), .B0(N2698), .B1(n1845), .Y(res3[1]) );
  AO22XL U350 ( .A0(N2667), .A1(n221), .B0(N2679), .B1(n1844), .Y(res2[8]) );
  AO22XL U351 ( .A0(N2665), .A1(n221), .B0(N2677), .B1(n1844), .Y(res2[6]) );
  BUFX8 U352 ( .A(side_sum[1]), .Y(n781) );
  INVX3 U353 ( .A(n944), .Y(n1095) );
  NOR2BX1 U354 ( .AN(n914), .B(n921), .Y(n402) );
  NOR2BX1 U355 ( .AN(n854), .B(n855), .Y(n376) );
  NAND3BX1 U356 ( .AN(n857), .B(n854), .C(n855), .Y(n379) );
  NOR2X1 U357 ( .A(n754), .B(n853), .Y(n377) );
  BUFX12 U358 ( .A(side_sum[10]), .Y(n217) );
  NOR2XL U359 ( .A(n128), .B(n43), .Y(n1358) );
  AOI2BB1XL U360 ( .A0N(n1838), .A1N(n32), .B0(n34), .Y(n1162) );
  AO22XL U361 ( .A0(N2569), .A1(n828), .B0(N2509), .B1(heptarea_done), .Y(
        diff_y[5]) );
  AO22XL U362 ( .A0(N2573), .A1(n859), .B0(N2513), .B1(heptarea_done), .Y(
        diff_y[9]) );
  AOI22XL U363 ( .A0(n2004), .A1(n162), .B0(n2005), .B1(n775), .Y(n991) );
  AOI22XL U364 ( .A0(n2062), .A1(n162), .B0(n2063), .B1(n778), .Y(n1011) );
  CLKINVX1 U365 ( .A(n203), .Y(n273) );
  NOR2X1 U366 ( .A(n820), .B(n314), .Y(n914) );
  NOR2BX1 U367 ( .AN(n914), .B(n915), .Y(n410) );
  NAND4BX1 U368 ( .AN(n912), .B(n913), .C(n914), .D(n915), .Y(n407) );
  CLKINVX1 U369 ( .A(n204), .Y(n757) );
  AOI21X1 U370 ( .A0(n1851), .A1(n861), .B0(n2087), .Y(n853) );
  NOR3BXL U371 ( .AN(n785), .B(n786), .C(n787), .Y(n783) );
  NOR3BXL U372 ( .AN(n819), .B(n820), .C(n1849), .Y(n346) );
  NOR3BXL U373 ( .AN(n730), .B(n1875), .C(n733), .Y(n278) );
  NOR2BX1 U374 ( .AN(n817), .B(n818), .Y(n347) );
  NOR2X1 U375 ( .A(n754), .B(n1849), .Y(n348) );
  NOR2BX1 U376 ( .AN(n729), .B(n754), .Y(n280) );
  NOR2X1 U377 ( .A(n738), .B(n737), .Y(n281) );
  NOR2BX1 U378 ( .AN(n730), .B(n731), .Y(n279) );
  NOR2BX1 U379 ( .AN(n783), .B(n784), .Y(n319) );
  CLKINVX1 U380 ( .A(n820), .Y(n2088) );
  NAND3X1 U381 ( .A(n730), .B(n731), .C(n733), .Y(n283) );
  NAND3X1 U382 ( .A(n822), .B(n818), .C(n817), .Y(n350) );
  NAND2BX1 U383 ( .AN(n787), .B(n786), .Y(n322) );
  CLKINVX1 U384 ( .A(n789), .Y(n1846) );
  CLKINVX1 U385 ( .A(n739), .Y(n1850) );
  NOR3BXL U386 ( .AN(n856), .B(n820), .C(n853), .Y(n375) );
  NOR3X1 U387 ( .A(n928), .B(n1876), .C(n930), .Y(n233) );
  NAND3X1 U388 ( .A(n934), .B(n927), .C(n2088), .Y(n928) );
  NOR2X1 U389 ( .A(n933), .B(n928), .Y(n236) );
  NOR2BX1 U390 ( .AN(n782), .B(n754), .Y(n320) );
  NOR2BX1 U391 ( .AN(n927), .B(n754), .Y(n235) );
  NOR4X1 U392 ( .A(n928), .B(n1876), .C(n1873), .D(n932), .Y(n232) );
  NAND4BX1 U393 ( .AN(n928), .B(n932), .C(n933), .D(n930), .Y(n238) );
  NAND3BX1 U394 ( .AN(n788), .B(n2088), .C(n782), .Y(n321) );
  NAND2X1 U395 ( .A(n757), .B(n917), .Y(n406) );
  OA21XL U396 ( .A0(n820), .A1(n934), .B0(n927), .Y(n229) );
  XOR2X4 U397 ( .A(n155), .B(side_cnt[2]), .Y(n223) );
  AO22X4 U398 ( .A0(hept_area[19]), .A1(n304), .B0(N2748), .B1(n2083), .Y(
        n1619) );
  OAI22X1 U399 ( .A0(n1417), .A1(n56), .B0(n821), .B1(n106), .Y(side_B[9]) );
  AOI2BB1XL U400 ( .A0N(n920), .A1N(n33), .B0(side_length[0]), .Y(n872) );
  OAI211XL U401 ( .A0(n1515), .A1(n155), .B0(n1032), .C0(n1033), .Y(N2488) );
  OA22XL U402 ( .A0(n1495), .A1(n125), .B0(n1505), .B1(n763), .Y(n1032) );
  AO22XL U403 ( .A0(side_length[0]), .A1(n298), .B0(root[0]), .B1(n2086), .Y(
        n1215) );
  OAI211XL U404 ( .A0(n1541), .A1(n53), .B0(n999), .C0(n1000), .Y(N2558) );
  AOI22XL U405 ( .A0(n1981), .A1(n162), .B0(n1982), .B1(n775), .Y(n999) );
  OAI211XL U406 ( .A0(n1542), .A1(n53), .B0(n997), .C0(n998), .Y(N2559) );
  AOI22XL U407 ( .A0(n1987), .A1(n159), .B0(n1988), .B1(n778), .Y(n997) );
  OAI211XL U408 ( .A0(n1543), .A1(n54), .B0(n995), .C0(n996), .Y(N2560) );
  AOI22XL U409 ( .A0(n1993), .A1(n159), .B0(n1994), .B1(n778), .Y(n995) );
  OAI211XL U410 ( .A0(n1544), .A1(n53), .B0(n993), .C0(n994), .Y(N2561) );
  AOI22XL U411 ( .A0(n1999), .A1(n162), .B0(n2000), .B1(n778), .Y(n993) );
  OAI211XL U412 ( .A0(n1513), .A1(n155), .B0(n1036), .C0(n1037), .Y(N2486) );
  OA22XL U413 ( .A0(n1493), .A1(n125), .B0(n1503), .B1(n763), .Y(n1036) );
  OA22XL U414 ( .A0(n1494), .A1(n125), .B0(n1504), .B1(n763), .Y(n1034) );
  AO22XL U415 ( .A0(side_length[1]), .A1(n298), .B0(root[1]), .B1(n2086), .Y(
        n1216) );
  AO22XL U416 ( .A0(side_length[2]), .A1(n298), .B0(root[2]), .B1(n2086), .Y(
        n1217) );
  AO22XL U417 ( .A0(side_length[3]), .A1(n298), .B0(root[3]), .B1(n2086), .Y(
        n1218) );
  AO22XL U418 ( .A0(side_length[4]), .A1(n298), .B0(root[4]), .B1(n2086), .Y(
        n1219) );
  AO22XL U419 ( .A0(side_length[5]), .A1(n298), .B0(root[5]), .B1(n2086), .Y(
        n1220) );
  OAI221XL U420 ( .A0(n1568), .A1(n495), .B0(n1557), .B1(n422), .C0(n1204), 
        .Y(N2188) );
  OAI221XL U421 ( .A0(n1566), .A1(n495), .B0(n1555), .B1(n426), .C0(n1206), 
        .Y(N2186) );
  OAI211XL U422 ( .A0(n1446), .A1(n371), .B0(n725), .C0(n726), .Y(n1767) );
  AOI2BB2XL U423 ( .B0(n650), .B1(n2067), .A0N(n1466), .A1N(n644), .Y(n725) );
  OAI211XL U424 ( .A0(n1466), .A1(n619), .B0(n814), .C0(n815), .Y(n1787) );
  AOI2BB2XL U425 ( .B0(n349), .B1(n2071), .A0N(n1476), .A1N(n553), .Y(n814) );
  OAI211XL U426 ( .A0(n1476), .A1(n547), .B0(n851), .C0(n852), .Y(n1797) );
  AOI2BB2XL U427 ( .B0(n528), .B1(n2071), .A0N(n1466), .A1N(n524), .Y(n851) );
  OAI211XL U428 ( .A0(n1436), .A1(n682), .B0(n925), .C0(n926), .Y(n1808) );
  AOI2BB2XL U429 ( .B0(n670), .B1(n2071), .A0N(n1466), .A1N(n666), .Y(n925) );
  OAI211XL U430 ( .A0(n1445), .A1(n371), .B0(n722), .C0(n723), .Y(n1766) );
  AOI2BB2XL U431 ( .B0(n649), .B1(n2061), .A0N(n1465), .A1N(n644), .Y(n722) );
  OAI211XL U432 ( .A0(n1465), .A1(n615), .B0(n812), .C0(n813), .Y(n1786) );
  AOI2BB2XL U433 ( .B0(n349), .B1(n2065), .A0N(n1475), .A1N(n553), .Y(n812) );
  OAI211XL U434 ( .A0(n1475), .A1(n550), .B0(n849), .C0(n850), .Y(n1796) );
  AOI2BB2XL U435 ( .B0(n528), .B1(n2065), .A0N(n1465), .A1N(n527), .Y(n849) );
  OAI211XL U436 ( .A0(n1435), .A1(n681), .B0(n693), .C0(n694), .Y(n1757) );
  AOI2BB2XL U437 ( .B0(n667), .B1(n2065), .A0N(n1465), .A1N(n666), .Y(n693) );
  OAI211XL U438 ( .A0(n1444), .A1(n371), .B0(n719), .C0(n720), .Y(n1765) );
  AOI2BB2XL U439 ( .B0(n281), .B1(n2055), .A0N(n1464), .A1N(n644), .Y(n719) );
  OAI211XL U440 ( .A0(n1464), .A1(n619), .B0(n810), .C0(n811), .Y(n1785) );
  AOI2BB2XL U441 ( .B0(n349), .B1(n2059), .A0N(n1474), .A1N(n553), .Y(n810) );
  OAI211XL U442 ( .A0(n1474), .A1(n372), .B0(n847), .C0(n848), .Y(n1795) );
  AOI2BB2XL U443 ( .B0(n528), .B1(n2059), .A0N(n1464), .A1N(n524), .Y(n847) );
  OAI211XL U444 ( .A0(n1434), .A1(n682), .B0(n688), .C0(n689), .Y(n1756) );
  AOI2BB2XL U445 ( .B0(n670), .B1(n2059), .A0N(n1464), .A1N(n666), .Y(n688) );
  OAI211XL U446 ( .A0(n1443), .A1(n371), .B0(n716), .C0(n717), .Y(n1764) );
  AOI2BB2XL U447 ( .B0(n281), .B1(n2049), .A0N(n1463), .A1N(n644), .Y(n716) );
  OAI211XL U448 ( .A0(n1463), .A1(n615), .B0(n808), .C0(n809), .Y(n1784) );
  AOI2BB2XL U449 ( .B0(n349), .B1(n2053), .A0N(n1473), .A1N(n553), .Y(n808) );
  OAI211XL U450 ( .A0(n1473), .A1(n372), .B0(n845), .C0(n846), .Y(n1794) );
  AOI2BB2XL U451 ( .B0(n528), .B1(n2053), .A0N(n1463), .A1N(n527), .Y(n845) );
  OAI211XL U452 ( .A0(n1433), .A1(n681), .B0(n683), .C0(n684), .Y(n1755) );
  AOI2BB2XL U453 ( .B0(n667), .B1(n2053), .A0N(n1463), .A1N(n666), .Y(n683) );
  OAI211XL U454 ( .A0(n1442), .A1(n371), .B0(n713), .C0(n714), .Y(n1763) );
  AOI2BB2XL U455 ( .B0(n281), .B1(n2043), .A0N(n1462), .A1N(n644), .Y(n713) );
  OAI211XL U456 ( .A0(n1462), .A1(n343), .B0(n806), .C0(n807), .Y(n1783) );
  AOI2BB2XL U457 ( .B0(n349), .B1(n2047), .A0N(n1472), .A1N(n553), .Y(n806) );
  OAI211XL U458 ( .A0(n1472), .A1(n372), .B0(n843), .C0(n844), .Y(n1793) );
  AOI2BB2XL U459 ( .B0(n528), .B1(n2047), .A0N(n1462), .A1N(n379), .Y(n843) );
  OAI211XL U460 ( .A0(n1432), .A1(n229), .B0(n678), .C0(n679), .Y(n1754) );
  AOI2BB2XL U461 ( .B0(n236), .B1(n2047), .A0N(n1462), .A1N(n666), .Y(n678) );
  OAI211XL U462 ( .A0(n1441), .A1(n371), .B0(n710), .C0(n711), .Y(n1762) );
  AOI2BB2XL U463 ( .B0(n650), .B1(n2037), .A0N(n1461), .A1N(n644), .Y(n710) );
  OAI211XL U464 ( .A0(n1461), .A1(n619), .B0(n804), .C0(n805), .Y(n1782) );
  AOI2BB2XL U465 ( .B0(n349), .B1(n2041), .A0N(n1471), .A1N(n553), .Y(n804) );
  OAI211XL U466 ( .A0(n1471), .A1(n550), .B0(n841), .C0(n842), .Y(n1792) );
  AOI2BB2XL U467 ( .B0(n528), .B1(n2041), .A0N(n1461), .A1N(n524), .Y(n841) );
  OAI211XL U468 ( .A0(n1431), .A1(n682), .B0(n673), .C0(n674), .Y(n1753) );
  AOI2BB2XL U469 ( .B0(n670), .B1(n2041), .A0N(n1461), .A1N(n666), .Y(n673) );
  OAI211XL U470 ( .A0(n1440), .A1(n371), .B0(n707), .C0(n708), .Y(n1761) );
  AOI2BB2XL U471 ( .B0(n650), .B1(n2031), .A0N(n1460), .A1N(n644), .Y(n707) );
  OAI211XL U472 ( .A0(n1460), .A1(n619), .B0(n802), .C0(n803), .Y(n1781) );
  AOI2BB2XL U473 ( .B0(n349), .B1(n2035), .A0N(n1470), .A1N(n553), .Y(n802) );
  OAI211XL U474 ( .A0(n1470), .A1(n550), .B0(n839), .C0(n840), .Y(n1791) );
  AOI2BB2XL U475 ( .B0(n528), .B1(n2035), .A0N(n1460), .A1N(n527), .Y(n839) );
  OAI211XL U476 ( .A0(n1430), .A1(n682), .B0(n668), .C0(n669), .Y(n1752) );
  AOI2BB2XL U477 ( .B0(n670), .B1(n2035), .A0N(n1460), .A1N(n666), .Y(n668) );
  OAI211XL U478 ( .A0(n1439), .A1(n371), .B0(n704), .C0(n705), .Y(n1760) );
  AOI2BB2XL U479 ( .B0(n650), .B1(n2025), .A0N(n1459), .A1N(n644), .Y(n704) );
  OAI211XL U480 ( .A0(n1459), .A1(n619), .B0(n800), .C0(n801), .Y(n1780) );
  AOI2BB2XL U481 ( .B0(n559), .B1(n2029), .A0N(n1469), .A1N(n553), .Y(n800) );
  OAI211XL U482 ( .A0(n1469), .A1(n550), .B0(n837), .C0(n838), .Y(n1790) );
  AOI2BB2XL U483 ( .B0(n528), .B1(n2029), .A0N(n1459), .A1N(n527), .Y(n837) );
  OAI211XL U484 ( .A0(n1429), .A1(n682), .B0(n663), .C0(n664), .Y(n1751) );
  AOI2BB2XL U485 ( .B0(n670), .B1(n2029), .A0N(n1459), .A1N(n665), .Y(n663) );
  OAI211XL U486 ( .A0(n1438), .A1(n371), .B0(n701), .C0(n702), .Y(n1759) );
  AOI2BB2XL U487 ( .B0(n650), .B1(n2019), .A0N(n1458), .A1N(n644), .Y(n701) );
  OAI211XL U488 ( .A0(n1458), .A1(n619), .B0(n798), .C0(n799), .Y(n1779) );
  AOI2BB2XL U489 ( .B0(n349), .B1(n2023), .A0N(n1468), .A1N(n553), .Y(n798) );
  OAI211XL U490 ( .A0(n1468), .A1(n550), .B0(n835), .C0(n836), .Y(n1789) );
  AOI2BB2XL U491 ( .B0(n528), .B1(n2023), .A0N(n1458), .A1N(n527), .Y(n835) );
  OAI211XL U492 ( .A0(n1428), .A1(n682), .B0(n658), .C0(n659), .Y(n1750) );
  AOI2BB2XL U493 ( .B0(n670), .B1(n2023), .A0N(n1458), .A1N(n665), .Y(n658) );
  AOI2BB2XL U494 ( .B0(n650), .B1(n2014), .A0N(n1457), .A1N(n644), .Y(n698) );
  AOI2BB2XL U495 ( .B0(n528), .B1(n2017), .A0N(n1457), .A1N(n527), .Y(n833) );
  AOI2BB2XL U496 ( .B0(n670), .B1(n2017), .A0N(n1457), .A1N(n665), .Y(n653) );
  OAI211XL U497 ( .A0(n1506), .A1(n371), .B0(n525), .C0(n526), .Y(n1707) );
  AOI2BB2XL U498 ( .B0(n650), .B1(n2009), .A0N(n1526), .A1N(n644), .Y(n525) );
  OAI211XL U499 ( .A0(n1526), .A1(n619), .B0(n578), .C0(n579), .Y(n1727) );
  AOI2BB2XL U500 ( .B0(n349), .B1(n2013), .A0N(n1536), .A1N(n553), .Y(n578) );
  OAI211XL U501 ( .A0(n1536), .A1(n550), .B0(n599), .C0(n600), .Y(n1737) );
  AOI2BB2XL U502 ( .B0(n528), .B1(n2013), .A0N(n1526), .A1N(n527), .Y(n599) );
  OAI211XL U503 ( .A0(n1496), .A1(n682), .B0(n651), .C0(n652), .Y(n1748) );
  AOI2BB2XL U504 ( .B0(n670), .B1(n2013), .A0N(n1526), .A1N(n665), .Y(n651) );
  OAI211XL U505 ( .A0(n1505), .A1(n371), .B0(n522), .C0(n523), .Y(n1706) );
  AOI2BB2XL U506 ( .B0(n650), .B1(n2003), .A0N(n1525), .A1N(n644), .Y(n522) );
  OAI211XL U507 ( .A0(n1535), .A1(n550), .B0(n597), .C0(n598), .Y(n1736) );
  AOI2BB2XL U508 ( .B0(n528), .B1(n2007), .A0N(n1525), .A1N(n527), .Y(n597) );
  OAI211XL U509 ( .A0(n1495), .A1(n682), .B0(n493), .C0(n494), .Y(n1697) );
  AOI2BB2XL U510 ( .B0(n670), .B1(n2007), .A0N(n1525), .A1N(n665), .Y(n493) );
  OAI211XL U511 ( .A0(n1504), .A1(n371), .B0(n519), .C0(n520), .Y(n1705) );
  AOI2BB2XL U512 ( .B0(n650), .B1(n1998), .A0N(n1524), .A1N(n645), .Y(n519) );
  OAI211XL U513 ( .A0(n1534), .A1(n550), .B0(n595), .C0(n596), .Y(n1735) );
  AOI2BB2XL U514 ( .B0(n528), .B1(n2001), .A0N(n1524), .A1N(n527), .Y(n595) );
  OAI211XL U515 ( .A0(n1494), .A1(n682), .B0(n488), .C0(n489), .Y(n1696) );
  AOI2BB2XL U516 ( .B0(n670), .B1(n2001), .A0N(n1524), .A1N(n665), .Y(n488) );
  OAI211XL U517 ( .A0(n1503), .A1(n405), .B0(n516), .C0(n517), .Y(n1704) );
  AOI2BB2XL U518 ( .B0(n650), .B1(n1992), .A0N(n1523), .A1N(n645), .Y(n516) );
  OAI211XL U519 ( .A0(n1533), .A1(n550), .B0(n593), .C0(n594), .Y(n1734) );
  AOI2BB2XL U520 ( .B0(n528), .B1(n1996), .A0N(n1523), .A1N(n527), .Y(n593) );
  OAI211XL U521 ( .A0(n1493), .A1(n682), .B0(n483), .C0(n484), .Y(n1695) );
  AOI2BB2XL U522 ( .B0(n670), .B1(n1996), .A0N(n1523), .A1N(n665), .Y(n483) );
  OAI211XL U523 ( .A0(n1502), .A1(n405), .B0(n513), .C0(n514), .Y(n1703) );
  AOI2BB2XL U524 ( .B0(n650), .B1(n1986), .A0N(n1522), .A1N(n645), .Y(n513) );
  OAI211XL U525 ( .A0(n1532), .A1(n550), .B0(n591), .C0(n592), .Y(n1733) );
  AOI2BB2XL U526 ( .B0(n528), .B1(n1990), .A0N(n1522), .A1N(n527), .Y(n591) );
  OAI211XL U527 ( .A0(n1492), .A1(n682), .B0(n478), .C0(n479), .Y(n1694) );
  AOI2BB2XL U528 ( .B0(n670), .B1(n1990), .A0N(n1522), .A1N(n665), .Y(n478) );
  OAI211XL U529 ( .A0(n1501), .A1(n405), .B0(n510), .C0(n511), .Y(n1702) );
  AOI2BB2XL U530 ( .B0(n650), .B1(n1980), .A0N(n1521), .A1N(n645), .Y(n510) );
  OAI211XL U531 ( .A0(n1531), .A1(n550), .B0(n589), .C0(n590), .Y(n1732) );
  AOI2BB2XL U532 ( .B0(n528), .B1(n1984), .A0N(n1521), .A1N(n527), .Y(n589) );
  OAI211XL U533 ( .A0(n1491), .A1(n682), .B0(n473), .C0(n474), .Y(n1693) );
  AOI2BB2XL U534 ( .B0(n670), .B1(n1984), .A0N(n1521), .A1N(n665), .Y(n473) );
  OAI211XL U535 ( .A0(n1500), .A1(n405), .B0(n507), .C0(n508), .Y(n1701) );
  AOI2BB2XL U536 ( .B0(n650), .B1(n1974), .A0N(n1520), .A1N(n645), .Y(n507) );
  OAI211XL U537 ( .A0(n1530), .A1(n550), .B0(n587), .C0(n588), .Y(n1731) );
  AOI2BB2XL U538 ( .B0(n528), .B1(n1978), .A0N(n1520), .A1N(n527), .Y(n587) );
  OAI211XL U539 ( .A0(n1490), .A1(n682), .B0(n468), .C0(n469), .Y(n1692) );
  AOI2BB2XL U540 ( .B0(n670), .B1(n1978), .A0N(n1520), .A1N(n665), .Y(n468) );
  OAI211XL U541 ( .A0(n1499), .A1(n405), .B0(n504), .C0(n505), .Y(n1700) );
  AOI2BB2XL U542 ( .B0(n650), .B1(n1968), .A0N(n1519), .A1N(n645), .Y(n504) );
  OAI211XL U543 ( .A0(n1529), .A1(n550), .B0(n585), .C0(n586), .Y(n1730) );
  AOI2BB2XL U544 ( .B0(n528), .B1(n1972), .A0N(n1519), .A1N(n527), .Y(n585) );
  OAI211XL U545 ( .A0(n1489), .A1(n682), .B0(n463), .C0(n464), .Y(n1691) );
  AOI2BB2XL U546 ( .B0(n670), .B1(n1972), .A0N(n1519), .A1N(n665), .Y(n463) );
  OAI211XL U547 ( .A0(n1498), .A1(n405), .B0(n501), .C0(n502), .Y(n1699) );
  AOI2BB2XL U548 ( .B0(n649), .B1(n1962), .A0N(n1518), .A1N(n645), .Y(n501) );
  OAI211XL U549 ( .A0(n1528), .A1(n547), .B0(n583), .C0(n584), .Y(n1729) );
  AOI2BB2XL U550 ( .B0(n378), .B1(n1966), .A0N(n1518), .A1N(n527), .Y(n583) );
  OAI211XL U551 ( .A0(n1488), .A1(n681), .B0(n458), .C0(n459), .Y(n1690) );
  AOI2BB2XL U552 ( .B0(n667), .B1(n1966), .A0N(n1518), .A1N(n665), .Y(n458) );
  AOI2BB2XL U553 ( .B0(n649), .B1(n1957), .A0N(n1517), .A1N(n645), .Y(n498) );
  OAI211XL U554 ( .A0(n1527), .A1(n547), .B0(n581), .C0(n582), .Y(n1728) );
  AOI2BB2XL U555 ( .B0(n378), .B1(n1960), .A0N(n1517), .A1N(n524), .Y(n581) );
  AOI2BB2XL U556 ( .B0(n667), .B1(n1960), .A0N(n1517), .A1N(n238), .Y(n453) );
  OAI211XL U557 ( .A0(n1514), .A1(n310), .B0(n551), .C0(n552), .Y(n1715) );
  OA22XL U558 ( .A0(n1494), .A1(n629), .B0(n1504), .B1(n322), .Y(n551) );
  OAI211XL U559 ( .A0(n1513), .A1(n313), .B0(n548), .C0(n549), .Y(n1714) );
  OA22XL U560 ( .A0(n1493), .A1(n629), .B0(n1503), .B1(n624), .Y(n548) );
  OAI211XL U561 ( .A0(n1512), .A1(n313), .B0(n545), .C0(n546), .Y(n1713) );
  OA22XL U562 ( .A0(n1492), .A1(n629), .B0(n1502), .B1(n624), .Y(n545) );
  OAI211XL U563 ( .A0(n1511), .A1(n313), .B0(n542), .C0(n543), .Y(n1712) );
  OA22XL U564 ( .A0(n1491), .A1(n629), .B0(n1501), .B1(n624), .Y(n542) );
  OAI211XL U565 ( .A0(n1510), .A1(n313), .B0(n539), .C0(n540), .Y(n1711) );
  OA22XL U566 ( .A0(n1490), .A1(n629), .B0(n1500), .B1(n322), .Y(n539) );
  OAI211XL U567 ( .A0(n1509), .A1(n313), .B0(n536), .C0(n537), .Y(n1710) );
  OA22XL U568 ( .A0(n1489), .A1(n629), .B0(n1499), .B1(n322), .Y(n536) );
  OAI211XL U569 ( .A0(n1508), .A1(n313), .B0(n533), .C0(n534), .Y(n1709) );
  OA22XL U570 ( .A0(n1488), .A1(n625), .B0(n1498), .B1(n322), .Y(n533) );
  OAI211XL U571 ( .A0(n1456), .A1(n310), .B0(n779), .C0(n780), .Y(n1777) );
  OA22XL U572 ( .A0(n1436), .A1(n629), .B0(n1446), .B1(n624), .Y(n779) );
  OAI211XL U573 ( .A0(n1455), .A1(n310), .B0(n776), .C0(n777), .Y(n1776) );
  OA22XL U574 ( .A0(n1435), .A1(n629), .B0(n1445), .B1(n624), .Y(n776) );
  OAI211XL U575 ( .A0(n1454), .A1(n310), .B0(n773), .C0(n774), .Y(n1775) );
  OA22XL U576 ( .A0(n1434), .A1(n625), .B0(n1444), .B1(n624), .Y(n773) );
  OAI211XL U577 ( .A0(n1453), .A1(n310), .B0(n770), .C0(n771), .Y(n1774) );
  OA22XL U578 ( .A0(n1433), .A1(n629), .B0(n1443), .B1(n624), .Y(n770) );
  OAI211XL U579 ( .A0(n1452), .A1(n310), .B0(n767), .C0(n768), .Y(n1773) );
  OA22XL U580 ( .A0(n1432), .A1(n625), .B0(n1442), .B1(n624), .Y(n767) );
  OAI211XL U581 ( .A0(n1451), .A1(n310), .B0(n764), .C0(n765), .Y(n1772) );
  OA22XL U582 ( .A0(n1431), .A1(n629), .B0(n1441), .B1(n624), .Y(n764) );
  OAI211XL U583 ( .A0(n1450), .A1(n310), .B0(n761), .C0(n762), .Y(n1771) );
  OA22XL U584 ( .A0(n1430), .A1(n629), .B0(n1440), .B1(n624), .Y(n761) );
  OAI211XL U585 ( .A0(n1449), .A1(n310), .B0(n758), .C0(n759), .Y(n1770) );
  OA22XL U586 ( .A0(n1429), .A1(n629), .B0(n1439), .B1(n322), .Y(n758) );
  OAI211XL U587 ( .A0(n1448), .A1(n310), .B0(n755), .C0(n756), .Y(n1769) );
  OA22XL U588 ( .A0(n1428), .A1(n629), .B0(n1438), .B1(n624), .Y(n755) );
  OAI211XL U589 ( .A0(n1516), .A1(n310), .B0(n557), .C0(n558), .Y(n1717) );
  OA22XL U590 ( .A0(n1496), .A1(n629), .B0(n1506), .B1(n624), .Y(n557) );
  OAI211XL U591 ( .A0(n1515), .A1(n310), .B0(n554), .C0(n555), .Y(n1716) );
  OA22XL U592 ( .A0(n1495), .A1(n629), .B0(n1505), .B1(n624), .Y(n554) );
  OAI221XL U593 ( .A0(n1568), .A1(n227), .B0(n1557), .B1(n67), .C0(n1181), .Y(
        N2218) );
  OAI221XL U594 ( .A0(n1566), .A1(n227), .B0(n1555), .B1(n67), .C0(n1184), .Y(
        N2216) );
  OAI221XL U595 ( .A0(n1564), .A1(n495), .B0(n1553), .B1(n426), .C0(n1208), 
        .Y(N2184) );
  OAI211XL U596 ( .A0(n1457), .A1(n619), .B0(n796), .C0(n797), .Y(n1778) );
  OAI211XL U597 ( .A0(n1525), .A1(n619), .B0(n576), .C0(n577), .Y(n1726) );
  AOI2BB2XL U598 ( .B0(n559), .B1(n2007), .A0N(n1535), .A1N(n553), .Y(n576) );
  OAI211XL U599 ( .A0(n1524), .A1(n619), .B0(n574), .C0(n575), .Y(n1725) );
  AOI2BB2XL U600 ( .B0(n559), .B1(n2001), .A0N(n1534), .A1N(n556), .Y(n574) );
  OAI211XL U601 ( .A0(n1523), .A1(n619), .B0(n572), .C0(n573), .Y(n1724) );
  AOI2BB2XL U602 ( .B0(n559), .B1(n1996), .A0N(n1533), .A1N(n556), .Y(n572) );
  OAI211XL U603 ( .A0(n1522), .A1(n619), .B0(n570), .C0(n571), .Y(n1723) );
  AOI2BB2XL U604 ( .B0(n559), .B1(n1990), .A0N(n1532), .A1N(n556), .Y(n570) );
  OAI211XL U605 ( .A0(n1521), .A1(n619), .B0(n568), .C0(n569), .Y(n1722) );
  AOI2BB2XL U606 ( .B0(n559), .B1(n1984), .A0N(n1531), .A1N(n556), .Y(n568) );
  OAI211XL U607 ( .A0(n1520), .A1(n619), .B0(n566), .C0(n567), .Y(n1721) );
  AOI2BB2XL U608 ( .B0(n559), .B1(n1978), .A0N(n1530), .A1N(n556), .Y(n566) );
  OAI211XL U609 ( .A0(n1519), .A1(n619), .B0(n564), .C0(n565), .Y(n1720) );
  AOI2BB2XL U610 ( .B0(n559), .B1(n1972), .A0N(n1529), .A1N(n556), .Y(n564) );
  OAI211XL U611 ( .A0(n1518), .A1(n615), .B0(n562), .C0(n563), .Y(n1719) );
  AOI2BB2XL U612 ( .B0(n559), .B1(n1966), .A0N(n1528), .A1N(n553), .Y(n562) );
  OAI211XL U613 ( .A0(n1517), .A1(n615), .B0(n560), .C0(n561), .Y(n1718) );
  AOI2BB2XL U614 ( .B0(n559), .B1(n1960), .A0N(n1527), .A1N(n556), .Y(n560) );
  OAI211XL U615 ( .A0(n1382), .A1(n405), .B0(n311), .C0(n312), .Y(n1643) );
  AOI2BB2XL U616 ( .B0(n649), .B1(n1951), .A0N(n1404), .A1N(n645), .Y(n311) );
  OAI211XL U617 ( .A0(n1404), .A1(n615), .B0(n369), .C0(n370), .Y(n1665) );
  AOI2BB2XL U618 ( .B0(n559), .B1(n1955), .A0N(n1415), .A1N(n553), .Y(n369) );
  OAI211XL U619 ( .A0(n1415), .A1(n547), .B0(n398), .C0(n399), .Y(n1676) );
  AOI2BB2XL U620 ( .B0(n378), .B1(n1955), .A0N(n1404), .A1N(n524), .Y(n398) );
  OAI211XL U621 ( .A0(n1371), .A1(n681), .B0(n451), .C0(n452), .Y(n1688) );
  AOI2BB2XL U622 ( .B0(n667), .B1(n1955), .A0N(n1404), .A1N(n666), .Y(n451) );
  OAI211XL U623 ( .A0(n1381), .A1(n405), .B0(n308), .C0(n309), .Y(n1642) );
  AOI2BB2XL U624 ( .B0(n649), .B1(n1945), .A0N(n1403), .A1N(n645), .Y(n308) );
  OAI211XL U625 ( .A0(n1403), .A1(n615), .B0(n367), .C0(n368), .Y(n1664) );
  AOI2BB2XL U626 ( .B0(n559), .B1(n1949), .A0N(n1414), .A1N(n350), .Y(n367) );
  OAI211XL U627 ( .A0(n1414), .A1(n547), .B0(n396), .C0(n397), .Y(n1675) );
  AOI2BB2XL U628 ( .B0(n378), .B1(n1949), .A0N(n1403), .A1N(n524), .Y(n396) );
  OAI211XL U629 ( .A0(n1370), .A1(n681), .B0(n271), .C0(n272), .Y(n1632) );
  AOI2BB2XL U630 ( .B0(n667), .B1(n1949), .A0N(n1403), .A1N(n666), .Y(n271) );
  OAI211XL U631 ( .A0(n1380), .A1(n405), .B0(n305), .C0(n306), .Y(n1641) );
  AOI2BB2XL U632 ( .B0(n649), .B1(n1939), .A0N(n1402), .A1N(n645), .Y(n305) );
  OAI211XL U633 ( .A0(n1402), .A1(n615), .B0(n365), .C0(n366), .Y(n1663) );
  AOI2BB2XL U634 ( .B0(n559), .B1(n1943), .A0N(n1413), .A1N(n350), .Y(n365) );
  OAI211XL U635 ( .A0(n1413), .A1(n547), .B0(n394), .C0(n395), .Y(n1674) );
  AOI2BB2XL U636 ( .B0(n378), .B1(n1943), .A0N(n1402), .A1N(n524), .Y(n394) );
  OAI211XL U637 ( .A0(n1369), .A1(n681), .B0(n267), .C0(n268), .Y(n1631) );
  AOI2BB2XL U638 ( .B0(n667), .B1(n1943), .A0N(n1402), .A1N(n666), .Y(n267) );
  OAI211XL U639 ( .A0(n1379), .A1(n405), .B0(n302), .C0(n303), .Y(n1640) );
  AOI2BB2XL U640 ( .B0(n649), .B1(n1933), .A0N(n1401), .A1N(n645), .Y(n302) );
  OAI211XL U641 ( .A0(n1401), .A1(n615), .B0(n363), .C0(n364), .Y(n1662) );
  AOI2BB2XL U642 ( .B0(n559), .B1(n1937), .A0N(n1412), .A1N(n350), .Y(n363) );
  OAI211XL U643 ( .A0(n1412), .A1(n547), .B0(n392), .C0(n393), .Y(n1673) );
  AOI2BB2XL U644 ( .B0(n378), .B1(n1937), .A0N(n1401), .A1N(n524), .Y(n392) );
  OAI211XL U645 ( .A0(n1368), .A1(n681), .B0(n263), .C0(n264), .Y(n1630) );
  AOI2BB2XL U646 ( .B0(n667), .B1(n1937), .A0N(n1401), .A1N(n666), .Y(n263) );
  OAI211XL U647 ( .A0(n1378), .A1(n405), .B0(n299), .C0(n300), .Y(n1639) );
  AOI2BB2XL U648 ( .B0(n649), .B1(n1927), .A0N(n1400), .A1N(n644), .Y(n299) );
  OAI211XL U649 ( .A0(n1400), .A1(n615), .B0(n361), .C0(n362), .Y(n1661) );
  AOI2BB2XL U650 ( .B0(n559), .B1(n1931), .A0N(n1411), .A1N(n556), .Y(n361) );
  OAI211XL U651 ( .A0(n1411), .A1(n547), .B0(n390), .C0(n391), .Y(n1672) );
  AOI2BB2XL U652 ( .B0(n378), .B1(n1931), .A0N(n1400), .A1N(n524), .Y(n390) );
  OAI211XL U653 ( .A0(n1367), .A1(n681), .B0(n259), .C0(n260), .Y(n1629) );
  AOI2BB2XL U654 ( .B0(n667), .B1(n1931), .A0N(n1400), .A1N(n666), .Y(n259) );
  OAI211XL U655 ( .A0(n1377), .A1(n405), .B0(n296), .C0(n297), .Y(n1638) );
  AOI2BB2XL U656 ( .B0(n649), .B1(n1921), .A0N(n1399), .A1N(n645), .Y(n296) );
  OAI211XL U657 ( .A0(n1399), .A1(n615), .B0(n359), .C0(n360), .Y(n1660) );
  AOI2BB2XL U658 ( .B0(n559), .B1(n1925), .A0N(n1410), .A1N(n556), .Y(n359) );
  OAI211XL U659 ( .A0(n1410), .A1(n547), .B0(n388), .C0(n389), .Y(n1671) );
  AOI2BB2XL U660 ( .B0(n378), .B1(n1925), .A0N(n1399), .A1N(n524), .Y(n388) );
  OAI211XL U661 ( .A0(n1366), .A1(n681), .B0(n255), .C0(n256), .Y(n1628) );
  AOI2BB2XL U662 ( .B0(n667), .B1(n1925), .A0N(n1399), .A1N(n665), .Y(n255) );
  OAI211XL U663 ( .A0(n1398), .A1(n615), .B0(n357), .C0(n358), .Y(n1659) );
  AOI2BB2XL U664 ( .B0(n559), .B1(n1919), .A0N(n1409), .A1N(n556), .Y(n357) );
  OAI211XL U665 ( .A0(n1409), .A1(n547), .B0(n386), .C0(n387), .Y(n1670) );
  AOI2BB2XL U666 ( .B0(n378), .B1(n1919), .A0N(n1398), .A1N(n524), .Y(n386) );
  OAI211XL U667 ( .A0(n1365), .A1(n681), .B0(n251), .C0(n252), .Y(n1627) );
  AOI2BB2XL U668 ( .B0(n667), .B1(n1919), .A0N(n1398), .A1N(n666), .Y(n251) );
  OAI211XL U669 ( .A0(n1397), .A1(n615), .B0(n355), .C0(n356), .Y(n1658) );
  AOI2BB2XL U670 ( .B0(n349), .B1(n1913), .A0N(n1408), .A1N(n556), .Y(n355) );
  OAI211XL U671 ( .A0(n1408), .A1(n547), .B0(n384), .C0(n385), .Y(n1669) );
  AOI2BB2XL U672 ( .B0(n378), .B1(n1913), .A0N(n1397), .A1N(n524), .Y(n384) );
  OAI211XL U673 ( .A0(n1364), .A1(n681), .B0(n247), .C0(n248), .Y(n1626) );
  AOI2BB2XL U674 ( .B0(n667), .B1(n1913), .A0N(n1397), .A1N(n665), .Y(n247) );
  OAI211XL U675 ( .A0(n1396), .A1(n615), .B0(n353), .C0(n354), .Y(n1657) );
  AOI2BB2XL U676 ( .B0(n349), .B1(n1907), .A0N(n1407), .A1N(n556), .Y(n353) );
  OAI211XL U677 ( .A0(n1407), .A1(n547), .B0(n382), .C0(n383), .Y(n1668) );
  AOI2BB2XL U678 ( .B0(n378), .B1(n1907), .A0N(n1396), .A1N(n524), .Y(n382) );
  OAI211XL U679 ( .A0(n1363), .A1(n681), .B0(n243), .C0(n244), .Y(n1625) );
  AOI2BB2XL U680 ( .B0(n667), .B1(n1907), .A0N(n1396), .A1N(n666), .Y(n243) );
  OAI211XL U681 ( .A0(n1395), .A1(n615), .B0(n351), .C0(n352), .Y(n1656) );
  AOI2BB2XL U682 ( .B0(n349), .B1(n1901), .A0N(n1406), .A1N(n556), .Y(n351) );
  OAI211XL U683 ( .A0(n1406), .A1(n547), .B0(n380), .C0(n381), .Y(n1667) );
  AOI2BB2XL U684 ( .B0(n378), .B1(n1901), .A0N(n1395), .A1N(n524), .Y(n380) );
  OAI211XL U685 ( .A0(n1362), .A1(n681), .B0(n239), .C0(n240), .Y(n1624) );
  AOI2BB2XL U686 ( .B0(n667), .B1(n1901), .A0N(n1395), .A1N(n665), .Y(n239) );
  OAI211XL U687 ( .A0(n1394), .A1(n615), .B0(n344), .C0(n345), .Y(n1655) );
  AOI2BB2XL U688 ( .B0(n349), .B1(n1895), .A0N(n1405), .A1N(n556), .Y(n344) );
  OAI211XL U689 ( .A0(n1405), .A1(n547), .B0(n373), .C0(n374), .Y(n1666) );
  AOI2BB2XL U690 ( .B0(n378), .B1(n1895), .A0N(n1394), .A1N(n524), .Y(n373) );
  OAI211XL U691 ( .A0(n1361), .A1(n681), .B0(n230), .C0(n231), .Y(n1623) );
  AOI2BB2XL U692 ( .B0(n667), .B1(n1895), .A0N(n1394), .A1N(n666), .Y(n230) );
  OAI211XL U693 ( .A0(n1376), .A1(n371), .B0(n293), .C0(n294), .Y(n1637) );
  AOI2BB2XL U694 ( .B0(n649), .B1(n1915), .A0N(n1398), .A1N(n644), .Y(n293) );
  OAI211XL U695 ( .A0(n1375), .A1(n405), .B0(n290), .C0(n291), .Y(n1636) );
  AOI2BB2XL U696 ( .B0(n649), .B1(n1909), .A0N(n1397), .A1N(n645), .Y(n290) );
  OAI211XL U697 ( .A0(n1374), .A1(n371), .B0(n287), .C0(n288), .Y(n1635) );
  AOI2BB2XL U698 ( .B0(n649), .B1(n1903), .A0N(n1396), .A1N(n644), .Y(n287) );
  OAI211XL U699 ( .A0(n1373), .A1(n405), .B0(n284), .C0(n285), .Y(n1634) );
  AOI2BB2XL U700 ( .B0(n649), .B1(n1897), .A0N(n1395), .A1N(n645), .Y(n284) );
  OAI211XL U701 ( .A0(n1372), .A1(n1850), .B0(n276), .C0(n277), .Y(n1633) );
  AOI2BB2XL U702 ( .B0(n649), .B1(n1891), .A0N(n1394), .A1N(n283), .Y(n276) );
  AO22XL U703 ( .A0(side_length[6]), .A1(n298), .B0(root[6]), .B1(n2086), .Y(
        n1221) );
  OAI221XL U704 ( .A0(n1564), .A1(n234), .B0(n1553), .B1(n67), .C0(n1186), .Y(
        N2214) );
  OAI221XL U705 ( .A0(n1562), .A1(n495), .B0(n1551), .B1(n426), .C0(n1210), 
        .Y(N2182) );
  AO22XL U706 ( .A0(side_length[7]), .A1(n298), .B0(root[7]), .B1(n2086), .Y(
        n1222) );
  OAI221XL U707 ( .A0(n1560), .A1(n495), .B0(n1549), .B1(n426), .C0(n1212), 
        .Y(N2180) );
  OAI221XL U708 ( .A0(n1562), .A1(n234), .B0(n1551), .B1(n490), .C0(n1188), 
        .Y(N2212) );
  OAI221XL U709 ( .A0(n1560), .A1(n234), .B0(n1549), .B1(n490), .C0(n1190), 
        .Y(N2210) );
  AO22XL U710 ( .A0(side_length[8]), .A1(n298), .B0(root[8]), .B1(n2086), .Y(
        n1223) );
  AO22XL U711 ( .A0(side_length[9]), .A1(n298), .B0(root[9]), .B1(n2086), .Y(
        n1224) );
  OAI211XL U712 ( .A0(n1483), .A1(n273), .B0(n1107), .C0(n1108), .Y(N2338) );
  AOI2BB2XL U713 ( .B0(n274), .B1(n2053), .A0N(n1473), .A1N(n286), .Y(n1107)
         );
  OAI211XL U714 ( .A0(n1465), .A1(n237), .B0(n1144), .C0(n1145), .Y(N2308) );
  OA22XL U715 ( .A0(n242), .A1(n1455), .B0(n1485), .B1(n261), .Y(n1144) );
  OAI211XL U716 ( .A0(n1485), .A1(n270), .B0(n1103), .C0(n1104), .Y(N2340) );
  AOI2BB2XL U717 ( .B0(n274), .B1(n2065), .A0N(n1475), .A1N(n282), .Y(n1103)
         );
  NAND2BX1 U718 ( .AN(n2072), .B(n197), .Y(n185) );
  NAND2BX1 U719 ( .AN(n2072), .B(n191), .Y(n188) );
  NAND2BX1 U720 ( .AN(n1596), .B(n197), .Y(n194) );
  OAI211XL U721 ( .A0(n1484), .A1(n273), .B0(n1105), .C0(n1106), .Y(N2339) );
  AOI2BB2XL U722 ( .B0(n274), .B1(n2059), .A0N(n1474), .A1N(n286), .Y(n1105)
         );
  OAI211XL U723 ( .A0(n1482), .A1(n270), .B0(n1109), .C0(n1110), .Y(N2337) );
  AOI2BB2XL U724 ( .B0(n274), .B1(n2047), .A0N(n1472), .A1N(n275), .Y(n1109)
         );
  NOR2X2 U725 ( .A(n1596), .B(n1595), .Y(n254) );
  OAI211XL U726 ( .A0(n1464), .A1(n241), .B0(n1146), .C0(n1147), .Y(N2307) );
  OA22XL U727 ( .A0(n242), .A1(n1454), .B0(n1484), .B1(n261), .Y(n1146) );
  OAI211XL U728 ( .A0(n1463), .A1(n241), .B0(n1148), .C0(n1149), .Y(N2306) );
  OA22XL U729 ( .A0(n245), .A1(n1453), .B0(n1483), .B1(n257), .Y(n1148) );
  OAI211XL U730 ( .A0(n1481), .A1(n270), .B0(n1111), .C0(n1112), .Y(N2336) );
  AOI2BB2XL U731 ( .B0(n274), .B1(n2041), .A0N(n1471), .A1N(n275), .Y(n1111)
         );
  NOR2X2 U732 ( .A(n1599), .B(n1597), .Y(n269) );
  OA22XL U733 ( .A0(n246), .A1(n1515), .B0(n1545), .B1(n258), .Y(n1077) );
  AOI2BB2XL U734 ( .B0(n274), .B1(n2007), .A0N(n1535), .A1N(n286), .Y(n1123)
         );
  OAI211XL U735 ( .A0(n1480), .A1(n270), .B0(n1113), .C0(n1114), .Y(N2335) );
  AOI2BB2XL U736 ( .B0(n274), .B1(n2035), .A0N(n1470), .A1N(n282), .Y(n1113)
         );
  OA22XL U737 ( .A0(n242), .A1(n1514), .B0(n1544), .B1(n261), .Y(n1079) );
  AOI2BB2XL U738 ( .B0(n274), .B1(n2001), .A0N(n1534), .A1N(n286), .Y(n1125)
         );
  AOI2BB2XL U739 ( .B0(n274), .B1(n1996), .A0N(n1533), .A1N(n275), .Y(n1127)
         );
  OAI211XL U740 ( .A0(n1462), .A1(n237), .B0(n1150), .C0(n1151), .Y(N2305) );
  OA22XL U741 ( .A0(n245), .A1(n1452), .B0(n1482), .B1(n257), .Y(n1150) );
  OAI211XL U742 ( .A0(n1461), .A1(n237), .B0(n1152), .C0(n1153), .Y(N2304) );
  OA22XL U743 ( .A0(n246), .A1(n1451), .B0(n1481), .B1(n258), .Y(n1152) );
  OAI211XL U744 ( .A0(n1479), .A1(n273), .B0(n1115), .C0(n1116), .Y(N2334) );
  AOI2BB2XL U745 ( .B0(n274), .B1(n2029), .A0N(n1469), .A1N(n286), .Y(n1115)
         );
  NOR2X2 U746 ( .A(n1599), .B(n1597), .Y(n984) );
  OAI211XL U747 ( .A0(n1466), .A1(n237), .B0(n1142), .C0(n1143), .Y(N2309) );
  OA22XL U748 ( .A0(n246), .A1(n1456), .B0(n1486), .B1(n258), .Y(n1142) );
  OAI211XL U749 ( .A0(n1486), .A1(n270), .B0(n1096), .C0(n1097), .Y(N2341) );
  AOI2BB2XL U750 ( .B0(n274), .B1(n2071), .A0N(n1476), .A1N(n275), .Y(n1096)
         );
  OAI211XL U751 ( .A0(n1526), .A1(n241), .B0(n1071), .C0(n1072), .Y(N2357) );
  OA22XL U752 ( .A0(n245), .A1(n1516), .B0(n1546), .B1(n257), .Y(n1071) );
  OAI211XL U753 ( .A0(n1546), .A1(n270), .B0(n1121), .C0(n1122), .Y(N2325) );
  AOI2BB2XL U754 ( .B0(n274), .B1(n2013), .A0N(n1536), .A1N(n282), .Y(n1121)
         );
  OA22XL U755 ( .A0(n246), .A1(n1510), .B0(n1540), .B1(n258), .Y(n1087) );
  AOI2BB2XL U756 ( .B0(n274), .B1(n1990), .A0N(n1532), .A1N(n275), .Y(n1129)
         );
  AOI2BB2XL U757 ( .B0(n274), .B1(n1978), .A0N(n1530), .A1N(n286), .Y(n1133)
         );
  OA22XL U758 ( .A0(n245), .A1(n1511), .B0(n1541), .B1(n257), .Y(n1085) );
  AOI2BB2XL U759 ( .B0(n274), .B1(n1984), .A0N(n1531), .A1N(n282), .Y(n1131)
         );
  OAI211XL U760 ( .A0(n1460), .A1(n241), .B0(n1154), .C0(n1155), .Y(N2303) );
  OA22XL U761 ( .A0(n242), .A1(n1450), .B0(n1480), .B1(n261), .Y(n1154) );
  OAI211XL U762 ( .A0(n1478), .A1(n270), .B0(n1117), .C0(n1118), .Y(N2333) );
  AOI2BB2XL U763 ( .B0(n274), .B1(n2023), .A0N(n1468), .A1N(n282), .Y(n1117)
         );
  OAI211XL U764 ( .A0(n1459), .A1(n241), .B0(n1156), .C0(n1157), .Y(N2302) );
  OA22XL U765 ( .A0(n246), .A1(n1449), .B0(n1479), .B1(n258), .Y(n1156) );
  OA22XL U766 ( .A0(n246), .A1(n1508), .B0(n1538), .B1(n258), .Y(n1091) );
  AOI2BB2XL U767 ( .B0(n274), .B1(n1966), .A0N(n1528), .A1N(n275), .Y(n1137)
         );
  OA22XL U768 ( .A0(n242), .A1(n1509), .B0(n1539), .B1(n261), .Y(n1089) );
  AOI2BB2XL U769 ( .B0(n274), .B1(n1972), .A0N(n1529), .A1N(n282), .Y(n1135)
         );
  OAI211XL U770 ( .A0(n1458), .A1(n237), .B0(n1158), .C0(n1159), .Y(N2301) );
  OA22XL U771 ( .A0(n245), .A1(n1448), .B0(n1478), .B1(n257), .Y(n1158) );
  AOI2BB2XL U772 ( .B0(n274), .B1(n1960), .A0N(n1527), .A1N(n282), .Y(n1139)
         );
  CLKINVX1 U773 ( .A(cur_state[0]), .Y(n2085) );
  CLKINVX1 U774 ( .A(n827), .Y(n1849) );
  NOR3X1 U775 ( .A(\reach_cnt[3][0] ), .B(\reach_cnt[3][2] ), .C(n1877), .Y(
        n786) );
  NOR3X1 U776 ( .A(\reach_cnt[1][0] ), .B(\reach_cnt[1][1] ), .C(n1882), .Y(
        n932) );
  NAND2X1 U777 ( .A(cur_state[1]), .B(n965), .Y(n964) );
  NAND2X1 U778 ( .A(n957), .B(cur_state[1]), .Y(n952) );
  NAND3X1 U779 ( .A(n2085), .B(n2089), .C(cur_state[1]), .Y(n210) );
  NAND2X1 U780 ( .A(n757), .B(cur_state[2]), .Y(n1164) );
  NAND3X1 U781 ( .A(n2090), .B(n2089), .C(cur_state[0]), .Y(n207) );
  CLKBUFX3 U782 ( .A(n372), .Y(n550) );
  CLKBUFX3 U783 ( .A(n372), .Y(n547) );
  CLKBUFX3 U784 ( .A(n481), .Y(n476) );
  CLKBUFX3 U785 ( .A(n480), .Y(n475) );
  CLKBUFX3 U786 ( .A(n455), .Y(n472) );
  CLKBUFX3 U787 ( .A(n442), .Y(n471) );
  CLKBUFX3 U788 ( .A(n434), .Y(n470) );
  CLKBUFX3 U789 ( .A(n487), .Y(n467) );
  CLKBUFX3 U790 ( .A(n481), .Y(n466) );
  CLKBUFX3 U791 ( .A(n482), .Y(n465) );
  CLKBUFX3 U792 ( .A(n485), .Y(n462) );
  CLKBUFX3 U793 ( .A(n485), .Y(n461) );
  CLKBUFX3 U794 ( .A(n486), .Y(n460) );
  CLKBUFX3 U795 ( .A(n486), .Y(n457) );
  CLKBUFX3 U796 ( .A(n487), .Y(n456) );
  CLKBUFX3 U797 ( .A(n430), .Y(n477) );
  CLKBUFX3 U798 ( .A(n402), .Y(n521) );
  CLKBUFX3 U799 ( .A(n402), .Y(n518) );
  CLKBUFX3 U800 ( .A(n377), .Y(n532) );
  CLKBUFX3 U801 ( .A(n377), .Y(n529) );
  CLKBUFX3 U802 ( .A(n343), .Y(n619) );
  CLKBUFX3 U803 ( .A(n343), .Y(n615) );
  CLKBUFX3 U804 ( .A(n278), .Y(n662) );
  CLKBUFX3 U805 ( .A(n610), .Y(n614) );
  CLKBUFX3 U806 ( .A(n375), .Y(n544) );
  CLKBUFX3 U807 ( .A(n278), .Y(n661) );
  CLKBUFX3 U808 ( .A(n375), .Y(n541) );
  CLKBUFX3 U809 ( .A(n376), .Y(n538) );
  CLKBUFX3 U810 ( .A(n376), .Y(n535) );
  CLKBUFX3 U811 ( .A(n379), .Y(n527) );
  CLKBUFX3 U812 ( .A(n379), .Y(n524) );
  INVX3 U813 ( .A(n727), .Y(n712) );
  INVX3 U814 ( .A(n736), .Y(n700) );
  INVX3 U815 ( .A(n724), .Y(n715) );
  INVX3 U816 ( .A(n728), .Y(n709) );
  INVX3 U817 ( .A(n732), .Y(n706) );
  INVX3 U818 ( .A(n734), .Y(n703) );
  INVX3 U819 ( .A(n691), .Y(n697) );
  INVX3 U820 ( .A(n692), .Y(n695) );
  INVX3 U821 ( .A(n691), .Y(n696) );
  CLKINVX1 U822 ( .A(n721), .Y(n718) );
  CLKBUFX3 U823 ( .A(n430), .Y(n480) );
  CLKBUFX3 U824 ( .A(n434), .Y(n481) );
  CLKBUFX3 U825 ( .A(n438), .Y(n482) );
  CLKBUFX3 U826 ( .A(n438), .Y(n485) );
  CLKBUFX3 U827 ( .A(n438), .Y(n486) );
  CLKBUFX3 U828 ( .A(n442), .Y(n487) );
  AO22X2 U829 ( .A0(N2690), .A1(N2683), .B0(N2702), .B1(n1845), .Y(res3[5]) );
  CLKINVX1 U830 ( .A(n217), .Y(n1842) );
  AO22X2 U831 ( .A0(N2691), .A1(N2683), .B0(N2703), .B1(n1845), .Y(res3[6]) );
  AO22X2 U832 ( .A0(N2693), .A1(n225), .B0(N2705), .B1(n301), .Y(res3[8]) );
  AO22X2 U833 ( .A0(N2692), .A1(n225), .B0(N2704), .B1(n1845), .Y(res3[7]) );
  AO22X2 U834 ( .A0(N2694), .A1(N2683), .B0(N2706), .B1(n301), .Y(res3[9]) );
  AO22X1 U835 ( .A0(N2644), .A1(n220), .B0(N2656), .B1(n1843), .Y(res1[11]) );
  CLKINVX1 U836 ( .A(n945), .Y(n1853) );
  CLKINVX1 U837 ( .A(n943), .Y(n1854) );
  CLKINVX1 U838 ( .A(n940), .Y(n1855) );
  CLKBUFX3 U839 ( .A(n1866), .Y(n414) );
  INVX4 U840 ( .A(n211), .Y(n1858) );
  CLKINVX1 U841 ( .A(n947), .Y(n1856) );
  CLKINVX1 U842 ( .A(n949), .Y(n1857) );
  CLKBUFX3 U843 ( .A(n1867), .Y(n418) );
  CLKBUFX3 U844 ( .A(n1864), .Y(n408) );
  INVX3 U845 ( .A(n179), .Y(n495) );
  INVX3 U846 ( .A(n179), .Y(n492) );
  CLKINVX1 U847 ( .A(n72), .Y(n242) );
  CLKINVX1 U848 ( .A(n72), .Y(n245) );
  CLKINVX1 U849 ( .A(n72), .Y(n246) );
  CLKBUFX3 U850 ( .A(n1848), .Y(n314) );
  CLKBUFX3 U851 ( .A(n407), .Y(n506) );
  CLKBUFX3 U852 ( .A(n407), .Y(n503) );
  CLKBUFX3 U853 ( .A(n410), .Y(n497) );
  CLKBUFX3 U854 ( .A(n410), .Y(n496) );
  CLKINVX1 U855 ( .A(n295), .Y(n2081) );
  CLKINVX1 U856 ( .A(n862), .Y(n2087) );
  CLKBUFX3 U857 ( .A(n406), .Y(n509) );
  CLKBUFX3 U858 ( .A(n406), .Y(n512) );
  CLKBUFX3 U859 ( .A(n236), .Y(n670) );
  CLKBUFX3 U860 ( .A(n236), .Y(n667) );
  CLKBUFX3 U861 ( .A(n281), .Y(n650) );
  CLKBUFX3 U862 ( .A(n281), .Y(n649) );
  CLKBUFX3 U863 ( .A(n1848), .Y(n315) );
  CLKBUFX3 U864 ( .A(n280), .Y(n656) );
  CLKBUFX3 U865 ( .A(n320), .Y(n634) );
  CLKBUFX3 U866 ( .A(n348), .Y(n604) );
  CLKBUFX3 U867 ( .A(n232), .Y(n680) );
  CLKBUFX3 U868 ( .A(n232), .Y(n677) );
  CLKBUFX3 U869 ( .A(n1850), .Y(n371) );
  CLKBUFX3 U870 ( .A(n1846), .Y(n310) );
  CLKBUFX3 U871 ( .A(n1850), .Y(n405) );
  CLKBUFX3 U872 ( .A(n1846), .Y(n313) );
  CLKBUFX3 U873 ( .A(n280), .Y(n655) );
  CLKBUFX3 U874 ( .A(n320), .Y(n630) );
  CLKBUFX3 U875 ( .A(n235), .Y(n671) );
  CLKBUFX3 U876 ( .A(n348), .Y(n580) );
  CLKBUFX3 U877 ( .A(n319), .Y(n639) );
  CLKBUFX3 U878 ( .A(n319), .Y(n635) );
  CLKBUFX3 U879 ( .A(n347), .Y(n605) );
  CLKBUFX3 U880 ( .A(n279), .Y(n660) );
  CLKBUFX3 U881 ( .A(n279), .Y(n657) );
  CLKBUFX3 U882 ( .A(n233), .Y(n675) );
  CLKBUFX3 U883 ( .A(n409), .Y(n500) );
  CLKBUFX3 U884 ( .A(n403), .Y(n515) );
  CLKBUFX3 U885 ( .A(n238), .Y(n665) );
  CLKBUFX3 U886 ( .A(n321), .Y(n629) );
  CLKBUFX3 U887 ( .A(n321), .Y(n625) );
  CLKBUFX3 U888 ( .A(n283), .Y(n644) );
  CLKBUFX3 U889 ( .A(n283), .Y(n645) );
  CLKBUFX3 U890 ( .A(n350), .Y(n553) );
  CLKBUFX3 U891 ( .A(n322), .Y(n620) );
  CLKBUFX3 U892 ( .A(n235), .Y(n672) );
  CLKBUFX3 U893 ( .A(n347), .Y(n609) );
  CLKBUFX3 U894 ( .A(n233), .Y(n676) );
  CLKBUFX3 U895 ( .A(n238), .Y(n666) );
  CLKBUFX3 U896 ( .A(n318), .Y(n640) );
  CLKBUFX3 U897 ( .A(n350), .Y(n556) );
  CLKBUFX3 U898 ( .A(n322), .Y(n624) );
  CLKBUFX3 U899 ( .A(n346), .Y(n610) );
  AOI31X1 U900 ( .A0(n854), .A1(n855), .A2(n857), .B0(n853), .Y(n372) );
  INVX3 U901 ( .A(n757), .Y(n754) );
  CLKBUFX3 U902 ( .A(n687), .Y(n728) );
  CLKBUFX3 U903 ( .A(n687), .Y(n727) );
  CLKBUFX3 U904 ( .A(n690), .Y(n732) );
  CLKBUFX3 U905 ( .A(n690), .Y(n734) );
  CLKBUFX3 U906 ( .A(n690), .Y(n736) );
  CLKBUFX3 U907 ( .A(n687), .Y(n724) );
  CLKBUFX3 U908 ( .A(n687), .Y(n721) );
  CLKBUFX3 U909 ( .A(n691), .Y(n740) );
  CLKBUFX3 U910 ( .A(n691), .Y(n744) );
  CLKBUFX3 U911 ( .A(n692), .Y(n745) );
  CLKBUFX3 U912 ( .A(n691), .Y(n746) );
  CLKBUFX3 U913 ( .A(n692), .Y(n747) );
  CLKBUFX3 U914 ( .A(n691), .Y(n748) );
  CLKBUFX3 U915 ( .A(n692), .Y(n749) );
  CLKBUFX3 U916 ( .A(n692), .Y(n750) );
  CLKBUFX3 U917 ( .A(n692), .Y(n751) );
  CLKBUFX3 U918 ( .A(n229), .Y(n682) );
  CLKBUFX3 U919 ( .A(n229), .Y(n681) );
  CLKBUFX3 U920 ( .A(n455), .Y(n430) );
  CLKBUFX3 U921 ( .A(n450), .Y(n434) );
  CLKBUFX3 U922 ( .A(n450), .Y(n438) );
  CLKBUFX3 U923 ( .A(n446), .Y(n442) );
  AO22X1 U924 ( .A0(N2634), .A1(n220), .B0(N2646), .B1(n1843), .Y(res1[1]) );
  AO22X1 U925 ( .A0(N2635), .A1(n220), .B0(N2647), .B1(n1843), .Y(res1[2]) );
  AO22X1 U926 ( .A0(N2638), .A1(n220), .B0(N2650), .B1(n1843), .Y(res1[5]) );
  AO22X1 U927 ( .A0(N2659), .A1(n221), .B0(N2671), .B1(n1844), .Y(res2[0]) );
  CLKINVX1 U928 ( .A(n877), .Y(n931) );
  AO22X1 U929 ( .A0(N2637), .A1(n220), .B0(N2649), .B1(n1843), .Y(res1[4]) );
  AO22X1 U930 ( .A0(N2636), .A1(n220), .B0(N2648), .B1(n1843), .Y(res1[3]) );
  CLKINVX1 U931 ( .A(n1166), .Y(n1841) );
  AO22X1 U932 ( .A0(N2640), .A1(n220), .B0(N2652), .B1(n1843), .Y(res1[7]) );
  AO22X1 U933 ( .A0(N2643), .A1(n220), .B0(N2655), .B1(n1843), .Y(res1[10]) );
  AO22X1 U934 ( .A0(N2641), .A1(n220), .B0(N2653), .B1(n1843), .Y(res1[8]) );
  AO22X1 U935 ( .A0(N2642), .A1(n220), .B0(N2654), .B1(n1843), .Y(res1[9]) );
  CLKINVX1 U936 ( .A(side_B[9]), .Y(n1840) );
  CLKINVX1 U937 ( .A(side_B[6]), .Y(n1839) );
  AOI222XL U938 ( .A0(n69), .A1(n2006), .B0(n292), .B1(n2007), .C0(n6), .C1(
        n2003), .Y(n992) );
  AOI222XL U939 ( .A0(n69), .A1(n2064), .B0(n292), .B1(n2065), .C0(n157), .C1(
        n2061), .Y(n1012) );
  AOI222XL U940 ( .A0(n69), .A1(\Y[3][2] ), .B0(n292), .B1(n2001), .C0(n153), 
        .C1(n1998), .Y(n994) );
  AOI222XL U941 ( .A0(n69), .A1(n2058), .B0(n292), .B1(n2059), .C0(n153), .C1(
        n2055), .Y(n1014) );
  AOI222XL U942 ( .A0(n69), .A1(n1995), .B0(n292), .B1(n1996), .C0(n153), .C1(
        n1992), .Y(n996) );
  AOI222XL U943 ( .A0(n69), .A1(n2052), .B0(n292), .B1(n2053), .C0(n153), .C1(
        n2049), .Y(n1016) );
  AOI222XL U944 ( .A0(n69), .A1(n1989), .B0(n292), .B1(n1990), .C0(n153), .C1(
        n1986), .Y(n998) );
  AOI222XL U945 ( .A0(n69), .A1(n2046), .B0(n292), .B1(n2047), .C0(n153), .C1(
        n2043), .Y(n1018) );
  AO22X1 U946 ( .A0(N2572), .A1(n828), .B0(N2512), .B1(heptarea_done), .Y(
        diff_y[8]) );
  AO22X1 U947 ( .A0(N2565), .A1(n831), .B0(N2505), .B1(n39), .Y(diff_y[1]) );
  AO22X1 U948 ( .A0(N2535), .A1(n828), .B0(N2494), .B1(n821), .Y(diff_x[1]) );
  AO22X1 U949 ( .A0(N2566), .A1(n831), .B0(N2506), .B1(heptarea_done), .Y(
        diff_y[2]) );
  AO22X1 U950 ( .A0(N2536), .A1(n828), .B0(N2495), .B1(n39), .Y(diff_x[2]) );
  AO22X1 U951 ( .A0(N2539), .A1(n176), .B0(N2498), .B1(heptarea_done), .Y(
        diff_x[5]) );
  AO22X1 U952 ( .A0(N2567), .A1(n859), .B0(N2507), .B1(heptarea_done), .Y(
        diff_y[3]) );
  AO22X1 U953 ( .A0(N2537), .A1(n828), .B0(N2496), .B1(heptarea_done), .Y(
        diff_x[3]) );
  AO22X1 U954 ( .A0(N2568), .A1(n831), .B0(N2508), .B1(heptarea_done), .Y(
        diff_y[4]) );
  AO22X1 U955 ( .A0(N2538), .A1(n176), .B0(N2497), .B1(heptarea_done), .Y(
        diff_x[4]) );
  AO22X1 U956 ( .A0(N2571), .A1(n859), .B0(N2511), .B1(heptarea_done), .Y(
        diff_y[7]) );
  CLKBUFX3 U957 ( .A(n167), .Y(n763) );
  AOI222XL U958 ( .A0(n69), .A1(n1983), .B0(n292), .B1(n1984), .C0(n153), .C1(
        n1980), .Y(n1000) );
  AOI222XL U959 ( .A0(n69), .A1(n2040), .B0(n292), .B1(n2041), .C0(n153), .C1(
        n2037), .Y(n1020) );
  AOI222XL U960 ( .A0(n69), .A1(n1977), .B0(n292), .B1(n1978), .C0(n153), .C1(
        n1974), .Y(n1002) );
  AOI222XL U961 ( .A0(n69), .A1(n2034), .B0(n292), .B1(n2035), .C0(n153), .C1(
        n2031), .Y(n1022) );
  AOI222XL U962 ( .A0(n69), .A1(n1971), .B0(n292), .B1(n1972), .C0(n153), .C1(
        n1968), .Y(n1004) );
  AO22X1 U963 ( .A0(N2542), .A1(n831), .B0(N2501), .B1(heptarea_done), .Y(
        diff_x[8]) );
  AO22X2 U964 ( .A0(N2574), .A1(n828), .B0(N2514), .B1(heptarea_done), .Y(
        diff_y[10]) );
  AO22X2 U965 ( .A0(N2544), .A1(n831), .B0(N2503), .B1(heptarea_done), .Y(
        diff_x[10]) );
  AOI222XL U966 ( .A0(n69), .A1(n2028), .B0(n292), .B1(n2029), .C0(n153), .C1(
        n2025), .Y(n1024) );
  AOI222XL U967 ( .A0(n69), .A1(n1965), .B0(n292), .B1(n1966), .C0(n153), .C1(
        n1962), .Y(n1006) );
  AOI222XL U968 ( .A0(n69), .A1(n2022), .B0(n292), .B1(n2023), .C0(n153), .C1(
        n2019), .Y(n1026) );
  AOI222XL U969 ( .A0(n69), .A1(\Y[3][9] ), .B0(n292), .B1(n1960), .C0(n153), 
        .C1(n1957), .Y(n1008) );
  AOI222XL U970 ( .A0(n69), .A1(\X[3][9] ), .B0(n292), .B1(n2017), .C0(n6), 
        .C1(n2014), .Y(n1028) );
  OAI21X1 U971 ( .A0(n970), .A1(n968), .B0(n295), .Y(n945) );
  OAI21X1 U972 ( .A0(n969), .A1(n968), .B0(n295), .Y(n943) );
  OAI21X1 U973 ( .A0(n967), .A1(n968), .B0(n295), .Y(n940) );
  NAND4X1 U974 ( .A(N2237), .B(n2085), .C(n2089), .D(n422), .Y(n968) );
  OAI22XL U975 ( .A0(n1877), .A1(n945), .B0(n1853), .B1(n964), .Y(n1816) );
  OAI22XL U976 ( .A0(n1874), .A1(n943), .B0(n1854), .B1(n964), .Y(n1815) );
  OAI22XL U977 ( .A0(n1871), .A1(n940), .B0(n1855), .B1(n964), .Y(n1814) );
  OAI22XL U978 ( .A0(n1854), .A1(n952), .B0(n1888), .B1(n943), .Y(n1820) );
  CLKINVX1 U979 ( .A(n970), .Y(n1866) );
  OAI22XL U980 ( .A0(n1855), .A1(n952), .B0(n1887), .B1(n940), .Y(n1819) );
  OAI22XL U981 ( .A0(n1853), .A1(n952), .B0(n1889), .B1(n945), .Y(n1821) );
  OAI22XL U982 ( .A0(n1884), .A1(n945), .B0(n941), .B1(n1853), .Y(n1811) );
  OAI22XL U983 ( .A0(n1883), .A1(n943), .B0(n941), .B1(n1854), .Y(n1810) );
  OAI22XL U984 ( .A0(n1882), .A1(n940), .B0(n941), .B1(n1855), .Y(n1809) );
  CLKINVX1 U985 ( .A(n969), .Y(n1864) );
  NAND2X1 U986 ( .A(n295), .B(n976), .Y(n949) );
  NAND4X1 U987 ( .A(N2237), .B(n179), .C(n2085), .D(n2089), .Y(n976) );
  NAND2X1 U988 ( .A(n295), .B(n972), .Y(n947) );
  NAND4X1 U989 ( .A(n1862), .B(N2237), .C(n2085), .D(n2089), .Y(n972) );
  NAND2X1 U990 ( .A(n1860), .B(n1861), .Y(n211) );
  OAI22XL U991 ( .A0(n1870), .A1(n949), .B0(n1857), .B1(n952), .Y(n1823) );
  OAI22XL U992 ( .A0(n1881), .A1(n949), .B0(n1857), .B1(n964), .Y(n1818) );
  OAI22XL U993 ( .A0(n1878), .A1(n947), .B0(n1856), .B1(n964), .Y(n1817) );
  OAI22XL U994 ( .A0(n1856), .A1(n952), .B0(n1890), .B1(n947), .Y(n1822) );
  OAI22XL U995 ( .A0(n1886), .A1(n949), .B0(n941), .B1(n1857), .Y(n1813) );
  OAI22XL U996 ( .A0(n1885), .A1(n947), .B0(n941), .B1(n1856), .Y(n1812) );
  CLKINVX1 U997 ( .A(n967), .Y(n1867) );
  INVX4 U998 ( .A(n491), .Y(n490) );
  BUFX4 U999 ( .A(n1869), .Y(n422) );
  CLKBUFX3 U1000 ( .A(n213), .Y(n686) );
  CLKBUFX3 U1001 ( .A(n214), .Y(n685) );
  INVX3 U1002 ( .A(n199), .Y(n234) );
  INVX3 U1003 ( .A(n199), .Y(n227) );
  CLKBUFX3 U1004 ( .A(n1869), .Y(n426) );
  CLKINVX1 U1005 ( .A(n202), .Y(n282) );
  INVX3 U1006 ( .A(n185), .Y(n274) );
  INVX3 U1007 ( .A(n188), .Y(n253) );
  CLKINVX1 U1008 ( .A(n202), .Y(n286) );
  INVX3 U1009 ( .A(n194), .Y(n249) );
  CLKINVX1 U1010 ( .A(n200), .Y(n261) );
  INVX3 U1011 ( .A(n205), .Y(n237) );
  INVX3 U1012 ( .A(n205), .Y(n241) );
  INVX3 U1013 ( .A(n203), .Y(n270) );
  CLKINVX1 U1014 ( .A(n202), .Y(n275) );
  CLKINVX1 U1015 ( .A(n200), .Y(n257) );
  CLKINVX1 U1016 ( .A(n200), .Y(n258) );
  INVX3 U1017 ( .A(n194), .Y(n250) );
  CLKINVX1 U1018 ( .A(n917), .Y(n1848) );
  NAND2X1 U1019 ( .A(n2085), .B(n2090), .Y(n204) );
  CLKBUFX3 U1020 ( .A(n228), .Y(n295) );
  NAND2X1 U1021 ( .A(n757), .B(n2089), .Y(n228) );
  NOR3BX1 U1022 ( .AN(n735), .B(n1879), .C(n737), .Y(n730) );
  NOR3X1 U1023 ( .A(n820), .B(n1849), .C(n826), .Y(n817) );
  NAND2X1 U1024 ( .A(n2088), .B(n2089), .Y(n862) );
  NAND2X1 U1025 ( .A(n2088), .B(n729), .Y(n737) );
  OAI31XL U1026 ( .A0(n735), .A1(n1879), .A2(n737), .B0(n729), .Y(n739) );
  OAI31XL U1027 ( .A0(n785), .A1(n786), .A2(n787), .B0(n782), .Y(n789) );
  NOR3X1 U1028 ( .A(n913), .B(n912), .C(n1880), .Y(n918) );
  CLKINVX1 U1029 ( .A(n915), .Y(n1880) );
  NAND3X1 U1030 ( .A(n782), .B(n788), .C(n2088), .Y(n787) );
  AND3X2 U1031 ( .A(n914), .B(n918), .C(n919), .Y(n403) );
  AND3X2 U1032 ( .A(n914), .B(n915), .C(n912), .Y(n409) );
  AND2X2 U1033 ( .A(n784), .B(n783), .Y(n318) );
  CLKBUFX3 U1034 ( .A(n378), .Y(n528) );
  CLKBUFX3 U1035 ( .A(n349), .Y(n559) );
  CLKINVX1 U1036 ( .A(n731), .Y(n1875) );
  AOI211X1 U1037 ( .A0(n1889), .A1(n823), .B0(n820), .C0(n860), .Y(n854) );
  OR2X1 U1038 ( .A(n856), .B(n853), .Y(n860) );
  AOI31X1 U1039 ( .A0(n1872), .A1(n818), .A2(n817), .B0(n1849), .Y(n343) );
  CLKINVX1 U1040 ( .A(n822), .Y(n1872) );
  NOR4X1 U1041 ( .A(n1860), .B(n1861), .C(n210), .D(n490), .Y(n979) );
  OAI221XL U1042 ( .A0(n967), .A1(n977), .B0(n979), .B1(n1868), .C0(n969), .Y(
        n1825) );
  OAI22XL U1043 ( .A0(n2079), .A1(n224), .B0(n226), .B1(n222), .Y(n1621) );
  INVX3 U1044 ( .A(n1164), .Y(n2084) );
  NAND2X1 U1045 ( .A(n979), .B(n980), .Y(n977) );
  CLKINVX1 U1046 ( .A(n933), .Y(n1876) );
  NAND2X1 U1047 ( .A(n832), .B(n1887), .Y(n857) );
  NAND2X1 U1048 ( .A(n2084), .B(n2072), .Y(N2288) );
  CLKINVX1 U1049 ( .A(n930), .Y(n1873) );
  CLKINVX1 U1050 ( .A(n224), .Y(n2082) );
  CLKINVX1 U1051 ( .A(n738), .Y(n1879) );
  CLKINVX1 U1052 ( .A(n219), .Y(n1847) );
  CLKBUFX3 U1053 ( .A(n207), .Y(n690) );
  CLKBUFX3 U1054 ( .A(n207), .Y(n687) );
  CLKBUFX3 U1055 ( .A(n207), .Y(n691) );
  CLKBUFX3 U1056 ( .A(n207), .Y(n692) );
  OAI31XL U1057 ( .A0(n491), .A1(n210), .A2(n211), .B0(n212), .Y(n1355) );
  OAI31XL U1058 ( .A0(n210), .A1(n686), .A2(n685), .B0(n491), .Y(n212) );
  NOR4X1 U1059 ( .A(n490), .B(n1861), .C(n1860), .D(n980), .Y(cross_done) );
  CLKINVX1 U1060 ( .A(n210), .Y(n2080) );
  NOR2BX1 U1061 ( .AN(n269), .B(n2075), .Y(hexarea_done) );
  NOR2X1 U1062 ( .A(n1164), .B(n2074), .Y(N2285) );
  CLKINVX1 U1063 ( .A(n980), .Y(n1862) );
  CLKINVX1 U1064 ( .A(n215), .Y(n1859) );
  AOI221XL U1065 ( .A0(n2080), .A1(n686), .B0(n1861), .B1(n210), .C0(n685), 
        .Y(n215) );
  INVX3 U1066 ( .A(n298), .Y(n2086) );
  CLKBUFX3 U1067 ( .A(n112), .Y(n455) );
  CLKBUFX3 U1068 ( .A(n112), .Y(n450) );
  CLKBUFX3 U1069 ( .A(n110), .Y(n446) );
  AOI222XL U1070 ( .A0(n37), .A1(n1926), .B0(n772), .B1(n1922), .C0(n769), 
        .C1(n1923), .Y(n178) );
  AOI222XL U1071 ( .A0(n37), .A1(n1938), .B0(n772), .B1(n1934), .C0(n769), 
        .C1(n1935), .Y(n184) );
  AOI222XL U1072 ( .A0(n36), .A1(n1932), .B0(n772), .B1(n1928), .C0(n769), 
        .C1(n1929), .Y(n181) );
  AO22X1 U1073 ( .A0(hept_area[17]), .A1(n304), .B0(N2746), .B1(n2083), .Y(
        n1617) );
  OA22X1 U1074 ( .A0(n1363), .A1(n125), .B0(n1374), .B1(n760), .Y(n168) );
  OA22X1 U1075 ( .A0(n1364), .A1(n125), .B0(n1375), .B1(n760), .Y(n171) );
  AOI222XL U1076 ( .A0(n36), .A1(n1914), .B0(n772), .B1(n1910), .C0(n769), 
        .C1(n1911), .Y(n172) );
  OA22X1 U1077 ( .A0(n1365), .A1(n125), .B0(n1376), .B1(n760), .Y(n174) );
  AOI222XL U1078 ( .A0(n37), .A1(n1920), .B0(n772), .B1(n1916), .C0(n769), 
        .C1(n1917), .Y(n175) );
  OAI22X2 U1079 ( .A0(n1418), .A1(n56), .B0(n39), .B1(n115), .Y(side_B[8]) );
  AOI221XL U1080 ( .A0(n775), .A1(n1905), .B0(n162), .B1(n1904), .C0(n118), 
        .Y(n115) );
  OAI222XL U1081 ( .A0(n1363), .A1(n49), .B0(n1374), .B1(n2076), .C0(n1385), 
        .C1(n2077), .Y(n118) );
  OAI222XL U1082 ( .A0(n1366), .A1(n49), .B0(n1377), .B1(n2076), .C0(n1388), 
        .C1(n2077), .Y(n130) );
  OAI222XL U1083 ( .A0(n1364), .A1(n49), .B0(n1375), .B1(n2076), .C0(n1386), 
        .C1(n2077), .Y(n122) );
  OAI222XL U1084 ( .A0(n1365), .A1(n49), .B0(n1376), .B1(n2076), .C0(n1387), 
        .C1(n2077), .Y(n126) );
  AO22X1 U1085 ( .A0(hept_area[10]), .A1(n304), .B0(N2739), .B1(n2083), .Y(
        n1610) );
  AO22X1 U1086 ( .A0(hept_area[11]), .A1(n304), .B0(N2740), .B1(n2083), .Y(
        n1611) );
  AO22X1 U1087 ( .A0(hept_area[12]), .A1(n304), .B0(N2741), .B1(n2083), .Y(
        n1612) );
  AO22X1 U1088 ( .A0(hept_area[14]), .A1(n304), .B0(N2743), .B1(n2083), .Y(
        n1614) );
  AO22X1 U1089 ( .A0(hept_area[15]), .A1(n304), .B0(N2744), .B1(n2083), .Y(
        n1615) );
  OAI22X2 U1090 ( .A0(n1416), .A1(n56), .B0(n821), .B1(n147), .Y(side_B[10])
         );
  AOI221XL U1091 ( .A0(n778), .A1(n1893), .B0(n159), .B1(n1892), .C0(n150), 
        .Y(n147) );
  OAI222XL U1092 ( .A0(n1361), .A1(n49), .B0(n1372), .B1(n2076), .C0(n1383), 
        .C1(n2077), .Y(n150) );
  AOI221XL U1093 ( .A0(n775), .A1(n1899), .B0(n159), .B1(n1898), .C0(n111), 
        .Y(n106) );
  OAI222XL U1094 ( .A0(n1362), .A1(n49), .B0(n1373), .B1(n2076), .C0(n1384), 
        .C1(n2077), .Y(n111) );
  OA22X1 U1095 ( .A0(n1362), .A1(n125), .B0(n1373), .B1(n760), .Y(n160) );
  OA22X1 U1096 ( .A0(n1361), .A1(n125), .B0(n1372), .B1(n760), .Y(n192) );
  AO22X1 U1097 ( .A0(hept_area[8]), .A1(n304), .B0(N2737), .B1(n2083), .Y(
        n1608) );
  AO22X1 U1098 ( .A0(hept_area[3]), .A1(n304), .B0(N2732), .B1(n2083), .Y(
        n1603) );
  AO22X1 U1099 ( .A0(hept_area[4]), .A1(n304), .B0(N2733), .B1(n2083), .Y(
        n1604) );
  AO22X1 U1100 ( .A0(hept_area[5]), .A1(n304), .B0(N2734), .B1(n2083), .Y(
        n1605) );
  AO22X1 U1101 ( .A0(hept_area[6]), .A1(n304), .B0(N2735), .B1(n2083), .Y(
        n1606) );
  AO22X1 U1102 ( .A0(hept_area[0]), .A1(n304), .B0(N2729), .B1(n2083), .Y(
        n1600) );
  AO22X1 U1103 ( .A0(hept_area[1]), .A1(n304), .B0(N2730), .B1(n2083), .Y(
        n1601) );
  AO22X1 U1104 ( .A0(n74), .A1(n304), .B0(N2731), .B1(n2083), .Y(n1602) );
  AOI222XL U1105 ( .A0(n37), .A1(n84), .B0(n772), .B1(n1993), .C0(n766), .C1(
        n1994), .Y(n1037) );
  OAI211X1 U1106 ( .A0(n1453), .A1(n155), .B0(n1056), .C0(n1057), .Y(N2470) );
  OA22X1 U1107 ( .A0(n1433), .A1(n125), .B0(n1443), .B1(n763), .Y(n1056) );
  AOI222XL U1108 ( .A0(n36), .A1(n85), .B0(n772), .B1(n2050), .C0(n766), .C1(
        n2051), .Y(n1057) );
  OAI211X1 U1109 ( .A0(n1546), .A1(n54), .B0(n989), .C0(n990), .Y(N2563) );
  AOI222XL U1110 ( .A0(n69), .A1(n2012), .B0(n292), .B1(n2013), .C0(n157), 
        .C1(n2009), .Y(n990) );
  AOI222XL U1111 ( .A0(n69), .A1(n2070), .B0(n292), .B1(n2071), .C0(n157), 
        .C1(n2067), .Y(n1010) );
  OA22X1 U1112 ( .A0(n1496), .A1(n125), .B0(n1506), .B1(n760), .Y(n1030) );
  AOI222XL U1113 ( .A0(n36), .A1(n55), .B0(n772), .B1(n2010), .C0(n766), .C1(
        n2011), .Y(n1031) );
  OAI211X1 U1114 ( .A0(n1456), .A1(n155), .B0(n1050), .C0(n1051), .Y(N2473) );
  OA22X1 U1115 ( .A0(n1436), .A1(n125), .B0(n1446), .B1(n763), .Y(n1050) );
  AOI222XL U1116 ( .A0(n37), .A1(\X[0][0] ), .B0(n772), .B1(n2068), .C0(n766), 
        .C1(n2069), .Y(n1051) );
  OAI211X1 U1117 ( .A0(n1455), .A1(n155), .B0(n1052), .C0(n1053), .Y(N2472) );
  OA22X1 U1118 ( .A0(n1435), .A1(n125), .B0(n1445), .B1(n763), .Y(n1052) );
  AOI222XL U1119 ( .A0(n36), .A1(n2066), .B0(n772), .B1(n2062), .C0(n766), 
        .C1(n2063), .Y(n1053) );
  AOI222XL U1120 ( .A0(n36), .A1(n92), .B0(n772), .B1(n1999), .C0(n766), .C1(
        n2000), .Y(n1035) );
  OAI211X1 U1121 ( .A0(n1454), .A1(n155), .B0(n1054), .C0(n1055), .Y(N2471) );
  OA22X1 U1122 ( .A0(n1434), .A1(n125), .B0(n1444), .B1(n763), .Y(n1054) );
  AOI222XL U1123 ( .A0(n37), .A1(n2060), .B0(n772), .B1(n2056), .C0(n769), 
        .C1(n2057), .Y(n1055) );
  OAI211X1 U1124 ( .A0(n1512), .A1(n155), .B0(n1038), .C0(n1039), .Y(N2485) );
  OA22X1 U1125 ( .A0(n1492), .A1(n125), .B0(n1502), .B1(n763), .Y(n1038) );
  AOI222XL U1126 ( .A0(n37), .A1(n86), .B0(n772), .B1(n1987), .C0(n766), .C1(
        n1988), .Y(n1039) );
  AO22X1 U1127 ( .A0(N2564), .A1(n859), .B0(N2504), .B1(n821), .Y(diff_y[0])
         );
  AO22X1 U1128 ( .A0(N2534), .A1(n859), .B0(N2493), .B1(n39), .Y(diff_x[0]) );
  OAI211X1 U1129 ( .A0(n1545), .A1(n53), .B0(n991), .C0(n992), .Y(N2562) );
  OAI211X1 U1130 ( .A0(n1485), .A1(n54), .B0(n1011), .C0(n1012), .Y(N2532) );
  OAI211X1 U1131 ( .A0(n1483), .A1(n53), .B0(n1015), .C0(n1016), .Y(N2530) );
  AOI22X1 U1132 ( .A0(n2050), .A1(n159), .B0(n2051), .B1(n775), .Y(n1015) );
  OAI211X1 U1133 ( .A0(n1484), .A1(n53), .B0(n1013), .C0(n1014), .Y(N2531) );
  AOI22X1 U1134 ( .A0(n2056), .A1(n162), .B0(n2057), .B1(n778), .Y(n1013) );
  OAI211X1 U1135 ( .A0(n1482), .A1(n53), .B0(n1017), .C0(n1018), .Y(N2529) );
  AOI22X1 U1136 ( .A0(n2044), .A1(n159), .B0(n2045), .B1(n775), .Y(n1017) );
  OAI211X1 U1137 ( .A0(n1481), .A1(n54), .B0(n1019), .C0(n1020), .Y(N2528) );
  AOI22X1 U1138 ( .A0(n2038), .A1(n159), .B0(n2039), .B1(n775), .Y(n1019) );
  OAI211X1 U1139 ( .A0(n1540), .A1(n53), .B0(n1001), .C0(n1002), .Y(N2557) );
  AOI22X1 U1140 ( .A0(n1975), .A1(n162), .B0(n1976), .B1(n778), .Y(n1001) );
  OAI211X1 U1141 ( .A0(n1480), .A1(n53), .B0(n1021), .C0(n1022), .Y(N2527) );
  AOI22X1 U1142 ( .A0(n2032), .A1(n159), .B0(n2033), .B1(n775), .Y(n1021) );
  OAI211X1 U1143 ( .A0(n1539), .A1(n53), .B0(n1003), .C0(n1004), .Y(N2556) );
  AOI22X1 U1144 ( .A0(n1969), .A1(n162), .B0(n1970), .B1(n778), .Y(n1003) );
  OAI211X1 U1145 ( .A0(n1479), .A1(n53), .B0(n1023), .C0(n1024), .Y(N2526) );
  AOI22X1 U1146 ( .A0(n2026), .A1(n159), .B0(n2027), .B1(n775), .Y(n1023) );
  OAI211X1 U1147 ( .A0(n1538), .A1(n54), .B0(n1005), .C0(n1006), .Y(N2555) );
  AOI22X1 U1148 ( .A0(n1963), .A1(n162), .B0(n1964), .B1(n778), .Y(n1005) );
  OAI211X1 U1149 ( .A0(n1452), .A1(n155), .B0(n1058), .C0(n1059), .Y(N2469) );
  OA22X1 U1150 ( .A0(n1432), .A1(n125), .B0(n1442), .B1(n763), .Y(n1058) );
  AOI222XL U1151 ( .A0(n36), .A1(n87), .B0(n772), .B1(n2044), .C0(n766), .C1(
        n2045), .Y(n1059) );
  OAI211X1 U1152 ( .A0(n1451), .A1(n155), .B0(n1060), .C0(n1061), .Y(N2468) );
  OA22X1 U1153 ( .A0(n1431), .A1(n125), .B0(n1441), .B1(n763), .Y(n1060) );
  AOI222XL U1154 ( .A0(n36), .A1(n89), .B0(n772), .B1(n2038), .C0(n766), .C1(
        n2039), .Y(n1061) );
  OAI211X1 U1155 ( .A0(n1450), .A1(n155), .B0(n1062), .C0(n1063), .Y(N2467) );
  OA22X1 U1156 ( .A0(n1430), .A1(n125), .B0(n1440), .B1(n763), .Y(n1062) );
  AOI222XL U1157 ( .A0(n36), .A1(n99), .B0(n772), .B1(n2032), .C0(n766), .C1(
        n2033), .Y(n1063) );
  OAI211X1 U1158 ( .A0(n1511), .A1(n155), .B0(n1040), .C0(n1041), .Y(N2484) );
  OA22X1 U1159 ( .A0(n1491), .A1(n125), .B0(n1501), .B1(n763), .Y(n1040) );
  AOI222XL U1160 ( .A0(n37), .A1(n88), .B0(n772), .B1(n1981), .C0(n766), .C1(
        n1982), .Y(n1041) );
  OAI211X1 U1161 ( .A0(n1510), .A1(n155), .B0(n1042), .C0(n1043), .Y(N2483) );
  OA22X1 U1162 ( .A0(n1490), .A1(n125), .B0(n1500), .B1(n763), .Y(n1042) );
  AOI222XL U1163 ( .A0(n37), .A1(n98), .B0(n772), .B1(n1975), .C0(n766), .C1(
        n1976), .Y(n1043) );
  OAI211X1 U1164 ( .A0(n1478), .A1(n53), .B0(n1025), .C0(n1026), .Y(N2525) );
  AOI22X1 U1165 ( .A0(n2020), .A1(n162), .B0(n2021), .B1(n775), .Y(n1025) );
  OAI211X1 U1166 ( .A0(n1537), .A1(n53), .B0(n1007), .C0(n1008), .Y(N2554) );
  AOI22X1 U1167 ( .A0(n1958), .A1(n162), .B0(n1959), .B1(n775), .Y(n1007) );
  OAI211X1 U1168 ( .A0(n1477), .A1(n53), .B0(n1027), .C0(n1028), .Y(N2524) );
  AOI22X1 U1169 ( .A0(n2015), .A1(n159), .B0(n2016), .B1(n778), .Y(n1027) );
  OAI211X1 U1170 ( .A0(n1449), .A1(n155), .B0(n1064), .C0(n1065), .Y(N2466) );
  OA22X1 U1171 ( .A0(n1429), .A1(n125), .B0(n1439), .B1(n763), .Y(n1064) );
  AOI222XL U1172 ( .A0(n36), .A1(n95), .B0(n772), .B1(n2026), .C0(n769), .C1(
        n2027), .Y(n1065) );
  OAI211X1 U1173 ( .A0(n1448), .A1(n155), .B0(n1066), .C0(n1067), .Y(N2465) );
  OA22X1 U1174 ( .A0(n1428), .A1(n125), .B0(n1438), .B1(n763), .Y(n1066) );
  AOI222XL U1175 ( .A0(n36), .A1(n96), .B0(n164), .B1(n2020), .C0(n766), .C1(
        n2021), .Y(n1067) );
  OAI211X1 U1176 ( .A0(n1507), .A1(n155), .B0(n1048), .C0(n1049), .Y(N2480) );
  OA22X1 U1177 ( .A0(n1487), .A1(n125), .B0(n1497), .B1(n763), .Y(n1048) );
  AOI222XL U1178 ( .A0(n37), .A1(n1961), .B0(n164), .B1(n1958), .C0(n766), 
        .C1(n1959), .Y(n1049) );
  OAI211X1 U1179 ( .A0(n1509), .A1(n155), .B0(n1044), .C0(n1045), .Y(N2482) );
  OA22X1 U1180 ( .A0(n1489), .A1(n125), .B0(n1499), .B1(n763), .Y(n1044) );
  AOI222XL U1181 ( .A0(n37), .A1(n94), .B0(n772), .B1(n1969), .C0(n766), .C1(
        n1970), .Y(n1045) );
  OAI211X1 U1182 ( .A0(n1508), .A1(n155), .B0(n1046), .C0(n1047), .Y(N2481) );
  OA22X1 U1183 ( .A0(n1488), .A1(n125), .B0(n1498), .B1(n763), .Y(n1046) );
  AOI222XL U1184 ( .A0(n37), .A1(n97), .B0(n772), .B1(n1963), .C0(n766), .C1(
        n1964), .Y(n1047) );
  OAI211X1 U1185 ( .A0(n1447), .A1(n155), .B0(n1068), .C0(n1069), .Y(N2464) );
  OA22X1 U1186 ( .A0(n1427), .A1(n125), .B0(n1437), .B1(n763), .Y(n1068) );
  AOI222XL U1187 ( .A0(n36), .A1(n2018), .B0(n164), .B1(n2015), .C0(n766), 
        .C1(n2016), .Y(n1069) );
  INVX3 U1188 ( .A(n1468), .Y(n2020) );
  INVX3 U1189 ( .A(n1528), .Y(n1963) );
  INVX3 U1190 ( .A(n1527), .Y(n1958) );
  INVX3 U1191 ( .A(n1437), .Y(n2017) );
  CLKINVX1 U1192 ( .A(n1537), .Y(n1961) );
  CLKINVX1 U1193 ( .A(n1477), .Y(n2018) );
  OAI211X1 U1194 ( .A0(n1392), .A1(n313), .B0(n339), .C0(n340), .Y(n1653) );
  OA22X1 U1195 ( .A0(n1370), .A1(n625), .B0(n1381), .B1(n620), .Y(n339) );
  AOI222XL U1196 ( .A0(n318), .A1(n1947), .B0(n635), .B1(n1946), .C0(n634), 
        .C1(in_R[1]), .Y(n340) );
  OAI211X1 U1197 ( .A0(n1391), .A1(n313), .B0(n337), .C0(n338), .Y(n1652) );
  OA22X1 U1198 ( .A0(n1369), .A1(n625), .B0(n1380), .B1(n620), .Y(n337) );
  AOI222XL U1199 ( .A0(n318), .A1(n1941), .B0(n635), .B1(n1940), .C0(n634), 
        .C1(in_R[2]), .Y(n338) );
  OAI211X1 U1200 ( .A0(n1390), .A1(n313), .B0(n335), .C0(n336), .Y(n1651) );
  OA22X1 U1201 ( .A0(n1368), .A1(n625), .B0(n1379), .B1(n620), .Y(n335) );
  AOI222XL U1202 ( .A0(n318), .A1(n1935), .B0(n635), .B1(n1934), .C0(n634), 
        .C1(in_R[3]), .Y(n336) );
  OAI211X1 U1203 ( .A0(n1389), .A1(n313), .B0(n333), .C0(n334), .Y(n1650) );
  OA22X1 U1204 ( .A0(n1367), .A1(n625), .B0(n1378), .B1(n620), .Y(n333) );
  AOI222XL U1205 ( .A0(n640), .A1(n1929), .B0(n635), .B1(n1928), .C0(n634), 
        .C1(in_R[4]), .Y(n334) );
  OAI211X1 U1206 ( .A0(n1388), .A1(n313), .B0(n331), .C0(n332), .Y(n1649) );
  OA22X1 U1207 ( .A0(n1366), .A1(n625), .B0(n1377), .B1(n620), .Y(n331) );
  AOI222XL U1208 ( .A0(n640), .A1(n1923), .B0(n635), .B1(n1922), .C0(n630), 
        .C1(in_R[5]), .Y(n332) );
  OAI211X1 U1209 ( .A0(n1387), .A1(n310), .B0(n329), .C0(n330), .Y(n1648) );
  OA22X1 U1210 ( .A0(n1365), .A1(n625), .B0(n1376), .B1(n620), .Y(n329) );
  AOI222XL U1211 ( .A0(n640), .A1(n1917), .B0(n635), .B1(n1916), .C0(n630), 
        .C1(in_R[6]), .Y(n330) );
  OAI211X1 U1212 ( .A0(n1386), .A1(n310), .B0(n327), .C0(n328), .Y(n1647) );
  OA22X1 U1213 ( .A0(n1364), .A1(n625), .B0(n1375), .B1(n620), .Y(n327) );
  AOI222XL U1214 ( .A0(n640), .A1(n1911), .B0(n635), .B1(n1910), .C0(n634), 
        .C1(in_R[7]), .Y(n328) );
  OAI211X1 U1215 ( .A0(n1385), .A1(n313), .B0(n325), .C0(n326), .Y(n1646) );
  OA22X1 U1216 ( .A0(n1363), .A1(n625), .B0(n1374), .B1(n620), .Y(n325) );
  AOI222XL U1217 ( .A0(n640), .A1(n1905), .B0(n635), .B1(n1904), .C0(n320), 
        .C1(in_R[8]), .Y(n326) );
  OAI211X1 U1218 ( .A0(n1384), .A1(n313), .B0(n323), .C0(n324), .Y(n1645) );
  OA22X1 U1219 ( .A0(n1362), .A1(n625), .B0(n1373), .B1(n620), .Y(n323) );
  AOI222XL U1220 ( .A0(n640), .A1(n1899), .B0(n635), .B1(n1898), .C0(n320), 
        .C1(in_R[9]), .Y(n324) );
  OAI211X1 U1221 ( .A0(n1383), .A1(n310), .B0(n316), .C0(n317), .Y(n1644) );
  OA22X1 U1222 ( .A0(n1361), .A1(n625), .B0(n1372), .B1(n620), .Y(n316) );
  AOI222XL U1223 ( .A0(n640), .A1(n1893), .B0(n635), .B1(n1892), .C0(n320), 
        .C1(in_R[10]), .Y(n317) );
  NAND2X1 U1224 ( .A(n908), .B(n909), .Y(n1807) );
  AOI222XL U1225 ( .A0(n314), .A1(n104), .B0(n500), .B1(n2071), .C0(n497), 
        .C1(n2067), .Y(n908) );
  AOI221XL U1226 ( .A0(n521), .A1(n2068), .B0(n515), .B1(n2069), .C0(n910), 
        .Y(n909) );
  OAI22XL U1227 ( .A0(n509), .A1(n2101), .B0(n1456), .B1(n503), .Y(n910) );
  NAND2X1 U1228 ( .A(n903), .B(n904), .Y(n1806) );
  AOI222XL U1229 ( .A0(n314), .A1(n91), .B0(n500), .B1(n2065), .C0(n496), .C1(
        n2061), .Y(n903) );
  AOI221XL U1230 ( .A0(n518), .A1(n2062), .B0(n515), .B1(n2063), .C0(n905), 
        .Y(n904) );
  OAI22XL U1231 ( .A0(n509), .A1(n2100), .B0(n1455), .B1(n407), .Y(n905) );
  NAND2X1 U1232 ( .A(n898), .B(n899), .Y(n1805) );
  AOI222XL U1233 ( .A0(n314), .A1(n93), .B0(n500), .B1(n2059), .C0(n410), .C1(
        n2055), .Y(n898) );
  AOI221XL U1234 ( .A0(n518), .A1(n2056), .B0(n515), .B1(n2057), .C0(n900), 
        .Y(n899) );
  OAI22XL U1235 ( .A0(n509), .A1(n2099), .B0(n1454), .B1(n506), .Y(n900) );
  NAND2X1 U1236 ( .A(n893), .B(n894), .Y(n1804) );
  AOI222XL U1237 ( .A0(n314), .A1(n2054), .B0(n500), .B1(n2053), .C0(n410), 
        .C1(n2049), .Y(n893) );
  AOI221XL U1238 ( .A0(n402), .A1(n2050), .B0(n515), .B1(n2051), .C0(n895), 
        .Y(n894) );
  OAI22XL U1239 ( .A0(n509), .A1(n2098), .B0(n1453), .B1(n503), .Y(n895) );
  NAND2X1 U1240 ( .A(n888), .B(n889), .Y(n1803) );
  AOI222XL U1241 ( .A0(n314), .A1(n2048), .B0(n500), .B1(n2047), .C0(n497), 
        .C1(n2043), .Y(n888) );
  AOI221XL U1242 ( .A0(n521), .A1(n2044), .B0(n515), .B1(n2045), .C0(n890), 
        .Y(n889) );
  OAI22XL U1243 ( .A0(n509), .A1(n2097), .B0(n1452), .B1(n506), .Y(n890) );
  NAND2X1 U1244 ( .A(n883), .B(n884), .Y(n1802) );
  AOI222XL U1245 ( .A0(n314), .A1(n2042), .B0(n500), .B1(n2041), .C0(n496), 
        .C1(n2037), .Y(n883) );
  AOI221XL U1246 ( .A0(n518), .A1(n2038), .B0(n515), .B1(n2039), .C0(n885), 
        .Y(n884) );
  OAI22XL U1247 ( .A0(n509), .A1(n2096), .B0(n1451), .B1(n503), .Y(n885) );
  NAND2X1 U1248 ( .A(n878), .B(n879), .Y(n1801) );
  AOI222XL U1249 ( .A0(n314), .A1(n2036), .B0(n500), .B1(n2035), .C0(n410), 
        .C1(n2031), .Y(n878) );
  AOI221XL U1250 ( .A0(n402), .A1(n2032), .B0(n515), .B1(n2033), .C0(n880), 
        .Y(n879) );
  OAI22XL U1251 ( .A0(n509), .A1(n2095), .B0(n1450), .B1(n506), .Y(n880) );
  NAND2X1 U1252 ( .A(n873), .B(n874), .Y(n1800) );
  AOI222XL U1253 ( .A0(n314), .A1(n2030), .B0(n500), .B1(n2029), .C0(n497), 
        .C1(n2025), .Y(n873) );
  AOI221XL U1254 ( .A0(n521), .A1(n2026), .B0(n515), .B1(n2027), .C0(n875), 
        .Y(n874) );
  OAI22XL U1255 ( .A0(n509), .A1(n2094), .B0(n1449), .B1(n506), .Y(n875) );
  NAND2X1 U1256 ( .A(n868), .B(n869), .Y(n1799) );
  AOI222XL U1257 ( .A0(n314), .A1(n2024), .B0(n500), .B1(n2023), .C0(n497), 
        .C1(n2019), .Y(n868) );
  AOI221XL U1258 ( .A0(n521), .A1(n2020), .B0(n515), .B1(n2021), .C0(n870), 
        .Y(n869) );
  OAI22XL U1259 ( .A0(n509), .A1(n2093), .B0(n1448), .B1(n506), .Y(n870) );
  NAND2X1 U1260 ( .A(n863), .B(n864), .Y(n1798) );
  AOI222XL U1261 ( .A0(n314), .A1(n2018), .B0(n500), .B1(n2017), .C0(n497), 
        .C1(n2014), .Y(n863) );
  AOI221XL U1262 ( .A0(n521), .A1(n2015), .B0(n515), .B1(n2016), .C0(n865), 
        .Y(n864) );
  OAI22XL U1263 ( .A0(n509), .A1(n2092), .B0(n1447), .B1(n506), .Y(n865) );
  NAND2X1 U1264 ( .A(n646), .B(n647), .Y(n1747) );
  AOI222XL U1265 ( .A0(n314), .A1(n100), .B0(n500), .B1(n2013), .C0(n497), 
        .C1(n2009), .Y(n646) );
  AOI221XL U1266 ( .A0(n521), .A1(n2010), .B0(n515), .B1(n2011), .C0(n648), 
        .Y(n647) );
  OAI22XL U1267 ( .A0(n509), .A1(n2111), .B0(n1516), .B1(n506), .Y(n648) );
  NAND2X1 U1268 ( .A(n641), .B(n642), .Y(n1746) );
  AOI222XL U1269 ( .A0(n314), .A1(n2008), .B0(n500), .B1(n2007), .C0(n497), 
        .C1(n2003), .Y(n641) );
  AOI221XL U1270 ( .A0(n521), .A1(n2004), .B0(n515), .B1(n2005), .C0(n643), 
        .Y(n642) );
  OAI22XL U1271 ( .A0(n509), .A1(n2110), .B0(n1515), .B1(n506), .Y(n643) );
  NAND2X1 U1272 ( .A(n636), .B(n637), .Y(n1745) );
  AOI222XL U1273 ( .A0(n314), .A1(n2002), .B0(n409), .B1(n2001), .C0(n497), 
        .C1(n1998), .Y(n636) );
  AOI221XL U1274 ( .A0(n521), .A1(n1999), .B0(n515), .B1(n2000), .C0(n638), 
        .Y(n637) );
  OAI22XL U1275 ( .A0(n509), .A1(n2109), .B0(n1514), .B1(n506), .Y(n638) );
  NAND2X1 U1276 ( .A(n631), .B(n632), .Y(n1744) );
  AOI222XL U1277 ( .A0(n314), .A1(n1997), .B0(n409), .B1(n1996), .C0(n497), 
        .C1(n1992), .Y(n631) );
  AOI221XL U1278 ( .A0(n521), .A1(n1993), .B0(n515), .B1(n1994), .C0(n633), 
        .Y(n632) );
  OAI22XL U1279 ( .A0(n512), .A1(n2108), .B0(n1513), .B1(n506), .Y(n633) );
  NAND2X1 U1280 ( .A(n626), .B(n627), .Y(n1743) );
  AOI222XL U1281 ( .A0(n314), .A1(n1991), .B0(n409), .B1(n1990), .C0(n497), 
        .C1(n1986), .Y(n626) );
  AOI221XL U1282 ( .A0(n521), .A1(n1987), .B0(n515), .B1(n1988), .C0(n628), 
        .Y(n627) );
  OAI22XL U1283 ( .A0(n512), .A1(n2107), .B0(n1512), .B1(n506), .Y(n628) );
  NAND2X1 U1284 ( .A(n621), .B(n622), .Y(n1742) );
  AOI222XL U1285 ( .A0(n314), .A1(n1985), .B0(n409), .B1(n1984), .C0(n497), 
        .C1(n1980), .Y(n621) );
  AOI221XL U1286 ( .A0(n521), .A1(n1981), .B0(n515), .B1(n1982), .C0(n623), 
        .Y(n622) );
  OAI22XL U1287 ( .A0(n512), .A1(n2106), .B0(n1511), .B1(n506), .Y(n623) );
  NAND2X1 U1288 ( .A(n616), .B(n617), .Y(n1741) );
  AOI222XL U1289 ( .A0(n315), .A1(n1979), .B0(n409), .B1(n1978), .C0(n497), 
        .C1(n1974), .Y(n616) );
  AOI221XL U1290 ( .A0(n521), .A1(n1975), .B0(n403), .B1(n1976), .C0(n618), 
        .Y(n617) );
  OAI22XL U1291 ( .A0(n512), .A1(n2105), .B0(n1510), .B1(n506), .Y(n618) );
  NAND2X1 U1292 ( .A(n611), .B(n612), .Y(n1740) );
  AOI222XL U1293 ( .A0(n315), .A1(n1973), .B0(n409), .B1(n1972), .C0(n497), 
        .C1(n1968), .Y(n611) );
  AOI221XL U1294 ( .A0(n521), .A1(n1969), .B0(n403), .B1(n1970), .C0(n613), 
        .Y(n612) );
  OAI22XL U1295 ( .A0(n512), .A1(n2104), .B0(n1509), .B1(n506), .Y(n613) );
  NAND2X1 U1296 ( .A(n606), .B(n607), .Y(n1739) );
  AOI222XL U1297 ( .A0(n315), .A1(n1967), .B0(n500), .B1(n1966), .C0(n497), 
        .C1(n1962), .Y(n606) );
  AOI221XL U1298 ( .A0(n521), .A1(n1963), .B0(n515), .B1(n1964), .C0(n608), 
        .Y(n607) );
  OAI22XL U1299 ( .A0(n512), .A1(n2103), .B0(n1508), .B1(n506), .Y(n608) );
  NAND2X1 U1300 ( .A(n601), .B(n602), .Y(n1738) );
  AOI222XL U1301 ( .A0(n315), .A1(n1961), .B0(n500), .B1(n1960), .C0(n496), 
        .C1(n1957), .Y(n601) );
  AOI221XL U1302 ( .A0(n518), .A1(n1958), .B0(n515), .B1(n1959), .C0(n603), 
        .Y(n602) );
  OAI22XL U1303 ( .A0(n512), .A1(n2102), .B0(n1507), .B1(n503), .Y(n603) );
  NAND2X1 U1304 ( .A(n447), .B(n448), .Y(n1687) );
  AOI222XL U1305 ( .A0(n315), .A1(n1956), .B0(n500), .B1(n1955), .C0(n496), 
        .C1(n1951), .Y(n447) );
  AOI221XL U1306 ( .A0(n518), .A1(n1952), .B0(n403), .B1(n1953), .C0(n449), 
        .Y(n448) );
  OAI22XL U1307 ( .A0(n2122), .A1(n512), .B0(n1393), .B1(n503), .Y(n449) );
  AOI222XL U1308 ( .A0(n610), .A1(n2067), .B0(n609), .B1(n2070), .C0(in_X[0]), 
        .C1(n580), .Y(n815) );
  AOI222XL U1309 ( .A0(n614), .A1(n2061), .B0(n609), .B1(n2064), .C0(in_X[1]), 
        .C1(n580), .Y(n813) );
  AOI222XL U1310 ( .A0(n610), .A1(n2055), .B0(n609), .B1(n2058), .C0(in_X[2]), 
        .C1(n580), .Y(n811) );
  AOI222XL U1311 ( .A0(n610), .A1(n2049), .B0(n609), .B1(n2052), .C0(in_X[3]), 
        .C1(n580), .Y(n809) );
  AOI222XL U1312 ( .A0(n610), .A1(n2043), .B0(n609), .B1(n2046), .C0(in_X[4]), 
        .C1(n580), .Y(n807) );
  AOI222XL U1313 ( .A0(n610), .A1(n2037), .B0(n609), .B1(n2040), .C0(in_X[5]), 
        .C1(n580), .Y(n805) );
  AOI222XL U1314 ( .A0(n346), .A1(n2031), .B0(n609), .B1(n2034), .C0(in_X[6]), 
        .C1(n580), .Y(n803) );
  AOI222XL U1315 ( .A0(n614), .A1(n2025), .B0(n609), .B1(n2028), .C0(in_X[7]), 
        .C1(n580), .Y(n801) );
  AOI222XL U1316 ( .A0(n614), .A1(n2019), .B0(n609), .B1(n2022), .C0(in_X[8]), 
        .C1(n580), .Y(n799) );
  AOI2BB2X1 U1317 ( .B0(n559), .B1(n2017), .A0N(n1467), .A1N(n553), .Y(n796)
         );
  AOI222XL U1318 ( .A0(n614), .A1(n2014), .B0(n609), .B1(\X[3][9] ), .C0(
        in_X[9]), .C1(n580), .Y(n797) );
  AOI222XL U1319 ( .A0(n614), .A1(n2009), .B0(n347), .B1(n2012), .C0(in_Y[0]), 
        .C1(n580), .Y(n579) );
  AOI222XL U1320 ( .A0(n614), .A1(n2003), .B0(n609), .B1(n2006), .C0(in_Y[1]), 
        .C1(n580), .Y(n577) );
  AOI222XL U1321 ( .A0(n614), .A1(n1998), .B0(n609), .B1(\Y[3][2] ), .C0(
        in_Y[2]), .C1(n604), .Y(n575) );
  AOI222XL U1322 ( .A0(n614), .A1(n1992), .B0(n609), .B1(n1995), .C0(in_Y[3]), 
        .C1(n604), .Y(n573) );
  AOI222XL U1323 ( .A0(n614), .A1(n1986), .B0(n605), .B1(n1989), .C0(in_Y[4]), 
        .C1(n604), .Y(n571) );
  AOI222XL U1324 ( .A0(n614), .A1(n1980), .B0(n609), .B1(n1983), .C0(in_Y[5]), 
        .C1(n604), .Y(n569) );
  AOI222XL U1325 ( .A0(n614), .A1(n1974), .B0(n347), .B1(n1977), .C0(in_Y[6]), 
        .C1(n604), .Y(n567) );
  AOI222XL U1326 ( .A0(n614), .A1(n1968), .B0(n347), .B1(n1971), .C0(in_Y[7]), 
        .C1(n604), .Y(n565) );
  AOI222XL U1327 ( .A0(n614), .A1(n1962), .B0(n605), .B1(n1965), .C0(in_Y[8]), 
        .C1(n604), .Y(n563) );
  AOI222XL U1328 ( .A0(n610), .A1(n1957), .B0(n605), .B1(\Y[3][9] ), .C0(
        in_Y[9]), .C1(n604), .Y(n561) );
  AOI222XL U1329 ( .A0(n640), .A1(n2069), .B0(n639), .B1(n2068), .C0(in_X[0]), 
        .C1(n630), .Y(n780) );
  AOI222XL U1330 ( .A0(n318), .A1(n2063), .B0(n635), .B1(n2062), .C0(in_X[1]), 
        .C1(n630), .Y(n777) );
  AOI222XL U1331 ( .A0(n318), .A1(n2057), .B0(n635), .B1(n2056), .C0(in_X[2]), 
        .C1(n630), .Y(n774) );
  AOI222XL U1332 ( .A0(n318), .A1(n2051), .B0(n639), .B1(n2050), .C0(in_X[3]), 
        .C1(n630), .Y(n771) );
  AOI222XL U1333 ( .A0(n318), .A1(n2045), .B0(n635), .B1(n2044), .C0(in_X[4]), 
        .C1(n630), .Y(n768) );
  AOI222XL U1334 ( .A0(n318), .A1(n2039), .B0(n639), .B1(n2038), .C0(in_X[5]), 
        .C1(n630), .Y(n765) );
  AOI222XL U1335 ( .A0(n318), .A1(n2033), .B0(n635), .B1(n2032), .C0(in_X[6]), 
        .C1(n630), .Y(n762) );
  AOI222XL U1336 ( .A0(n640), .A1(n2027), .B0(n639), .B1(n2026), .C0(in_X[7]), 
        .C1(n630), .Y(n759) );
  AOI222XL U1337 ( .A0(n640), .A1(n2021), .B0(n639), .B1(n2020), .C0(in_X[8]), 
        .C1(n630), .Y(n756) );
  OAI211X1 U1338 ( .A0(n1447), .A1(n310), .B0(n752), .C0(n753), .Y(n1768) );
  OA22X1 U1339 ( .A0(n1427), .A1(n629), .B0(n1437), .B1(n620), .Y(n752) );
  AOI222XL U1340 ( .A0(n640), .A1(n2016), .B0(n639), .B1(n2015), .C0(in_X[9]), 
        .C1(n630), .Y(n753) );
  AOI222XL U1341 ( .A0(n640), .A1(n2011), .B0(n639), .B1(n2010), .C0(in_Y[0]), 
        .C1(n630), .Y(n558) );
  AOI222XL U1342 ( .A0(n640), .A1(n2005), .B0(n639), .B1(n2004), .C0(in_Y[1]), 
        .C1(n630), .Y(n555) );
  AOI222XL U1343 ( .A0(n640), .A1(n2000), .B0(n639), .B1(n1999), .C0(in_Y[2]), 
        .C1(n634), .Y(n552) );
  AOI222XL U1344 ( .A0(n640), .A1(n1994), .B0(n639), .B1(n1993), .C0(in_Y[3]), 
        .C1(n634), .Y(n549) );
  AOI222XL U1345 ( .A0(n640), .A1(n1988), .B0(n639), .B1(n1987), .C0(in_Y[4]), 
        .C1(n634), .Y(n546) );
  AOI222XL U1346 ( .A0(n640), .A1(n1982), .B0(n639), .B1(n1981), .C0(in_Y[5]), 
        .C1(n634), .Y(n543) );
  AOI222XL U1347 ( .A0(n318), .A1(n1976), .B0(n639), .B1(n1975), .C0(in_Y[6]), 
        .C1(n634), .Y(n540) );
  AOI222XL U1348 ( .A0(n640), .A1(n1970), .B0(n639), .B1(n1969), .C0(in_Y[7]), 
        .C1(n634), .Y(n537) );
  AOI222XL U1349 ( .A0(n318), .A1(n1964), .B0(n639), .B1(n1963), .C0(in_Y[8]), 
        .C1(n634), .Y(n534) );
  OAI211X1 U1350 ( .A0(n1507), .A1(n313), .B0(n530), .C0(n531), .Y(n1708) );
  OA22X1 U1351 ( .A0(n1487), .A1(n625), .B0(n1497), .B1(n620), .Y(n530) );
  AOI222XL U1352 ( .A0(n318), .A1(n1959), .B0(n635), .B1(n1958), .C0(in_Y[9]), 
        .C1(n634), .Y(n531) );
  OAI211X1 U1353 ( .A0(n1393), .A1(n313), .B0(n341), .C0(n342), .Y(n1654) );
  OA22X1 U1354 ( .A0(n1371), .A1(n625), .B0(n1382), .B1(n620), .Y(n341) );
  AOI222XL U1355 ( .A0(n318), .A1(n1953), .B0(n635), .B1(n1952), .C0(n634), 
        .C1(in_R[0]), .Y(n342) );
  AOI222XL U1356 ( .A0(n661), .A1(n1952), .B0(n657), .B1(n1954), .C0(in_R[0]), 
        .C1(n656), .Y(n312) );
  AOI222XL U1357 ( .A0(n610), .A1(n1951), .B0(n605), .B1(n1954), .C0(n604), 
        .C1(in_R[0]), .Y(n370) );
  AOI222XL U1358 ( .A0(n677), .A1(n1952), .B0(n675), .B1(n1954), .C0(in_R[0]), 
        .C1(n672), .Y(n452) );
  AOI222XL U1359 ( .A0(n661), .A1(n1946), .B0(n657), .B1(n1948), .C0(n656), 
        .C1(in_R[1]), .Y(n309) );
  AOI222XL U1360 ( .A0(n610), .A1(n1945), .B0(n605), .B1(n1948), .C0(n604), 
        .C1(in_R[1]), .Y(n368) );
  AOI222XL U1361 ( .A0(n677), .A1(n1946), .B0(n675), .B1(n1948), .C0(in_R[1]), 
        .C1(n672), .Y(n272) );
  AOI222XL U1362 ( .A0(n661), .A1(n1940), .B0(n657), .B1(n1942), .C0(n656), 
        .C1(in_R[2]), .Y(n306) );
  AOI222XL U1363 ( .A0(n610), .A1(n1939), .B0(n605), .B1(n1942), .C0(n604), 
        .C1(in_R[2]), .Y(n366) );
  AOI222XL U1364 ( .A0(n677), .A1(n1940), .B0(n675), .B1(n1942), .C0(in_R[2]), 
        .C1(n672), .Y(n268) );
  AOI222XL U1365 ( .A0(n661), .A1(n1934), .B0(n657), .B1(n1936), .C0(n656), 
        .C1(in_R[3]), .Y(n303) );
  AOI222XL U1366 ( .A0(n610), .A1(n1933), .B0(n605), .B1(n1936), .C0(n604), 
        .C1(in_R[3]), .Y(n364) );
  AOI222XL U1367 ( .A0(n677), .A1(n1934), .B0(n675), .B1(n1936), .C0(in_R[3]), 
        .C1(n672), .Y(n264) );
  AOI222XL U1368 ( .A0(n661), .A1(n1928), .B0(n657), .B1(n1930), .C0(n656), 
        .C1(in_R[4]), .Y(n300) );
  AOI222XL U1369 ( .A0(n610), .A1(n1927), .B0(n605), .B1(n1930), .C0(n604), 
        .C1(in_R[4]), .Y(n362) );
  AOI222XL U1370 ( .A0(n677), .A1(n1928), .B0(n675), .B1(n1930), .C0(in_R[4]), 
        .C1(n672), .Y(n260) );
  AOI222XL U1371 ( .A0(n661), .A1(n1922), .B0(n657), .B1(n1924), .C0(n655), 
        .C1(in_R[5]), .Y(n297) );
  AOI222XL U1372 ( .A0(n610), .A1(n1921), .B0(n605), .B1(n1924), .C0(n580), 
        .C1(in_R[5]), .Y(n360) );
  AOI222XL U1373 ( .A0(n677), .A1(n1922), .B0(n675), .B1(n1924), .C0(in_R[5]), 
        .C1(n671), .Y(n256) );
  AOI222XL U1374 ( .A0(n661), .A1(n1916), .B0(n657), .B1(n1918), .C0(n655), 
        .C1(in_R[6]), .Y(n294) );
  AOI222XL U1375 ( .A0(n610), .A1(n1915), .B0(n605), .B1(n1918), .C0(n580), 
        .C1(in_R[6]), .Y(n358) );
  AOI222XL U1376 ( .A0(n677), .A1(n1916), .B0(n675), .B1(n1918), .C0(in_R[6]), 
        .C1(n672), .Y(n252) );
  AOI222XL U1377 ( .A0(n661), .A1(n1910), .B0(n657), .B1(n1912), .C0(n656), 
        .C1(in_R[7]), .Y(n291) );
  AOI222XL U1378 ( .A0(n610), .A1(n1909), .B0(n605), .B1(n1912), .C0(n604), 
        .C1(in_R[7]), .Y(n356) );
  AOI222XL U1379 ( .A0(n677), .A1(n1910), .B0(n675), .B1(n1912), .C0(in_R[7]), 
        .C1(n235), .Y(n248) );
  AOI222XL U1380 ( .A0(n661), .A1(n1904), .B0(n657), .B1(n1906), .C0(n280), 
        .C1(in_R[8]), .Y(n288) );
  AOI222XL U1382 ( .A0(n610), .A1(n1903), .B0(n605), .B1(n1906), .C0(n580), 
        .C1(in_R[8]), .Y(n354) );
  AOI222XL U1383 ( .A0(n677), .A1(n1904), .B0(n675), .B1(n1906), .C0(in_R[8]), 
        .C1(n235), .Y(n244) );
  AOI222XL U1384 ( .A0(n661), .A1(n1898), .B0(n657), .B1(n1900), .C0(n280), 
        .C1(in_R[9]), .Y(n285) );
  AOI222XL U1386 ( .A0(n610), .A1(n1897), .B0(n605), .B1(n1900), .C0(n348), 
        .C1(in_R[9]), .Y(n352) );
  AOI222XL U1387 ( .A0(n677), .A1(n1898), .B0(n675), .B1(n1900), .C0(in_R[9]), 
        .C1(n235), .Y(n240) );
  AOI222XL U1388 ( .A0(n661), .A1(n1892), .B0(n657), .B1(n1894), .C0(n280), 
        .C1(in_R[10]), .Y(n277) );
  AOI222XL U1390 ( .A0(n610), .A1(n1891), .B0(n605), .B1(n1894), .C0(n348), 
        .C1(in_R[10]), .Y(n345) );
  AOI222XL U1391 ( .A0(n677), .A1(n1892), .B0(n675), .B1(n1894), .C0(in_R[10]), 
        .C1(n671), .Y(n231) );
  AOI222XL U1392 ( .A0(n661), .A1(n2068), .B0(n657), .B1(n2070), .C0(in_X[0]), 
        .C1(n655), .Y(n726) );
  AOI222XL U1394 ( .A0(n544), .A1(n2067), .B0(n535), .B1(n2070), .C0(in_X[0]), 
        .C1(n529), .Y(n852) );
  AOI222XL U1395 ( .A0(n680), .A1(n2068), .B0(n676), .B1(n2070), .C0(in_X[0]), 
        .C1(n672), .Y(n926) );
  AOI222XL U1396 ( .A0(n662), .A1(n2062), .B0(n660), .B1(n2064), .C0(in_X[1]), 
        .C1(n655), .Y(n723) );
  AOI222XL U1398 ( .A0(n541), .A1(n2061), .B0(n538), .B1(n2064), .C0(in_X[1]), 
        .C1(n529), .Y(n850) );
  AOI222XL U1399 ( .A0(n677), .A1(n2062), .B0(n676), .B1(n2064), .C0(in_X[1]), 
        .C1(n672), .Y(n694) );
  AOI222XL U1400 ( .A0(n661), .A1(n2056), .B0(n657), .B1(n2058), .C0(in_X[2]), 
        .C1(n655), .Y(n720) );
  AOI222XL U1402 ( .A0(n544), .A1(n2055), .B0(n535), .B1(n2058), .C0(in_X[2]), 
        .C1(n529), .Y(n848) );
  AOI222XL U1403 ( .A0(n680), .A1(n2056), .B0(n676), .B1(n2058), .C0(in_X[2]), 
        .C1(n672), .Y(n689) );
  AOI222XL U1404 ( .A0(n662), .A1(n2050), .B0(n279), .B1(n2052), .C0(in_X[3]), 
        .C1(n655), .Y(n717) );
  AOI222XL U1406 ( .A0(n544), .A1(n2049), .B0(n376), .B1(n2052), .C0(in_X[3]), 
        .C1(n529), .Y(n846) );
  AOI222XL U1407 ( .A0(n677), .A1(n2050), .B0(n676), .B1(n2052), .C0(in_X[3]), 
        .C1(n672), .Y(n684) );
  AOI222XL U1408 ( .A0(n661), .A1(n2044), .B0(n279), .B1(n2046), .C0(in_X[4]), 
        .C1(n655), .Y(n714) );
  AOI222XL U1410 ( .A0(n541), .A1(n2043), .B0(n376), .B1(n2046), .C0(in_X[4]), 
        .C1(n529), .Y(n844) );
  AOI222XL U1411 ( .A0(n232), .A1(n2044), .B0(n676), .B1(n2046), .C0(in_X[4]), 
        .C1(n672), .Y(n679) );
  AOI222XL U1412 ( .A0(n662), .A1(n2038), .B0(n279), .B1(n2040), .C0(in_X[5]), 
        .C1(n655), .Y(n711) );
  AOI222XL U1414 ( .A0(n544), .A1(n2037), .B0(n376), .B1(n2040), .C0(in_X[5]), 
        .C1(n529), .Y(n842) );
  AOI222XL U1415 ( .A0(n232), .A1(n2038), .B0(n676), .B1(n2040), .C0(in_X[5]), 
        .C1(n672), .Y(n674) );
  AOI222XL U1416 ( .A0(n661), .A1(n2032), .B0(n660), .B1(n2034), .C0(in_X[6]), 
        .C1(n655), .Y(n708) );
  AOI222XL U1417 ( .A0(n541), .A1(n2031), .B0(n538), .B1(n2034), .C0(in_X[6]), 
        .C1(n529), .Y(n840) );
  AOI222XL U1418 ( .A0(n680), .A1(n2032), .B0(n676), .B1(n2034), .C0(in_X[6]), 
        .C1(n672), .Y(n669) );
  AOI222XL U1419 ( .A0(n662), .A1(n2026), .B0(n660), .B1(n2028), .C0(in_X[7]), 
        .C1(n655), .Y(n705) );
  AOI222XL U1420 ( .A0(n544), .A1(n2025), .B0(n538), .B1(n2028), .C0(in_X[7]), 
        .C1(n529), .Y(n838) );
  AOI222XL U1421 ( .A0(n680), .A1(n2026), .B0(n676), .B1(n2028), .C0(in_X[7]), 
        .C1(n671), .Y(n664) );
  AOI222XL U1422 ( .A0(n662), .A1(n2020), .B0(n660), .B1(n2022), .C0(in_X[8]), 
        .C1(n655), .Y(n702) );
  AOI222XL U1423 ( .A0(n544), .A1(n2019), .B0(n538), .B1(n2022), .C0(in_X[8]), 
        .C1(n529), .Y(n836) );
  AOI222XL U1424 ( .A0(n680), .A1(n2020), .B0(n676), .B1(n2022), .C0(in_X[8]), 
        .C1(n671), .Y(n659) );
  OAI211X1 U1425 ( .A0(n1437), .A1(n371), .B0(n698), .C0(n699), .Y(n1758) );
  AOI222XL U1426 ( .A0(n662), .A1(n2015), .B0(n660), .B1(\X[3][9] ), .C0(
        in_X[9]), .C1(n655), .Y(n699) );
  OAI211X1 U1427 ( .A0(n1467), .A1(n550), .B0(n833), .C0(n834), .Y(n1788) );
  AOI222XL U1428 ( .A0(n544), .A1(n2014), .B0(n538), .B1(\X[3][9] ), .C0(
        in_X[9]), .C1(n529), .Y(n834) );
  OAI211X1 U1429 ( .A0(n1427), .A1(n682), .B0(n653), .C0(n654), .Y(n1749) );
  AOI222XL U1430 ( .A0(n680), .A1(n2015), .B0(n675), .B1(\X[3][9] ), .C0(
        in_X[9]), .C1(n671), .Y(n654) );
  AOI222XL U1431 ( .A0(n662), .A1(n2010), .B0(n660), .B1(n2012), .C0(in_Y[0]), 
        .C1(n655), .Y(n526) );
  AOI222XL U1432 ( .A0(n544), .A1(n2009), .B0(n538), .B1(n2012), .C0(in_Y[0]), 
        .C1(n529), .Y(n600) );
  AOI222XL U1433 ( .A0(n680), .A1(n2010), .B0(n233), .B1(n2012), .C0(in_Y[0]), 
        .C1(n671), .Y(n652) );
  AOI222XL U1434 ( .A0(n662), .A1(n2004), .B0(n660), .B1(n2006), .C0(in_Y[1]), 
        .C1(n655), .Y(n523) );
  AOI222XL U1435 ( .A0(n544), .A1(n2003), .B0(n538), .B1(n2006), .C0(in_Y[1]), 
        .C1(n529), .Y(n598) );
  AOI222XL U1436 ( .A0(n680), .A1(n2004), .B0(n675), .B1(n2006), .C0(in_Y[1]), 
        .C1(n671), .Y(n494) );
  AOI222XL U1437 ( .A0(n662), .A1(n1999), .B0(n660), .B1(\Y[3][2] ), .C0(
        in_Y[2]), .C1(n656), .Y(n520) );
  AOI222XL U1438 ( .A0(n544), .A1(n1998), .B0(n538), .B1(\Y[3][2] ), .C0(
        in_Y[2]), .C1(n532), .Y(n596) );
  AOI222XL U1439 ( .A0(n680), .A1(n1999), .B0(n233), .B1(\Y[3][2] ), .C0(
        in_Y[2]), .C1(n671), .Y(n489) );
  AOI222XL U1440 ( .A0(n662), .A1(n1993), .B0(n660), .B1(n1995), .C0(in_Y[3]), 
        .C1(n656), .Y(n517) );
  AOI222XL U1441 ( .A0(n544), .A1(n1992), .B0(n538), .B1(n1995), .C0(in_Y[3]), 
        .C1(n532), .Y(n594) );
  AOI222XL U1442 ( .A0(n680), .A1(n1993), .B0(n676), .B1(n1995), .C0(in_Y[3]), 
        .C1(n671), .Y(n484) );
  AOI222XL U1443 ( .A0(n662), .A1(n1987), .B0(n660), .B1(n1989), .C0(in_Y[4]), 
        .C1(n656), .Y(n514) );
  AOI222XL U1444 ( .A0(n544), .A1(n1986), .B0(n538), .B1(n1989), .C0(in_Y[4]), 
        .C1(n532), .Y(n592) );
  AOI222XL U1445 ( .A0(n680), .A1(n1987), .B0(n675), .B1(n1989), .C0(in_Y[4]), 
        .C1(n671), .Y(n479) );
  AOI222XL U1446 ( .A0(n662), .A1(n1981), .B0(n660), .B1(n1983), .C0(in_Y[5]), 
        .C1(n656), .Y(n511) );
  AOI222XL U1447 ( .A0(n544), .A1(n1980), .B0(n538), .B1(n1983), .C0(in_Y[5]), 
        .C1(n532), .Y(n590) );
  AOI222XL U1448 ( .A0(n680), .A1(n1981), .B0(n676), .B1(n1983), .C0(in_Y[5]), 
        .C1(n671), .Y(n474) );
  AOI222XL U1449 ( .A0(n662), .A1(n1975), .B0(n660), .B1(n1977), .C0(in_Y[6]), 
        .C1(n656), .Y(n508) );
  AOI222XL U1450 ( .A0(n544), .A1(n1974), .B0(n538), .B1(n1977), .C0(in_Y[6]), 
        .C1(n532), .Y(n588) );
  AOI222XL U1451 ( .A0(n680), .A1(n1975), .B0(n676), .B1(n1977), .C0(in_Y[6]), 
        .C1(n671), .Y(n469) );
  AOI222XL U1452 ( .A0(n662), .A1(n1969), .B0(n660), .B1(n1971), .C0(in_Y[7]), 
        .C1(n656), .Y(n505) );
  AOI222XL U1453 ( .A0(n544), .A1(n1968), .B0(n538), .B1(n1971), .C0(in_Y[7]), 
        .C1(n532), .Y(n586) );
  AOI222XL U1454 ( .A0(n680), .A1(n1969), .B0(n676), .B1(n1971), .C0(in_Y[7]), 
        .C1(n671), .Y(n464) );
  AOI222XL U1455 ( .A0(n662), .A1(n1963), .B0(n660), .B1(n1965), .C0(in_Y[8]), 
        .C1(n656), .Y(n502) );
  AOI222XL U1456 ( .A0(n544), .A1(n1962), .B0(n538), .B1(n1965), .C0(in_Y[8]), 
        .C1(n532), .Y(n584) );
  AOI222XL U1457 ( .A0(n680), .A1(n1963), .B0(n676), .B1(n1965), .C0(in_Y[8]), 
        .C1(n671), .Y(n459) );
  OAI211X1 U1458 ( .A0(n1497), .A1(n405), .B0(n498), .C0(n499), .Y(n1698) );
  AOI222XL U1459 ( .A0(n661), .A1(n1958), .B0(n657), .B1(\Y[3][9] ), .C0(
        in_Y[9]), .C1(n656), .Y(n499) );
  AOI222XL U1460 ( .A0(n541), .A1(n1957), .B0(n535), .B1(\Y[3][9] ), .C0(
        in_Y[9]), .C1(n532), .Y(n582) );
  OAI211X1 U1461 ( .A0(n1487), .A1(n681), .B0(n453), .C0(n454), .Y(n1689) );
  AOI222XL U1463 ( .A0(n677), .A1(n1958), .B0(n675), .B1(\Y[3][9] ), .C0(
        in_Y[9]), .C1(n672), .Y(n454) );
  AOI222XL U1464 ( .A0(n541), .A1(n1951), .B0(n535), .B1(n1954), .C0(n532), 
        .C1(in_R[0]), .Y(n399) );
  AOI222XL U1465 ( .A0(n541), .A1(n1945), .B0(n535), .B1(n1948), .C0(n532), 
        .C1(in_R[1]), .Y(n397) );
  AOI222XL U1466 ( .A0(n541), .A1(n1939), .B0(n535), .B1(n1942), .C0(n532), 
        .C1(in_R[2]), .Y(n395) );
  AOI222XL U1467 ( .A0(n541), .A1(n1933), .B0(n535), .B1(n1936), .C0(n532), 
        .C1(in_R[3]), .Y(n393) );
  AOI222XL U1468 ( .A0(n541), .A1(n1927), .B0(n535), .B1(n1930), .C0(n532), 
        .C1(in_R[4]), .Y(n391) );
  AOI222XL U1469 ( .A0(n541), .A1(n1921), .B0(n535), .B1(n1924), .C0(n529), 
        .C1(in_R[5]), .Y(n389) );
  AOI222XL U1470 ( .A0(n541), .A1(n1915), .B0(n535), .B1(n1918), .C0(n529), 
        .C1(in_R[6]), .Y(n387) );
  AOI222XL U1471 ( .A0(n541), .A1(n1909), .B0(n535), .B1(n1912), .C0(n532), 
        .C1(in_R[7]), .Y(n385) );
  AOI222XL U1472 ( .A0(n541), .A1(n1903), .B0(n535), .B1(n1906), .C0(n529), 
        .C1(in_R[8]), .Y(n383) );
  AOI222XL U1473 ( .A0(n541), .A1(n1897), .B0(n535), .B1(n1900), .C0(n532), 
        .C1(in_R[9]), .Y(n381) );
  AOI222XL U1475 ( .A0(n541), .A1(n1891), .B0(n535), .B1(n1894), .C0(n377), 
        .C1(in_R[10]), .Y(n374) );
  NAND2X1 U1476 ( .A(n443), .B(n444), .Y(n1686) );
  AOI222XL U1477 ( .A0(n315), .A1(n1950), .B0(n500), .B1(n1949), .C0(n496), 
        .C1(n1945), .Y(n443) );
  AOI221XL U1478 ( .A0(n518), .A1(n1946), .B0(n403), .B1(n1947), .C0(n445), 
        .Y(n444) );
  OAI22XL U1479 ( .A0(n2121), .A1(n512), .B0(n1392), .B1(n503), .Y(n445) );
  NAND2X1 U1480 ( .A(n439), .B(n440), .Y(n1685) );
  AOI222XL U1482 ( .A0(n315), .A1(n1944), .B0(n500), .B1(n1943), .C0(n496), 
        .C1(n1939), .Y(n439) );
  AOI221XL U1483 ( .A0(n518), .A1(n1940), .B0(n403), .B1(n1941), .C0(n441), 
        .Y(n440) );
  OAI22XL U1484 ( .A0(n2120), .A1(n512), .B0(n1391), .B1(n503), .Y(n441) );
  NAND2X1 U1485 ( .A(n435), .B(n436), .Y(n1684) );
  AOI222XL U1486 ( .A0(n315), .A1(n1938), .B0(n500), .B1(n1937), .C0(n496), 
        .C1(n1933), .Y(n435) );
  AOI221XL U1487 ( .A0(n518), .A1(n1934), .B0(n403), .B1(n1935), .C0(n437), 
        .Y(n436) );
  OAI22XL U1489 ( .A0(n2119), .A1(n512), .B0(n1390), .B1(n503), .Y(n437) );
  NAND2X1 U1490 ( .A(n431), .B(n432), .Y(n1683) );
  AOI222XL U1491 ( .A0(n315), .A1(n1932), .B0(n409), .B1(n1931), .C0(n496), 
        .C1(n1927), .Y(n431) );
  AOI221XL U1492 ( .A0(n518), .A1(n1928), .B0(n403), .B1(n1929), .C0(n433), 
        .Y(n432) );
  OAI22XL U1493 ( .A0(n2118), .A1(n512), .B0(n1389), .B1(n503), .Y(n433) );
  NAND2X1 U1494 ( .A(n427), .B(n428), .Y(n1682) );
  AOI222XL U1496 ( .A0(n315), .A1(n1926), .B0(n409), .B1(n1925), .C0(n496), 
        .C1(n1921), .Y(n427) );
  AOI221XL U1497 ( .A0(n518), .A1(n1922), .B0(n403), .B1(n1923), .C0(n429), 
        .Y(n428) );
  OAI22XL U1498 ( .A0(n2117), .A1(n512), .B0(n1388), .B1(n503), .Y(n429) );
  NAND2X1 U1499 ( .A(n423), .B(n424), .Y(n1681) );
  AOI222XL U1500 ( .A0(n315), .A1(n1920), .B0(n409), .B1(n1919), .C0(n496), 
        .C1(n1915), .Y(n423) );
  AOI221XL U1501 ( .A0(n518), .A1(n1916), .B0(n403), .B1(n1917), .C0(n425), 
        .Y(n424) );
  OAI22XL U1503 ( .A0(n2116), .A1(n509), .B0(n1387), .B1(n503), .Y(n425) );
  NAND2X1 U1504 ( .A(n419), .B(n420), .Y(n1680) );
  AOI222XL U1505 ( .A0(n315), .A1(n1914), .B0(n409), .B1(n1913), .C0(n496), 
        .C1(n1909), .Y(n419) );
  AOI221XL U1506 ( .A0(n518), .A1(n1910), .B0(n403), .B1(n1911), .C0(n421), 
        .Y(n420) );
  OAI22XL U1507 ( .A0(n2115), .A1(n509), .B0(n1386), .B1(n503), .Y(n421) );
  NAND2X1 U1508 ( .A(n415), .B(n416), .Y(n1679) );
  AOI222XL U1510 ( .A0(n315), .A1(n1908), .B0(n409), .B1(n1907), .C0(n496), 
        .C1(n1903), .Y(n415) );
  AOI221XL U1511 ( .A0(n518), .A1(n1904), .B0(n403), .B1(n1905), .C0(n417), 
        .Y(n416) );
  OAI22XL U1512 ( .A0(n2114), .A1(n512), .B0(n1385), .B1(n503), .Y(n417) );
  NAND2X1 U1513 ( .A(n411), .B(n412), .Y(n1678) );
  AOI222XL U1514 ( .A0(n315), .A1(n1902), .B0(n409), .B1(n1901), .C0(n496), 
        .C1(n1897), .Y(n411) );
  AOI221XL U1515 ( .A0(n518), .A1(n1898), .B0(n403), .B1(n1899), .C0(n413), 
        .Y(n412) );
  OAI22XL U1517 ( .A0(n2113), .A1(n512), .B0(n1384), .B1(n503), .Y(n413) );
  NAND2X1 U1518 ( .A(n400), .B(n401), .Y(n1677) );
  AOI222XL U1519 ( .A0(n315), .A1(n1896), .B0(n409), .B1(n1895), .C0(n496), 
        .C1(n1891), .Y(n400) );
  AOI221XL U1520 ( .A0(n518), .A1(n1892), .B0(n403), .B1(n1893), .C0(n404), 
        .Y(n401) );
  OAI22XL U1521 ( .A0(n2112), .A1(n509), .B0(n1383), .B1(n503), .Y(n404) );
  CLKINVX1 U1522 ( .A(in_R[0]), .Y(n2122) );
  CLKINVX1 U1524 ( .A(in_R[1]), .Y(n2121) );
  CLKINVX1 U1525 ( .A(in_R[2]), .Y(n2120) );
  CLKINVX1 U1526 ( .A(in_R[3]), .Y(n2119) );
  CLKINVX1 U1527 ( .A(in_R[4]), .Y(n2118) );
  CLKINVX1 U1528 ( .A(in_R[5]), .Y(n2117) );
  CLKINVX1 U1529 ( .A(in_R[6]), .Y(n2116) );
  CLKINVX1 U1531 ( .A(in_R[7]), .Y(n2115) );
  CLKINVX1 U1532 ( .A(in_R[8]), .Y(n2114) );
  CLKINVX1 U1533 ( .A(in_R[9]), .Y(n2113) );
  CLKINVX1 U1534 ( .A(in_R[10]), .Y(n2112) );
  CLKINVX1 U1535 ( .A(in_X[0]), .Y(n2101) );
  CLKINVX1 U1536 ( .A(in_X[1]), .Y(n2100) );
  CLKINVX1 U1537 ( .A(in_X[2]), .Y(n2099) );
  CLKINVX1 U1538 ( .A(in_X[3]), .Y(n2098) );
  CLKINVX1 U1539 ( .A(in_X[4]), .Y(n2097) );
  CLKINVX1 U1540 ( .A(in_X[5]), .Y(n2096) );
  CLKINVX1 U1541 ( .A(in_X[6]), .Y(n2095) );
  CLKINVX1 U1542 ( .A(in_X[7]), .Y(n2094) );
  CLKINVX1 U1543 ( .A(in_X[8]), .Y(n2093) );
  CLKINVX1 U1544 ( .A(in_X[9]), .Y(n2092) );
  CLKINVX1 U1545 ( .A(in_Y[0]), .Y(n2111) );
  CLKINVX1 U1546 ( .A(in_Y[1]), .Y(n2110) );
  CLKINVX1 U1547 ( .A(in_Y[2]), .Y(n2109) );
  CLKINVX1 U1548 ( .A(in_Y[3]), .Y(n2108) );
  CLKINVX1 U1549 ( .A(in_Y[4]), .Y(n2107) );
  CLKINVX1 U1550 ( .A(in_Y[5]), .Y(n2106) );
  CLKINVX1 U1551 ( .A(in_Y[6]), .Y(n2105) );
  CLKINVX1 U1552 ( .A(in_Y[7]), .Y(n2104) );
  CLKINVX1 U1553 ( .A(in_Y[8]), .Y(n2103) );
  CLKINVX1 U1554 ( .A(in_Y[9]), .Y(n2102) );
  AOI222XL U1555 ( .A0(n418), .A1(\vecX[1][1] ), .B0(n1864), .B1(\vecX[2][1] ), 
        .C0(n414), .C1(\vecX[3][1] ), .Y(n1205) );
  NAND2X1 U1556 ( .A(outer_cnt[0]), .B(outer_cnt[1]), .Y(n970) );
  NAND2X1 U1557 ( .A(outer_cnt[1]), .B(n1865), .Y(n969) );
  AOI222XL U1558 ( .A0(n686), .A1(\vecX[1][1] ), .B0(n685), .B1(\vecX[2][1] ), 
        .C0(n1858), .C1(\vecX[3][1] ), .Y(n1183) );
  AOI222XL U1559 ( .A0(n686), .A1(\vecY[1][1] ), .B0(n685), .B1(\vecY[2][1] ), 
        .C0(n1858), .C1(\vecY[3][1] ), .Y(n1194) );
  AOI222XL U1560 ( .A0(n418), .A1(\vecY[1][1] ), .B0(n408), .B1(\vecY[2][1] ), 
        .C0(n414), .C1(\vecY[3][1] ), .Y(n1170) );
  AOI222XL U1561 ( .A0(n418), .A1(\vecX[1][0] ), .B0(n1864), .B1(\vecX[2][0] ), 
        .C0(n414), .C1(\vecX[3][0] ), .Y(n1204) );
  NAND2X1 U1562 ( .A(outer_cnt[0]), .B(n1868), .Y(n967) );
  NOR2X1 U1563 ( .A(n1861), .B(n1593), .Y(n213) );
  NOR2X1 U1564 ( .A(n1860), .B(n1592), .Y(n214) );
  AND3X2 U1565 ( .A(n1592), .B(n490), .C(n1593), .Y(n199) );
  OAI221XL U1566 ( .A0(n1590), .A1(n227), .B0(n1579), .B1(n490), .C0(n1193), 
        .Y(N2203) );
  AOI222XL U1567 ( .A0(n686), .A1(\vecY[1][0] ), .B0(n685), .B1(\vecY[2][0] ), 
        .C0(n1858), .C1(\vecY[3][0] ), .Y(n1193) );
  AOI222XL U1568 ( .A0(n686), .A1(\vecY[1][2] ), .B0(n685), .B1(\vecY[2][2] ), 
        .C0(n1858), .C1(\vecY[3][2] ), .Y(n1195) );
  AOI222XL U1569 ( .A0(n213), .A1(\vecY[1][3] ), .B0(n685), .B1(\vecY[2][3] ), 
        .C0(n1858), .C1(\vecY[3][3] ), .Y(n1196) );
  AOI222XL U1570 ( .A0(n418), .A1(\vecY[1][2] ), .B0(n408), .B1(\vecY[2][2] ), 
        .C0(n414), .C1(\vecY[3][2] ), .Y(n1171) );
  AOI222XL U1571 ( .A0(n1867), .A1(\vecY[1][3] ), .B0(n408), .B1(\vecY[2][3] ), 
        .C0(n1866), .C1(\vecY[3][3] ), .Y(n1172) );
  OAI221X1 U1572 ( .A0(n1565), .A1(n495), .B0(n1554), .B1(n426), .C0(n1207), 
        .Y(N2185) );
  AOI222XL U1573 ( .A0(n418), .A1(\vecX[1][3] ), .B0(n408), .B1(\vecX[2][3] ), 
        .C0(n414), .C1(\vecX[3][3] ), .Y(n1207) );
  OAI221X1 U1574 ( .A0(n1565), .A1(n234), .B0(n1554), .B1(n67), .C0(n1185), 
        .Y(N2215) );
  AOI222XL U1575 ( .A0(n686), .A1(\vecX[1][3] ), .B0(n214), .B1(\vecX[2][3] ), 
        .C0(n1858), .C1(\vecX[3][3] ), .Y(n1185) );
  AOI222XL U1576 ( .A0(n686), .A1(\vecX[1][0] ), .B0(n214), .B1(\vecX[2][0] ), 
        .C0(n1858), .C1(\vecX[3][0] ), .Y(n1181) );
  AOI222XL U1577 ( .A0(n418), .A1(\vecX[1][2] ), .B0(n408), .B1(\vecX[2][2] ), 
        .C0(n414), .C1(\vecX[3][2] ), .Y(n1206) );
  AOI222XL U1578 ( .A0(n686), .A1(\vecX[1][2] ), .B0(n214), .B1(\vecX[2][2] ), 
        .C0(n1858), .C1(\vecX[3][2] ), .Y(n1184) );
  OAI221XL U1579 ( .A0(n1590), .A1(n492), .B0(n1579), .B1(n422), .C0(n1169), 
        .Y(N2233) );
  AOI222XL U1580 ( .A0(n418), .A1(\vecY[1][0] ), .B0(n408), .B1(\vecY[2][0] ), 
        .C0(n414), .C1(\vecY[3][0] ), .Y(n1169) );
  AOI222XL U1581 ( .A0(n213), .A1(\vecY[1][4] ), .B0(n685), .B1(\vecY[2][4] ), 
        .C0(n1858), .C1(\vecY[3][4] ), .Y(n1197) );
  AOI222XL U1582 ( .A0(n1867), .A1(\vecY[1][4] ), .B0(n408), .B1(\vecY[2][4] ), 
        .C0(n1866), .C1(\vecY[3][4] ), .Y(n1173) );
  AOI222XL U1583 ( .A0(n213), .A1(\vecY[1][5] ), .B0(n685), .B1(\vecY[2][5] ), 
        .C0(n1858), .C1(\vecY[3][5] ), .Y(n1198) );
  OAI221X1 U1584 ( .A0(n1563), .A1(n495), .B0(n1552), .B1(n426), .C0(n1209), 
        .Y(N2183) );
  AOI222XL U1585 ( .A0(n418), .A1(\vecX[1][5] ), .B0(n1864), .B1(\vecX[2][5] ), 
        .C0(n414), .C1(\vecX[3][5] ), .Y(n1209) );
  OAI221X1 U1586 ( .A0(n1563), .A1(n234), .B0(n1552), .B1(n490), .C0(n1187), 
        .Y(N2213) );
  AOI222XL U1587 ( .A0(n686), .A1(\vecX[1][5] ), .B0(n685), .B1(\vecX[2][5] ), 
        .C0(n1858), .C1(\vecX[3][5] ), .Y(n1187) );
  AOI222XL U1588 ( .A0(n418), .A1(\vecX[1][4] ), .B0(n1864), .B1(\vecX[2][4] ), 
        .C0(n414), .C1(\vecX[3][4] ), .Y(n1208) );
  AOI222XL U1589 ( .A0(n686), .A1(\vecX[1][4] ), .B0(n214), .B1(\vecX[2][4] ), 
        .C0(n1858), .C1(\vecX[3][4] ), .Y(n1186) );
  AOI222XL U1590 ( .A0(n213), .A1(\vecY[1][6] ), .B0(n685), .B1(\vecY[2][6] ), 
        .C0(n1858), .C1(\vecY[3][6] ), .Y(n1199) );
  AOI222XL U1591 ( .A0(n1867), .A1(\vecY[1][5] ), .B0(n408), .B1(\vecY[2][5] ), 
        .C0(n1866), .C1(\vecY[3][5] ), .Y(n1174) );
  AOI222XL U1592 ( .A0(n213), .A1(\vecY[1][7] ), .B0(n685), .B1(\vecY[2][7] ), 
        .C0(n1858), .C1(\vecY[3][7] ), .Y(n1200) );
  AOI222XL U1593 ( .A0(n1867), .A1(\vecY[1][6] ), .B0(n408), .B1(\vecY[2][6] ), 
        .C0(n1866), .C1(\vecY[3][6] ), .Y(n1175) );
  AOI222XL U1595 ( .A0(n418), .A1(\vecX[1][6] ), .B0(n1864), .B1(\vecX[2][6] ), 
        .C0(n414), .C1(\vecX[3][6] ), .Y(n1210) );
  AOI222XL U1596 ( .A0(n686), .A1(\vecX[1][6] ), .B0(n685), .B1(\vecX[2][6] ), 
        .C0(n1858), .C1(\vecX[3][6] ), .Y(n1188) );
  OAI221X1 U1597 ( .A0(n1561), .A1(n495), .B0(n1550), .B1(n426), .C0(n1211), 
        .Y(N2181) );
  AOI222XL U1598 ( .A0(n418), .A1(\vecX[1][7] ), .B0(n1864), .B1(\vecX[2][7] ), 
        .C0(n414), .C1(\vecX[3][7] ), .Y(n1211) );
  OAI221X1 U1599 ( .A0(n1561), .A1(n227), .B0(n1550), .B1(n490), .C0(n1189), 
        .Y(N2211) );
  AOI222XL U1600 ( .A0(n686), .A1(\vecX[1][7] ), .B0(n685), .B1(\vecX[2][7] ), 
        .C0(n1858), .C1(\vecX[3][7] ), .Y(n1189) );
  AOI222XL U1601 ( .A0(n1867), .A1(\vecY[1][7] ), .B0(n408), .B1(\vecY[2][7] ), 
        .C0(n1866), .C1(\vecY[3][7] ), .Y(n1176) );
  AOI222XL U1602 ( .A0(n686), .A1(\vecY[1][8] ), .B0(n685), .B1(\vecY[2][8] ), 
        .C0(n1858), .C1(\vecY[3][8] ), .Y(n1201) );
  AOI222XL U1603 ( .A0(n1867), .A1(\vecY[1][8] ), .B0(n408), .B1(\vecY[2][8] ), 
        .C0(n414), .C1(\vecY[3][8] ), .Y(n1177) );
  OAI221X1 U1604 ( .A0(n1559), .A1(n495), .B0(n1548), .B1(n426), .C0(n1213), 
        .Y(N2179) );
  AOI222XL U1605 ( .A0(n418), .A1(\vecX[1][9] ), .B0(n408), .B1(\vecX[2][9] ), 
        .C0(n414), .C1(\vecX[3][9] ), .Y(n1213) );
  AOI222XL U1606 ( .A0(n418), .A1(\vecX[1][8] ), .B0(n408), .B1(\vecX[2][8] ), 
        .C0(n414), .C1(\vecX[3][8] ), .Y(n1212) );
  AOI222XL U1607 ( .A0(n418), .A1(\vecY[1][9] ), .B0(n408), .B1(\vecY[2][9] ), 
        .C0(n414), .C1(\vecY[3][9] ), .Y(n1178) );
  OAI221X1 U1608 ( .A0(n1558), .A1(n495), .B0(n1547), .B1(n422), .C0(n1214), 
        .Y(N2178) );
  AOI222XL U1609 ( .A0(n418), .A1(\vecX[1][10] ), .B0(n408), .B1(\vecX[2][10] ), .C0(n1866), .C1(\vecX[3][10] ), .Y(n1214) );
  OAI221X1 U1610 ( .A0(n1559), .A1(n227), .B0(n1548), .B1(n490), .C0(n1191), 
        .Y(N2209) );
  AOI222XL U1611 ( .A0(n686), .A1(\vecX[1][9] ), .B0(n685), .B1(\vecX[2][9] ), 
        .C0(n1858), .C1(\vecX[3][9] ), .Y(n1191) );
  AOI222XL U1612 ( .A0(n686), .A1(\vecX[1][8] ), .B0(n685), .B1(\vecX[2][8] ), 
        .C0(n1858), .C1(\vecX[3][8] ), .Y(n1190) );
  AOI222XL U1613 ( .A0(n686), .A1(\vecY[1][9] ), .B0(n685), .B1(\vecY[2][9] ), 
        .C0(n1858), .C1(\vecY[3][9] ), .Y(n1202) );
  AOI222XL U1614 ( .A0(n686), .A1(\vecY[1][10] ), .B0(n685), .B1(\vecY[2][10] ), .C0(n1858), .C1(\vecY[3][10] ), .Y(n1203) );
  AOI222XL U1615 ( .A0(n418), .A1(\vecY[1][10] ), .B0(n408), .B1(\vecY[2][10] ), .C0(n414), .C1(\vecY[3][10] ), .Y(n1179) );
  OAI221X1 U1616 ( .A0(n1558), .A1(n234), .B0(n1547), .B1(n490), .C0(n1192), 
        .Y(N2208) );
  AOI222XL U1617 ( .A0(n686), .A1(\vecX[1][10] ), .B0(n685), .B1(\vecX[2][10] ), .C0(n1858), .C1(\vecX[3][10] ), .Y(n1192) );
  AOI222XL U1618 ( .A0(n265), .A1(n2004), .B0(n1074), .B1(n2007), .C0(n269), 
        .C1(n2003), .Y(n1078) );
  AOI222XL U1619 ( .A0(n253), .A1(n2005), .B0(n254), .B1(n2006), .C0(n250), 
        .C1(n2003), .Y(n1124) );
  AOI222XL U1620 ( .A0(n1073), .A1(n1999), .B0(n266), .B1(n2001), .C0(n984), 
        .C1(n1998), .Y(n1080) );
  OA22X1 U1621 ( .A0(n242), .A1(n1513), .B0(n1543), .B1(n261), .Y(n1081) );
  AOI222XL U1622 ( .A0(n262), .A1(n1993), .B0(n1074), .B1(n1996), .C0(n269), 
        .C1(n1992), .Y(n1082) );
  AOI222XL U1623 ( .A0(n253), .A1(n1994), .B0(n254), .B1(n1995), .C0(n249), 
        .C1(n1992), .Y(n1128) );
  AOI222XL U1624 ( .A0(n253), .A1(n2063), .B0(n254), .B1(n2064), .C0(n249), 
        .C1(n2061), .Y(n1104) );
  AOI222XL U1625 ( .A0(n1073), .A1(n2062), .B0(n1074), .B1(n2065), .C0(n269), 
        .C1(n2061), .Y(n1145) );
  AOI222XL U1626 ( .A0(n265), .A1(n2050), .B0(n1074), .B1(n2053), .C0(n269), 
        .C1(n2049), .Y(n1149) );
  AOI222XL U1627 ( .A0(n262), .A1(n2056), .B0(n266), .B1(n2059), .C0(n984), 
        .C1(n2055), .Y(n1147) );
  NOR2X2 U1628 ( .A(n2074), .B(n1597), .Y(n1074) );
  NOR2X2 U1629 ( .A(n2074), .B(n1597), .Y(n266) );
  AND3X2 U1630 ( .A(n1597), .B(n1598), .C(n2074), .Y(n262) );
  AOI222XL U1632 ( .A0(n253), .A1(n2051), .B0(n254), .B1(n2052), .C0(n250), 
        .C1(n2049), .Y(n1108) );
  AND3X2 U1634 ( .A(n1599), .B(n1598), .C(n1597), .Y(n200) );
  AND3X2 U1636 ( .A(n1595), .B(n2072), .C(n1594), .Y(n202) );
  AO22X1 U1638 ( .A0(hex_area[19]), .A1(n754), .B0(N2437), .B1(n2084), .Y(
        n1244) );
  OA22X1 U1640 ( .A0(n245), .A1(n1512), .B0(n1542), .B1(n257), .Y(n1083) );
  AOI222XL U1642 ( .A0(n265), .A1(n1987), .B0(n266), .B1(n1990), .C0(n984), 
        .C1(n1986), .Y(n1084) );
  AOI222XL U1644 ( .A0(n262), .A1(n1975), .B0(n266), .B1(n1978), .C0(n984), 
        .C1(n1974), .Y(n1088) );
  AOI222XL U1646 ( .A0(n253), .A1(n2000), .B0(n1099), .B1(\Y[3][2] ), .C0(n250), .C1(n1998), .Y(n1126) );
  AOI222XL U1648 ( .A0(n1073), .A1(n1981), .B0(n1074), .B1(n1984), .C0(n269), 
        .C1(n1980), .Y(n1086) );
  AOI222XL U1650 ( .A0(n253), .A1(n1982), .B0(n254), .B1(n1983), .C0(n250), 
        .C1(n1980), .Y(n1132) );
  AOI222XL U1651 ( .A0(n253), .A1(n2039), .B0(n254), .B1(n2040), .C0(n249), 
        .C1(n2037), .Y(n1112) );
  AOI222XL U1652 ( .A0(n262), .A1(n2038), .B0(n1074), .B1(n2041), .C0(n269), 
        .C1(n2037), .Y(n1153) );
  AOI222XL U1653 ( .A0(n253), .A1(n2057), .B0(n1099), .B1(n2058), .C0(n249), 
        .C1(n2055), .Y(n1106) );
  AOI222XL U1654 ( .A0(n253), .A1(n2045), .B0(n1099), .B1(n2046), .C0(n250), 
        .C1(n2043), .Y(n1110) );
  AOI222XL U1655 ( .A0(n1073), .A1(n2044), .B0(n266), .B1(n2047), .C0(n984), 
        .C1(n2043), .Y(n1151) );
  NOR2X2 U1656 ( .A(n1596), .B(n1595), .Y(n1099) );
  AOI222XL U1657 ( .A0(n253), .A1(n1988), .B0(n1099), .B1(n1989), .C0(n249), 
        .C1(n1986), .Y(n1130) );
  AOI222XL U1658 ( .A0(n253), .A1(n2069), .B0(n254), .B1(n2070), .C0(n250), 
        .C1(n2067), .Y(n1097) );
  AOI222XL U1659 ( .A0(n265), .A1(n2068), .B0(n266), .B1(n2071), .C0(n984), 
        .C1(n2067), .Y(n1143) );
  AND3X2 U1660 ( .A(n1595), .B(n1596), .C(n1594), .Y(n203) );
  AND2X2 U1661 ( .A(n1599), .B(n2075), .Y(n205) );
  AO22X1 U1662 ( .A0(n81), .A1(n754), .B0(N2435), .B1(n2084), .Y(n1242) );
  AO22X1 U1663 ( .A0(hex_area[18]), .A1(n754), .B0(N2436), .B1(n2084), .Y(
        n1243) );
  AOI222XL U1664 ( .A0(n262), .A1(n2010), .B0(n266), .B1(n2013), .C0(n984), 
        .C1(n2009), .Y(n1072) );
  AOI222XL U1665 ( .A0(n253), .A1(n2011), .B0(n1099), .B1(n2012), .C0(n249), 
        .C1(n2009), .Y(n1122) );
  AOI2BB2X1 U1666 ( .B0(n274), .B1(n2017), .A0N(n1467), .A1N(n275), .Y(n1119)
         );
  AOI222XL U1667 ( .A0(n253), .A1(n2016), .B0(n254), .B1(\X[3][9] ), .C0(n249), 
        .C1(n2014), .Y(n1120) );
  OA22X1 U1668 ( .A0(n246), .A1(n1447), .B0(n1477), .B1(n258), .Y(n1160) );
  AOI222XL U1669 ( .A0(n265), .A1(n2015), .B0(n1074), .B1(n2017), .C0(n269), 
        .C1(n2014), .Y(n1161) );
  AOI222XL U1670 ( .A0(n253), .A1(n1976), .B0(n1099), .B1(n1977), .C0(n250), 
        .C1(n1974), .Y(n1134) );
  AOI222XL U1671 ( .A0(n1073), .A1(n1963), .B0(n266), .B1(n1966), .C0(n984), 
        .C1(n1962), .Y(n1092) );
  AOI222XL U1672 ( .A0(n265), .A1(n1969), .B0(n1074), .B1(n1972), .C0(n269), 
        .C1(n1968), .Y(n1090) );
  AOI222XL U1673 ( .A0(n253), .A1(n1970), .B0(n254), .B1(n1971), .C0(n249), 
        .C1(n1968), .Y(n1136) );
  AOI222XL U1674 ( .A0(n1073), .A1(n2026), .B0(n1074), .B1(n2029), .C0(n269), 
        .C1(n2025), .Y(n1157) );
  AOI222XL U1676 ( .A0(n253), .A1(n2033), .B0(n1099), .B1(n2034), .C0(n249), 
        .C1(n2031), .Y(n1114) );
  AOI222XL U1678 ( .A0(n265), .A1(n2032), .B0(n266), .B1(n2035), .C0(n984), 
        .C1(n2031), .Y(n1155) );
  AOI222XL U1680 ( .A0(n253), .A1(n1964), .B0(n1099), .B1(n1965), .C0(n249), 
        .C1(n1962), .Y(n1138) );
  AOI222XL U1682 ( .A0(n253), .A1(n2027), .B0(n254), .B1(n2028), .C0(n250), 
        .C1(n2025), .Y(n1116) );
  AO22X1 U1684 ( .A0(hex_area[15]), .A1(n754), .B0(N2433), .B1(n2084), .Y(
        n1240) );
  AO22X1 U1686 ( .A0(hex_area[16]), .A1(n754), .B0(N2434), .B1(n2084), .Y(
        n1241) );
  OA22X1 U1688 ( .A0(n245), .A1(n1507), .B0(n1537), .B1(n257), .Y(n1093) );
  AOI222XL U1690 ( .A0(n262), .A1(n1958), .B0(n1074), .B1(n1960), .C0(n269), 
        .C1(n1957), .Y(n1094) );
  AOI222XL U1692 ( .A0(n253), .A1(n1959), .B0(n254), .B1(\Y[3][9] ), .C0(n250), 
        .C1(n1957), .Y(n1140) );
  AOI222XL U1694 ( .A0(n253), .A1(n2021), .B0(n1099), .B1(n2022), .C0(n250), 
        .C1(n2019), .Y(n1118) );
  AOI222XL U1695 ( .A0(n262), .A1(n2020), .B0(n266), .B1(n2023), .C0(n984), 
        .C1(n2019), .Y(n1159) );
  AO22X1 U1696 ( .A0(hex_area[13]), .A1(n754), .B0(N2431), .B1(n2084), .Y(
        n1238) );
  AO22X1 U1697 ( .A0(hex_area[14]), .A1(n754), .B0(N2432), .B1(n2084), .Y(
        n1239) );
  AO22X1 U1698 ( .A0(n83), .A1(n754), .B0(N2430), .B1(n2084), .Y(n1237) );
  AO22X1 U1699 ( .A0(hex_area[10]), .A1(n754), .B0(N2428), .B1(n2084), .Y(
        n1235) );
  AO22X1 U1700 ( .A0(hex_area[11]), .A1(n754), .B0(N2429), .B1(n2084), .Y(
        n1236) );
  AO22X1 U1701 ( .A0(n79), .A1(n754), .B0(N2426), .B1(n2084), .Y(n1233) );
  AO22X1 U1702 ( .A0(hex_area[9]), .A1(n754), .B0(N2427), .B1(n2084), .Y(n1234) );
  AO22X1 U1703 ( .A0(hex_area[6]), .A1(n754), .B0(N2424), .B1(n2084), .Y(n1231) );
  AO22X1 U1704 ( .A0(n68), .A1(n754), .B0(N2425), .B1(n2084), .Y(n1232) );
  AO22X1 U1705 ( .A0(n80), .A1(n204), .B0(N2422), .B1(n2084), .Y(n1229) );
  AO22X1 U1706 ( .A0(n82), .A1(n204), .B0(N2423), .B1(n2084), .Y(n1230) );
  AO22X1 U1707 ( .A0(n78), .A1(n204), .B0(N2420), .B1(n2084), .Y(n1227) );
  AO22X1 U1708 ( .A0(hex_area[3]), .A1(n204), .B0(N2421), .B1(n2084), .Y(n1228) );
  OAI32X1 U1709 ( .A0(n219), .A1(rd_cnt[2]), .A2(rd_cnt[1]), .B0(n923), .B1(
        n862), .Y(n917) );
  NAND2X1 U1710 ( .A(n1360), .B(n2081), .Y(n219) );
  CLKINVX1 U1711 ( .A(cur_state[1]), .Y(n2090) );
  AO22X1 U1712 ( .A0(hex_area[1]), .A1(n754), .B0(N2419), .B1(n2084), .Y(n1226) );
  OAI221X1 U1713 ( .A0(n1886), .A1(n492), .B0(n1885), .B1(n422), .C0(n960), 
        .Y(n954) );
  AOI222XL U1714 ( .A0(n418), .A1(\reach_cnt[1][2] ), .B0(n408), .B1(
        \reach_cnt[2][2] ), .C0(n414), .C1(\reach_cnt[3][2] ), .Y(n960) );
  NAND2X2 U1715 ( .A(cur_state[1]), .B(cur_state[0]), .Y(n820) );
  INVX3 U1716 ( .A(cur_state[2]), .Y(n2089) );
  OA21X2 U1717 ( .A0(n1863), .A1(n952), .B0(n953), .Y(n941) );
  CLKINVX1 U1718 ( .A(n954), .Y(n1863) );
  OAI211X1 U1719 ( .A0(n954), .A1(n955), .B0(n956), .C0(cur_state[1]), .Y(n953) );
  OAI21XL U1720 ( .A0(n957), .A1(n954), .B0(n955), .Y(n956) );
  OAI2BB2X1 U1721 ( .B0(n935), .B1(n862), .A0N(n2081), .A1N(read_done), .Y(
        n927) );
  NOR4X1 U1722 ( .A(n932), .B(n1873), .C(n1876), .D(n937), .Y(n935) );
  NOR3X1 U1723 ( .A(n1886), .B(\reach_cnt[0][1] ), .C(\reach_cnt[0][0] ), .Y(
        n937) );
  OAI21X1 U1724 ( .A0(n741), .A1(n219), .B0(n742), .Y(n729) );
  OAI31XL U1725 ( .A0(n743), .A1(n733), .A2(n1875), .B0(n2087), .Y(n742) );
  OAI31XL U1726 ( .A0(n1881), .A1(\reach_cnt[0][2] ), .A2(n1870), .B0(n738), 
        .Y(n743) );
  OAI31XL U1727 ( .A0(n1851), .A1(rd_cnt[2]), .A2(n219), .B0(n829), .Y(n827)
         );
  OAI21XL U1728 ( .A0(n826), .A1(n830), .B0(n2087), .Y(n829) );
  OAI31XL U1729 ( .A0(n1870), .A1(\reach_cnt[0][2] ), .A2(\reach_cnt[0][1] ), 
        .B0(n818), .Y(n830) );
  NAND2X1 U1730 ( .A(n790), .B(n791), .Y(n782) );
  OAI31XL U1731 ( .A0(n792), .A1(n786), .A2(n784), .B0(n2087), .Y(n791) );
  OAI31XL U1732 ( .A0(n1881), .A1(\reach_cnt[0][2] ), .A2(\reach_cnt[0][0] ), 
        .B0(n788), .Y(n792) );
  NOR2X1 U1733 ( .A(\reach_cnt[3][1] ), .B(\reach_cnt[3][2] ), .Y(n823) );
  NAND3X1 U1735 ( .A(\reach_cnt[4][0] ), .B(\reach_cnt[4][2] ), .C(
        \reach_cnt[4][1] ), .Y(n915) );
  NAND3X1 U1736 ( .A(n1874), .B(n1883), .C(\reach_cnt[2][0] ), .Y(n818) );
  NOR3X1 U1737 ( .A(n1360), .B(rd_cnt[2]), .C(n295), .Y(n861) );
  NAND3X1 U1738 ( .A(\reach_cnt[2][0] ), .B(n1883), .C(\reach_cnt[2][1] ), .Y(
        n731) );
  AO21X1 U1739 ( .A0(\reach_cnt[3][0] ), .A1(n823), .B0(n819), .Y(n826) );
  AND3X2 U1740 ( .A(n823), .B(\reach_cnt[3][0] ), .C(n824), .Y(n349) );
  NOR3X1 U1741 ( .A(n820), .B(n819), .C(n1849), .Y(n824) );
  AND3X2 U1742 ( .A(n823), .B(n2088), .C(n858), .Y(n378) );
  NOR3X1 U1743 ( .A(n853), .B(\reach_cnt[3][0] ), .C(n856), .Y(n858) );
  NAND2X1 U1744 ( .A(rd_cnt[1]), .B(n861), .Y(n790) );
  OAI2BB2XL U1745 ( .B0(n695), .B1(n1547), .A0N(N2099), .A1N(n718), .Y(n1245)
         );
  OAI2BB2XL U1746 ( .B0(n695), .B1(n1548), .A0N(N2098), .A1N(n718), .Y(n1246)
         );
  OAI2BB2XL U1747 ( .B0(n697), .B1(n1569), .A0N(N2154), .A1N(n712), .Y(n1300)
         );
  OAI2BB2XL U1748 ( .B0(n697), .B1(n1570), .A0N(N2153), .A1N(n712), .Y(n1301)
         );
  OAI2BB2XL U1749 ( .B0(n697), .B1(n1558), .A0N(N2055), .A1N(n712), .Y(n1289)
         );
  OAI2BB2XL U1750 ( .B0(n700), .B1(n1559), .A0N(N2054), .A1N(n712), .Y(n1290)
         );
  OAI2BB2XL U1751 ( .B0(n696), .B1(n1580), .A0N(N2110), .A1N(n715), .Y(n1344)
         );
  OAI2BB2XL U1752 ( .B0(n696), .B1(n1581), .A0N(N2109), .A1N(n715), .Y(n1345)
         );
  AO22X1 U1753 ( .A0(hex_area[0]), .A1(n754), .B0(N2418), .B1(n2084), .Y(n1225) );
  AO22X1 U1754 ( .A0(N2077), .A1(n709), .B0(\vecX[2][10] ), .B1(n740), .Y(
        n1267) );
  AO22X1 U1755 ( .A0(N2076), .A1(n709), .B0(\vecX[2][9] ), .B1(n740), .Y(n1268) );
  AO22X1 U1756 ( .A0(N2066), .A1(n706), .B0(\vecX[1][10] ), .B1(n745), .Y(
        n1278) );
  AO22X1 U1757 ( .A0(N2065), .A1(n706), .B0(\vecX[1][9] ), .B1(n745), .Y(n1279) );
  AO22X1 U1758 ( .A0(N2143), .A1(n706), .B0(\vecY[3][10] ), .B1(n746), .Y(
        n1311) );
  AO22X1 U1759 ( .A0(N2142), .A1(n703), .B0(\vecY[3][9] ), .B1(n747), .Y(n1312) );
  AO22X1 U1760 ( .A0(N2132), .A1(n703), .B0(\vecY[2][10] ), .B1(n748), .Y(
        n1322) );
  AO22X1 U1761 ( .A0(N2131), .A1(n706), .B0(\vecY[2][9] ), .B1(n748), .Y(n1323) );
  AO22X1 U1762 ( .A0(N2121), .A1(n703), .B0(\vecY[1][10] ), .B1(n750), .Y(
        n1333) );
  AO22X1 U1763 ( .A0(N2120), .A1(n706), .B0(\vecY[1][9] ), .B1(n750), .Y(n1334) );
  AO22X1 U1764 ( .A0(N2088), .A1(n709), .B0(\vecX[3][10] ), .B1(n721), .Y(
        n1256) );
  AO22X1 U1765 ( .A0(N2087), .A1(n712), .B0(\vecX[3][9] ), .B1(n724), .Y(n1257) );
  OAI222XL U1766 ( .A0(n967), .A1(n1887), .B0(n969), .B1(n1888), .C0(n970), 
        .C1(n1889), .Y(n975) );
  OAI221X1 U1767 ( .A0(n1881), .A1(n492), .B0(n1878), .B1(n422), .C0(n966), 
        .Y(n955) );
  AOI222XL U1768 ( .A0(n418), .A1(\reach_cnt[1][1] ), .B0(n408), .B1(
        \reach_cnt[2][1] ), .C0(n414), .C1(\reach_cnt[3][1] ), .Y(n966) );
  XNOR2X1 U1769 ( .A(n955), .B(n957), .Y(n965) );
  OAI32X1 U1770 ( .A0(n977), .A1(outer_cnt[2]), .A2(n970), .B0(n978), .B1(n426), .Y(n1824) );
  OA21XL U1771 ( .A0(n1862), .A1(n414), .B0(n979), .Y(n978) );
  OAI221XL U1772 ( .A0(n741), .A1(n295), .B0(n1852), .B1(n219), .C0(n790), .Y(
        N674) );
  AOI211X1 U1773 ( .A0(n1594), .A1(n2073), .B0(n1164), .C0(n250), .Y(N2290) );
  CLKINVX1 U1774 ( .A(n1099), .Y(n2073) );
  NAND2X1 U1775 ( .A(rd_cnt[2]), .B(n1851), .Y(n741) );
  OAI22XL U1776 ( .A0(n2078), .A1(n224), .B0(n307), .B1(n222), .Y(n1622) );
  OAI22XL U1777 ( .A0(n979), .A1(n1865), .B0(outer_cnt[0]), .B1(n977), .Y(
        n1826) );
  NOR2X1 U1778 ( .A(\reach_cnt[1][2] ), .B(\reach_cnt[1][1] ), .Y(n832) );
  NAND2X1 U1779 ( .A(n832), .B(\reach_cnt[1][0] ), .Y(n822) );
  NOR2X1 U1780 ( .A(n741), .B(n1360), .Y(read_done) );
  OAI2BB2XL U1781 ( .B0(n5), .B1(n222), .A0N(side_cnt[2]), .A1N(n304), .Y(
        n1620) );
  NAND3X1 U1782 ( .A(\reach_cnt[3][0] ), .B(n1884), .C(\reach_cnt[3][1] ), .Y(
        n735) );
  OAI2BB2XL U1783 ( .B0(n695), .B1(n1549), .A0N(N2097), .A1N(n718), .Y(n1247)
         );
  OAI2BB2XL U1784 ( .B0(n695), .B1(n1550), .A0N(N2096), .A1N(n715), .Y(n1248)
         );
  OAI2BB2XL U1785 ( .B0(n695), .B1(n1551), .A0N(N2095), .A1N(n715), .Y(n1249)
         );
  OAI2BB2XL U1786 ( .B0(n695), .B1(n1552), .A0N(N2094), .A1N(n715), .Y(n1250)
         );
  OAI2BB2XL U1787 ( .B0(n696), .B1(n1553), .A0N(N2093), .A1N(n715), .Y(n1251)
         );
  OAI2BB2XL U1788 ( .B0(n696), .B1(n1554), .A0N(N2092), .A1N(n715), .Y(n1252)
         );
  OAI2BB2XL U1789 ( .B0(n696), .B1(n1555), .A0N(N2091), .A1N(n715), .Y(n1253)
         );
  OAI2BB2XL U1790 ( .B0(n696), .B1(n1556), .A0N(N2090), .A1N(n715), .Y(n1254)
         );
  OAI2BB2XL U1791 ( .B0(n696), .B1(n1557), .A0N(N2089), .A1N(n715), .Y(n1255)
         );
  OAI2BB2XL U1792 ( .B0(n697), .B1(n1571), .A0N(N2152), .A1N(n715), .Y(n1302)
         );
  OAI2BB2XL U1793 ( .B0(n697), .B1(n1572), .A0N(N2151), .A1N(n712), .Y(n1303)
         );
  OAI2BB2XL U1794 ( .B0(n697), .B1(n1573), .A0N(N2150), .A1N(n712), .Y(n1304)
         );
  OAI2BB2XL U1795 ( .B0(n696), .B1(n1574), .A0N(N2149), .A1N(n715), .Y(n1305)
         );
  OAI2BB2XL U1796 ( .B0(n697), .B1(n1575), .A0N(N2148), .A1N(n712), .Y(n1306)
         );
  OAI2BB2XL U1797 ( .B0(n697), .B1(n1576), .A0N(N2147), .A1N(n712), .Y(n1307)
         );
  OAI2BB2XL U1798 ( .B0(n696), .B1(n1577), .A0N(N2146), .A1N(n715), .Y(n1308)
         );
  OAI2BB2XL U1799 ( .B0(n697), .B1(n1578), .A0N(N2145), .A1N(n712), .Y(n1309)
         );
  OAI2BB2XL U1800 ( .B0(n697), .B1(n1579), .A0N(N2144), .A1N(n715), .Y(n1310)
         );
  OAI2BB2XL U1801 ( .B0(n697), .B1(n1560), .A0N(N2053), .A1N(n712), .Y(n1291)
         );
  OAI2BB2XL U1802 ( .B0(n700), .B1(n1561), .A0N(N2052), .A1N(n712), .Y(n1292)
         );
  OAI2BB2XL U1803 ( .B0(n700), .B1(n1562), .A0N(N2051), .A1N(n712), .Y(n1293)
         );
  OAI2BB2XL U1804 ( .B0(n700), .B1(n1563), .A0N(N2050), .A1N(n712), .Y(n1294)
         );
  OAI2BB2XL U1805 ( .B0(n700), .B1(n1564), .A0N(N2049), .A1N(n712), .Y(n1295)
         );
  OAI2BB2XL U1806 ( .B0(n700), .B1(n1565), .A0N(N2048), .A1N(n712), .Y(n1296)
         );
  OAI2BB2XL U1807 ( .B0(n700), .B1(n1566), .A0N(N2047), .A1N(n712), .Y(n1297)
         );
  OAI2BB2XL U1808 ( .B0(n700), .B1(n1567), .A0N(N2046), .A1N(n712), .Y(n1298)
         );
  OAI2BB2XL U1809 ( .B0(n697), .B1(n1568), .A0N(N2045), .A1N(n712), .Y(n1299)
         );
  OAI2BB2XL U1810 ( .B0(n696), .B1(n1582), .A0N(N2108), .A1N(n715), .Y(n1346)
         );
  OAI2BB2XL U1811 ( .B0(n696), .B1(n1583), .A0N(N2107), .A1N(n715), .Y(n1347)
         );
  OAI2BB2XL U1812 ( .B0(n695), .B1(n1584), .A0N(N2106), .A1N(n715), .Y(n1348)
         );
  OAI2BB2XL U1813 ( .B0(n695), .B1(n1585), .A0N(N2105), .A1N(n715), .Y(n1349)
         );
  OAI2BB2XL U1814 ( .B0(n695), .B1(n1586), .A0N(N2104), .A1N(n715), .Y(n1350)
         );
  OAI2BB2XL U1815 ( .B0(n695), .B1(n1587), .A0N(N2103), .A1N(n715), .Y(n1351)
         );
  OAI2BB2XL U1816 ( .B0(n695), .B1(n1588), .A0N(N2102), .A1N(n718), .Y(n1352)
         );
  OAI2BB2XL U1817 ( .B0(n695), .B1(n1589), .A0N(N2101), .A1N(n718), .Y(n1353)
         );
  OAI2BB2XL U1818 ( .B0(n696), .B1(n1590), .A0N(N2100), .A1N(n718), .Y(n1354)
         );
  NOR2X1 U1819 ( .A(n249), .B(n1165), .Y(N2289) );
  AOI2BB2X1 U1820 ( .B0(n2084), .B1(n253), .A0N(n191), .A1N(N2288), .Y(n1165)
         );
  AO22X1 U1821 ( .A0(N2112), .A1(n700), .B0(\vecY[1][1] ), .B1(n750), .Y(n1342) );
  AO22X1 U1822 ( .A0(N2111), .A1(n700), .B0(\vecY[1][0] ), .B1(n751), .Y(n1343) );
  AO22X1 U1823 ( .A0(N2078), .A1(n709), .B0(\vecX[3][0] ), .B1(n740), .Y(n1266) );
  AO22X1 U1824 ( .A0(N2075), .A1(n706), .B0(\vecX[2][8] ), .B1(n740), .Y(n1269) );
  AO22X1 U1825 ( .A0(N2074), .A1(n706), .B0(\vecX[2][7] ), .B1(n740), .Y(n1270) );
  AO22X1 U1826 ( .A0(N2073), .A1(n709), .B0(\vecX[2][6] ), .B1(n740), .Y(n1271) );
  AO22X1 U1827 ( .A0(N2072), .A1(n709), .B0(\vecX[2][5] ), .B1(n744), .Y(n1272) );
  AO22X1 U1828 ( .A0(N2071), .A1(n709), .B0(\vecX[2][4] ), .B1(n744), .Y(n1273) );
  AO22X1 U1829 ( .A0(N2070), .A1(n709), .B0(\vecX[2][3] ), .B1(n744), .Y(n1274) );
  AO22X1 U1830 ( .A0(N2069), .A1(n709), .B0(\vecX[2][2] ), .B1(n744), .Y(n1275) );
  AO22X1 U1831 ( .A0(N2068), .A1(n706), .B0(\vecX[2][1] ), .B1(n744), .Y(n1276) );
  AO22X1 U1832 ( .A0(N2067), .A1(n709), .B0(\vecX[2][0] ), .B1(n744), .Y(n1277) );
  AO22X1 U1833 ( .A0(N2064), .A1(n706), .B0(\vecX[1][8] ), .B1(n745), .Y(n1280) );
  AO22X1 U1834 ( .A0(N2063), .A1(n709), .B0(\vecX[1][7] ), .B1(n745), .Y(n1281) );
  AO22X1 U1835 ( .A0(N2062), .A1(n706), .B0(\vecX[1][6] ), .B1(n745), .Y(n1282) );
  AO22X1 U1836 ( .A0(N2061), .A1(n709), .B0(\vecX[1][5] ), .B1(n745), .Y(n1283) );
  AO22X1 U1837 ( .A0(N2060), .A1(n706), .B0(\vecX[1][4] ), .B1(n746), .Y(n1284) );
  AO22X1 U1838 ( .A0(N2059), .A1(n709), .B0(\vecX[1][3] ), .B1(n746), .Y(n1285) );
  AO22X1 U1839 ( .A0(N2058), .A1(n706), .B0(\vecX[1][2] ), .B1(n746), .Y(n1286) );
  AO22X1 U1840 ( .A0(N2057), .A1(n709), .B0(\vecX[1][1] ), .B1(n746), .Y(n1287) );
  AO22X1 U1841 ( .A0(N2056), .A1(n706), .B0(\vecX[1][0] ), .B1(n746), .Y(n1288) );
  AO22X1 U1842 ( .A0(N2141), .A1(n706), .B0(\vecY[3][8] ), .B1(n747), .Y(n1313) );
  AO22X1 U1843 ( .A0(N2140), .A1(n703), .B0(\vecY[3][7] ), .B1(n747), .Y(n1314) );
  AO22X1 U1844 ( .A0(N2139), .A1(n703), .B0(\vecY[3][6] ), .B1(n747), .Y(n1315) );
  AO22X1 U1845 ( .A0(N2138), .A1(n703), .B0(\vecY[3][5] ), .B1(n747), .Y(n1316) );
  AO22X1 U1846 ( .A0(N2137), .A1(n703), .B0(\vecY[3][4] ), .B1(n747), .Y(n1317) );
  AO22X1 U1847 ( .A0(N2136), .A1(n703), .B0(\vecY[3][3] ), .B1(n748), .Y(n1318) );
  AO22X1 U1848 ( .A0(N2135), .A1(n703), .B0(\vecY[3][2] ), .B1(n748), .Y(n1319) );
  AO22X1 U1849 ( .A0(N2134), .A1(n703), .B0(\vecY[3][1] ), .B1(n748), .Y(n1320) );
  AO22X1 U1850 ( .A0(N2133), .A1(n703), .B0(\vecY[3][0] ), .B1(n748), .Y(n1321) );
  AO22X1 U1851 ( .A0(N2130), .A1(n703), .B0(\vecY[2][8] ), .B1(n749), .Y(n1324) );
  AO22X1 U1852 ( .A0(N2129), .A1(n706), .B0(\vecY[2][7] ), .B1(n749), .Y(n1325) );
  AO22X1 U1853 ( .A0(N2128), .A1(n703), .B0(\vecY[2][6] ), .B1(n749), .Y(n1326) );
  AO22X1 U1854 ( .A0(N2127), .A1(n706), .B0(\vecY[2][5] ), .B1(n749), .Y(n1327) );
  AO22X1 U1855 ( .A0(N2126), .A1(n703), .B0(\vecY[2][4] ), .B1(n749), .Y(n1328) );
  AO22X1 U1856 ( .A0(N2125), .A1(n703), .B0(\vecY[2][3] ), .B1(n749), .Y(n1329) );
  AO22X1 U1857 ( .A0(N2124), .A1(n700), .B0(\vecY[2][2] ), .B1(n750), .Y(n1330) );
  AO22X1 U1858 ( .A0(N2123), .A1(n706), .B0(\vecY[2][1] ), .B1(n750), .Y(n1331) );
  AO22X1 U1859 ( .A0(N2122), .A1(n700), .B0(\vecY[2][0] ), .B1(n750), .Y(n1332) );
  AO22X1 U1860 ( .A0(N2119), .A1(n703), .B0(\vecY[1][8] ), .B1(n750), .Y(n1335) );
  AO22X1 U1861 ( .A0(N2118), .A1(n700), .B0(\vecY[1][7] ), .B1(n751), .Y(n1336) );
  AO22X1 U1862 ( .A0(N2117), .A1(n703), .B0(\vecY[1][6] ), .B1(n751), .Y(n1337) );
  AO22X1 U1863 ( .A0(N2116), .A1(n700), .B0(\vecY[1][5] ), .B1(n751), .Y(n1338) );
  AO22X1 U1864 ( .A0(N2115), .A1(n703), .B0(\vecY[1][4] ), .B1(n751), .Y(n1339) );
  AO22X1 U1865 ( .A0(N2114), .A1(n700), .B0(\vecY[1][3] ), .B1(n751), .Y(n1340) );
  AO22X1 U1866 ( .A0(N2113), .A1(n703), .B0(\vecY[1][2] ), .B1(n751), .Y(n1341) );
  AO22X1 U1867 ( .A0(N2086), .A1(n706), .B0(\vecX[3][8] ), .B1(n727), .Y(n1258) );
  AO22X1 U1868 ( .A0(N2085), .A1(n712), .B0(\vecX[3][7] ), .B1(n728), .Y(n1259) );
  AO22X1 U1869 ( .A0(N2084), .A1(n709), .B0(\vecX[3][6] ), .B1(n732), .Y(n1260) );
  AO22X1 U1870 ( .A0(N2083), .A1(n709), .B0(\vecX[3][5] ), .B1(n734), .Y(n1261) );
  AO22X1 U1871 ( .A0(N2082), .A1(n709), .B0(\vecX[3][4] ), .B1(n736), .Y(n1262) );
  AO22X1 U1872 ( .A0(N2081), .A1(n709), .B0(\vecX[3][3] ), .B1(n745), .Y(n1263) );
  AO22X1 U1873 ( .A0(N2080), .A1(n706), .B0(\vecX[3][2] ), .B1(n744), .Y(n1264) );
  AO22X1 U1874 ( .A0(N2079), .A1(n709), .B0(\vecX[3][1] ), .B1(n740), .Y(n1265) );
  OAI2BB2XL U1875 ( .B0(n1593), .B1(n2080), .A0N(n2080), .A1N(n218), .Y(n1357)
         );
  AO21X1 U1876 ( .A0(n67), .A1(n1593), .B0(n685), .Y(n218) );
  NOR2X1 U1877 ( .A(n1164), .B(n1167), .Y(N2287) );
  XNOR2X1 U1878 ( .A(n1597), .B(n242), .Y(n1167) );
  NOR2X1 U1879 ( .A(n1168), .B(n1164), .Y(N2286) );
  OA21XL U1880 ( .A0(n1599), .A1(n2075), .B0(n237), .Y(n1168) );
  CLKBUFX3 U1881 ( .A(n201), .Y(n298) );
  NAND3X1 U1882 ( .A(cur_state[0]), .B(n2090), .C(cur_state[2]), .Y(n201) );
  NOR2X1 U1883 ( .A(n295), .B(n988), .Y(N673) );
  XOR2X1 U1884 ( .A(rd_cnt[1]), .B(n1360), .Y(n988) );
  CLKINVX1 U1885 ( .A(reset), .Y(n2091) );
  OAI211X4 U1886 ( .A0(n1393), .A1(n155), .B0(n195), .C0(n196), .Y(side_A[0])
         );
  AO22X1 U1887 ( .A0(n872), .A1(n133), .B0(n31), .B1(n920), .Y(n886) );
  OAI22XL U1888 ( .A0(side_length[3]), .A1(n794), .B0(side_length[3]), .B1(
        n877), .Y(n881) );
  AO22X1 U1889 ( .A0(n939), .A1(n136), .B0(n33), .B1(n987), .Y(n950) );
  OAI22XL U1890 ( .A0(n1163), .A1(n794), .B0(side_B[3]), .B1(n1163), .Y(n1182)
         );
  OAI22XL U1891 ( .A0(side_B[3]), .A1(n794), .B0(side_B[3]), .B1(n1166), .Y(
        n1180) );
  AOI221XL U1892 ( .A0(n793), .A1(n1841), .B0(n1356), .B1(n1182), .C0(n1180), 
        .Y(n1830) );
  OAI22XL U1893 ( .A0(n1358), .A1(n1098), .B0(n48), .B1(n1358), .Y(n1359) );
  OAI21XL U1894 ( .A0(n209), .A1(n1839), .B0(n1359), .Y(n1829) );
  NOR2BX1 U1895 ( .AN(side_B[7]), .B(n145), .Y(n1831) );
endmodule


module geofence ( clk, reset, X, Y, R, valid, is_inside );
  input [9:0] X;
  input [9:0] Y;
  input [10:0] R;
  input clk, reset;
  output valid, is_inside;
  wire   _read_done, _cross_done, _hexarea_done, _heptarea_done;
  wire   [2:0] _cur_state;

  CTRL CTRL ( .clk(clk), .reset(reset), .read_done(_read_done), .cross_done(
        _cross_done), .hexarea_done(_hexarea_done), .heptarea_done(
        _heptarea_done), .cur_state(_cur_state), .valid(valid) );
  READ READ ( .clk(clk), .reset(reset), .cur_state(_cur_state), .in_X(X), 
        .in_Y(Y), .in_R(R), .read_done(_read_done), .cross_done(_cross_done), 
        .hexarea_done(_hexarea_done), .heptarea_done(_heptarea_done), 
        .is_inside(is_inside) );
endmodule

