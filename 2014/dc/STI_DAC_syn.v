/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Apr 13 20:45:13 2021
/////////////////////////////////////////////////////////////


module CTRL ( clk, reset, pi_end, read_done, out_done, mem_done, cur_state, 
        so_valid, oem_finish );
  output [2:0] cur_state;
  input clk, reset, pi_end, read_done, out_done, mem_done;
  output so_valid, oem_finish;
  wire   n12, n13, n2, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [2:0] next_state;

  DFFRX1 \cur_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n11), .Q(
        cur_state[0]), .QN(n5) );
  DFFRX1 \cur_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n11), .Q(
        cur_state[1]), .QN(n4) );
  NOR3XL U3 ( .A(n4), .B(cur_state[2]), .C(cur_state[0]), .Y(n12) );
  BUFX12 U4 ( .A(n13), .Y(oem_finish) );
  NOR3X1 U5 ( .A(n2), .B(n4), .C(n5), .Y(n13) );
  BUFX12 U6 ( .A(n12), .Y(so_valid) );
  NAND3X1 U7 ( .A(n6), .B(n2), .C(n7), .Y(next_state[2]) );
  NAND3X1 U8 ( .A(out_done), .B(cur_state[1]), .C(pi_end), .Y(n7) );
  OAI21X1 U9 ( .A0(cur_state[0]), .A1(cur_state[2]), .B0(cur_state[1]), .Y(n6)
         );
  OAI221XL U10 ( .A0(cur_state[2]), .A1(n5), .B0(out_done), .B1(n4), .C0(n8), 
        .Y(next_state[1]) );
  AOI31X1 U11 ( .A0(cur_state[2]), .A1(n5), .A2(mem_done), .B0(n10), .Y(n8) );
  CLKINVX1 U12 ( .A(n6), .Y(n10) );
  NAND2X1 U13 ( .A(n6), .B(n9), .Y(next_state[0]) );
  OAI211X1 U14 ( .A0(cur_state[2]), .A1(read_done), .B0(n5), .C0(n4), .Y(n9)
         );
  CLKINVX1 U15 ( .A(reset), .Y(n11) );
  DFFRX2 \cur_state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n11), .Q(
        cur_state[2]), .QN(n2) );
endmodule


module PROC ( clk, reset, cur_state, load, pi_data, pi_length, pi_fill, pi_msb, 
        pi_low, read_done, out_done, so_data );
  input [2:0] cur_state;
  input [15:0] pi_data;
  input [1:0] pi_length;
  input clk, reset, load, pi_fill, pi_msb, pi_low;
  output read_done, out_done, so_data;
  wire   N22, N23, N24, N25, N26, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N113, N114, N115, N116, N157, N158,
         N159, N160, N162, N163, N164, N165, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n18, n19, n20, n21, n22, n23, n25, n26, n27, n28,
         n29, n33, n34, n35, n39, n40, n41, n42, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n116, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, \add_266/carry[4] ,
         \add_266/carry[3] , \add_266/carry[2] , n1, n2, n3, n4, n17, n24, n30,
         n31, n32, n36, n37, n38, n43, n84, n113, n114, n115, n117, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179;
  wire   [31:0] proc_data;

  DFFRX1 read_done_reg ( .D(n169), .CK(clk), .RN(n166), .Q(read_done) );
  DFFRX1 \data_reg[7]  ( .D(n74), .CK(clk), .RN(n167), .QN(n95) );
  DFFRX1 \data_reg[6]  ( .D(n73), .CK(clk), .RN(n167), .QN(n96) );
  DFFRX1 \data_reg[5]  ( .D(n72), .CK(clk), .RN(n167), .QN(n97) );
  DFFRX1 \data_reg[4]  ( .D(n71), .CK(clk), .RN(n167), .QN(n98) );
  DFFRX1 \data_reg[3]  ( .D(n70), .CK(clk), .RN(n167), .QN(n99) );
  DFFRX1 \data_reg[2]  ( .D(n69), .CK(clk), .RN(n164), .QN(n100) );
  DFFRX1 \data_reg[1]  ( .D(n68), .CK(clk), .RN(n167), .QN(n101) );
  DFFRX1 \data_reg[0]  ( .D(n67), .CK(clk), .RN(n165), .QN(n102) );
  DFFRX1 \destin_reg[3]  ( .D(n62), .CK(clk), .RN(n164), .QN(n55) );
  DFFRX1 \destin_reg[2]  ( .D(n61), .CK(clk), .RN(n164), .QN(n54) );
  DFFRX1 \destin_reg[0]  ( .D(n59), .CK(clk), .RN(n164), .QN(n52) );
  DFFRX1 \destin_reg[4]  ( .D(n63), .CK(clk), .RN(n164), .QN(n56) );
  DFFRX1 \destin_reg[1]  ( .D(n60), .CK(clk), .RN(n164), .QN(n53) );
  DFFRX1 low_reg ( .D(n83), .CK(clk), .RN(n179), .Q(n3), .QN(n58) );
  DFFRX1 fill_reg ( .D(n64), .CK(clk), .RN(n164), .Q(n2), .QN(n57) );
  DFFRX1 \origin_reg[4]  ( .D(n118), .CK(clk), .RN(n164), .Q(N26), .QN(n158)
         );
  DFFRX1 \proc_data_reg[31]  ( .D(n138), .CK(clk), .RN(n166), .Q(proc_data[31]), .QN(n44) );
  DFFRX1 \proc_data_reg[29]  ( .D(n136), .CK(clk), .RN(n167), .Q(proc_data[29]), .QN(n46) );
  DFFRX1 \proc_data_reg[27]  ( .D(n134), .CK(clk), .RN(n165), .Q(proc_data[27]), .QN(n48) );
  DFFRX1 \proc_data_reg[25]  ( .D(n132), .CK(clk), .RN(n166), .Q(proc_data[25]), .QN(n50) );
  DFFRX1 \proc_data_reg[23]  ( .D(n130), .CK(clk), .RN(n166), .Q(proc_data[23]), .QN(n105) );
  DFFRX1 \proc_data_reg[21]  ( .D(n128), .CK(clk), .RN(n166), .Q(proc_data[21]), .QN(n107) );
  DFFRX1 \proc_data_reg[19]  ( .D(n126), .CK(clk), .RN(n166), .Q(proc_data[19]), .QN(n109) );
  DFFRX1 \proc_data_reg[17]  ( .D(n124), .CK(clk), .RN(n166), .Q(proc_data[17]), .QN(n111) );
  DFFRX1 \proc_data_reg[15]  ( .D(N116), .CK(clk), .RN(n166), .Q(proc_data[15]) );
  DFFRX1 \proc_data_reg[13]  ( .D(N114), .CK(clk), .RN(n165), .Q(proc_data[13]) );
  DFFRX1 \proc_data_reg[11]  ( .D(N112), .CK(clk), .RN(n165), .Q(proc_data[11]) );
  DFFRX1 \proc_data_reg[9]  ( .D(N110), .CK(clk), .RN(n165), .Q(proc_data[9])
         );
  DFFRX1 \proc_data_reg[7]  ( .D(N108), .CK(clk), .RN(n165), .Q(proc_data[7])
         );
  DFFRX1 \proc_data_reg[5]  ( .D(N106), .CK(clk), .RN(n165), .Q(proc_data[5])
         );
  DFFRX1 \proc_data_reg[3]  ( .D(N104), .CK(clk), .RN(n165), .Q(proc_data[3])
         );
  DFFRX1 \proc_data_reg[1]  ( .D(N102), .CK(clk), .RN(n164), .Q(proc_data[1])
         );
  DFFRX1 \proc_data_reg[30]  ( .D(n137), .CK(clk), .RN(n164), .Q(proc_data[30]), .QN(n45) );
  DFFRX1 \proc_data_reg[28]  ( .D(n135), .CK(clk), .RN(n167), .Q(proc_data[28]), .QN(n47) );
  DFFRX1 \proc_data_reg[26]  ( .D(n133), .CK(clk), .RN(n164), .Q(proc_data[26]), .QN(n49) );
  DFFRX1 \proc_data_reg[24]  ( .D(n131), .CK(clk), .RN(n166), .Q(proc_data[24]), .QN(n51) );
  DFFRX1 \proc_data_reg[22]  ( .D(n129), .CK(clk), .RN(n166), .Q(proc_data[22]), .QN(n106) );
  DFFRX1 \proc_data_reg[20]  ( .D(n127), .CK(clk), .RN(n166), .Q(proc_data[20]), .QN(n108) );
  DFFRX1 \proc_data_reg[18]  ( .D(n125), .CK(clk), .RN(n166), .Q(proc_data[18]), .QN(n110) );
  DFFRX1 \proc_data_reg[16]  ( .D(n123), .CK(clk), .RN(n166), .Q(proc_data[16]), .QN(n112) );
  DFFRX1 \proc_data_reg[14]  ( .D(N115), .CK(clk), .RN(n166), .Q(proc_data[14]) );
  DFFRX1 \proc_data_reg[12]  ( .D(N113), .CK(clk), .RN(n165), .Q(proc_data[12]) );
  DFFRX1 \proc_data_reg[10]  ( .D(N111), .CK(clk), .RN(n165), .Q(proc_data[10]) );
  DFFRX1 \proc_data_reg[8]  ( .D(N109), .CK(clk), .RN(n165), .Q(proc_data[8])
         );
  DFFRX1 \proc_data_reg[6]  ( .D(N107), .CK(clk), .RN(n165), .Q(proc_data[6])
         );
  DFFRX1 \proc_data_reg[4]  ( .D(N105), .CK(clk), .RN(n165), .Q(proc_data[4])
         );
  DFFRX1 \proc_data_reg[2]  ( .D(N103), .CK(clk), .RN(n165), .Q(proc_data[2])
         );
  DFFRX1 \proc_data_reg[0]  ( .D(N101), .CK(clk), .RN(n164), .Q(proc_data[0])
         );
  DFFRX1 \data_reg[15]  ( .D(n82), .CK(clk), .RN(n179), .QN(n87) );
  DFFRX1 \data_reg[14]  ( .D(n81), .CK(clk), .RN(n167), .QN(n88) );
  DFFRX1 \data_reg[13]  ( .D(n80), .CK(clk), .RN(n167), .QN(n89) );
  DFFRX1 \data_reg[12]  ( .D(n79), .CK(clk), .RN(n167), .QN(n90) );
  DFFRX1 \data_reg[11]  ( .D(n78), .CK(clk), .RN(n167), .QN(n91) );
  DFFRX1 \data_reg[10]  ( .D(n77), .CK(clk), .RN(n167), .QN(n92) );
  DFFRX1 \data_reg[9]  ( .D(n76), .CK(clk), .RN(n167), .QN(n93) );
  DFFRX1 \data_reg[8]  ( .D(n75), .CK(clk), .RN(n167), .QN(n94) );
  DFFRX1 msb_reg ( .D(n85), .CK(clk), .RN(n179), .QN(n86) );
  DFFRX1 \length_reg[0]  ( .D(n65), .CK(clk), .RN(n166), .Q(n1), .QN(n104) );
  DFFRX1 \origin_reg[3]  ( .D(n119), .CK(clk), .RN(n164), .Q(N25), .QN(n156)
         );
  DFFRX1 \origin_reg[2]  ( .D(n120), .CK(clk), .RN(n164), .Q(N24), .QN(n157)
         );
  DFFRX1 \origin_reg[1]  ( .D(n121), .CK(clk), .RN(n164), .Q(N23), .QN(n116)
         );
  DFFRX1 \length_reg[1]  ( .D(n66), .CK(clk), .RN(n179), .Q(n175), .QN(n103)
         );
  DFFRX1 \origin_reg[0]  ( .D(n122), .CK(clk), .RN(n179), .Q(N22), .QN(n159)
         );
  NAND2X2 U3 ( .A(n159), .B(n116), .Y(n144) );
  NAND2X2 U4 ( .A(N23), .B(n159), .Y(n146) );
  NAND2X2 U5 ( .A(N23), .B(N22), .Y(n147) );
  NOR2X1 U6 ( .A(N23), .B(N22), .Y(n170) );
  CLKBUFX3 U7 ( .A(n34), .Y(n163) );
  CLKBUFX3 U8 ( .A(n35), .Y(n161) );
  CLKBUFX3 U9 ( .A(n166), .Y(n164) );
  CLKBUFX3 U10 ( .A(n166), .Y(n165) );
  CLKBUFX3 U11 ( .A(n179), .Y(n166) );
  CLKBUFX3 U12 ( .A(n166), .Y(n167) );
  NOR2BX1 U13 ( .AN(n14), .B(n20), .Y(n29) );
  CLKINVX1 U14 ( .A(n13), .Y(n174) );
  NAND2BX2 U15 ( .AN(n42), .B(n3), .Y(n41) );
  OA21X2 U16 ( .A0(n42), .A1(n3), .B0(n160), .Y(n40) );
  CLKBUFX3 U17 ( .A(n33), .Y(n162) );
  NAND3X1 U18 ( .A(n175), .B(n2), .C(n1), .Y(n33) );
  CLKINVX1 U19 ( .A(n20), .Y(n177) );
  OAI2BB2XL U20 ( .B0(n103), .B1(load), .A0N(pi_length[1]), .A1N(n169), .Y(n66) );
  OAI2BB2XL U21 ( .B0(n104), .B1(load), .A0N(pi_length[0]), .A1N(n169), .Y(n65) );
  OAI2BB2XL U22 ( .B0(n94), .B1(load), .A0N(pi_data[8]), .A1N(n169), .Y(n75)
         );
  OAI2BB2XL U23 ( .B0(n93), .B1(load), .A0N(pi_data[9]), .A1N(n169), .Y(n76)
         );
  OAI2BB2XL U24 ( .B0(n92), .B1(load), .A0N(pi_data[10]), .A1N(n169), .Y(n77)
         );
  OAI2BB2XL U25 ( .B0(n91), .B1(load), .A0N(pi_data[11]), .A1N(n169), .Y(n78)
         );
  OAI2BB2XL U26 ( .B0(n90), .B1(load), .A0N(pi_data[12]), .A1N(n169), .Y(n79)
         );
  OAI2BB2XL U27 ( .B0(n89), .B1(load), .A0N(pi_data[13]), .A1N(n169), .Y(n80)
         );
  OAI2BB2XL U28 ( .B0(n88), .B1(load), .A0N(pi_data[14]), .A1N(n168), .Y(n81)
         );
  OAI2BB2XL U29 ( .B0(n87), .B1(load), .A0N(pi_data[15]), .A1N(n168), .Y(n82)
         );
  OAI2BB2XL U30 ( .B0(n86), .B1(load), .A0N(pi_msb), .A1N(n168), .Y(n85) );
  OAI2BB2XL U31 ( .B0(n102), .B1(load), .A0N(pi_data[0]), .A1N(n169), .Y(n67)
         );
  OAI2BB2XL U32 ( .B0(n101), .B1(load), .A0N(pi_data[1]), .A1N(n169), .Y(n68)
         );
  OAI2BB2XL U33 ( .B0(n100), .B1(load), .A0N(pi_data[2]), .A1N(n169), .Y(n69)
         );
  OAI2BB2XL U34 ( .B0(n99), .B1(load), .A0N(pi_data[3]), .A1N(n169), .Y(n70)
         );
  OAI2BB2XL U35 ( .B0(n98), .B1(load), .A0N(pi_data[4]), .A1N(n169), .Y(n71)
         );
  OAI2BB2XL U36 ( .B0(n97), .B1(load), .A0N(pi_data[5]), .A1N(n169), .Y(n72)
         );
  OAI2BB2XL U37 ( .B0(n96), .B1(n168), .A0N(pi_data[6]), .A1N(n169), .Y(n73)
         );
  OAI2BB2XL U38 ( .B0(n95), .B1(n168), .A0N(pi_data[7]), .A1N(n169), .Y(n74)
         );
  OAI2BB2XL U39 ( .B0(n57), .B1(load), .A0N(pi_fill), .A1N(n168), .Y(n64) );
  OAI2BB2XL U40 ( .B0(n58), .B1(load), .A0N(pi_low), .A1N(n168), .Y(n83) );
  CLKBUFX3 U41 ( .A(n168), .Y(n169) );
  CLKBUFX3 U42 ( .A(load), .Y(n168) );
  OAI221XL U43 ( .A0(n104), .A1(n13), .B0(n156), .B1(n14), .C0(n19), .Y(n119)
         );
  AOI32X1 U44 ( .A0(n16), .A1(n177), .A2(N159), .B0(N164), .B1(n18), .Y(n19)
         );
  OAI221XL U45 ( .A0(n103), .A1(n13), .B0(n158), .B1(n14), .C0(n15), .Y(n118)
         );
  AOI32X1 U46 ( .A0(n16), .A1(n177), .A2(N160), .B0(N165), .B1(n18), .Y(n15)
         );
  OAI211X1 U47 ( .A0(n157), .A1(n14), .B0(n21), .C0(n22), .Y(n120) );
  NAND2X1 U48 ( .A(N163), .B(n18), .Y(n21) );
  AOI21X1 U49 ( .A0(N158), .A1(n23), .B0(n174), .Y(n22) );
  NOR3X2 U50 ( .A(cur_state[1]), .B(cur_state[2]), .C(n178), .Y(n11) );
  OAI21X2 U51 ( .A0(cur_state[2]), .A1(n20), .B0(n176), .Y(n14) );
  CLKINVX1 U52 ( .A(n11), .Y(n176) );
  AND2X2 U53 ( .A(n29), .B(n86), .Y(n18) );
  NOR2BX1 U54 ( .AN(n29), .B(n86), .Y(n23) );
  NOR2BX1 U55 ( .AN(n14), .B(n86), .Y(n16) );
  OAI211X1 U56 ( .A0(n116), .A1(n14), .B0(n25), .C0(n26), .Y(n121) );
  AOI21X1 U57 ( .A0(N157), .A1(n23), .B0(n174), .Y(n26) );
  NAND2X1 U58 ( .A(N162), .B(n18), .Y(n25) );
  OAI211X1 U59 ( .A0(n159), .A1(n14), .B0(n27), .C0(n28), .Y(n122) );
  AOI21X1 U60 ( .A0(n159), .A1(n23), .B0(n174), .Y(n28) );
  NAND2X1 U61 ( .A(n159), .B(n18), .Y(n27) );
  NAND2X1 U62 ( .A(cur_state[1]), .B(n178), .Y(n20) );
  NAND2X1 U63 ( .A(n16), .B(cur_state[0]), .Y(n13) );
  CLKINVX1 U64 ( .A(cur_state[0]), .Y(n178) );
  ADDHXL U65 ( .A(N23), .B(N22), .CO(\add_266/carry[2] ), .S(N162) );
  CLKINVX1 U66 ( .A(N24), .Y(n173) );
  ADDHXL U67 ( .A(N24), .B(\add_266/carry[2] ), .CO(\add_266/carry[3] ), .S(
        N163) );
  ADDHXL U68 ( .A(N25), .B(\add_266/carry[3] ), .CO(\add_266/carry[4] ), .S(
        N164) );
  OAI222XL U69 ( .A0(n102), .A1(n162), .B0(n163), .B1(n112), .C0(n94), .C1(
        n161), .Y(n123) );
  OAI222XL U70 ( .A0(n101), .A1(n162), .B0(n163), .B1(n111), .C0(n93), .C1(
        n161), .Y(n124) );
  OAI222XL U71 ( .A0(n100), .A1(n162), .B0(n163), .B1(n110), .C0(n92), .C1(
        n161), .Y(n125) );
  OAI222XL U72 ( .A0(n99), .A1(n162), .B0(n163), .B1(n109), .C0(n91), .C1(n161), .Y(n126) );
  OAI222XL U73 ( .A0(n98), .A1(n162), .B0(n163), .B1(n108), .C0(n90), .C1(n161), .Y(n127) );
  OAI222XL U74 ( .A0(n97), .A1(n162), .B0(n163), .B1(n107), .C0(n89), .C1(n161), .Y(n128) );
  OAI222XL U75 ( .A0(n96), .A1(n162), .B0(n163), .B1(n106), .C0(n88), .C1(n161), .Y(n129) );
  OAI222XL U76 ( .A0(n95), .A1(n162), .B0(n163), .B1(n105), .C0(n87), .C1(n161), .Y(n130) );
  NAND2X1 U77 ( .A(n86), .B(n11), .Y(n12) );
  NOR4X1 U78 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(out_done) );
  XOR2X1 U79 ( .A(n54), .B(n157), .Y(n6) );
  XOR2X1 U80 ( .A(n55), .B(n156), .Y(n7) );
  XOR2X1 U81 ( .A(n52), .B(n159), .Y(n8) );
  OAI22XL U82 ( .A0(n102), .A1(n40), .B0(n94), .B1(n41), .Y(N101) );
  OAI22XL U83 ( .A0(n101), .A1(n40), .B0(n93), .B1(n41), .Y(N102) );
  OAI22XL U84 ( .A0(n100), .A1(n40), .B0(n92), .B1(n41), .Y(N103) );
  OAI22XL U85 ( .A0(n99), .A1(n40), .B0(n91), .B1(n41), .Y(N104) );
  OAI22XL U86 ( .A0(n98), .A1(n40), .B0(n90), .B1(n41), .Y(N105) );
  OAI22XL U87 ( .A0(n97), .A1(n40), .B0(n89), .B1(n41), .Y(N106) );
  OAI22XL U88 ( .A0(n96), .A1(n40), .B0(n88), .B1(n41), .Y(N107) );
  OAI22XL U89 ( .A0(n95), .A1(n40), .B0(n87), .B1(n41), .Y(N108) );
  OAI22XL U90 ( .A0(n56), .A1(n11), .B0(n103), .B1(n12), .Y(n63) );
  OAI22XL U91 ( .A0(n55), .A1(n11), .B0(n104), .B1(n12), .Y(n62) );
  OAI22XL U92 ( .A0(n94), .A1(n160), .B0(n102), .B1(n161), .Y(N109) );
  OAI22XL U93 ( .A0(n93), .A1(n160), .B0(n101), .B1(n161), .Y(N110) );
  OAI22XL U94 ( .A0(n92), .A1(n160), .B0(n100), .B1(n161), .Y(N111) );
  OAI22XL U95 ( .A0(n91), .A1(n160), .B0(n99), .B1(n161), .Y(N112) );
  OAI22XL U96 ( .A0(n90), .A1(n160), .B0(n98), .B1(n161), .Y(N113) );
  OAI22XL U97 ( .A0(n89), .A1(n160), .B0(n97), .B1(n161), .Y(N114) );
  OAI22XL U98 ( .A0(n88), .A1(n160), .B0(n96), .B1(n161), .Y(N115) );
  OAI22XL U99 ( .A0(n87), .A1(n160), .B0(n95), .B1(n161), .Y(N116) );
  OAI22XL U100 ( .A0(n94), .A1(n162), .B0(n163), .B1(n51), .Y(n131) );
  OAI22XL U101 ( .A0(n93), .A1(n162), .B0(n163), .B1(n50), .Y(n132) );
  OAI22XL U102 ( .A0(n92), .A1(n162), .B0(n163), .B1(n49), .Y(n133) );
  OAI22XL U103 ( .A0(n91), .A1(n162), .B0(n163), .B1(n48), .Y(n134) );
  OAI22XL U104 ( .A0(n90), .A1(n162), .B0(n163), .B1(n47), .Y(n135) );
  OAI22XL U105 ( .A0(n89), .A1(n162), .B0(n163), .B1(n46), .Y(n136) );
  OAI22XL U106 ( .A0(n88), .A1(n162), .B0(n163), .B1(n45), .Y(n137) );
  OAI22XL U107 ( .A0(n87), .A1(n162), .B0(n163), .B1(n44), .Y(n138) );
  NAND2X1 U108 ( .A(n104), .B(n103), .Y(n42) );
  OAI21XL U109 ( .A0(n52), .A1(n11), .B0(n12), .Y(n59) );
  OAI21XL U110 ( .A0(n53), .A1(n11), .B0(n12), .Y(n60) );
  OAI21XL U111 ( .A0(n54), .A1(n11), .B0(n12), .Y(n61) );
  NAND3X1 U112 ( .A(n175), .B(n2), .C(n104), .Y(n35) );
  NAND2X1 U113 ( .A(n9), .B(n10), .Y(n5) );
  XNOR2X1 U114 ( .A(n116), .B(n53), .Y(n10) );
  XNOR2X1 U115 ( .A(n158), .B(n56), .Y(n9) );
  NAND2X1 U116 ( .A(n103), .B(n1), .Y(n34) );
  CLKBUFX3 U117 ( .A(n39), .Y(n160) );
  OAI21XL U118 ( .A0(n57), .A1(n103), .B0(n42), .Y(n39) );
  CLKINVX1 U119 ( .A(reset), .Y(n179) );
  OAI22XL U120 ( .A0(proc_data[13]), .A1(n145), .B0(proc_data[12]), .B1(n144), 
        .Y(n17) );
  OAI22XL U121 ( .A0(proc_data[15]), .A1(n147), .B0(proc_data[14]), .B1(n146), 
        .Y(n4) );
  OAI21XL U122 ( .A0(n17), .A1(n4), .B0(N24), .Y(n32) );
  OAI22XL U123 ( .A0(proc_data[9]), .A1(n145), .B0(proc_data[8]), .B1(n144), 
        .Y(n30) );
  OAI22XL U124 ( .A0(proc_data[11]), .A1(n147), .B0(proc_data[10]), .B1(n146), 
        .Y(n24) );
  OAI21XL U125 ( .A0(n30), .A1(n24), .B0(n157), .Y(n31) );
  AOI21X1 U126 ( .A0(n32), .A1(n31), .B0(n156), .Y(n155) );
  OAI22XL U127 ( .A0(proc_data[5]), .A1(n145), .B0(proc_data[4]), .B1(n144), 
        .Y(n37) );
  OAI22XL U128 ( .A0(proc_data[7]), .A1(n147), .B0(proc_data[6]), .B1(n146), 
        .Y(n36) );
  OAI21XL U129 ( .A0(n37), .A1(n36), .B0(N24), .Y(n113) );
  OAI22XL U130 ( .A0(proc_data[1]), .A1(n145), .B0(proc_data[0]), .B1(n144), 
        .Y(n43) );
  OAI22XL U131 ( .A0(proc_data[3]), .A1(n147), .B0(proc_data[2]), .B1(n146), 
        .Y(n38) );
  OAI21XL U132 ( .A0(n43), .A1(n38), .B0(n157), .Y(n84) );
  AOI21X1 U133 ( .A0(n113), .A1(n84), .B0(N25), .Y(n154) );
  OAI22XL U134 ( .A0(proc_data[21]), .A1(n145), .B0(proc_data[20]), .B1(n144), 
        .Y(n115) );
  OAI22XL U135 ( .A0(proc_data[23]), .A1(n147), .B0(proc_data[22]), .B1(n146), 
        .Y(n114) );
  OAI21XL U136 ( .A0(n115), .A1(n114), .B0(N24), .Y(n141) );
  OAI22XL U137 ( .A0(proc_data[17]), .A1(n145), .B0(proc_data[16]), .B1(n144), 
        .Y(n139) );
  OAI22XL U138 ( .A0(proc_data[19]), .A1(n147), .B0(proc_data[18]), .B1(n146), 
        .Y(n117) );
  OAI21XL U139 ( .A0(n139), .A1(n117), .B0(n157), .Y(n140) );
  AOI21X1 U140 ( .A0(n141), .A1(n140), .B0(N25), .Y(n153) );
  OAI22XL U141 ( .A0(proc_data[29]), .A1(n145), .B0(proc_data[28]), .B1(n144), 
        .Y(n143) );
  OAI22XL U142 ( .A0(proc_data[31]), .A1(n147), .B0(proc_data[30]), .B1(n146), 
        .Y(n142) );
  OAI21XL U143 ( .A0(n143), .A1(n142), .B0(N24), .Y(n151) );
  OAI22XL U144 ( .A0(proc_data[25]), .A1(n145), .B0(proc_data[24]), .B1(n144), 
        .Y(n149) );
  OAI22XL U145 ( .A0(proc_data[27]), .A1(n147), .B0(proc_data[26]), .B1(n146), 
        .Y(n148) );
  OAI21XL U146 ( .A0(n149), .A1(n148), .B0(n157), .Y(n150) );
  AOI21X1 U147 ( .A0(n151), .A1(n150), .B0(n156), .Y(n152) );
  OAI33X1 U148 ( .A0(n155), .A1(N26), .A2(n154), .B0(n158), .B1(n153), .B2(
        n152), .Y(so_data) );
  NAND2X2 U149 ( .A(N22), .B(n116), .Y(n145) );
  AO21XL U150 ( .A0(N22), .A1(N23), .B0(n170), .Y(N157) );
  NAND2X1 U151 ( .A(n170), .B(n173), .Y(n171) );
  OAI21XL U152 ( .A0(n170), .A1(n173), .B0(n171), .Y(N158) );
  XNOR2X1 U153 ( .A(N25), .B(n171), .Y(N159) );
  NOR2X1 U154 ( .A(N25), .B(n171), .Y(n172) );
  XOR2X1 U155 ( .A(N26), .B(n172), .Y(N160) );
  XOR2X1 U156 ( .A(\add_266/carry[4] ), .B(N26), .Y(N165) );
endmodule


module DAC_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DAC ( clk, reset, cur_state, so_valid, so_data, odd1_wr, odd2_wr, 
        odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr, oem_addr, 
        oem_dataout, mem_done );
  input [2:0] cur_state;
  output [4:0] oem_addr;
  output [7:0] oem_dataout;
  input clk, reset, so_valid, so_data;
  output odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr,
         even4_wr, mem_done;
  wire   n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, n1, n3, n4, n5, n7, n10,
         n11, n12, n15, n18, n20, n21, n22, n23, n24, n25, n26, n27, n28, n31,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n46, n47,
         n48, n49, n51, n54, n55, n58, n59, n60, n62, n63, n64, n65, n67, n68,
         n70, n72, n74, n76, n78, n79, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145,
         \add_371/carry[4] , \add_371/carry[3] , \add_371/carry[2] , n2, n6,
         n8, n9, n13, n14, n16, n17, n19, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173;
  wire   [7:0] wr_cnt;

  DFFSX1 \wr_cnt_reg[7]  ( .D(n104), .CK(clk), .SN(n150), .Q(wr_cnt[7]) );
  DFFSX1 \wr_cnt_reg[6]  ( .D(n105), .CK(clk), .SN(n173), .Q(wr_cnt[6]) );
  DFFSX1 \wr_cnt_reg[4]  ( .D(n107), .CK(clk), .SN(n173), .Q(wr_cnt[4]) );
  DFFSX1 \wr_cnt_reg[5]  ( .D(n106), .CK(clk), .SN(n173), .Q(wr_cnt[5]) );
  DFFSX1 \wr_cnt_reg[3]  ( .D(n108), .CK(clk), .SN(n173), .Q(wr_cnt[3]) );
  DFFSX1 \wr_cnt_reg[2]  ( .D(n109), .CK(clk), .SN(n150), .Q(wr_cnt[2]) );
  DFFRX1 \mem_sel_reg[5]  ( .D(n98), .CK(clk), .RN(n150), .Q(n8), .QN(n127) );
  DFFRX1 \mem_sel_reg[0]  ( .D(n101), .CK(clk), .RN(n150), .Q(n2), .QN(n131)
         );
  DFFSX1 \wr_cnt_reg[1]  ( .D(n110), .CK(clk), .SN(n150), .Q(wr_cnt[1]) );
  DFFSX1 \wr_cnt_reg[0]  ( .D(n111), .CK(clk), .SN(n150), .Q(wr_cnt[0]) );
  DFFRX1 \mem_sel_reg[3]  ( .D(n95), .CK(clk), .RN(n150), .Q(n14), .QN(n129)
         );
  DFFRX1 \mem_sel_reg[1]  ( .D(n102), .CK(clk), .RN(n150), .Q(n9), .QN(n130)
         );
  DFFRX1 \mem_sel_reg[6]  ( .D(n97), .CK(clk), .RN(n150), .Q(n16), .QN(n92) );
  DFFRX1 \mem_sel_reg[4]  ( .D(n100), .CK(clk), .RN(n150), .QN(n128) );
  DFFRX1 \oem_dataout_reg[0]  ( .D(n138), .CK(clk), .RN(n112), .Q(n189), .QN(
        n91) );
  DFFRX1 \oem_dataout_reg[1]  ( .D(n139), .CK(clk), .RN(n113), .Q(n188), .QN(
        n90) );
  DFFRX1 \oem_dataout_reg[2]  ( .D(n140), .CK(clk), .RN(n114), .Q(n187), .QN(
        n89) );
  DFFRX1 \oem_dataout_reg[3]  ( .D(n141), .CK(clk), .RN(n115), .Q(n186), .QN(
        n88) );
  DFFRX1 \oem_dataout_reg[4]  ( .D(n142), .CK(clk), .RN(n116), .Q(n185), .QN(
        n87) );
  DFFRX1 \oem_dataout_reg[5]  ( .D(n143), .CK(clk), .RN(n117), .Q(n184), .QN(
        n86) );
  DFFRX1 \oem_dataout_reg[6]  ( .D(n144), .CK(clk), .RN(n118), .Q(n183), .QN(
        n85) );
  DFFRX1 \oem_dataout_reg[7]  ( .D(n145), .CK(clk), .RN(n119), .Q(n182), .QN(
        n84) );
  DFFSX1 \cnt_bits_reg[0]  ( .D(n122), .CK(clk), .SN(n173), .Q(n164), .QN(n125) );
  DFFSX1 \cnt_bits_reg[1]  ( .D(n121), .CK(clk), .SN(n173), .QN(n124) );
  DFFSX1 \cnt_bits_reg[2]  ( .D(n165), .CK(clk), .SN(n173), .Q(n168), .QN(n123) );
  DFFSX1 addr_carry_reg ( .D(n103), .CK(clk), .SN(n173), .QN(n94) );
  DFFRX1 \mem_sel_reg[7]  ( .D(n99), .CK(clk), .RN(n173), .Q(n170), .QN(n126)
         );
  DFFSX1 \oem_addr_reg[1]  ( .D(n136), .CK(clk), .SN(n173), .QN(n19) );
  DFFSX1 \oem_addr_reg[4]  ( .D(n133), .CK(clk), .SN(n173), .QN(n17) );
  DFFSX1 \oem_addr_reg[2]  ( .D(n135), .CK(clk), .SN(n173), .QN(n13) );
  DFFSX1 \oem_addr_reg[0]  ( .D(n137), .CK(clk), .SN(n173), .QN(N106) );
  DFFSX1 \oem_addr_reg[3]  ( .D(n134), .CK(clk), .SN(n173), .QN(n6) );
  NAND3BXL U3 ( .AN(cur_state[0]), .B(n172), .C(cur_state[2]), .Y(n60) );
  NAND3XL U4 ( .A(cur_state[0]), .B(n172), .C(cur_state[2]), .Y(n83) );
  NOR3XL U5 ( .A(cur_state[0]), .B(cur_state[2]), .C(n172), .Y(n55) );
  INVX3 U6 ( .A(reset), .Y(n173) );
  INVX16 U7 ( .A(n19), .Y(oem_addr[1]) );
  INVX16 U8 ( .A(n17), .Y(oem_addr[4]) );
  INVX16 U9 ( .A(n13), .Y(oem_addr[2]) );
  INVX16 U10 ( .A(n6), .Y(oem_addr[3]) );
  INVX16 U11 ( .A(N106), .Y(oem_addr[0]) );
  OR2X1 U12 ( .A(n126), .B(n1), .Y(n174) );
  INVX12 U13 ( .A(n174), .Y(odd1_wr) );
  OR2X1 U14 ( .A(n127), .B(n1), .Y(n175) );
  INVX12 U15 ( .A(n175), .Y(odd2_wr) );
  OR2X1 U16 ( .A(n129), .B(n1), .Y(n176) );
  INVX12 U17 ( .A(n176), .Y(odd3_wr) );
  OR2X1 U18 ( .A(n130), .B(n1), .Y(n177) );
  INVX12 U19 ( .A(n177), .Y(odd4_wr) );
  OR2X1 U20 ( .A(n92), .B(n1), .Y(n178) );
  INVX12 U21 ( .A(n178), .Y(even1_wr) );
  NAND3X2 U22 ( .A(n83), .B(n164), .C(n49), .Y(n1) );
  OR2X1 U23 ( .A(n128), .B(n1), .Y(n179) );
  INVX12 U24 ( .A(n179), .Y(even2_wr) );
  OR2X1 U25 ( .A(n93), .B(n1), .Y(n180) );
  INVX12 U26 ( .A(n180), .Y(even3_wr) );
  XOR2XL U27 ( .A(\add_371/carry[4] ), .B(oem_addr[4]), .Y(N110) );
  BUFX12 U28 ( .A(n182), .Y(oem_dataout[7]) );
  BUFX12 U29 ( .A(n183), .Y(oem_dataout[6]) );
  BUFX12 U30 ( .A(n184), .Y(oem_dataout[5]) );
  BUFX12 U31 ( .A(n185), .Y(oem_dataout[4]) );
  BUFX12 U32 ( .A(n186), .Y(oem_dataout[3]) );
  BUFX12 U33 ( .A(n187), .Y(oem_dataout[2]) );
  BUFX12 U34 ( .A(n188), .Y(oem_dataout[1]) );
  BUFX12 U35 ( .A(n189), .Y(oem_dataout[0]) );
  OR2X1 U36 ( .A(n131), .B(n1), .Y(n181) );
  INVX12 U37 ( .A(n181), .Y(even4_wr) );
  NAND4XL U38 ( .A(oem_addr[4]), .B(oem_addr[3]), .C(n43), .D(oem_addr[2]), 
        .Y(n25) );
  CLKINVX1 U39 ( .A(n26), .Y(n169) );
  NOR2X1 U40 ( .A(n94), .B(n149), .Y(n58) );
  NAND4X1 U41 ( .A(n20), .B(n33), .C(n148), .D(n34), .Y(n11) );
  NOR2X1 U42 ( .A(n168), .B(n124), .Y(n47) );
  NOR2BX1 U43 ( .AN(n124), .B(n123), .Y(n48) );
  NOR2X1 U44 ( .A(n150), .B(n125), .Y(n46) );
  CLKINVX1 U45 ( .A(n24), .Y(n151) );
  NOR2X1 U46 ( .A(n149), .B(n169), .Y(n24) );
  CLKBUFX3 U47 ( .A(n154), .Y(n149) );
  CLKINVX1 U48 ( .A(n148), .Y(n154) );
  NAND2X1 U49 ( .A(n44), .B(n167), .Y(n112) );
  NOR2BX1 U50 ( .AN(n79), .B(n164), .Y(n64) );
  AND2XL U51 ( .A(so_valid), .B(n150), .Y(n79) );
  AND2X2 U52 ( .A(n79), .B(n164), .Y(n68) );
  CLKBUFX3 U53 ( .A(n173), .Y(n150) );
  NAND2X2 U54 ( .A(so_data), .B(n60), .Y(n63) );
  NOR2X1 U55 ( .A(n25), .B(n149), .Y(n7) );
  NOR2BX1 U56 ( .AN(n25), .B(n26), .Y(n5) );
  NAND2X1 U57 ( .A(n24), .B(n25), .Y(n10) );
  AOI211X1 U58 ( .A0(n8), .A1(n14), .B0(n37), .C0(n170), .Y(n36) );
  NOR2X1 U59 ( .A(n8), .B(n14), .Y(n41) );
  NOR3X1 U60 ( .A(n2), .B(n16), .C(n9), .Y(n42) );
  CLKBUFX3 U61 ( .A(n3), .Y(n148) );
  OAI21XL U62 ( .A0(n59), .A1(n164), .B0(n60), .Y(n3) );
  CLKINVX1 U63 ( .A(n58), .Y(n153) );
  NOR3X1 U64 ( .A(n171), .B(n2), .C(n40), .Y(n23) );
  CLKINVX1 U65 ( .A(n11), .Y(n155) );
  NAND2BX1 U66 ( .AN(n37), .B(n41), .Y(n20) );
  CLKINVX1 U67 ( .A(n59), .Y(n167) );
  CLKINVX1 U68 ( .A(n54), .Y(n166) );
  CLKINVX1 U69 ( .A(n51), .Y(n165) );
  AOI221XL U70 ( .A0(n167), .A1(n166), .B0(n168), .B1(n54), .C0(n49), .Y(n51)
         );
  NOR2X1 U71 ( .A(n164), .B(n150), .Y(n44) );
  NAND2X1 U72 ( .A(n48), .B(n44), .Y(n116) );
  NAND2X1 U73 ( .A(n48), .B(n46), .Y(n117) );
  NAND2X1 U74 ( .A(n44), .B(n49), .Y(n118) );
  NAND2X1 U75 ( .A(n46), .B(n49), .Y(n119) );
  NAND2X1 U76 ( .A(n46), .B(n167), .Y(n113) );
  NAND2X1 U77 ( .A(n47), .B(n44), .Y(n114) );
  NAND2X1 U78 ( .A(n47), .B(n46), .Y(n115) );
  NOR2X2 U79 ( .A(n60), .B(reset), .Y(n65) );
  OAI22XL U80 ( .A0(n159), .A1(n91), .B0(n62), .B1(n63), .Y(n138) );
  CLKINVX1 U81 ( .A(n62), .Y(n159) );
  AOI21X1 U82 ( .A0(n167), .A1(n64), .B0(n65), .Y(n62) );
  OAI32X1 U83 ( .A0(n90), .A1(n65), .A2(n163), .B0(n63), .B1(n67), .Y(n139) );
  CLKINVX1 U84 ( .A(n67), .Y(n163) );
  NAND2X1 U85 ( .A(n68), .B(n167), .Y(n67) );
  OAI32X1 U86 ( .A0(n87), .A1(n65), .A2(n157), .B0(n63), .B1(n74), .Y(n142) );
  CLKINVX1 U87 ( .A(n74), .Y(n157) );
  NAND2X1 U88 ( .A(n64), .B(n48), .Y(n74) );
  OAI32X1 U89 ( .A0(n86), .A1(n65), .A2(n161), .B0(n63), .B1(n76), .Y(n143) );
  CLKINVX1 U90 ( .A(n76), .Y(n161) );
  NAND2X1 U91 ( .A(n68), .B(n48), .Y(n76) );
  OAI32X1 U92 ( .A0(n85), .A1(n65), .A2(n156), .B0(n63), .B1(n78), .Y(n144) );
  CLKINVX1 U93 ( .A(n78), .Y(n156) );
  NAND2X1 U94 ( .A(n64), .B(n49), .Y(n78) );
  OAI32X1 U95 ( .A0(n84), .A1(n65), .A2(n160), .B0(n63), .B1(n81), .Y(n145) );
  CLKINVX1 U96 ( .A(n81), .Y(n160) );
  NAND2X1 U97 ( .A(n68), .B(n49), .Y(n81) );
  OAI32X1 U98 ( .A0(n89), .A1(n65), .A2(n158), .B0(n63), .B1(n70), .Y(n140) );
  CLKINVX1 U99 ( .A(n70), .Y(n158) );
  NAND2X1 U100 ( .A(n64), .B(n47), .Y(n70) );
  OAI32X1 U101 ( .A0(n88), .A1(n65), .A2(n162), .B0(n63), .B1(n72), .Y(n141)
         );
  CLKINVX1 U102 ( .A(n72), .Y(n162) );
  NAND2X1 U103 ( .A(n68), .B(n47), .Y(n72) );
  AO22X1 U104 ( .A0(n153), .A1(oem_addr[4]), .B0(N110), .B1(n58), .Y(n133) );
  AND2XL U105 ( .A(oem_addr[0]), .B(oem_addr[1]), .Y(n43) );
  NOR2X2 U106 ( .A(n124), .B(n123), .Y(n49) );
  OAI221XL U107 ( .A0(n129), .A1(n152), .B0(n130), .B1(n148), .C0(n31), .Y(
        n102) );
  AOI221XL U108 ( .A0(n169), .A1(n9), .B0(n24), .B1(n2), .C0(n155), .Y(n31) );
  CLKINVX1 U109 ( .A(n7), .Y(n152) );
  OAI221XL U110 ( .A0(n128), .A1(n151), .B0(n127), .B1(n148), .C0(n18), .Y(n98) );
  AOI221XL U111 ( .A0(n5), .A1(n8), .B0(n7), .B1(n170), .C0(n155), .Y(n18) );
  OAI221XL U112 ( .A0(n93), .A1(n151), .B0(n129), .B1(n148), .C0(n4), .Y(n95)
         );
  AOI221XL U113 ( .A0(n5), .A1(n14), .B0(n7), .B1(n8), .C0(n155), .Y(n4) );
  OAI211X1 U114 ( .A0(n126), .A1(n10), .B0(n11), .C0(n15), .Y(n97) );
  OAI21XL U115 ( .A0(n169), .A1(n149), .B0(n16), .Y(n15) );
  OAI211X1 U116 ( .A0(n129), .A1(n10), .B0(n11), .C0(n12), .Y(n96) );
  AOI2BB2X1 U117 ( .B0(n171), .B1(n169), .A0N(n148), .A1N(n93), .Y(n12) );
  OAI211X1 U118 ( .A0(n127), .A1(n10), .B0(n11), .C0(n27), .Y(n100) );
  AO21X1 U119 ( .A0(n26), .A1(n148), .B0(n128), .Y(n27) );
  OAI211X1 U120 ( .A0(n20), .A1(n21), .B0(n11), .C0(n22), .Y(n99) );
  AOI32X1 U121 ( .A0(n23), .A1(n130), .A2(n24), .B0(n149), .B1(n170), .Y(n22)
         );
  OAI21XL U122 ( .A0(n5), .A1(n126), .B0(n148), .Y(n21) );
  CLKINVX1 U123 ( .A(cur_state[1]), .Y(n172) );
  ADDHXL U124 ( .A(oem_addr[1]), .B(oem_addr[0]), .CO(\add_371/carry[2] ), .S(
        N107) );
  ADDHXL U125 ( .A(oem_addr[2]), .B(\add_371/carry[2] ), .CO(
        \add_371/carry[3] ), .S(N108) );
  AO22X1 U126 ( .A0(n153), .A1(oem_addr[2]), .B0(N108), .B1(n58), .Y(n135) );
  AO22X1 U127 ( .A0(n153), .A1(oem_addr[3]), .B0(N109), .B1(n58), .Y(n134) );
  AO22X1 U128 ( .A0(n153), .A1(oem_addr[0]), .B0(N106), .B1(n58), .Y(n137) );
  AO22X1 U129 ( .A0(n153), .A1(oem_addr[1]), .B0(N107), .B1(n58), .Y(n136) );
  ADDHXL U130 ( .A(oem_addr[3]), .B(\add_371/carry[3] ), .CO(
        \add_371/carry[4] ), .S(N109) );
  NAND4X1 U131 ( .A(n126), .B(n93), .C(n42), .D(n41), .Y(n33) );
  AOI211X1 U132 ( .A0(n23), .A1(n92), .B0(n35), .C0(n36), .Y(n34) );
  AOI211X1 U133 ( .A0(n38), .A1(n39), .B0(n40), .C0(n9), .Y(n35) );
  OAI211X1 U134 ( .A0(n130), .A1(n151), .B0(n11), .C0(n28), .Y(n101) );
  AOI2BB2X1 U135 ( .B0(n2), .B1(n169), .A0N(n148), .A1N(n131), .Y(n28) );
  NAND3X1 U136 ( .A(n126), .B(n41), .C(n128), .Y(n40) );
  NAND2X1 U138 ( .A(n123), .B(n124), .Y(n59) );
  OAI21XL U139 ( .A0(n93), .A1(n92), .B0(n131), .Y(n39) );
  NAND2X1 U140 ( .A(n93), .B(n92), .Y(n38) );
  AO22X1 U141 ( .A0(n149), .A1(wr_cnt[7]), .B0(N118), .B1(n148), .Y(n104) );
  AND4X1 U142 ( .A(n82), .B(wr_cnt[6]), .C(n169), .D(wr_cnt[7]), .Y(mem_done)
         );
  XNOR2X1 U143 ( .A(n166), .B(n124), .Y(n121) );
  NAND2X1 U144 ( .A(n55), .B(n125), .Y(n54) );
  XNOR2X1 U145 ( .A(n94), .B(n148), .Y(n103) );
  NAND3X1 U146 ( .A(wr_cnt[1]), .B(wr_cnt[0]), .C(wr_cnt[2]), .Y(n26) );
  OAI21XL U147 ( .A0(n125), .A1(n55), .B0(n54), .Y(n122) );
  AO22X1 U148 ( .A0(n149), .A1(wr_cnt[6]), .B0(N117), .B1(n148), .Y(n105) );
  AO22X1 U149 ( .A0(n149), .A1(wr_cnt[5]), .B0(N116), .B1(n148), .Y(n106) );
  AO22X1 U150 ( .A0(n149), .A1(wr_cnt[4]), .B0(N115), .B1(n148), .Y(n107) );
  AO22X1 U151 ( .A0(n149), .A1(wr_cnt[3]), .B0(N114), .B1(n148), .Y(n108) );
  AO22X1 U152 ( .A0(wr_cnt[2]), .A1(n149), .B0(N113), .B1(n148), .Y(n109) );
  AO22X1 U153 ( .A0(wr_cnt[1]), .A1(n149), .B0(N112), .B1(n148), .Y(n110) );
  AO22X1 U154 ( .A0(wr_cnt[0]), .A1(n149), .B0(N111), .B1(n148), .Y(n111) );
  AND3X2 U155 ( .A(wr_cnt[4]), .B(wr_cnt[5]), .C(wr_cnt[3]), .Y(n82) );
  DAC_DW01_inc_0 add_374 ( .A(wr_cnt), .SUM({N118, N117, N116, N115, N114, 
        N113, N112, N111}) );
  DFFRX1 \mem_sel_reg[2]  ( .D(n96), .CK(clk), .RN(n173), .Q(n171), .QN(n93)
         );
  NAND3XL U137 ( .A(n93), .B(n42), .C(n128), .Y(n37) );
endmodule


module STI_DAC ( clk, reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, 
        pi_end, so_data, so_valid, oem_finish, oem_dataout, oem_addr, odd1_wr, 
        odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [7:0] oem_dataout;
  output [4:0] oem_addr;
  input clk, reset, load, pi_fill, pi_msb, pi_low, pi_end;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   n2, _read_done, _out_done, _mem_done;
  wire   [2:0] _cur_state;

  BUFX12 U1 ( .A(n2), .Y(so_data) );
  CTRL CTRL ( .clk(clk), .reset(reset), .pi_end(pi_end), .read_done(_read_done), .out_done(_out_done), .mem_done(_mem_done), .cur_state(_cur_state), 
        .so_valid(so_valid), .oem_finish(oem_finish) );
  PROC PROC ( .clk(clk), .reset(reset), .cur_state(_cur_state), .load(load), 
        .pi_data(pi_data), .pi_length(pi_length), .pi_fill(pi_fill), .pi_msb(
        pi_msb), .pi_low(pi_low), .read_done(_read_done), .out_done(_out_done), 
        .so_data(n2) );
  DAC DAC ( .clk(clk), .reset(reset), .cur_state(_cur_state), .so_valid(
        so_valid), .so_data(n2), .odd1_wr(odd1_wr), .odd2_wr(odd2_wr), 
        .odd3_wr(odd3_wr), .odd4_wr(odd4_wr), .even1_wr(even1_wr), .even2_wr(
        even2_wr), .even3_wr(even3_wr), .even4_wr(even4_wr), .oem_addr(
        oem_addr), .oem_dataout(oem_dataout), .mem_done(_mem_done) );
endmodule

