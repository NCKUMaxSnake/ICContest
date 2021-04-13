/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Tue Apr 13 17:49:24 2021
/////////////////////////////////////////////////////////////


module Counter32 ( clk, reset, recount_counter32, count_out, isstring, 
        ispattern );
  output [4:0] count_out;
  input clk, reset, recount_counter32, isstring, ispattern;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N16, N22, n3, n4,
         \add_337/carry[4] , \add_337/carry[3] , \add_337/carry[2] , n1, n2,
         n5;
  wire   [1:0] isStrPat;
  assign N22 = isstring;

  DFFRX1 \isStrPat_reg[1]  ( .D(N22), .CK(clk), .RN(n2), .Q(isStrPat[1]) );
  DFFRX1 \isStrPat_reg[0]  ( .D(n5), .CK(clk), .RN(n2), .Q(isStrPat[0]) );
  DFFRX1 \count_out_reg[4]  ( .D(N16), .CK(clk), .RN(n2), .Q(count_out[4]) );
  DFFRX1 \count_out_reg[3]  ( .D(N15), .CK(clk), .RN(n2), .Q(count_out[3]) );
  DFFRX2 \count_out_reg[0]  ( .D(N12), .CK(clk), .RN(n2), .Q(count_out[0]) );
  DFFRX2 \count_out_reg[2]  ( .D(N14), .CK(clk), .RN(n2), .Q(count_out[2]) );
  DFFRX2 \count_out_reg[1]  ( .D(N13), .CK(clk), .RN(n2), .Q(count_out[1]) );
  XOR2XL U3 ( .A(\add_337/carry[4] ), .B(count_out[4]), .Y(N11) );
  AND2X2 U4 ( .A(N10), .B(n3), .Y(N15) );
  AND2X2 U5 ( .A(N9), .B(n3), .Y(N14) );
  AND2X2 U6 ( .A(N8), .B(n3), .Y(N13) );
  AOI2BB1X1 U7 ( .A0N(isStrPat[0]), .A1N(n4), .B0(recount_counter32), .Y(n3)
         );
  NAND2X1 U8 ( .A(ispattern), .B(isStrPat[1]), .Y(n4) );
  AOI21X1 U9 ( .A0(count_out[0]), .A1(n1), .B0(recount_counter32), .Y(N12) );
  OR2X1 U10 ( .A(isStrPat[0]), .B(n4), .Y(n1) );
  AND2X2 U11 ( .A(N11), .B(n3), .Y(N16) );
  CLKINVX1 U12 ( .A(N22), .Y(n5) );
  ADDHXL U13 ( .A(count_out[1]), .B(count_out[0]), .CO(\add_337/carry[2] ), 
        .S(N8) );
  ADDHXL U14 ( .A(count_out[2]), .B(\add_337/carry[2] ), .CO(
        \add_337/carry[3] ), .S(N9) );
  ADDHXL U15 ( .A(count_out[3]), .B(\add_337/carry[3] ), .CO(
        \add_337/carry[4] ), .S(N10) );
  INVX3 U16 ( .A(reset), .Y(n2) );
endmodule


module Compare ( next_state, string_cp_char, pattern_cp_char, result, star );
  input [1:0] next_state;
  input [7:0] string_cp_char;
  input [7:0] pattern_cp_char;
  output result, star;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n2,
         n3, n4, n5;

  NOR3BXL U3 ( .AN(pattern_cp_char[5]), .B(pattern_cp_char[4]), .C(
        pattern_cp_char[6]), .Y(n12) );
  CLKINVX1 U4 ( .A(n24), .Y(n2) );
  AOI31X1 U5 ( .A0(n3), .A1(n4), .A2(n23), .B0(n24), .Y(n22) );
  OAI21XL U6 ( .A0(n25), .A1(n26), .B0(n21), .Y(n23) );
  NAND4X1 U7 ( .A(string_cp_char[0]), .B(string_cp_char[1]), .C(
        string_cp_char[2]), .D(string_cp_char[3]), .Y(n25) );
  NAND4X1 U8 ( .A(string_cp_char[4]), .B(string_cp_char[5]), .C(
        string_cp_char[6]), .D(string_cp_char[7]), .Y(n26) );
  NAND4BX1 U9 ( .AN(string_cp_char[0]), .B(string_cp_char[5]), .C(n27), .D(n28), .Y(n21) );
  NOR2X1 U10 ( .A(string_cp_char[2]), .B(string_cp_char[1]), .Y(n27) );
  NOR4X1 U11 ( .A(string_cp_char[7]), .B(string_cp_char[6]), .C(
        string_cp_char[4]), .D(string_cp_char[3]), .Y(n28) );
  CLKINVX1 U12 ( .A(n11), .Y(star) );
  NOR2X1 U13 ( .A(n4), .B(n3), .Y(n24) );
  NAND3X1 U14 ( .A(n1), .B(n12), .C(n13), .Y(n11) );
  NOR3X1 U15 ( .A(n2), .B(pattern_cp_char[7]), .C(pattern_cp_char[0]), .Y(n13)
         );
  NAND4BBXL U16 ( .AN(pattern_cp_char[0]), .BN(pattern_cp_char[7]), .C(
        pattern_cp_char[2]), .D(n19), .Y(n17) );
  OAI32X1 U17 ( .A0(n20), .A1(n21), .A2(n2), .B0(n22), .B1(n5), .Y(n19) );
  NAND3BX1 U18 ( .AN(pattern_cp_char[5]), .B(pattern_cp_char[6]), .C(
        pattern_cp_char[4]), .Y(n20) );
  CLKINVX1 U19 ( .A(n12), .Y(n5) );
  XNOR2X1 U20 ( .A(pattern_cp_char[3]), .B(string_cp_char[3]), .Y(n36) );
  XNOR2X1 U21 ( .A(pattern_cp_char[7]), .B(string_cp_char[7]), .Y(n32) );
  XNOR2X1 U22 ( .A(pattern_cp_char[2]), .B(string_cp_char[2]), .Y(n35) );
  XNOR2X1 U23 ( .A(pattern_cp_char[1]), .B(string_cp_char[1]), .Y(n34) );
  XNOR2X1 U24 ( .A(pattern_cp_char[0]), .B(string_cp_char[0]), .Y(n33) );
  NAND4X1 U25 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n16) );
  XNOR2X1 U26 ( .A(pattern_cp_char[5]), .B(string_cp_char[5]), .Y(n30) );
  XNOR2X1 U27 ( .A(pattern_cp_char[4]), .B(string_cp_char[4]), .Y(n29) );
  XNOR2X1 U28 ( .A(pattern_cp_char[6]), .B(string_cp_char[6]), .Y(n31) );
  CLKINVX1 U29 ( .A(pattern_cp_char[1]), .Y(n3) );
  CLKINVX1 U30 ( .A(pattern_cp_char[3]), .Y(n4) );
  CLKINVX1 U31 ( .A(n14), .Y(n1) );
  OAI211X1 U32 ( .A0(n15), .A1(n16), .B0(n17), .C0(n18), .Y(n14) );
  NAND2BX1 U33 ( .AN(next_state[0]), .B(next_state[1]), .Y(n18) );
  NAND4X1 U34 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NAND2X1 U35 ( .A(n1), .B(n11), .Y(result) );
endmodule


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   N329, N330, N331, n1855, n1856, n1857, n1858, n1859, n1860,
         recnt_flag, tmp_result, star, N344, N345, N354, N355, N356, N357,
         N358, N359, N360, N362, \patterns[7][7] , \patterns[7][6] ,
         \patterns[7][5] , \patterns[7][4] , \patterns[7][3] ,
         \patterns[7][2] , \patterns[7][1] , \patterns[7][0] ,
         \patterns[6][7] , \patterns[6][6] , \patterns[6][5] ,
         \patterns[6][4] , \patterns[6][3] , \patterns[6][2] ,
         \patterns[6][1] , \patterns[6][0] , \patterns[5][7] ,
         \patterns[5][6] , \patterns[5][5] , \patterns[5][4] ,
         \patterns[5][3] , \patterns[5][2] , \patterns[5][1] ,
         \patterns[5][0] , \patterns[4][7] , \patterns[4][6] ,
         \patterns[4][5] , \patterns[4][4] , \patterns[4][3] ,
         \patterns[4][2] , \patterns[4][1] , \patterns[4][0] ,
         \patterns[3][7] , \patterns[3][6] , \patterns[3][5] ,
         \patterns[3][4] , \patterns[3][3] , \patterns[3][2] ,
         \patterns[3][1] , \patterns[3][0] , \patterns[2][7] ,
         \patterns[2][6] , \patterns[2][5] , \patterns[2][4] ,
         \patterns[2][3] , \patterns[2][2] , \patterns[2][1] ,
         \patterns[2][0] , \patterns[1][7] , \patterns[1][6] ,
         \patterns[1][5] , \patterns[1][4] , \patterns[1][3] ,
         \patterns[1][2] , \patterns[1][1] , \patterns[1][0] ,
         \patterns[0][7] , \patterns[0][6] , \patterns[0][5] ,
         \patterns[0][4] , \patterns[0][3] , \patterns[0][2] ,
         \patterns[0][1] , \patterns[0][0] , N411, N412, N413, N414, N415,
         N416, N417, N418, match_done, N427, N428, N429, N473, N474, N475,
         N476, N477, N494, N496, N1556, n145, n146, n147, n149, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n521, n523, n524, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n827, n828, n829, n833, n834, n835,
         n836, n837, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n857, n858, n859, n861,
         n863, n865, n866, n867, n868, n869, n870, n871, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n899, n901,
         n902, n903, n904, n905, n906, n908, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         n939, n940, n941, n943, n946, n947, n948, n949, n950, n951, n952,
         n953, n955, n956, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n995, n996, n997, n999, n1002, n1003, n1004,
         n1005, n1006, n1007, n1009, n1011, n1013, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050,
         n1051, n1052, n1053, n1054, n1055, n1056, n1058, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1074, n1076,
         n1078, n1080, n1082, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1137, n1138, n1139, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193,
         n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203,
         n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213,
         n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223,
         n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233,
         n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243,
         n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363,
         n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373,
         n1374, n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383,
         n1384, n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393,
         n1394, n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403,
         n1404, n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413,
         n1414, n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423,
         n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433,
         n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443,
         n1444, n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453,
         n1454, n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463,
         n1464, n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473,
         n1474, n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483,
         n1484, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493,
         n1494, n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503,
         n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513,
         n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523,
         n1524, n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533,
         n1534, n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543,
         n1544, n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553,
         n1554, n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563,
         n1564, n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573,
         n1574, n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1588, n1589,
         n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599,
         n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607, n1608, n1609,
         n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619,
         n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629,
         n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639,
         n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650,
         n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660,
         n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670,
         n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680,
         n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690,
         n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700,
         n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710,
         n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720,
         n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730,
         n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740,
         n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750,
         n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760,
         n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770,
         n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780,
         n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790,
         n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800,
         n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810,
         n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820,
         n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830,
         n1831, n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840,
         n1841, n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850,
         n1851, n1852, n1853, n1854;
  wire   [4:0] cnt_num;
  wire   [1:0] next_state;
  wire   [7:0] string_cp_char;
  wire   [7:0] pattern_cp_char;
  wire   [1:0] current_state;
  wire   [4:0] start_cp_bit;
  wire   [4:0] strings_num;
  wire   [2:0] patterns_num;
  wire   [1:0] isStrPat;
  wire   [4:1] \add_248/carry ;
  wire   [4:2] \r558/carry ;
  wire   [5:1] \add_185_2/carry ;
  wire   [5:0] \sub_255/carry ;

  Counter32 GET ( .clk(clk), .reset(reset), .recount_counter32(recnt_flag), 
        .count_out(cnt_num), .isstring(isstring), .ispattern(ispattern) );
  Compare CP ( .next_state(next_state), .string_cp_char(string_cp_char), 
        .pattern_cp_char(pattern_cp_char), .result(tmp_result), .star(star) );
  TLATX1 recnt_flag_reg ( .G(N354), .D(N355), .Q(recnt_flag) );
  TLATX1 \next_state_reg[0]  ( .G(N354), .D(N344), .Q(next_state[0]), .QN(n147) );
  TLATX1 \next_state_reg[1]  ( .G(N354), .D(N345), .Q(next_state[1]), .QN(n146) );
  DFFRX1 match_done_reg ( .D(n1574), .CK(clk), .RN(n1692), .Q(match_done), 
        .QN(n491) );
  DFFRX1 \isStrPat_reg[0]  ( .D(n1566), .CK(clk), .RN(n1692), .Q(isStrPat[0]), 
        .QN(n489) );
  DFFRX1 \isStrPat_reg[1]  ( .D(n1567), .CK(clk), .RN(n1692), .Q(isStrPat[1]), 
        .QN(n488) );
  EDFFX1 \strings_num_reg[0]  ( .D(cnt_num[0]), .E(n1580), .CK(clk), .Q(
        strings_num[0]) );
  EDFFX1 \strings_num_reg[1]  ( .D(cnt_num[1]), .E(n1580), .CK(clk), .Q(
        strings_num[1]) );
  EDFFX1 \strings_num_reg[2]  ( .D(cnt_num[2]), .E(n1580), .CK(clk), .Q(
        strings_num[2]) );
  EDFFX1 \strings_num_reg[3]  ( .D(cnt_num[3]), .E(n1580), .CK(clk), .Q(
        strings_num[3]) );
  EDFFX1 \strings_num_reg[4]  ( .D(cnt_num[4]), .E(n1580), .CK(clk), .Q(
        strings_num[4]) );
  DFFSX1 \strings_reg[31][7]  ( .D(n1310), .CK(clk), .SN(n1703), .QN(n232) );
  DFFSX1 \strings_reg[31][6]  ( .D(n1311), .CK(clk), .SN(n1703), .QN(n233) );
  DFFSX1 \strings_reg[31][5]  ( .D(n1312), .CK(clk), .SN(n1702), .QN(n234) );
  DFFSX1 \strings_reg[31][4]  ( .D(n1313), .CK(clk), .SN(n1702), .QN(n235) );
  DFFSX1 \strings_reg[31][2]  ( .D(n1315), .CK(clk), .SN(n1702), .QN(n237) );
  DFFSX1 \strings_reg[31][1]  ( .D(n1316), .CK(clk), .SN(n1702), .QN(n238) );
  DFFSX1 \strings_reg[31][0]  ( .D(n1317), .CK(clk), .SN(n1702), .QN(n239) );
  DFFSX1 \strings_reg[30][7]  ( .D(n1318), .CK(clk), .SN(n1702), .QN(n240) );
  DFFSX1 \strings_reg[30][6]  ( .D(n1319), .CK(clk), .SN(n1702), .QN(n241) );
  DFFSX1 \strings_reg[30][5]  ( .D(n1320), .CK(clk), .SN(n1702), .QN(n242) );
  DFFSX1 \strings_reg[30][4]  ( .D(n1321), .CK(clk), .SN(n1702), .QN(n243) );
  DFFSX1 \strings_reg[30][2]  ( .D(n1323), .CK(clk), .SN(n1702), .QN(n245) );
  DFFSX1 \strings_reg[30][1]  ( .D(n1324), .CK(clk), .SN(n1702), .QN(n246) );
  DFFSX1 \strings_reg[30][0]  ( .D(n1325), .CK(clk), .SN(n1702), .QN(n247) );
  DFFSX1 \strings_reg[29][7]  ( .D(n1326), .CK(clk), .SN(n1702), .QN(n248) );
  DFFSX1 \strings_reg[29][6]  ( .D(n1327), .CK(clk), .SN(n1702), .QN(n249) );
  DFFSX1 \strings_reg[29][5]  ( .D(n1328), .CK(clk), .SN(n1701), .QN(n250) );
  DFFSX1 \strings_reg[29][4]  ( .D(n1329), .CK(clk), .SN(n1701), .QN(n251) );
  DFFSX1 \strings_reg[29][3]  ( .D(n1330), .CK(clk), .SN(n1701), .QN(n252) );
  DFFSX1 \strings_reg[29][2]  ( .D(n1331), .CK(clk), .SN(n1701), .QN(n253) );
  DFFSX1 \strings_reg[29][1]  ( .D(n1332), .CK(clk), .SN(n1701), .QN(n254) );
  DFFSX1 \strings_reg[29][0]  ( .D(n1333), .CK(clk), .SN(n1701), .QN(n255) );
  DFFSX1 \strings_reg[28][7]  ( .D(n1334), .CK(clk), .SN(n1701), .QN(n256) );
  DFFSX1 \strings_reg[28][6]  ( .D(n1335), .CK(clk), .SN(n1701), .QN(n257) );
  DFFSX1 \strings_reg[28][5]  ( .D(n1336), .CK(clk), .SN(n1701), .QN(n258) );
  DFFSX1 \strings_reg[28][4]  ( .D(n1337), .CK(clk), .SN(n1701), .QN(n259) );
  DFFSX1 \strings_reg[28][3]  ( .D(n1338), .CK(clk), .SN(n1701), .QN(n260) );
  DFFSX1 \strings_reg[28][2]  ( .D(n1339), .CK(clk), .SN(n1701), .QN(n261) );
  DFFSX1 \strings_reg[28][1]  ( .D(n1340), .CK(clk), .SN(n1701), .QN(n262) );
  DFFSX1 \strings_reg[28][0]  ( .D(n1341), .CK(clk), .SN(n1701), .QN(n263) );
  DFFSX1 \strings_reg[26][7]  ( .D(n1350), .CK(clk), .SN(n1700), .QN(n272) );
  DFFSX1 \strings_reg[26][6]  ( .D(n1351), .CK(clk), .SN(n1700), .QN(n273) );
  DFFSX1 \strings_reg[26][5]  ( .D(n1352), .CK(clk), .SN(n1700), .QN(n274) );
  DFFSX1 \strings_reg[26][4]  ( .D(n1353), .CK(clk), .SN(n1700), .QN(n275) );
  DFFSX1 \strings_reg[26][3]  ( .D(n1354), .CK(clk), .SN(n1700), .QN(n276) );
  DFFSX1 \strings_reg[26][2]  ( .D(n1355), .CK(clk), .SN(n1700), .QN(n277) );
  DFFSX1 \strings_reg[26][1]  ( .D(n1356), .CK(clk), .SN(n1700), .QN(n278) );
  DFFSX1 \strings_reg[26][0]  ( .D(n1357), .CK(clk), .SN(n1700), .QN(n279) );
  DFFSX1 \strings_reg[24][7]  ( .D(n1366), .CK(clk), .SN(n1699), .QN(n288) );
  DFFSX1 \strings_reg[24][6]  ( .D(n1367), .CK(clk), .SN(n1699), .QN(n289) );
  DFFSX1 \strings_reg[24][5]  ( .D(n1368), .CK(clk), .SN(n1699), .QN(n290) );
  DFFSX1 \strings_reg[24][4]  ( .D(n1369), .CK(clk), .SN(n1699), .QN(n291) );
  DFFSX1 \strings_reg[24][3]  ( .D(n1370), .CK(clk), .SN(n1699), .QN(n292) );
  DFFSX1 \strings_reg[24][2]  ( .D(n1371), .CK(clk), .SN(n1699), .QN(n293) );
  DFFSX1 \strings_reg[24][1]  ( .D(n1372), .CK(clk), .SN(n1699), .QN(n294) );
  DFFSX1 \strings_reg[24][0]  ( .D(n1373), .CK(clk), .SN(n1699), .QN(n295) );
  DFFSX1 \strings_reg[22][7]  ( .D(n1382), .CK(clk), .SN(n1698), .QN(n304) );
  DFFSX1 \strings_reg[22][6]  ( .D(n1383), .CK(clk), .SN(n1703), .QN(n305) );
  DFFSX1 \strings_reg[22][5]  ( .D(n1384), .CK(clk), .SN(n1698), .QN(n306) );
  DFFSX1 \strings_reg[22][4]  ( .D(n1385), .CK(clk), .SN(n1698), .QN(n307) );
  DFFSX1 \strings_reg[22][3]  ( .D(n1386), .CK(clk), .SN(n1698), .QN(n308) );
  DFFSX1 \strings_reg[22][2]  ( .D(n1387), .CK(clk), .SN(n1698), .QN(n309) );
  DFFSX1 \strings_reg[22][1]  ( .D(n1388), .CK(clk), .SN(n1698), .QN(n310) );
  DFFSX1 \strings_reg[22][0]  ( .D(n1389), .CK(clk), .SN(n1698), .QN(n311) );
  DFFSX1 \strings_reg[20][7]  ( .D(n1398), .CK(clk), .SN(n1697), .QN(n320) );
  DFFSX1 \strings_reg[20][6]  ( .D(n1399), .CK(clk), .SN(n1697), .QN(n321) );
  DFFSX1 \strings_reg[20][5]  ( .D(n1400), .CK(clk), .SN(n1697), .QN(n322) );
  DFFSX1 \strings_reg[20][4]  ( .D(n1401), .CK(clk), .SN(n1697), .QN(n323) );
  DFFSX1 \strings_reg[20][3]  ( .D(n1402), .CK(clk), .SN(n1697), .QN(n324) );
  DFFSX1 \strings_reg[20][2]  ( .D(n1403), .CK(clk), .SN(n1697), .QN(n325) );
  DFFSX1 \strings_reg[20][1]  ( .D(n1404), .CK(clk), .SN(n1697), .QN(n326) );
  DFFSX1 \strings_reg[20][0]  ( .D(n1405), .CK(clk), .SN(n1697), .QN(n327) );
  DFFSX1 \strings_reg[18][7]  ( .D(n1414), .CK(clk), .SN(n1696), .QN(n336) );
  DFFSX1 \strings_reg[18][6]  ( .D(n1415), .CK(clk), .SN(n1696), .QN(n337) );
  DFFSX1 \strings_reg[18][5]  ( .D(n1416), .CK(clk), .SN(n1696), .QN(n338) );
  DFFSX1 \strings_reg[18][4]  ( .D(n1417), .CK(clk), .SN(n1696), .QN(n339) );
  DFFSX1 \strings_reg[18][3]  ( .D(n1418), .CK(clk), .SN(n1696), .QN(n340) );
  DFFSX1 \strings_reg[18][2]  ( .D(n1419), .CK(clk), .SN(n1696), .QN(n341) );
  DFFSX1 \strings_reg[18][1]  ( .D(n1420), .CK(clk), .SN(n1695), .QN(n342) );
  DFFSX1 \strings_reg[18][0]  ( .D(n1421), .CK(clk), .SN(n1695), .QN(n343) );
  DFFSX1 \strings_reg[16][7]  ( .D(n1430), .CK(clk), .SN(n1695), .QN(n352) );
  DFFSX1 \strings_reg[16][6]  ( .D(n1431), .CK(clk), .SN(n1695), .QN(n353) );
  DFFSX1 \strings_reg[16][5]  ( .D(n1432), .CK(clk), .SN(n1695), .QN(n354) );
  DFFSX1 \strings_reg[16][4]  ( .D(n1433), .CK(clk), .SN(n1696), .QN(n355) );
  DFFSX1 \strings_reg[16][3]  ( .D(n1434), .CK(clk), .SN(n1695), .QN(n356) );
  DFFSX1 \strings_reg[16][2]  ( .D(n1435), .CK(clk), .SN(n1695), .QN(n357) );
  DFFSX1 \strings_reg[16][1]  ( .D(n1436), .CK(clk), .SN(n1694), .QN(n358) );
  DFFSX1 \strings_reg[16][0]  ( .D(n1437), .CK(clk), .SN(n1695), .QN(n359) );
  DFFSX1 \strings_reg[14][7]  ( .D(n1446), .CK(clk), .SN(n1694), .QN(n368) );
  DFFSX1 \strings_reg[14][6]  ( .D(n1447), .CK(clk), .SN(n1694), .QN(n369) );
  DFFSX1 \strings_reg[14][5]  ( .D(n1448), .CK(clk), .SN(n1694), .QN(n370) );
  DFFSX1 \strings_reg[14][4]  ( .D(n1449), .CK(clk), .SN(n1694), .QN(n371) );
  DFFSX1 \strings_reg[14][3]  ( .D(n1450), .CK(clk), .SN(n1694), .QN(n372) );
  DFFSX1 \strings_reg[14][2]  ( .D(n1451), .CK(clk), .SN(n1694), .QN(n373) );
  DFFSX1 \strings_reg[14][1]  ( .D(n1452), .CK(clk), .SN(n1694), .QN(n374) );
  DFFSX1 \strings_reg[14][0]  ( .D(n1453), .CK(clk), .SN(n1693), .QN(n375) );
  DFFSX1 \strings_reg[12][7]  ( .D(n1462), .CK(clk), .SN(n1693), .QN(n384) );
  DFFSX1 \strings_reg[12][6]  ( .D(n1463), .CK(clk), .SN(n1693), .QN(n385) );
  DFFSX1 \strings_reg[12][5]  ( .D(n1464), .CK(clk), .SN(n1698), .QN(n386) );
  DFFSX1 \strings_reg[12][4]  ( .D(n1465), .CK(clk), .SN(n1713), .QN(n387) );
  DFFSX1 \strings_reg[12][3]  ( .D(n1466), .CK(clk), .SN(n1713), .QN(n388) );
  DFFSX1 \strings_reg[12][2]  ( .D(n1467), .CK(clk), .SN(n1713), .QN(n389) );
  DFFSX1 \strings_reg[12][1]  ( .D(n1468), .CK(clk), .SN(n1713), .QN(n390) );
  DFFSX1 \strings_reg[12][0]  ( .D(n1469), .CK(clk), .SN(n1713), .QN(n391) );
  DFFSX1 \strings_reg[10][7]  ( .D(n1478), .CK(clk), .SN(n1712), .QN(n400) );
  DFFSX1 \strings_reg[10][6]  ( .D(n1479), .CK(clk), .SN(n1712), .QN(n401) );
  DFFSX1 \strings_reg[10][5]  ( .D(n1480), .CK(clk), .SN(n1712), .QN(n402) );
  DFFSX1 \strings_reg[10][4]  ( .D(n1481), .CK(clk), .SN(n1712), .QN(n403) );
  DFFSX1 \strings_reg[10][3]  ( .D(n1482), .CK(clk), .SN(n1712), .QN(n404) );
  DFFSX1 \strings_reg[10][2]  ( .D(n1483), .CK(clk), .SN(n1712), .QN(n405) );
  DFFSX1 \strings_reg[10][1]  ( .D(n1484), .CK(clk), .SN(n1712), .QN(n406) );
  DFFSX1 \strings_reg[10][0]  ( .D(n1485), .CK(clk), .SN(n1712), .QN(n407) );
  DFFSX1 \strings_reg[8][7]  ( .D(n1494), .CK(clk), .SN(n1711), .QN(n416) );
  DFFSX1 \strings_reg[8][6]  ( .D(n1495), .CK(clk), .SN(n1711), .QN(n417) );
  DFFSX1 \strings_reg[8][5]  ( .D(n1496), .CK(clk), .SN(n1711), .QN(n418) );
  DFFSX1 \strings_reg[8][4]  ( .D(n1497), .CK(clk), .SN(n1711), .QN(n419) );
  DFFSX1 \strings_reg[8][3]  ( .D(n1498), .CK(clk), .SN(n1711), .QN(n420) );
  DFFSX1 \strings_reg[8][2]  ( .D(n1499), .CK(clk), .SN(n1711), .QN(n421) );
  DFFSX1 \strings_reg[8][1]  ( .D(n1500), .CK(clk), .SN(n1711), .QN(n422) );
  DFFSX1 \strings_reg[8][0]  ( .D(n1501), .CK(clk), .SN(n1711), .QN(n423) );
  DFFSX1 \strings_reg[6][7]  ( .D(n1510), .CK(clk), .SN(n1710), .QN(n432) );
  DFFSX1 \strings_reg[6][6]  ( .D(n1511), .CK(clk), .SN(n1710), .QN(n433) );
  DFFSX1 \strings_reg[6][5]  ( .D(n1512), .CK(clk), .SN(n1710), .QN(n434) );
  DFFSX1 \strings_reg[6][4]  ( .D(n1513), .CK(clk), .SN(n1710), .QN(n435) );
  DFFSX1 \strings_reg[6][3]  ( .D(n1514), .CK(clk), .SN(n1710), .QN(n436) );
  DFFSX1 \strings_reg[6][2]  ( .D(n1515), .CK(clk), .SN(n1710), .QN(n437) );
  DFFSX1 \strings_reg[6][1]  ( .D(n1516), .CK(clk), .SN(n1710), .QN(n438) );
  DFFSX1 \strings_reg[6][0]  ( .D(n1517), .CK(clk), .SN(n1710), .QN(n439) );
  DFFSX1 \strings_reg[4][7]  ( .D(n1526), .CK(clk), .SN(n1709), .QN(n448) );
  DFFSX1 \strings_reg[4][6]  ( .D(n1527), .CK(clk), .SN(n1709), .QN(n449) );
  DFFSX1 \strings_reg[4][5]  ( .D(n1528), .CK(clk), .SN(n1709), .QN(n450) );
  DFFSX1 \strings_reg[4][4]  ( .D(n1529), .CK(clk), .SN(n1709), .QN(n451) );
  DFFSX1 \strings_reg[4][3]  ( .D(n1530), .CK(clk), .SN(n1709), .QN(n452) );
  DFFSX1 \strings_reg[4][2]  ( .D(n1531), .CK(clk), .SN(n1709), .QN(n453) );
  DFFSX1 \strings_reg[4][1]  ( .D(n1532), .CK(clk), .SN(n1709), .QN(n454) );
  DFFSX1 \strings_reg[4][0]  ( .D(n1533), .CK(clk), .SN(n1709), .QN(n455) );
  DFFSX1 \strings_reg[2][7]  ( .D(n1542), .CK(clk), .SN(n1708), .QN(n464) );
  DFFSX1 \strings_reg[2][6]  ( .D(n1543), .CK(clk), .SN(n1708), .QN(n465) );
  DFFSX1 \strings_reg[2][5]  ( .D(n1544), .CK(clk), .SN(n1708), .QN(n466) );
  DFFSX1 \strings_reg[2][4]  ( .D(n1545), .CK(clk), .SN(n1708), .QN(n467) );
  DFFSX1 \strings_reg[2][3]  ( .D(n1546), .CK(clk), .SN(n1708), .QN(n468) );
  DFFSX1 \strings_reg[2][2]  ( .D(n1547), .CK(clk), .SN(n1708), .QN(n469) );
  DFFSX1 \strings_reg[2][1]  ( .D(n1548), .CK(clk), .SN(n1708), .QN(n470) );
  DFFSX1 \strings_reg[2][0]  ( .D(n1549), .CK(clk), .SN(n1708), .QN(n471) );
  DFFSX1 \strings_reg[27][7]  ( .D(n1342), .CK(clk), .SN(n1701), .QN(n264) );
  DFFSX1 \strings_reg[27][6]  ( .D(n1343), .CK(clk), .SN(n1701), .QN(n265) );
  DFFSX1 \strings_reg[27][5]  ( .D(n1344), .CK(clk), .SN(n1700), .QN(n266) );
  DFFSX1 \strings_reg[27][4]  ( .D(n1345), .CK(clk), .SN(n1700), .QN(n267) );
  DFFSX1 \strings_reg[27][3]  ( .D(n1346), .CK(clk), .SN(n1700), .QN(n268) );
  DFFSX1 \strings_reg[27][2]  ( .D(n1347), .CK(clk), .SN(n1700), .QN(n269) );
  DFFSX1 \strings_reg[27][1]  ( .D(n1348), .CK(clk), .SN(n1700), .QN(n270) );
  DFFSX1 \strings_reg[27][0]  ( .D(n1349), .CK(clk), .SN(n1700), .QN(n271) );
  DFFSX1 \strings_reg[25][7]  ( .D(n1358), .CK(clk), .SN(n1700), .QN(n280) );
  DFFSX1 \strings_reg[25][6]  ( .D(n1359), .CK(clk), .SN(n1700), .QN(n281) );
  DFFSX1 \strings_reg[25][5]  ( .D(n1360), .CK(clk), .SN(n1699), .QN(n282) );
  DFFSX1 \strings_reg[25][4]  ( .D(n1361), .CK(clk), .SN(n1699), .QN(n283) );
  DFFSX1 \strings_reg[25][3]  ( .D(n1362), .CK(clk), .SN(n1699), .QN(n284) );
  DFFSX1 \strings_reg[25][2]  ( .D(n1363), .CK(clk), .SN(n1699), .QN(n285) );
  DFFSX1 \strings_reg[25][1]  ( .D(n1364), .CK(clk), .SN(n1699), .QN(n286) );
  DFFSX1 \strings_reg[25][0]  ( .D(n1365), .CK(clk), .SN(n1699), .QN(n287) );
  DFFSX1 \strings_reg[23][7]  ( .D(n1374), .CK(clk), .SN(n1699), .QN(n296) );
  DFFSX1 \strings_reg[23][6]  ( .D(n1375), .CK(clk), .SN(n1699), .QN(n297) );
  DFFSX1 \strings_reg[23][5]  ( .D(n1376), .CK(clk), .SN(n1698), .QN(n298) );
  DFFSX1 \strings_reg[23][4]  ( .D(n1377), .CK(clk), .SN(n1698), .QN(n299) );
  DFFSX1 \strings_reg[23][3]  ( .D(n1378), .CK(clk), .SN(n1698), .QN(n300) );
  DFFSX1 \strings_reg[23][2]  ( .D(n1379), .CK(clk), .SN(n1698), .QN(n301) );
  DFFSX1 \strings_reg[23][1]  ( .D(n1380), .CK(clk), .SN(n1698), .QN(n302) );
  DFFSX1 \strings_reg[23][0]  ( .D(n1381), .CK(clk), .SN(n1698), .QN(n303) );
  DFFSX1 \strings_reg[21][7]  ( .D(n1390), .CK(clk), .SN(n1698), .QN(n312) );
  DFFSX1 \strings_reg[21][6]  ( .D(n1391), .CK(clk), .SN(n1697), .QN(n313) );
  DFFSX1 \strings_reg[21][5]  ( .D(n1392), .CK(clk), .SN(n1697), .QN(n314) );
  DFFSX1 \strings_reg[21][4]  ( .D(n1393), .CK(clk), .SN(n1698), .QN(n315) );
  DFFSX1 \strings_reg[21][3]  ( .D(n1394), .CK(clk), .SN(n1697), .QN(n316) );
  DFFSX1 \strings_reg[21][2]  ( .D(n1395), .CK(clk), .SN(n1697), .QN(n317) );
  DFFSX1 \strings_reg[21][1]  ( .D(n1396), .CK(clk), .SN(n1697), .QN(n318) );
  DFFSX1 \strings_reg[21][0]  ( .D(n1397), .CK(clk), .SN(n1697), .QN(n319) );
  DFFSX1 \strings_reg[19][7]  ( .D(n1406), .CK(clk), .SN(n1697), .QN(n328) );
  DFFSX1 \strings_reg[19][6]  ( .D(n1407), .CK(clk), .SN(n1696), .QN(n329) );
  DFFSX1 \strings_reg[19][5]  ( .D(n1408), .CK(clk), .SN(n1697), .QN(n330) );
  DFFSX1 \strings_reg[19][4]  ( .D(n1409), .CK(clk), .SN(n1696), .QN(n331) );
  DFFSX1 \strings_reg[19][3]  ( .D(n1410), .CK(clk), .SN(n1696), .QN(n332) );
  DFFSX1 \strings_reg[19][2]  ( .D(n1411), .CK(clk), .SN(n1696), .QN(n333) );
  DFFSX1 \strings_reg[19][1]  ( .D(n1412), .CK(clk), .SN(n1696), .QN(n334) );
  DFFSX1 \strings_reg[19][0]  ( .D(n1413), .CK(clk), .SN(n1696), .QN(n335) );
  DFFSX1 \strings_reg[17][7]  ( .D(n1422), .CK(clk), .SN(n1696), .QN(n344) );
  DFFSX1 \strings_reg[17][6]  ( .D(n1423), .CK(clk), .SN(n1695), .QN(n345) );
  DFFSX1 \strings_reg[17][5]  ( .D(n1424), .CK(clk), .SN(n1695), .QN(n346) );
  DFFSX1 \strings_reg[17][4]  ( .D(n1425), .CK(clk), .SN(n1696), .QN(n347) );
  DFFSX1 \strings_reg[17][3]  ( .D(n1426), .CK(clk), .SN(n1695), .QN(n348) );
  DFFSX1 \strings_reg[17][2]  ( .D(n1427), .CK(clk), .SN(n1695), .QN(n349) );
  DFFSX1 \strings_reg[17][1]  ( .D(n1428), .CK(clk), .SN(n1696), .QN(n350) );
  DFFSX1 \strings_reg[17][0]  ( .D(n1429), .CK(clk), .SN(n1695), .QN(n351) );
  DFFSX1 \strings_reg[15][7]  ( .D(n1438), .CK(clk), .SN(n1694), .QN(n360) );
  DFFSX1 \strings_reg[15][6]  ( .D(n1439), .CK(clk), .SN(n1694), .QN(n361) );
  DFFSX1 \strings_reg[15][5]  ( .D(n1440), .CK(clk), .SN(n1695), .QN(n362) );
  DFFSX1 \strings_reg[15][4]  ( .D(n1441), .CK(clk), .SN(n1695), .QN(n363) );
  DFFSX1 \strings_reg[15][3]  ( .D(n1442), .CK(clk), .SN(n1694), .QN(n364) );
  DFFSX1 \strings_reg[15][2]  ( .D(n1443), .CK(clk), .SN(n1695), .QN(n365) );
  DFFSX1 \strings_reg[15][1]  ( .D(n1444), .CK(clk), .SN(n1694), .QN(n366) );
  DFFSX1 \strings_reg[15][0]  ( .D(n1445), .CK(clk), .SN(n1694), .QN(n367) );
  DFFSX1 \strings_reg[13][7]  ( .D(n1454), .CK(clk), .SN(n1693), .QN(n376) );
  DFFSX1 \strings_reg[13][6]  ( .D(n1455), .CK(clk), .SN(n1694), .QN(n377) );
  DFFSX1 \strings_reg[13][5]  ( .D(n1456), .CK(clk), .SN(n1693), .QN(n378) );
  DFFSX1 \strings_reg[13][4]  ( .D(n1457), .CK(clk), .SN(n1694), .QN(n379) );
  DFFSX1 \strings_reg[13][3]  ( .D(n1458), .CK(clk), .SN(n1694), .QN(n380) );
  DFFSX1 \strings_reg[13][2]  ( .D(n1459), .CK(clk), .SN(n1693), .QN(n381) );
  DFFSX1 \strings_reg[13][1]  ( .D(n1460), .CK(clk), .SN(n1693), .QN(n382) );
  DFFSX1 \strings_reg[13][0]  ( .D(n1461), .CK(clk), .SN(n1693), .QN(n383) );
  DFFSX1 \strings_reg[11][7]  ( .D(n1470), .CK(clk), .SN(n1713), .QN(n392) );
  DFFSX1 \strings_reg[11][6]  ( .D(n1471), .CK(clk), .SN(n1713), .QN(n393) );
  DFFSX1 \strings_reg[11][5]  ( .D(n1472), .CK(clk), .SN(n1713), .QN(n394) );
  DFFSX1 \strings_reg[11][4]  ( .D(n1473), .CK(clk), .SN(n1712), .QN(n395) );
  DFFSX1 \strings_reg[11][3]  ( .D(n1474), .CK(clk), .SN(n1712), .QN(n396) );
  DFFSX1 \strings_reg[11][2]  ( .D(n1475), .CK(clk), .SN(n1712), .QN(n397) );
  DFFSX1 \strings_reg[11][1]  ( .D(n1476), .CK(clk), .SN(n1712), .QN(n398) );
  DFFSX1 \strings_reg[11][0]  ( .D(n1477), .CK(clk), .SN(n1712), .QN(n399) );
  DFFSX1 \strings_reg[9][7]  ( .D(n1486), .CK(clk), .SN(n1712), .QN(n408) );
  DFFSX1 \strings_reg[9][6]  ( .D(n1487), .CK(clk), .SN(n1712), .QN(n409) );
  DFFSX1 \strings_reg[9][5]  ( .D(n1488), .CK(clk), .SN(n1712), .QN(n410) );
  DFFSX1 \strings_reg[9][4]  ( .D(n1489), .CK(clk), .SN(n1711), .QN(n411) );
  DFFSX1 \strings_reg[9][3]  ( .D(n1490), .CK(clk), .SN(n1711), .QN(n412) );
  DFFSX1 \strings_reg[9][2]  ( .D(n1491), .CK(clk), .SN(n1711), .QN(n413) );
  DFFSX1 \strings_reg[9][1]  ( .D(n1492), .CK(clk), .SN(n1711), .QN(n414) );
  DFFSX1 \strings_reg[9][0]  ( .D(n1493), .CK(clk), .SN(n1711), .QN(n415) );
  DFFSX1 \strings_reg[7][7]  ( .D(n1502), .CK(clk), .SN(n1711), .QN(n424) );
  DFFSX1 \strings_reg[7][6]  ( .D(n1503), .CK(clk), .SN(n1711), .QN(n425) );
  DFFSX1 \strings_reg[7][5]  ( .D(n1504), .CK(clk), .SN(n1711), .QN(n426) );
  DFFSX1 \strings_reg[7][4]  ( .D(n1505), .CK(clk), .SN(n1710), .QN(n427) );
  DFFSX1 \strings_reg[7][3]  ( .D(n1506), .CK(clk), .SN(n1710), .QN(n428) );
  DFFSX1 \strings_reg[7][2]  ( .D(n1507), .CK(clk), .SN(n1710), .QN(n429) );
  DFFSX1 \strings_reg[7][1]  ( .D(n1508), .CK(clk), .SN(n1710), .QN(n430) );
  DFFSX1 \strings_reg[7][0]  ( .D(n1509), .CK(clk), .SN(n1710), .QN(n431) );
  DFFSX1 \strings_reg[5][7]  ( .D(n1518), .CK(clk), .SN(n1710), .QN(n440) );
  DFFSX1 \strings_reg[5][6]  ( .D(n1519), .CK(clk), .SN(n1710), .QN(n441) );
  DFFSX1 \strings_reg[5][5]  ( .D(n1520), .CK(clk), .SN(n1710), .QN(n442) );
  DFFSX1 \strings_reg[5][4]  ( .D(n1521), .CK(clk), .SN(n1709), .QN(n443) );
  DFFSX1 \strings_reg[5][3]  ( .D(n1522), .CK(clk), .SN(n1709), .QN(n444) );
  DFFSX1 \strings_reg[5][2]  ( .D(n1523), .CK(clk), .SN(n1709), .QN(n445) );
  DFFSX1 \strings_reg[5][1]  ( .D(n1524), .CK(clk), .SN(n1709), .QN(n446) );
  DFFSX1 \strings_reg[5][0]  ( .D(n1525), .CK(clk), .SN(n1709), .QN(n447) );
  DFFSX1 \strings_reg[3][7]  ( .D(n1534), .CK(clk), .SN(n1709), .QN(n456) );
  DFFSX1 \strings_reg[3][6]  ( .D(n1535), .CK(clk), .SN(n1709), .QN(n457) );
  DFFSX1 \strings_reg[3][5]  ( .D(n1536), .CK(clk), .SN(n1709), .QN(n458) );
  DFFSX1 \strings_reg[3][4]  ( .D(n1537), .CK(clk), .SN(n1708), .QN(n459) );
  DFFSX1 \strings_reg[3][3]  ( .D(n1538), .CK(clk), .SN(n1708), .QN(n460) );
  DFFSX1 \strings_reg[3][2]  ( .D(n1539), .CK(clk), .SN(n1708), .QN(n461) );
  DFFSX1 \strings_reg[3][1]  ( .D(n1540), .CK(clk), .SN(n1708), .QN(n462) );
  DFFSX1 \strings_reg[3][0]  ( .D(n1541), .CK(clk), .SN(n1708), .QN(n463) );
  DFFSX1 \strings_reg[1][7]  ( .D(n1550), .CK(clk), .SN(n1708), .QN(n472) );
  DFFSX1 \strings_reg[1][6]  ( .D(n1551), .CK(clk), .SN(n1708), .QN(n473) );
  DFFSX1 \strings_reg[1][5]  ( .D(n1552), .CK(clk), .SN(n1707), .QN(n474) );
  DFFSX1 \strings_reg[1][4]  ( .D(n1553), .CK(clk), .SN(n1707), .QN(n475) );
  DFFSX1 \strings_reg[1][3]  ( .D(n1554), .CK(clk), .SN(n1707), .QN(n476) );
  DFFSX1 \strings_reg[1][2]  ( .D(n1555), .CK(clk), .SN(n1707), .QN(n477) );
  DFFSX1 \strings_reg[1][1]  ( .D(n1556), .CK(clk), .SN(n1707), .QN(n478) );
  DFFSX1 \strings_reg[1][0]  ( .D(n1557), .CK(clk), .SN(n1707), .QN(n479) );
  DFFSX1 \strings_reg[0][7]  ( .D(n1558), .CK(clk), .SN(n1707), .QN(n480) );
  DFFSX1 \strings_reg[0][6]  ( .D(n1559), .CK(clk), .SN(n1707), .QN(n481) );
  DFFSX1 \strings_reg[0][5]  ( .D(n1560), .CK(clk), .SN(n1707), .QN(n482) );
  DFFSX1 \strings_reg[0][4]  ( .D(n1561), .CK(clk), .SN(n1707), .QN(n483) );
  DFFSX1 \strings_reg[0][3]  ( .D(n1562), .CK(clk), .SN(n1707), .QN(n484) );
  DFFSX1 \strings_reg[0][2]  ( .D(n1563), .CK(clk), .SN(n1707), .QN(n485) );
  DFFSX1 \strings_reg[0][1]  ( .D(n1564), .CK(clk), .SN(n1707), .QN(n486) );
  DFFSX1 \strings_reg[0][0]  ( .D(n1565), .CK(clk), .SN(n1707), .QN(n487) );
  DFFSX1 \patterns_reg[3][0]  ( .D(n1272), .CK(clk), .SN(n1703), .Q(
        \patterns[3][0] ), .QN(n202) );
  DFFSX1 \patterns_reg[2][0]  ( .D(n1280), .CK(clk), .SN(n1703), .Q(
        \patterns[2][0] ), .QN(n210) );
  DFFSX1 \patterns_reg[3][1]  ( .D(n1273), .CK(clk), .SN(n1703), .Q(
        \patterns[3][1] ), .QN(n201) );
  DFFSX1 \patterns_reg[2][1]  ( .D(n1281), .CK(clk), .SN(n1704), .Q(
        \patterns[2][1] ), .QN(n209) );
  DFFSX1 \patterns_reg[3][2]  ( .D(n1274), .CK(clk), .SN(n1704), .Q(
        \patterns[3][2] ), .QN(n200) );
  DFFSX1 \patterns_reg[2][2]  ( .D(n1282), .CK(clk), .SN(n1704), .Q(
        \patterns[2][2] ), .QN(n208) );
  DFFSX1 \patterns_reg[3][3]  ( .D(n1275), .CK(clk), .SN(n1704), .Q(
        \patterns[3][3] ), .QN(n199) );
  DFFSX1 \patterns_reg[2][3]  ( .D(n1283), .CK(clk), .SN(n1705), .Q(
        \patterns[2][3] ), .QN(n207) );
  DFFSX1 \patterns_reg[3][4]  ( .D(n1276), .CK(clk), .SN(n1705), .Q(
        \patterns[3][4] ), .QN(n198) );
  DFFSX1 \patterns_reg[2][4]  ( .D(n1284), .CK(clk), .SN(n1705), .Q(
        \patterns[2][4] ), .QN(n206) );
  DFFSX1 \patterns_reg[3][5]  ( .D(n1277), .CK(clk), .SN(n1705), .Q(
        \patterns[3][5] ), .QN(n197) );
  DFFSX1 \patterns_reg[2][5]  ( .D(n1285), .CK(clk), .SN(n1706), .Q(
        \patterns[2][5] ), .QN(n205) );
  DFFSX1 \patterns_reg[3][6]  ( .D(n1278), .CK(clk), .SN(n1706), .Q(
        \patterns[3][6] ), .QN(n196) );
  DFFSX1 \patterns_reg[2][6]  ( .D(n1286), .CK(clk), .SN(n1706), .Q(
        \patterns[2][6] ), .QN(n204) );
  DFFSX1 \patterns_reg[3][7]  ( .D(n1279), .CK(clk), .SN(n1706), .Q(
        \patterns[3][7] ), .QN(n195) );
  DFFSX1 \patterns_reg[2][7]  ( .D(n1287), .CK(clk), .SN(n1707), .Q(
        \patterns[2][7] ), .QN(n203) );
  DFFSX1 \patterns_reg[1][0]  ( .D(n1288), .CK(clk), .SN(n1703), .Q(
        \patterns[1][0] ), .QN(n218) );
  DFFSX1 \patterns_reg[1][1]  ( .D(n1289), .CK(clk), .SN(n1704), .Q(
        \patterns[1][1] ), .QN(n217) );
  DFFSX1 \patterns_reg[1][2]  ( .D(n1290), .CK(clk), .SN(n1704), .Q(
        \patterns[1][2] ), .QN(n216) );
  DFFSX1 \patterns_reg[1][3]  ( .D(n1291), .CK(clk), .SN(n1705), .Q(
        \patterns[1][3] ), .QN(n215) );
  DFFSX1 \patterns_reg[1][4]  ( .D(n1292), .CK(clk), .SN(n1705), .Q(
        \patterns[1][4] ), .QN(n214) );
  DFFSX1 \patterns_reg[1][5]  ( .D(n1293), .CK(clk), .SN(n1706), .Q(
        \patterns[1][5] ), .QN(n213) );
  DFFSX1 \patterns_reg[1][6]  ( .D(n1294), .CK(clk), .SN(n1706), .Q(
        \patterns[1][6] ), .QN(n212) );
  DFFSX1 \patterns_reg[1][7]  ( .D(n1295), .CK(clk), .SN(n1707), .Q(
        \patterns[1][7] ), .QN(n211) );
  DFFSX1 \strings_reg[31][3]  ( .D(n1314), .CK(clk), .SN(n1702), .QN(n236) );
  DFFSX1 \strings_reg[30][3]  ( .D(n1322), .CK(clk), .SN(n1702), .QN(n244) );
  DFFRX1 \current_cp_bit_reg[2]  ( .D(n1577), .CK(clk), .RN(n1692), .Q(N331), 
        .QN(n521) );
  DFFRX1 \current_state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n1692), .Q(
        current_state[1]), .QN(n145) );
  DFFRX1 \star_index_reg[4]  ( .D(n1304), .CK(clk), .RN(n1693), .QN(n227) );
  DFFRX1 \star_index_reg[3]  ( .D(n1305), .CK(clk), .RN(n1692), .QN(n228) );
  DFFRX1 \star_index_reg[2]  ( .D(n1306), .CK(clk), .RN(n1693), .QN(n229) );
  DFFRX1 \star_index_reg[1]  ( .D(n1307), .CK(clk), .RN(n1693), .QN(n230) );
  DFFRX1 \star_index_reg[0]  ( .D(n1308), .CK(clk), .RN(n1692), .QN(n231) );
  DFFSX1 \patterns_reg[5][0]  ( .D(n1256), .CK(clk), .SN(n1703), .Q(
        \patterns[5][0] ), .QN(n186) );
  DFFSX1 \patterns_reg[4][0]  ( .D(n1264), .CK(clk), .SN(n1703), .Q(
        \patterns[4][0] ), .QN(n194) );
  DFFSX1 \patterns_reg[5][2]  ( .D(n1258), .CK(clk), .SN(n1704), .Q(
        \patterns[5][2] ), .QN(n184) );
  DFFSX1 \patterns_reg[4][2]  ( .D(n1266), .CK(clk), .SN(n1704), .Q(
        \patterns[4][2] ), .QN(n192) );
  DFFSX1 \patterns_reg[5][7]  ( .D(n1263), .CK(clk), .SN(n1706), .Q(
        \patterns[5][7] ), .QN(n179) );
  DFFSX1 \patterns_reg[4][7]  ( .D(n1271), .CK(clk), .SN(n1706), .Q(
        \patterns[4][7] ), .QN(n187) );
  DFFSX1 \patterns_reg[6][0]  ( .D(n1248), .CK(clk), .SN(n1703), .Q(
        \patterns[6][0] ), .QN(n178) );
  DFFSX1 \patterns_reg[6][2]  ( .D(n1250), .CK(clk), .SN(n1704), .Q(
        \patterns[6][2] ), .QN(n176) );
  DFFSX1 \patterns_reg[6][7]  ( .D(n1255), .CK(clk), .SN(n1706), .Q(
        \patterns[6][7] ), .QN(n171) );
  DFFSX1 \patterns_reg[7][0]  ( .D(n1241), .CK(clk), .SN(n1703), .Q(
        \patterns[7][0] ), .QN(n170) );
  DFFSX1 \patterns_reg[7][2]  ( .D(n1243), .CK(clk), .SN(n1704), .Q(
        \patterns[7][2] ), .QN(n168) );
  DFFSX1 \patterns_reg[7][7]  ( .D(n1576), .CK(clk), .SN(n1706), .Q(
        \patterns[7][7] ), .QN(n163) );
  DFFSX1 \patterns_reg[5][1]  ( .D(n1257), .CK(clk), .SN(n1703), .Q(
        \patterns[5][1] ), .QN(n185) );
  DFFSX1 \patterns_reg[4][1]  ( .D(n1265), .CK(clk), .SN(n1703), .Q(
        \patterns[4][1] ), .QN(n193) );
  DFFSX1 \patterns_reg[5][3]  ( .D(n1259), .CK(clk), .SN(n1704), .Q(
        \patterns[5][3] ), .QN(n183) );
  DFFSX1 \patterns_reg[4][3]  ( .D(n1267), .CK(clk), .SN(n1704), .Q(
        \patterns[4][3] ), .QN(n191) );
  DFFSX1 \patterns_reg[5][4]  ( .D(n1260), .CK(clk), .SN(n1705), .Q(
        \patterns[5][4] ), .QN(n182) );
  DFFSX1 \patterns_reg[4][4]  ( .D(n1268), .CK(clk), .SN(n1705), .Q(
        \patterns[4][4] ), .QN(n190) );
  DFFSX1 \patterns_reg[5][5]  ( .D(n1261), .CK(clk), .SN(n1705), .Q(
        \patterns[5][5] ), .QN(n181) );
  DFFSX1 \patterns_reg[4][5]  ( .D(n1269), .CK(clk), .SN(n1705), .Q(
        \patterns[4][5] ), .QN(n189) );
  DFFSX1 \patterns_reg[5][6]  ( .D(n1262), .CK(clk), .SN(n1706), .Q(
        \patterns[5][6] ), .QN(n180) );
  DFFSX1 \patterns_reg[4][6]  ( .D(n1270), .CK(clk), .SN(n1706), .Q(
        \patterns[4][6] ), .QN(n188) );
  DFFSX1 \patterns_reg[6][1]  ( .D(n1249), .CK(clk), .SN(n1703), .Q(
        \patterns[6][1] ), .QN(n177) );
  DFFSX1 \patterns_reg[6][3]  ( .D(n1251), .CK(clk), .SN(n1704), .Q(
        \patterns[6][3] ), .QN(n175) );
  DFFSX1 \patterns_reg[6][4]  ( .D(n1252), .CK(clk), .SN(n1705), .Q(
        \patterns[6][4] ), .QN(n174) );
  DFFSX1 \patterns_reg[6][5]  ( .D(n1253), .CK(clk), .SN(n1705), .Q(
        \patterns[6][5] ), .QN(n173) );
  DFFSX1 \patterns_reg[6][6]  ( .D(n1254), .CK(clk), .SN(n1706), .Q(
        \patterns[6][6] ), .QN(n172) );
  DFFSX1 \patterns_reg[7][1]  ( .D(n1242), .CK(clk), .SN(n1703), .Q(
        \patterns[7][1] ), .QN(n169) );
  DFFSX1 \patterns_reg[7][3]  ( .D(n1244), .CK(clk), .SN(n1704), .Q(
        \patterns[7][3] ), .QN(n167) );
  DFFSX1 \patterns_reg[7][4]  ( .D(n1245), .CK(clk), .SN(n1705), .Q(
        \patterns[7][4] ), .QN(n166) );
  DFFSX1 \patterns_reg[7][5]  ( .D(n1246), .CK(clk), .SN(n1705), .Q(
        \patterns[7][5] ), .QN(n165) );
  DFFSX1 \patterns_reg[7][6]  ( .D(n1247), .CK(clk), .SN(n1706), .Q(
        \patterns[7][6] ), .QN(n164) );
  DFFRX1 \current_cp_bit_reg[1]  ( .D(n1572), .CK(clk), .RN(n1692), .Q(N330), 
        .QN(n523) );
  DFFSX1 \patterns_reg[0][1]  ( .D(n1302), .CK(clk), .SN(n1703), .Q(
        \patterns[0][1] ), .QN(n225) );
  DFFSX1 \patterns_reg[0][2]  ( .D(n1301), .CK(clk), .SN(n1704), .Q(
        \patterns[0][2] ), .QN(n224) );
  DFFRX1 \start_cp_bit_reg[1]  ( .D(n1568), .CK(clk), .RN(n1692), .Q(
        start_cp_bit[1]), .QN(n161) );
  DFFRX1 \start_cp_bit_reg[2]  ( .D(n1569), .CK(clk), .RN(n1693), .Q(
        start_cp_bit[2]), .QN(n160) );
  DFFRX1 \start_cp_bit_reg[4]  ( .D(n1578), .CK(clk), .RN(n1692), .Q(
        start_cp_bit[4]), .QN(n149) );
  DFFRX1 \current_state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n1692), .Q(
        current_state[0]) );
  DFFRX1 \start_cp_bit_reg[3]  ( .D(n1570), .CK(clk), .RN(n1821), .Q(
        start_cp_bit[3]), .QN(n159) );
  DFFXL \patterns_num_reg[2]  ( .D(n1239), .CK(clk), .Q(patterns_num[2]), .QN(
        n1851) );
  DFFXL \patterns_num_reg[0]  ( .D(n1579), .CK(clk), .Q(patterns_num[0]), .QN(
        n1843) );
  DFFSX2 \patterns_reg[0][5]  ( .D(n1298), .CK(clk), .SN(n1821), .Q(
        \patterns[0][5] ), .QN(n221) );
  DFFSX2 \patterns_reg[0][4]  ( .D(n1299), .CK(clk), .SN(n1821), .Q(
        \patterns[0][4] ), .QN(n222) );
  DFFSX2 \patterns_reg[0][3]  ( .D(n1300), .CK(clk), .SN(n1821), .Q(
        \patterns[0][3] ), .QN(n223) );
  DFFSX2 \patterns_reg[0][0]  ( .D(n1303), .CK(clk), .SN(n1821), .Q(
        \patterns[0][0] ), .QN(n226) );
  DFFX1 \patterns_num_reg[1]  ( .D(n1240), .CK(clk), .Q(patterns_num[1]), .QN(
        n1850) );
  DFFRX2 \start_cp_bit_reg[0]  ( .D(n1571), .CK(clk), .RN(n1821), .Q(
        start_cp_bit[0]), .QN(n162) );
  DFFRX2 star_flag_reg ( .D(n1309), .CK(clk), .RN(n1821), .QN(n492) );
  DFFSX2 \patterns_reg[0][7]  ( .D(n1296), .CK(clk), .SN(n1821), .Q(
        \patterns[0][7] ), .QN(n219) );
  DFFSX2 \patterns_reg[0][6]  ( .D(n1297), .CK(clk), .SN(n1821), .Q(
        \patterns[0][6] ), .QN(n220) );
  DFFRX2 \current_cp_bit_reg[0]  ( .D(n1573), .CK(clk), .RN(n1821), .Q(N329), 
        .QN(n524) );
  DFFSX1 match_reg ( .D(n1575), .CK(clk), .SN(n1821), .QN(n490) );
  NOR2X1 U1218 ( .A(current_state[0]), .B(current_state[1]), .Y(n825) );
  OAI21X1 U1219 ( .A0(n1847), .A1(n1825), .B0(n1845), .Y(n811) );
  OAI21X1 U1220 ( .A0(n1847), .A1(n1827), .B0(n1845), .Y(n809) );
  OAI21X1 U1221 ( .A0(n1847), .A1(n1829), .B0(n1845), .Y(n807) );
  OAI21X1 U1222 ( .A0(n1847), .A1(n1831), .B0(n1845), .Y(n805) );
  OAI21X1 U1223 ( .A0(n1847), .A1(n1833), .B0(n1845), .Y(n803) );
  OAI21X1 U1224 ( .A0(n1847), .A1(n1835), .B0(n1845), .Y(n801) );
  OAI21X1 U1225 ( .A0(n1847), .A1(n1837), .B0(n1845), .Y(n798) );
  OA21X2 U1226 ( .A0(n1154), .A1(N1556), .B0(n1692), .Y(n1580) );
  NAND2X1 U1227 ( .A(\sub_255/carry [3]), .B(n1594), .Y(n1581) );
  XOR2XL U1228 ( .A(start_cp_bit[3]), .B(\add_248/carry [3]), .Y(N476) );
  AND2XL U1229 ( .A(\add_248/carry [3]), .B(start_cp_bit[3]), .Y(
        \add_248/carry [4]) );
  XNOR2XL U1230 ( .A(strings_num[3]), .B(start_cp_bit[3]), .Y(n1236) );
  INVX3 U1231 ( .A(reset), .Y(n1821) );
  INVX16 U1232 ( .A(n490), .Y(match) );
  NAND3BX2 U1233 ( .AN(cnt_num[3]), .B(n1154), .C(cnt_num[4]), .Y(n1156) );
  NAND3BX2 U1234 ( .AN(cnt_num[4]), .B(n1154), .C(cnt_num[3]), .Y(n1165) );
  BUFX12 U1235 ( .A(n1856), .Y(match_index[4]) );
  OAI222XL U1236 ( .A0(n227), .A1(n492), .B0(n1595), .B1(n1228), .C0(n149), 
        .C1(n1229), .Y(n1856) );
  BUFX12 U1237 ( .A(n1857), .Y(match_index[3]) );
  OAI222XL U1238 ( .A0(n228), .A1(n492), .B0(n1852), .B1(n1228), .C0(n159), 
        .C1(n1229), .Y(n1857) );
  BUFX12 U1239 ( .A(n1858), .Y(match_index[2]) );
  OAI222XL U1240 ( .A0(n229), .A1(n492), .B0(n1853), .B1(n1228), .C0(n160), 
        .C1(n1229), .Y(n1858) );
  BUFX12 U1241 ( .A(n1859), .Y(match_index[1]) );
  OAI222XL U1242 ( .A0(n230), .A1(n492), .B0(n1854), .B1(n1228), .C0(n161), 
        .C1(n1229), .Y(n1859) );
  BUFX12 U1243 ( .A(n1860), .Y(match_index[0]) );
  OAI222XL U1244 ( .A0(n231), .A1(n492), .B0(start_cp_bit[0]), .B1(n1228), 
        .C0(n162), .C1(n1229), .Y(n1860) );
  CLKINVX1 U1245 ( .A(N1556), .Y(n1839) );
  NOR2X2 U1246 ( .A(n1783), .B(n1784), .Y(n724) );
  CLKINVX1 U1247 ( .A(n798), .Y(n1836) );
  CLKINVX1 U1248 ( .A(n801), .Y(n1834) );
  CLKINVX1 U1249 ( .A(n803), .Y(n1832) );
  CLKINVX1 U1250 ( .A(n805), .Y(n1830) );
  CLKINVX1 U1251 ( .A(n807), .Y(n1828) );
  CLKINVX1 U1252 ( .A(n809), .Y(n1826) );
  CLKINVX1 U1253 ( .A(n811), .Y(n1824) );
  CLKINVX1 U1254 ( .A(n854), .Y(n1822) );
  OAI31XL U1255 ( .A0(n1214), .A1(n1779), .A2(n1138), .B0(n1713), .Y(n1213) );
  NAND2X1 U1256 ( .A(n1846), .B(n1204), .Y(n858) );
  OAI21X1 U1257 ( .A0(n1847), .A1(n1823), .B0(n1845), .Y(n854) );
  NOR2X2 U1258 ( .A(n1783), .B(N357), .Y(n727) );
  OAI21XL U1259 ( .A0(n1641), .A1(n1209), .B0(n1143), .Y(n1208) );
  NOR2X2 U1260 ( .A(n1784), .B(N358), .Y(n725) );
  NOR2X2 U1261 ( .A(N357), .B(N358), .Y(n721) );
  NOR3X1 U1262 ( .A(n1686), .B(n1685), .C(n1687), .Y(n865) );
  CLKINVX1 U1263 ( .A(n1769), .Y(n1771) );
  CLKBUFX3 U1264 ( .A(n755), .Y(n1677) );
  INVX3 U1265 ( .A(n825), .Y(n1847) );
  INVX3 U1266 ( .A(valid), .Y(n1845) );
  INVX3 U1267 ( .A(n1641), .Y(n1846) );
  NAND3X1 U1268 ( .A(n1819), .B(n1820), .C(n1802), .Y(n1135) );
  OAI21XL U1269 ( .A0(isStrPat[0]), .A1(n488), .B0(n1215), .Y(n1205) );
  BUFX4 U1270 ( .A(N329), .Y(n1687) );
  OAI222XL U1271 ( .A0(n555), .A1(n244), .B0(n556), .B1(n236), .C0(n557), .C1(
        n252), .Y(n657) );
  OAI222XL U1272 ( .A0(n555), .A1(n240), .B0(n556), .B1(n232), .C0(n557), .C1(
        n248), .Y(n545) );
  OAI222XL U1273 ( .A0(n555), .A1(n245), .B0(n556), .B1(n237), .C0(n557), .C1(
        n253), .Y(n677) );
  OAI222XL U1274 ( .A0(n555), .A1(n246), .B0(n556), .B1(n238), .C0(n557), .C1(
        n254), .Y(n697) );
  OAI222XL U1275 ( .A0(n555), .A1(n247), .B0(n556), .B1(n239), .C0(n557), .C1(
        n255), .Y(n717) );
  OAI222XL U1276 ( .A0(n555), .A1(n241), .B0(n556), .B1(n233), .C0(n557), .C1(
        n249), .Y(n597) );
  OAI222XL U1277 ( .A0(n555), .A1(n243), .B0(n556), .B1(n235), .C0(n557), .C1(
        n251), .Y(n637) );
  CLKBUFX3 U1278 ( .A(N330), .Y(n1686) );
  OAI22XL U1279 ( .A0(n568), .A1(n316), .B0(n569), .B1(n308), .Y(n661) );
  OAI22XL U1280 ( .A0(n568), .A1(n312), .B0(n569), .B1(n304), .Y(n558) );
  OAI22XL U1281 ( .A0(n568), .A1(n317), .B0(n569), .B1(n309), .Y(n681) );
  OAI22XL U1282 ( .A0(n568), .A1(n318), .B0(n569), .B1(n310), .Y(n701) );
  OAI22XL U1283 ( .A0(n568), .A1(n319), .B0(n569), .B1(n311), .Y(n729) );
  OAI22XL U1284 ( .A0(n568), .A1(n313), .B0(n569), .B1(n305), .Y(n601) );
  OAI22XL U1285 ( .A0(n568), .A1(n315), .B0(n569), .B1(n307), .Y(n641) );
  OAI22XL U1286 ( .A0(n568), .A1(n314), .B0(n569), .B1(n306), .Y(n621) );
  OAI22XL U1287 ( .A0(n564), .A1(n348), .B0(n565), .B1(n340), .Y(n663) );
  OAI22XL U1288 ( .A0(n564), .A1(n344), .B0(n565), .B1(n336), .Y(n560) );
  OAI22XL U1289 ( .A0(n564), .A1(n349), .B0(n565), .B1(n341), .Y(n683) );
  OAI22XL U1290 ( .A0(n564), .A1(n350), .B0(n565), .B1(n342), .Y(n703) );
  OAI22XL U1291 ( .A0(n564), .A1(n351), .B0(n565), .B1(n343), .Y(n731) );
  OAI22XL U1292 ( .A0(n564), .A1(n345), .B0(n565), .B1(n337), .Y(n603) );
  OAI22XL U1293 ( .A0(n564), .A1(n347), .B0(n565), .B1(n339), .Y(n643) );
  OAI22XL U1294 ( .A0(n564), .A1(n346), .B0(n565), .B1(n338), .Y(n623) );
  OAI22XL U1295 ( .A0(n551), .A1(n284), .B0(n552), .B1(n276), .Y(n659) );
  OAI22XL U1296 ( .A0(n551), .A1(n280), .B0(n552), .B1(n272), .Y(n547) );
  OAI22XL U1297 ( .A0(n551), .A1(n285), .B0(n552), .B1(n277), .Y(n679) );
  OAI22XL U1298 ( .A0(n551), .A1(n286), .B0(n552), .B1(n278), .Y(n699) );
  OAI22XL U1299 ( .A0(n551), .A1(n287), .B0(n552), .B1(n279), .Y(n719) );
  OAI22XL U1300 ( .A0(n551), .A1(n281), .B0(n552), .B1(n273), .Y(n599) );
  OAI22XL U1301 ( .A0(n551), .A1(n283), .B0(n552), .B1(n275), .Y(n639) );
  OAI22XL U1302 ( .A0(n566), .A1(n332), .B0(n567), .B1(n324), .Y(n662) );
  OAI22XL U1303 ( .A0(n566), .A1(n328), .B0(n567), .B1(n320), .Y(n559) );
  OAI22XL U1304 ( .A0(n566), .A1(n333), .B0(n567), .B1(n325), .Y(n682) );
  OAI22XL U1305 ( .A0(n566), .A1(n334), .B0(n567), .B1(n326), .Y(n702) );
  OAI22XL U1306 ( .A0(n566), .A1(n335), .B0(n567), .B1(n327), .Y(n730) );
  OAI22XL U1307 ( .A0(n566), .A1(n329), .B0(n567), .B1(n321), .Y(n602) );
  OAI22XL U1308 ( .A0(n566), .A1(n331), .B0(n567), .B1(n323), .Y(n642) );
  OAI22XL U1309 ( .A0(n566), .A1(n330), .B0(n567), .B1(n322), .Y(n622) );
  OAI22XL U1310 ( .A0(n553), .A1(n268), .B0(n554), .B1(n260), .Y(n658) );
  OAI22XL U1311 ( .A0(n553), .A1(n264), .B0(n554), .B1(n256), .Y(n546) );
  OAI22XL U1312 ( .A0(n553), .A1(n269), .B0(n554), .B1(n261), .Y(n678) );
  OAI22XL U1313 ( .A0(n553), .A1(n270), .B0(n554), .B1(n262), .Y(n698) );
  OAI22XL U1314 ( .A0(n553), .A1(n271), .B0(n554), .B1(n263), .Y(n718) );
  OAI22XL U1315 ( .A0(n553), .A1(n265), .B0(n554), .B1(n257), .Y(n598) );
  OAI22XL U1316 ( .A0(n553), .A1(n267), .B0(n554), .B1(n259), .Y(n638) );
  NAND3X2 U1317 ( .A(cnt_num[3]), .B(n1154), .C(cnt_num[4]), .Y(n1146) );
  OAI22XL U1318 ( .A0(n549), .A1(n300), .B0(n550), .B1(n292), .Y(n660) );
  OAI22XL U1319 ( .A0(n549), .A1(n296), .B0(n550), .B1(n288), .Y(n548) );
  OAI22XL U1320 ( .A0(n549), .A1(n301), .B0(n550), .B1(n293), .Y(n680) );
  OAI22XL U1321 ( .A0(n549), .A1(n302), .B0(n550), .B1(n294), .Y(n700) );
  OAI22XL U1322 ( .A0(n549), .A1(n303), .B0(n550), .B1(n295), .Y(n720) );
  OAI22XL U1323 ( .A0(n549), .A1(n297), .B0(n550), .B1(n289), .Y(n600) );
  OAI22XL U1324 ( .A0(n549), .A1(n299), .B0(n550), .B1(n291), .Y(n640) );
  CLKBUFX3 U1325 ( .A(N331), .Y(n1685) );
  OAI22XL U1326 ( .A0(n580), .A1(n380), .B0(n581), .B1(n372), .Y(n665) );
  OAI22XL U1327 ( .A0(n580), .A1(n376), .B0(n581), .B1(n368), .Y(n570) );
  OAI22XL U1328 ( .A0(n580), .A1(n381), .B0(n581), .B1(n373), .Y(n685) );
  OAI22XL U1329 ( .A0(n580), .A1(n382), .B0(n581), .B1(n374), .Y(n705) );
  OAI22XL U1330 ( .A0(n580), .A1(n383), .B0(n581), .B1(n375), .Y(n736) );
  OAI22XL U1331 ( .A0(n580), .A1(n377), .B0(n581), .B1(n369), .Y(n605) );
  OAI22XL U1332 ( .A0(n580), .A1(n379), .B0(n581), .B1(n371), .Y(n645) );
  OAI22XL U1333 ( .A0(n580), .A1(n378), .B0(n581), .B1(n370), .Y(n625) );
  OAI22XL U1334 ( .A0(n576), .A1(n412), .B0(n577), .B1(n404), .Y(n667) );
  OAI22XL U1335 ( .A0(n576), .A1(n408), .B0(n577), .B1(n400), .Y(n572) );
  OAI22XL U1336 ( .A0(n576), .A1(n413), .B0(n577), .B1(n405), .Y(n687) );
  OAI22XL U1337 ( .A0(n576), .A1(n414), .B0(n577), .B1(n406), .Y(n707) );
  OAI22XL U1338 ( .A0(n576), .A1(n415), .B0(n577), .B1(n407), .Y(n738) );
  OAI22XL U1339 ( .A0(n576), .A1(n409), .B0(n577), .B1(n401), .Y(n607) );
  OAI22XL U1340 ( .A0(n576), .A1(n411), .B0(n577), .B1(n403), .Y(n647) );
  OAI22XL U1341 ( .A0(n576), .A1(n410), .B0(n577), .B1(n402), .Y(n627) );
  OAI22XL U1342 ( .A0(n578), .A1(n396), .B0(n579), .B1(n388), .Y(n666) );
  OAI22XL U1343 ( .A0(n578), .A1(n392), .B0(n579), .B1(n384), .Y(n571) );
  OAI22XL U1344 ( .A0(n578), .A1(n397), .B0(n579), .B1(n389), .Y(n686) );
  OAI22XL U1345 ( .A0(n578), .A1(n398), .B0(n579), .B1(n390), .Y(n706) );
  OAI22XL U1346 ( .A0(n578), .A1(n399), .B0(n579), .B1(n391), .Y(n737) );
  OAI22XL U1347 ( .A0(n578), .A1(n393), .B0(n579), .B1(n385), .Y(n606) );
  OAI22XL U1348 ( .A0(n578), .A1(n395), .B0(n579), .B1(n387), .Y(n646) );
  OAI22XL U1349 ( .A0(n578), .A1(n394), .B0(n579), .B1(n386), .Y(n626) );
  OAI22XL U1350 ( .A0(n591), .A1(n442), .B0(n592), .B1(n434), .Y(n629) );
  OAI22XL U1351 ( .A0(n587), .A1(n474), .B0(n588), .B1(n466), .Y(n631) );
  OAI22XL U1352 ( .A0(n589), .A1(n458), .B0(n590), .B1(n450), .Y(n630) );
  OAI22XL U1353 ( .A0(n562), .A1(n364), .B0(n563), .B1(n356), .Y(n664) );
  OAI22XL U1354 ( .A0(n574), .A1(n428), .B0(n575), .B1(n420), .Y(n668) );
  OAI22XL U1355 ( .A0(n562), .A1(n360), .B0(n563), .B1(n352), .Y(n561) );
  OAI22XL U1356 ( .A0(n574), .A1(n424), .B0(n575), .B1(n416), .Y(n573) );
  OAI22XL U1357 ( .A0(n562), .A1(n365), .B0(n563), .B1(n357), .Y(n684) );
  OAI22XL U1358 ( .A0(n574), .A1(n429), .B0(n575), .B1(n421), .Y(n688) );
  OAI22XL U1359 ( .A0(n562), .A1(n366), .B0(n563), .B1(n358), .Y(n704) );
  OAI22XL U1360 ( .A0(n574), .A1(n430), .B0(n575), .B1(n422), .Y(n708) );
  OAI22XL U1361 ( .A0(n562), .A1(n367), .B0(n563), .B1(n359), .Y(n732) );
  OAI22XL U1362 ( .A0(n574), .A1(n431), .B0(n575), .B1(n423), .Y(n739) );
  OAI22XL U1363 ( .A0(n562), .A1(n361), .B0(n563), .B1(n353), .Y(n604) );
  OAI22XL U1364 ( .A0(n574), .A1(n425), .B0(n575), .B1(n417), .Y(n608) );
  OAI22XL U1365 ( .A0(n562), .A1(n363), .B0(n563), .B1(n355), .Y(n644) );
  OAI22XL U1366 ( .A0(n574), .A1(n427), .B0(n575), .B1(n419), .Y(n648) );
  OAI22XL U1367 ( .A0(n562), .A1(n362), .B0(n563), .B1(n354), .Y(n624) );
  OAI22XL U1368 ( .A0(n574), .A1(n426), .B0(n575), .B1(n418), .Y(n628) );
  OAI2BB2XL U1369 ( .B0(n778), .B1(n1642), .A0N(N417), .A1N(n1642), .Y(
        pattern_cp_char[1]) );
  OAI2BB2XL U1370 ( .B0(n770), .B1(n1642), .A0N(N415), .A1N(n1642), .Y(
        pattern_cp_char[3]) );
  OAI2BB2XL U1371 ( .B0(n774), .B1(n1642), .A0N(N416), .A1N(n1642), .Y(
        pattern_cp_char[2]) );
  OAI222XL U1372 ( .A0(n1677), .A1(n175), .B0(n1770), .B1(n183), .C0(n757), 
        .C1(n167), .Y(n771) );
  OAI222XL U1373 ( .A0(n1677), .A1(n172), .B0(n1770), .B1(n180), .C0(n757), 
        .C1(n164), .Y(n759) );
  OAI222XL U1374 ( .A0(n1677), .A1(n174), .B0(n1770), .B1(n182), .C0(n757), 
        .C1(n166), .Y(n767) );
  NOR3X1 U1375 ( .A(n524), .B(n1685), .C(n523), .Y(n938) );
  NOR3X1 U1376 ( .A(n1686), .B(n1685), .C(n524), .Y(n855) );
  CLKBUFX3 U1377 ( .A(n863), .Y(n1641) );
  NAND3X1 U1378 ( .A(cnt_num[2]), .B(n1802), .C(cnt_num[1]), .Y(n829) );
  NAND3X1 U1379 ( .A(cnt_num[2]), .B(n1819), .C(cnt_num[0]), .Y(n861) );
  NAND3X1 U1380 ( .A(cnt_num[1]), .B(n1820), .C(cnt_num[0]), .Y(n941) );
  NAND3X1 U1381 ( .A(n1802), .B(n1820), .C(cnt_num[1]), .Y(n999) );
  NAND3X1 U1382 ( .A(n1802), .B(n1819), .C(cnt_num[2]), .Y(n899) );
  NAND3X1 U1383 ( .A(n1819), .B(n1820), .C(cnt_num[0]), .Y(n1058) );
  CLKINVX1 U1384 ( .A(cnt_num[2]), .Y(n1820) );
  CLKINVX1 U1385 ( .A(cnt_num[1]), .Y(n1819) );
  CLKINVX1 U1386 ( .A(cnt_num[0]), .Y(n1802) );
  AOI21X1 U1387 ( .A0(n523), .A1(n1687), .B0(n1139), .Y(n540) );
  NAND3X1 U1388 ( .A(cnt_num[1]), .B(cnt_num[2]), .C(cnt_num[0]), .Y(n1145) );
  INVX3 U1389 ( .A(n1757), .Y(n1752) );
  INVX3 U1390 ( .A(n1757), .Y(n1751) );
  INVX3 U1391 ( .A(n1750), .Y(n1753) );
  INVX3 U1392 ( .A(n1750), .Y(n1755) );
  INVX3 U1393 ( .A(n1749), .Y(n1754) );
  INVX3 U1394 ( .A(n1749), .Y(n1756) );
  INVX3 U1395 ( .A(n1645), .Y(n1798) );
  AND2X2 U1396 ( .A(n1758), .B(n827), .Y(n816) );
  CLKBUFX3 U1397 ( .A(n815), .Y(n1684) );
  NOR2BX1 U1398 ( .AN(n827), .B(n1750), .Y(n815) );
  CLKINVX1 U1399 ( .A(n1184), .Y(n1838) );
  CLKBUFX3 U1400 ( .A(n1822), .Y(n1720) );
  CLKBUFX3 U1401 ( .A(n1822), .Y(n1721) );
  CLKBUFX3 U1402 ( .A(n1836), .Y(n1734) );
  CLKBUFX3 U1403 ( .A(n1834), .Y(n1732) );
  CLKBUFX3 U1404 ( .A(n1832), .Y(n1730) );
  CLKBUFX3 U1405 ( .A(n1830), .Y(n1728) );
  CLKBUFX3 U1406 ( .A(n1828), .Y(n1726) );
  CLKBUFX3 U1407 ( .A(n1826), .Y(n1724) );
  CLKBUFX3 U1408 ( .A(n1824), .Y(n1722) );
  CLKBUFX3 U1409 ( .A(n1836), .Y(n1735) );
  CLKBUFX3 U1410 ( .A(n1834), .Y(n1733) );
  CLKBUFX3 U1411 ( .A(n1832), .Y(n1731) );
  CLKBUFX3 U1412 ( .A(n1830), .Y(n1729) );
  CLKBUFX3 U1413 ( .A(n1828), .Y(n1727) );
  CLKBUFX3 U1414 ( .A(n1826), .Y(n1725) );
  CLKBUFX3 U1415 ( .A(n1824), .Y(n1723) );
  CLKBUFX3 U1416 ( .A(n1839), .Y(n1736) );
  CLKBUFX3 U1417 ( .A(n1839), .Y(n1737) );
  CLKBUFX3 U1418 ( .A(n1719), .Y(n1692) );
  CLKBUFX3 U1419 ( .A(n1714), .Y(n1713) );
  NAND2X2 U1420 ( .A(n740), .B(n724), .Y(n581) );
  NAND2X2 U1421 ( .A(n747), .B(n724), .Y(n592) );
  NAND2X2 U1422 ( .A(n733), .B(n724), .Y(n569) );
  NOR2X2 U1423 ( .A(n1143), .B(n1842), .Y(n1142) );
  NAND2X2 U1424 ( .A(n722), .B(n724), .Y(n555) );
  NOR2X1 U1425 ( .A(n1779), .B(n1842), .Y(n1198) );
  INVX3 U1426 ( .A(n1743), .Y(n1739) );
  INVX3 U1427 ( .A(n1764), .Y(n1760) );
  CLKBUFX3 U1428 ( .A(n1748), .Y(n1757) );
  CLKINVX1 U1429 ( .A(n1195), .Y(n1842) );
  CLKBUFX3 U1430 ( .A(n1749), .Y(n1758) );
  INVX3 U1431 ( .A(n1742), .Y(n1740) );
  INVX3 U1432 ( .A(n1764), .Y(n1761) );
  INVX3 U1433 ( .A(n1763), .Y(n1762) );
  CLKINVX1 U1434 ( .A(n1742), .Y(n1741) );
  CLKBUFX3 U1435 ( .A(n1717), .Y(n1706) );
  CLKBUFX3 U1436 ( .A(n1718), .Y(n1705) );
  CLKBUFX3 U1437 ( .A(n1718), .Y(n1704) );
  CLKBUFX3 U1438 ( .A(n1717), .Y(n1707) );
  CLKBUFX3 U1439 ( .A(n1716), .Y(n1708) );
  CLKBUFX3 U1440 ( .A(n1716), .Y(n1709) );
  CLKBUFX3 U1441 ( .A(n1715), .Y(n1710) );
  CLKBUFX3 U1442 ( .A(n1715), .Y(n1711) );
  CLKBUFX3 U1443 ( .A(n1714), .Y(n1712) );
  CLKBUFX3 U1444 ( .A(n1716), .Y(n1694) );
  CLKBUFX3 U1445 ( .A(n1715), .Y(n1695) );
  CLKBUFX3 U1446 ( .A(n1690), .Y(n1696) );
  CLKBUFX3 U1447 ( .A(n1716), .Y(n1697) );
  CLKBUFX3 U1448 ( .A(n1690), .Y(n1698) );
  CLKBUFX3 U1449 ( .A(n1717), .Y(n1699) );
  CLKBUFX3 U1450 ( .A(n1690), .Y(n1700) );
  CLKBUFX3 U1451 ( .A(n1718), .Y(n1701) );
  CLKBUFX3 U1452 ( .A(n1689), .Y(n1702) );
  CLKBUFX3 U1453 ( .A(n1690), .Y(n1703) );
  CLKBUFX3 U1454 ( .A(n1719), .Y(n1693) );
  NAND2X2 U1455 ( .A(n1846), .B(n1644), .Y(n795) );
  NAND2X2 U1456 ( .A(n1846), .B(n1644), .Y(n796) );
  INVX3 U1457 ( .A(n1646), .Y(n1807) );
  INVX3 U1458 ( .A(n1647), .Y(n1794) );
  INVX3 U1459 ( .A(n1648), .Y(n1811) );
  INVX3 U1460 ( .A(n1649), .Y(n1790) );
  INVX3 U1461 ( .A(n1650), .Y(n1815) );
  INVX3 U1462 ( .A(n1651), .Y(n1786) );
  INVX3 U1463 ( .A(n1652), .Y(n1803) );
  INVX3 U1464 ( .A(n1653), .Y(n1799) );
  INVX3 U1465 ( .A(n1654), .Y(n1808) );
  INVX3 U1466 ( .A(n1655), .Y(n1795) );
  INVX3 U1467 ( .A(n1656), .Y(n1812) );
  INVX3 U1468 ( .A(n1657), .Y(n1791) );
  INVX3 U1469 ( .A(n1658), .Y(n1816) );
  INVX3 U1470 ( .A(n1659), .Y(n1787) );
  INVX3 U1471 ( .A(n1660), .Y(n1804) );
  INVX3 U1472 ( .A(n1661), .Y(n1800) );
  INVX3 U1473 ( .A(n1662), .Y(n1809) );
  INVX3 U1474 ( .A(n1663), .Y(n1796) );
  INVX3 U1475 ( .A(n1664), .Y(n1813) );
  INVX3 U1476 ( .A(n1665), .Y(n1792) );
  INVX3 U1477 ( .A(n1666), .Y(n1817) );
  INVX3 U1478 ( .A(n1667), .Y(n1788) );
  INVX3 U1479 ( .A(n1668), .Y(n1805) );
  INVX3 U1480 ( .A(n1669), .Y(n1801) );
  INVX3 U1481 ( .A(n1670), .Y(n1810) );
  INVX3 U1482 ( .A(n1671), .Y(n1797) );
  INVX3 U1483 ( .A(n1672), .Y(n1814) );
  INVX3 U1484 ( .A(n1673), .Y(n1793) );
  INVX3 U1485 ( .A(n1674), .Y(n1818) );
  INVX3 U1486 ( .A(n1675), .Y(n1789) );
  INVX3 U1487 ( .A(n1676), .Y(n1806) );
  NAND3X2 U1488 ( .A(n1849), .B(n1678), .C(n1846), .Y(n1004) );
  NAND3X2 U1489 ( .A(n1744), .B(n1680), .C(n1846), .Y(n903) );
  NAND3X2 U1490 ( .A(n1765), .B(n1682), .C(n1846), .Y(n835) );
  NAND3X2 U1491 ( .A(n1771), .B(n1679), .C(n1846), .Y(n952) );
  NAND3X2 U1492 ( .A(n1596), .B(n1681), .C(n1846), .Y(n870) );
  INVX3 U1493 ( .A(n1679), .Y(n1776) );
  INVX3 U1494 ( .A(n1681), .Y(n1777) );
  AND3X2 U1495 ( .A(n1848), .B(n1639), .C(n1846), .Y(n1069) );
  CLKBUFX3 U1496 ( .A(n1181), .Y(n1645) );
  OAI21XL U1497 ( .A0(n1135), .A1(n1174), .B0(n1736), .Y(n1181) );
  AND2X2 U1498 ( .A(n1683), .B(n1846), .Y(n827) );
  OA21X2 U1499 ( .A0(n1845), .A1(n1134), .B0(n1839), .Y(n1067) );
  NOR2X1 U1500 ( .A(n1154), .B(n1138), .Y(n1184) );
  CLKINVX1 U1501 ( .A(n1213), .Y(n1778) );
  NAND2BX1 U1502 ( .AN(n1210), .B(n1778), .Y(n788) );
  NAND2X1 U1503 ( .A(n1778), .B(n1846), .Y(n786) );
  CLKBUFX3 U1504 ( .A(n1688), .Y(n1714) );
  CLKBUFX3 U1505 ( .A(n1691), .Y(n1719) );
  NAND2X2 U1506 ( .A(n734), .B(n724), .Y(n562) );
  NAND2X2 U1507 ( .A(n741), .B(n724), .Y(n574) );
  NAND2X2 U1508 ( .A(n734), .B(n721), .Y(n576) );
  NAND2X2 U1509 ( .A(n734), .B(n725), .Y(n578) );
  NAND2X2 U1510 ( .A(n734), .B(n727), .Y(n580) );
  NAND2X2 U1511 ( .A(n741), .B(n721), .Y(n587) );
  NAND2X2 U1512 ( .A(n741), .B(n725), .Y(n589) );
  NAND2X2 U1513 ( .A(n741), .B(n727), .Y(n591) );
  NAND2X2 U1514 ( .A(n740), .B(n721), .Y(n575) );
  NAND2X2 U1515 ( .A(n740), .B(n725), .Y(n577) );
  NAND2X2 U1516 ( .A(n740), .B(n727), .Y(n579) );
  NAND2X2 U1517 ( .A(n747), .B(n725), .Y(n588) );
  NAND2X2 U1518 ( .A(n747), .B(n727), .Y(n590) );
  CLKINVX1 U1519 ( .A(n858), .Y(n1780) );
  AND2X2 U1520 ( .A(n748), .B(n1785), .Y(n747) );
  AND2X2 U1521 ( .A(n742), .B(n1785), .Y(n740) );
  NAND2X2 U1522 ( .A(n723), .B(n721), .Y(n564) );
  NAND2X2 U1523 ( .A(n723), .B(n725), .Y(n566) );
  NAND2X2 U1524 ( .A(n723), .B(n727), .Y(n568) );
  NAND2X2 U1525 ( .A(n723), .B(n724), .Y(n549) );
  NAND2X2 U1526 ( .A(n721), .B(n726), .Y(n551) );
  NAND2X2 U1527 ( .A(n725), .B(n726), .Y(n553) );
  NAND2X2 U1528 ( .A(n733), .B(n721), .Y(n563) );
  NAND2X2 U1529 ( .A(n733), .B(n725), .Y(n565) );
  NAND2X2 U1530 ( .A(n733), .B(n727), .Y(n567) );
  NAND2X2 U1531 ( .A(n721), .B(n722), .Y(n550) );
  NAND2X2 U1532 ( .A(n725), .B(n722), .Y(n552) );
  NAND2X2 U1533 ( .A(n727), .B(n722), .Y(n554) );
  NAND2X2 U1534 ( .A(n727), .B(n726), .Y(n557) );
  NAND2X2 U1535 ( .A(n724), .B(n726), .Y(n556) );
  INVX3 U1536 ( .A(n1643), .Y(n1779) );
  AND3X2 U1537 ( .A(n1206), .B(n1208), .C(n1846), .Y(n1189) );
  AND2X2 U1538 ( .A(n735), .B(n1785), .Y(n733) );
  AND2X2 U1539 ( .A(n728), .B(n1785), .Y(n722) );
  AND2X2 U1540 ( .A(n1210), .B(n1198), .Y(n1143) );
  CLKBUFX3 U1541 ( .A(n1738), .Y(n1743) );
  INVX3 U1542 ( .A(n1596), .Y(n1772) );
  INVX3 U1543 ( .A(n1771), .Y(n1770) );
  CLKBUFX3 U1544 ( .A(n1759), .Y(n1764) );
  CLKBUFX3 U1545 ( .A(n1629), .Y(n1636) );
  NOR2X1 U1546 ( .A(n521), .B(n1633), .Y(n1629) );
  CLKBUFX3 U1547 ( .A(n865), .Y(n1748) );
  NOR2X1 U1548 ( .A(n1211), .B(n1844), .Y(n1206) );
  NAND2X1 U1549 ( .A(n1846), .B(n1211), .Y(n1195) );
  NOR2X1 U1550 ( .A(n1589), .B(n1590), .Y(n1588) );
  OR2X1 U1551 ( .A(n1581), .B(N496), .Y(n1589) );
  XNOR2X1 U1552 ( .A(n1591), .B(\sub_255/carry [2]), .Y(n1590) );
  CLKINVX1 U1553 ( .A(n757), .Y(n1848) );
  CLKBUFX3 U1554 ( .A(n1738), .Y(n1742) );
  INVX3 U1555 ( .A(n1596), .Y(n1773) );
  CLKBUFX3 U1556 ( .A(n1759), .Y(n1765) );
  INVX3 U1557 ( .A(n1596), .Y(n1774) );
  CLKBUFX3 U1558 ( .A(n1746), .Y(n1744) );
  CLKBUFX3 U1559 ( .A(n1765), .Y(n1766) );
  CLKBUFX3 U1560 ( .A(n1763), .Y(n1767) );
  CLKBUFX3 U1561 ( .A(n1763), .Y(n1768) );
  CLKBUFX3 U1562 ( .A(n865), .Y(n1750) );
  INVX3 U1563 ( .A(n1596), .Y(n1775) );
  CLKBUFX3 U1564 ( .A(n1759), .Y(n1763) );
  CLKBUFX3 U1565 ( .A(n1742), .Y(n1746) );
  CLKBUFX3 U1566 ( .A(n1742), .Y(n1747) );
  INVX3 U1567 ( .A(n1677), .Y(n1849) );
  CLKBUFX3 U1568 ( .A(n865), .Y(n1749) );
  CLKBUFX3 U1569 ( .A(n1746), .Y(n1745) );
  CLKBUFX3 U1570 ( .A(n1689), .Y(n1718) );
  CLKBUFX3 U1571 ( .A(n1689), .Y(n1717) );
  CLKBUFX3 U1572 ( .A(n1688), .Y(n1716) );
  CLKBUFX3 U1573 ( .A(n1688), .Y(n1715) );
  NAND3X1 U1574 ( .A(n1223), .B(n1222), .C(n1224), .Y(n1230) );
  CLKINVX1 U1575 ( .A(N429), .Y(n1852) );
  CLKINVX1 U1576 ( .A(N428), .Y(n1853) );
  CLKINVX1 U1577 ( .A(N427), .Y(n1854) );
  NAND2X2 U1578 ( .A(n1154), .B(n1182), .Y(n1174) );
  NAND3BX2 U1579 ( .AN(n1205), .B(n1182), .C(n825), .Y(n828) );
  NOR2X2 U1580 ( .A(n1840), .B(n1847), .Y(n1154) );
  NOR2X2 U1581 ( .A(n1684), .B(valid), .Y(n813) );
  NAND2X2 U1582 ( .A(n1055), .B(n1678), .Y(n1003) );
  NOR2X1 U1583 ( .A(n1849), .B(n1641), .Y(n1055) );
  NAND2X2 U1584 ( .A(n939), .B(n1680), .Y(n902) );
  NOR2X1 U1585 ( .A(n1742), .B(n1641), .Y(n939) );
  NAND2X2 U1586 ( .A(n857), .B(n1682), .Y(n834) );
  NOR2X1 U1587 ( .A(n1765), .B(n1641), .Y(n857) );
  OA21X2 U1588 ( .A0(valid), .A1(n825), .B0(n1639), .Y(n1072) );
  AND2X2 U1589 ( .A(n996), .B(n1679), .Y(n950) );
  NOR2X1 U1590 ( .A(n1771), .B(n1641), .Y(n996) );
  AND2X2 U1591 ( .A(n896), .B(n1681), .Y(n868) );
  NOR2X1 U1592 ( .A(n1596), .B(n1641), .Y(n896) );
  CLKBUFX3 U1593 ( .A(n1172), .Y(n1653) );
  OAI21XL U1594 ( .A0(n1135), .A1(n1165), .B0(n1736), .Y(n1172) );
  CLKBUFX3 U1595 ( .A(n1171), .Y(n1654) );
  OAI21XL U1596 ( .A0(n1058), .A1(n1165), .B0(n1736), .Y(n1171) );
  CLKBUFX3 U1597 ( .A(n1170), .Y(n1655) );
  OAI21XL U1598 ( .A0(n999), .A1(n1165), .B0(n1736), .Y(n1170) );
  CLKBUFX3 U1599 ( .A(n1169), .Y(n1656) );
  OAI21XL U1600 ( .A0(n941), .A1(n1165), .B0(n1736), .Y(n1169) );
  CLKBUFX3 U1601 ( .A(n1168), .Y(n1657) );
  OAI21XL U1602 ( .A0(n899), .A1(n1165), .B0(n1736), .Y(n1168) );
  CLKBUFX3 U1603 ( .A(n1167), .Y(n1658) );
  OAI21XL U1604 ( .A0(n861), .A1(n1165), .B0(n1737), .Y(n1167) );
  CLKBUFX3 U1605 ( .A(n1166), .Y(n1659) );
  OAI21XL U1606 ( .A0(n829), .A1(n1165), .B0(n1737), .Y(n1166) );
  CLKBUFX3 U1607 ( .A(n1164), .Y(n1660) );
  OAI21XL U1608 ( .A0(n1145), .A1(n1165), .B0(n1737), .Y(n1164) );
  CLKBUFX3 U1609 ( .A(n1163), .Y(n1661) );
  OAI21XL U1610 ( .A0(n1135), .A1(n1156), .B0(n1737), .Y(n1163) );
  CLKBUFX3 U1611 ( .A(n1162), .Y(n1662) );
  OAI21XL U1612 ( .A0(n1058), .A1(n1156), .B0(n1737), .Y(n1162) );
  CLKBUFX3 U1613 ( .A(n1161), .Y(n1663) );
  OAI21XL U1614 ( .A0(n999), .A1(n1156), .B0(n1737), .Y(n1161) );
  CLKBUFX3 U1615 ( .A(n1160), .Y(n1664) );
  OAI21XL U1616 ( .A0(n941), .A1(n1156), .B0(n1737), .Y(n1160) );
  CLKBUFX3 U1617 ( .A(n1159), .Y(n1665) );
  OAI21XL U1618 ( .A0(n899), .A1(n1156), .B0(n1737), .Y(n1159) );
  CLKBUFX3 U1619 ( .A(n1158), .Y(n1666) );
  OAI21XL U1620 ( .A0(n861), .A1(n1156), .B0(n1737), .Y(n1158) );
  CLKBUFX3 U1621 ( .A(n1157), .Y(n1667) );
  OAI21XL U1622 ( .A0(n829), .A1(n1156), .B0(n1737), .Y(n1157) );
  CLKBUFX3 U1623 ( .A(n1155), .Y(n1668) );
  OAI21XL U1624 ( .A0(n1145), .A1(n1156), .B0(n1737), .Y(n1155) );
  NOR2X1 U1625 ( .A(n1185), .B(n1847), .Y(n1138) );
  AND2X2 U1626 ( .A(n1683), .B(n825), .Y(n817) );
  AND2X2 U1627 ( .A(n1133), .B(n1639), .Y(n1070) );
  NOR2X1 U1628 ( .A(n1848), .B(n1641), .Y(n1133) );
  CLKBUFX3 U1629 ( .A(n1006), .Y(n1678) );
  OAI211X1 U1630 ( .A0(n1677), .A1(n858), .B0(n1845), .C0(n1056), .Y(n1006) );
  AOI2BB1X1 U1631 ( .A0N(n1058), .A1N(n828), .B0(n1779), .Y(n1056) );
  CLKBUFX3 U1632 ( .A(n905), .Y(n1680) );
  OAI211X1 U1633 ( .A0(n1741), .A1(n858), .B0(n1845), .C0(n940), .Y(n905) );
  OA21XL U1634 ( .A0(n828), .A1(n941), .B0(n1643), .Y(n940) );
  CLKBUFX3 U1635 ( .A(n837), .Y(n1682) );
  OAI211X1 U1636 ( .A0(n1762), .A1(n858), .B0(n1845), .C0(n859), .Y(n837) );
  AOI2BB1X1 U1637 ( .A0N(n861), .A1N(n828), .B0(n1779), .Y(n859) );
  CLKBUFX3 U1638 ( .A(n799), .Y(n1644) );
  OAI211X1 U1639 ( .A0(n828), .A1(n1145), .B0(n1202), .C0(n1203), .Y(n799) );
  NOR2X1 U1640 ( .A(valid), .B(n1780), .Y(n1203) );
  NAND4X1 U1641 ( .A(N494), .B(n1634), .C(n1779), .D(n1588), .Y(n1202) );
  CLKBUFX3 U1642 ( .A(n948), .Y(n1679) );
  OAI211X1 U1643 ( .A0(n1770), .A1(n858), .B0(n1845), .C0(n997), .Y(n948) );
  AOI2BB1X1 U1644 ( .A0N(n999), .A1N(n828), .B0(n1779), .Y(n997) );
  CLKBUFX3 U1645 ( .A(n866), .Y(n1681) );
  OAI211X1 U1646 ( .A0(n1774), .A1(n858), .B0(n1845), .C0(n897), .Y(n866) );
  AOI2BB1X1 U1647 ( .A0N(n899), .A1N(n828), .B0(n1779), .Y(n897) );
  CLKBUFX3 U1648 ( .A(n1180), .Y(n1646) );
  OAI21XL U1649 ( .A0(n1058), .A1(n1174), .B0(n1736), .Y(n1180) );
  CLKBUFX3 U1650 ( .A(n1179), .Y(n1647) );
  OAI21XL U1651 ( .A0(n999), .A1(n1174), .B0(n1736), .Y(n1179) );
  CLKBUFX3 U1652 ( .A(n1178), .Y(n1648) );
  OAI21XL U1653 ( .A0(n941), .A1(n1174), .B0(n1736), .Y(n1178) );
  CLKBUFX3 U1654 ( .A(n1177), .Y(n1649) );
  OAI21XL U1655 ( .A0(n899), .A1(n1174), .B0(n1736), .Y(n1177) );
  CLKBUFX3 U1656 ( .A(n1176), .Y(n1650) );
  OAI21XL U1657 ( .A0(n861), .A1(n1174), .B0(n1736), .Y(n1176) );
  CLKBUFX3 U1658 ( .A(n1175), .Y(n1651) );
  OAI21XL U1659 ( .A0(n829), .A1(n1174), .B0(n1736), .Y(n1175) );
  CLKBUFX3 U1660 ( .A(n1173), .Y(n1652) );
  OAI21XL U1661 ( .A0(n1145), .A1(n1174), .B0(n1736), .Y(n1173) );
  CLKBUFX3 U1662 ( .A(n1153), .Y(n1669) );
  OAI21XL U1663 ( .A0(n1135), .A1(n1146), .B0(n1737), .Y(n1153) );
  CLKBUFX3 U1664 ( .A(n1152), .Y(n1670) );
  OAI21XL U1665 ( .A0(n1058), .A1(n1146), .B0(n1737), .Y(n1152) );
  CLKBUFX3 U1666 ( .A(n1151), .Y(n1671) );
  OAI21XL U1667 ( .A0(n999), .A1(n1146), .B0(n1736), .Y(n1151) );
  CLKBUFX3 U1668 ( .A(n1150), .Y(n1672) );
  OAI21XL U1669 ( .A0(n941), .A1(n1146), .B0(n1839), .Y(n1150) );
  CLKBUFX3 U1670 ( .A(n1149), .Y(n1673) );
  OAI21XL U1671 ( .A0(n899), .A1(n1146), .B0(n1839), .Y(n1149) );
  CLKBUFX3 U1672 ( .A(n1148), .Y(n1674) );
  OAI21XL U1673 ( .A0(n861), .A1(n1146), .B0(n1736), .Y(n1148) );
  CLKBUFX3 U1674 ( .A(n1147), .Y(n1675) );
  OAI21XL U1675 ( .A0(n829), .A1(n1146), .B0(n1737), .Y(n1147) );
  CLKBUFX3 U1676 ( .A(n1144), .Y(n1676) );
  OAI21XL U1677 ( .A0(n1145), .A1(n1146), .B0(n1737), .Y(n1144) );
  CLKBUFX3 U1678 ( .A(n1066), .Y(n1639) );
  OAI211X1 U1679 ( .A0(n828), .A1(n1135), .B0(n1137), .C0(n1643), .Y(n1066) );
  AOI211X1 U1680 ( .A0(n1780), .A1(n1848), .B0(valid), .C0(n1138), .Y(n1137)
         );
  CLKBUFX3 U1681 ( .A(n812), .Y(n1683) );
  OAI21XL U1682 ( .A0(n828), .A1(n829), .B0(n1643), .Y(n812) );
  OAI2BB2XL U1683 ( .B0(n1847), .B1(n1205), .A0N(n1215), .A1N(valid), .Y(n1214) );
  OAI222XL U1684 ( .A0(n786), .A1(n793), .B0(n788), .B1(n1819), .C0(n1778), 
        .C1(n1850), .Y(n1240) );
  XNOR2X1 U1685 ( .A(n792), .B(n794), .Y(n793) );
  XNOR2X1 U1686 ( .A(n1850), .B(n540), .Y(n794) );
  NOR2X1 U1687 ( .A(n1840), .B(n1845), .Y(N1556) );
  NAND2X1 U1688 ( .A(n1841), .B(n1840), .Y(n1134) );
  CLKBUFX3 U1689 ( .A(n1821), .Y(n1688) );
  CLKBUFX3 U1690 ( .A(n1821), .Y(n1691) );
  NAND3BX2 U1691 ( .AN(N362), .B(n721), .C(n747), .Y(n586) );
  NAND4X1 U1692 ( .A(n653), .B(n654), .C(n655), .D(n656), .Y(string_cp_char[3]) );
  NOR4X1 U1693 ( .A(n657), .B(n658), .C(n659), .D(n660), .Y(n656) );
  NOR4X1 U1694 ( .A(n665), .B(n666), .C(n667), .D(n668), .Y(n654) );
  NOR4X1 U1695 ( .A(n661), .B(n662), .C(n663), .D(n664), .Y(n655) );
  NAND4X1 U1696 ( .A(n541), .B(n542), .C(n543), .D(n544), .Y(string_cp_char[7]) );
  NOR4X1 U1697 ( .A(n545), .B(n546), .C(n547), .D(n548), .Y(n544) );
  NOR4X1 U1698 ( .A(n570), .B(n571), .C(n572), .D(n573), .Y(n542) );
  NOR4X1 U1699 ( .A(n558), .B(n559), .C(n560), .D(n561), .Y(n543) );
  NAND4X1 U1700 ( .A(n593), .B(n594), .C(n595), .D(n596), .Y(string_cp_char[6]) );
  NOR4X1 U1701 ( .A(n597), .B(n598), .C(n599), .D(n600), .Y(n596) );
  NOR4X1 U1702 ( .A(n605), .B(n606), .C(n607), .D(n608), .Y(n594) );
  NOR4X1 U1703 ( .A(n601), .B(n602), .C(n603), .D(n604), .Y(n595) );
  NAND4X1 U1704 ( .A(n633), .B(n634), .C(n635), .D(n636), .Y(string_cp_char[4]) );
  NOR4X1 U1705 ( .A(n637), .B(n638), .C(n639), .D(n640), .Y(n636) );
  NOR4X1 U1706 ( .A(n645), .B(n646), .C(n647), .D(n648), .Y(n634) );
  NOR4X1 U1707 ( .A(n641), .B(n642), .C(n643), .D(n644), .Y(n635) );
  NOR2X1 U1708 ( .A(n1782), .B(N360), .Y(n742) );
  NOR2X1 U1709 ( .A(N359), .B(N360), .Y(n748) );
  AND2X2 U1710 ( .A(n742), .B(N356), .Y(n734) );
  AND2X2 U1711 ( .A(n748), .B(N356), .Y(n741) );
  INVX1 U1712 ( .A(N356), .Y(n1785) );
  CLKINVX1 U1713 ( .A(N359), .Y(n1782) );
  NAND4X1 U1714 ( .A(n673), .B(n674), .C(n675), .D(n676), .Y(string_cp_char[2]) );
  NOR4X1 U1715 ( .A(n677), .B(n678), .C(n679), .D(n680), .Y(n676) );
  NOR4X1 U1716 ( .A(n685), .B(n686), .C(n687), .D(n688), .Y(n674) );
  NOR4X1 U1717 ( .A(n681), .B(n682), .C(n683), .D(n684), .Y(n675) );
  NAND4X1 U1718 ( .A(n693), .B(n694), .C(n695), .D(n696), .Y(string_cp_char[1]) );
  NOR4X1 U1719 ( .A(n697), .B(n698), .C(n699), .D(n700), .Y(n696) );
  NOR4X1 U1720 ( .A(n705), .B(n706), .C(n707), .D(n708), .Y(n694) );
  NOR4X1 U1721 ( .A(n701), .B(n702), .C(n703), .D(n704), .Y(n695) );
  NAND4X1 U1722 ( .A(n613), .B(n614), .C(n615), .D(n616), .Y(string_cp_char[5]) );
  NOR4X1 U1723 ( .A(n625), .B(n626), .C(n627), .D(n628), .Y(n614) );
  NOR4X1 U1724 ( .A(n629), .B(n630), .C(n631), .D(n632), .Y(n613) );
  NOR4X1 U1725 ( .A(n621), .B(n622), .C(n623), .D(n624), .Y(n615) );
  NAND4X1 U1726 ( .A(n713), .B(n714), .C(n715), .D(n716), .Y(string_cp_char[0]) );
  NOR4X1 U1727 ( .A(n717), .B(n718), .C(n719), .D(n720), .Y(n716) );
  NOR4X1 U1728 ( .A(n736), .B(n737), .C(n738), .D(n739), .Y(n714) );
  NOR4X1 U1729 ( .A(n729), .B(n730), .C(n731), .D(n732), .Y(n715) );
  OA21X2 U1730 ( .A0(n1195), .A1(n1196), .B0(n1208), .Y(n1187) );
  AND2X1 U1731 ( .A(n735), .B(N356), .Y(n723) );
  AND2X1 U1732 ( .A(n728), .B(N356), .Y(n726) );
  AND2XL U1733 ( .A(N360), .B(n1782), .Y(n735) );
  AND2XL U1734 ( .A(N360), .B(N359), .Y(n728) );
  CLKBUFX3 U1735 ( .A(n943), .Y(n1643) );
  NAND2X1 U1736 ( .A(n1204), .B(n1846), .Y(n943) );
  INVX3 U1737 ( .A(N362), .Y(n1781) );
  NAND2X1 U1738 ( .A(n1842), .B(n1196), .Y(n1186) );
  CLKINVX1 U1739 ( .A(n1686), .Y(n1633) );
  CLKINVX1 U1740 ( .A(N357), .Y(n1784) );
  CLKINVX1 U1741 ( .A(N358), .Y(n1783) );
  OR2X1 U1742 ( .A(n1200), .B(n1641), .Y(n1194) );
  CLKBUFX3 U1743 ( .A(n1627), .Y(n1637) );
  NOR2X1 U1744 ( .A(n1633), .B(n1685), .Y(n1627) );
  NAND2X2 U1745 ( .A(n1139), .B(n1685), .Y(n757) );
  INVX3 U1746 ( .A(n1687), .Y(n1634) );
  CLKBUFX3 U1747 ( .A(n750), .Y(n1642) );
  NAND3BX1 U1748 ( .AN(n1222), .B(n1223), .C(n1224), .Y(n750) );
  NAND2X1 U1749 ( .A(n1141), .B(n1687), .Y(n755) );
  CLKBUFX3 U1750 ( .A(n1630), .Y(n1635) );
  NOR2X1 U1751 ( .A(n521), .B(n1686), .Y(n1630) );
  CLKBUFX3 U1752 ( .A(n1626), .Y(n1638) );
  NOR2X1 U1753 ( .A(n1686), .B(n1685), .Y(n1626) );
  CLKBUFX3 U1754 ( .A(n938), .Y(n1738) );
  CLKBUFX3 U1755 ( .A(n855), .Y(n1759) );
  OAI33X1 U1756 ( .A0(n1216), .A1(n1217), .A2(n1218), .B0(n1219), .B1(n1642), 
        .B2(n1220), .Y(n1211) );
  XNOR2X1 U1757 ( .A(n1851), .B(n1685), .Y(n1216) );
  XNOR2X1 U1758 ( .A(n1850), .B(n1686), .Y(n1218) );
  XNOR2X1 U1759 ( .A(n1685), .B(n1221), .Y(n1220) );
  XNOR2X1 U1760 ( .A(n1843), .B(n1687), .Y(n1217) );
  CLKINVX1 U1761 ( .A(n1209), .Y(n1844) );
  XNOR2X1 U1762 ( .A(n1685), .B(n1592), .Y(n1591) );
  AND2X2 U1763 ( .A(n1686), .B(n1687), .Y(n1592) );
  XNOR2X1 U1764 ( .A(n1686), .B(n1687), .Y(n1593) );
  NAND3X1 U1765 ( .A(n1685), .B(n1687), .C(n1686), .Y(n1594) );
  NOR2X1 U1766 ( .A(valid), .B(n825), .Y(n1210) );
  NOR2X1 U1767 ( .A(n540), .B(n792), .Y(n791) );
  OR2X1 U1768 ( .A(n1197), .B(valid), .Y(n1193) );
  NAND2X1 U1769 ( .A(n1641), .B(n1847), .Y(n1197) );
  CLKBUFX3 U1770 ( .A(n1821), .Y(n1690) );
  CLKBUFX3 U1771 ( .A(n1821), .Y(n1689) );
  NAND2X1 U1772 ( .A(n1230), .B(n492), .Y(n1229) );
  NAND2BX1 U1773 ( .AN(n1230), .B(n492), .Y(n1228) );
  NOR3X1 U1774 ( .A(\patterns[0][0] ), .B(\patterns[0][7] ), .C(
        \patterns[0][5] ), .Y(n1224) );
  AND4X1 U1775 ( .A(\patterns[0][6] ), .B(\patterns[0][4] ), .C(n1232), .D(
        \patterns[0][3] ), .Y(n1223) );
  NOR2X1 U1776 ( .A(n225), .B(n224), .Y(n1232) );
  XOR2X1 U1777 ( .A(\r558/carry [4]), .B(n149), .Y(n1595) );
  NAND4X1 U1778 ( .A(n162), .B(n161), .C(n1231), .D(n160), .Y(n1222) );
  NOR2X1 U1779 ( .A(start_cp_bit[4]), .B(start_cp_bit[3]), .Y(n1231) );
  ADDHXL U1780 ( .A(start_cp_bit[1]), .B(start_cp_bit[0]), .CO(\r558/carry [2]), .S(N427) );
  ADDHXL U1781 ( .A(start_cp_bit[2]), .B(\r558/carry [2]), .CO(\r558/carry [3]), .S(N428) );
  ADDHXL U1782 ( .A(start_cp_bit[3]), .B(\r558/carry [3]), .CO(\r558/carry [4]), .S(N429) );
  OAI221XL U1783 ( .A0(n1053), .A1(n1003), .B0(n163), .B1(n1004), .C0(n1054), 
        .Y(n1295) );
  AOI2BB2X1 U1784 ( .B0(n1062), .B1(n756), .A0N(n756), .A1N(n171), .Y(n1053)
         );
  AOI2BB2X1 U1785 ( .B0(n1678), .B1(n854), .A0N(n211), .A1N(n1678), .Y(n1054)
         );
  OAI22XL U1786 ( .A0(n1744), .A1(n1063), .B0(n179), .B1(n1740), .Y(n1062) );
  OAI221XL U1787 ( .A0(n936), .A1(n902), .B0(n163), .B1(n903), .C0(n937), .Y(
        n1279) );
  AOI2BB2X1 U1788 ( .B0(n946), .B1(n1775), .A0N(n1775), .A1N(n171), .Y(n936)
         );
  AOI2BB2X1 U1789 ( .B0(n1680), .B1(n854), .A0N(n195), .A1N(n1680), .Y(n937)
         );
  OAI22XL U1790 ( .A0(n1765), .A1(n947), .B0(n179), .B1(n1762), .Y(n946) );
  OAI221XL U1791 ( .A0(n852), .A1(n834), .B0(n163), .B1(n835), .C0(n853), .Y(
        n1263) );
  AOI221XL U1792 ( .A0(\patterns[0][7] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[6][7] ), .C0(n1755), .Y(n852) );
  AOI2BB2X1 U1793 ( .B0(n854), .B1(n1682), .A0N(n179), .A1N(n1682), .Y(n853)
         );
  OAI221XL U1794 ( .A0(n1047), .A1(n1003), .B0(n164), .B1(n1004), .C0(n1048), 
        .Y(n1294) );
  AOI2BB2X1 U1795 ( .B0(n1049), .B1(n1769), .A0N(n756), .A1N(n172), .Y(n1047)
         );
  AOI2BB2X1 U1796 ( .B0(n1678), .B1(n811), .A0N(n212), .A1N(n1678), .Y(n1048)
         );
  OAI22XL U1797 ( .A0(n1743), .A1(n1050), .B0(n180), .B1(n1740), .Y(n1049) );
  OAI221XL U1798 ( .A0(n932), .A1(n902), .B0(n164), .B1(n903), .C0(n933), .Y(
        n1278) );
  AOI2BB2X1 U1799 ( .B0(n934), .B1(n1773), .A0N(n1775), .A1N(n172), .Y(n932)
         );
  AOI2BB2X1 U1800 ( .B0(n1680), .B1(n811), .A0N(n196), .A1N(n1680), .Y(n933)
         );
  OAI22XL U1801 ( .A0(n1765), .A1(n935), .B0(n180), .B1(n1762), .Y(n934) );
  OAI221XL U1802 ( .A0(n850), .A1(n834), .B0(n164), .B1(n835), .C0(n851), .Y(
        n1262) );
  AOI221XL U1803 ( .A0(\patterns[0][6] ), .A1(n1752), .B0(n1750), .B1(
        \patterns[6][6] ), .C0(n1754), .Y(n850) );
  AOI2BB2X1 U1804 ( .B0(n1682), .B1(n811), .A0N(n180), .A1N(n1682), .Y(n851)
         );
  OAI221XL U1805 ( .A0(n1041), .A1(n1003), .B0(n165), .B1(n1004), .C0(n1042), 
        .Y(n1293) );
  AOI2BB2X1 U1806 ( .B0(n1043), .B1(n1769), .A0N(n756), .A1N(n173), .Y(n1041)
         );
  AOI2BB2X1 U1807 ( .B0(n1678), .B1(n809), .A0N(n213), .A1N(n1678), .Y(n1042)
         );
  OAI22XL U1808 ( .A0(n1744), .A1(n1044), .B0(n181), .B1(n1740), .Y(n1043) );
  OAI221XL U1809 ( .A0(n928), .A1(n902), .B0(n165), .B1(n903), .C0(n929), .Y(
        n1277) );
  AOI2BB2X1 U1810 ( .B0(n930), .B1(n1773), .A0N(n1775), .A1N(n173), .Y(n928)
         );
  AOI2BB2X1 U1811 ( .B0(n1680), .B1(n809), .A0N(n197), .A1N(n1680), .Y(n929)
         );
  OAI22XL U1812 ( .A0(n1765), .A1(n931), .B0(n181), .B1(n1762), .Y(n930) );
  OAI221XL U1813 ( .A0(n848), .A1(n834), .B0(n165), .B1(n835), .C0(n849), .Y(
        n1261) );
  AOI221XL U1814 ( .A0(\patterns[0][5] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[6][5] ), .C0(n1755), .Y(n848) );
  AOI2BB2X1 U1815 ( .B0(n1682), .B1(n809), .A0N(n181), .A1N(n1682), .Y(n849)
         );
  OAI221XL U1816 ( .A0(n1035), .A1(n1003), .B0(n166), .B1(n1004), .C0(n1036), 
        .Y(n1292) );
  AOI2BB2X1 U1817 ( .B0(n1037), .B1(n1769), .A0N(n1770), .A1N(n174), .Y(n1035)
         );
  AOI2BB2X1 U1818 ( .B0(n1678), .B1(n807), .A0N(n214), .A1N(n1678), .Y(n1036)
         );
  OAI22XL U1819 ( .A0(n1744), .A1(n1038), .B0(n182), .B1(n1740), .Y(n1037) );
  OAI221XL U1820 ( .A0(n924), .A1(n902), .B0(n166), .B1(n903), .C0(n925), .Y(
        n1276) );
  AOI2BB2X1 U1821 ( .B0(n926), .B1(n1773), .A0N(n1774), .A1N(n174), .Y(n924)
         );
  AOI2BB2X1 U1822 ( .B0(n1680), .B1(n807), .A0N(n198), .A1N(n1680), .Y(n925)
         );
  OAI22XL U1823 ( .A0(n1765), .A1(n927), .B0(n182), .B1(n1762), .Y(n926) );
  OAI221XL U1824 ( .A0(n846), .A1(n834), .B0(n166), .B1(n835), .C0(n847), .Y(
        n1260) );
  AOI221XL U1825 ( .A0(\patterns[0][4] ), .A1(n1752), .B0(n1750), .B1(
        \patterns[6][4] ), .C0(n1754), .Y(n846) );
  AOI2BB2X1 U1826 ( .B0(n1682), .B1(n807), .A0N(n182), .A1N(n1682), .Y(n847)
         );
  OAI221XL U1827 ( .A0(n1029), .A1(n1003), .B0(n167), .B1(n1004), .C0(n1030), 
        .Y(n1291) );
  AOI2BB2X1 U1828 ( .B0(n1031), .B1(n1769), .A0N(n1769), .A1N(n175), .Y(n1029)
         );
  AOI2BB2X1 U1829 ( .B0(n1678), .B1(n805), .A0N(n215), .A1N(n1678), .Y(n1030)
         );
  OAI22XL U1830 ( .A0(n1745), .A1(n1032), .B0(n183), .B1(n1740), .Y(n1031) );
  OAI221XL U1831 ( .A0(n920), .A1(n902), .B0(n167), .B1(n903), .C0(n921), .Y(
        n1275) );
  AOI2BB2X1 U1832 ( .B0(n922), .B1(n1773), .A0N(n1774), .A1N(n175), .Y(n920)
         );
  AOI2BB2X1 U1833 ( .B0(n1680), .B1(n805), .A0N(n199), .A1N(n1680), .Y(n921)
         );
  OAI22XL U1834 ( .A0(n1765), .A1(n923), .B0(n183), .B1(n1762), .Y(n922) );
  OAI221XL U1835 ( .A0(n844), .A1(n834), .B0(n167), .B1(n835), .C0(n845), .Y(
        n1259) );
  AOI221XL U1836 ( .A0(\patterns[0][3] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[6][3] ), .C0(n1755), .Y(n844) );
  AOI2BB2X1 U1837 ( .B0(n1682), .B1(n805), .A0N(n183), .A1N(n1682), .Y(n845)
         );
  OAI221XL U1838 ( .A0(n1023), .A1(n1003), .B0(n168), .B1(n1004), .C0(n1024), 
        .Y(n1290) );
  AOI2BB2X1 U1839 ( .B0(n1025), .B1(n1769), .A0N(n1769), .A1N(n176), .Y(n1023)
         );
  AOI2BB2X1 U1840 ( .B0(n1678), .B1(n803), .A0N(n216), .A1N(n1678), .Y(n1024)
         );
  OAI22XL U1841 ( .A0(n1745), .A1(n1026), .B0(n184), .B1(n1740), .Y(n1025) );
  OAI221XL U1842 ( .A0(n916), .A1(n902), .B0(n168), .B1(n903), .C0(n917), .Y(
        n1274) );
  AOI2BB2X1 U1843 ( .B0(n918), .B1(n1774), .A0N(n1774), .A1N(n176), .Y(n916)
         );
  AOI2BB2X1 U1844 ( .B0(n1680), .B1(n803), .A0N(n200), .A1N(n1680), .Y(n917)
         );
  OAI22XL U1845 ( .A0(n1763), .A1(n919), .B0(n184), .B1(n1761), .Y(n918) );
  OAI221XL U1846 ( .A0(n842), .A1(n834), .B0(n168), .B1(n835), .C0(n843), .Y(
        n1258) );
  AOI221XL U1847 ( .A0(\patterns[0][2] ), .A1(n1752), .B0(n1750), .B1(
        \patterns[6][2] ), .C0(n1755), .Y(n842) );
  AOI2BB2X1 U1848 ( .B0(n1682), .B1(n803), .A0N(n184), .A1N(n1682), .Y(n843)
         );
  OAI221XL U1849 ( .A0(n1017), .A1(n1003), .B0(n169), .B1(n1004), .C0(n1018), 
        .Y(n1289) );
  AOI2BB2X1 U1850 ( .B0(n1019), .B1(n1769), .A0N(n1769), .A1N(n177), .Y(n1017)
         );
  AOI2BB2X1 U1851 ( .B0(n1678), .B1(n801), .A0N(n217), .A1N(n1678), .Y(n1018)
         );
  OAI22XL U1852 ( .A0(n1745), .A1(n1020), .B0(n185), .B1(n1740), .Y(n1019) );
  OAI221XL U1853 ( .A0(n912), .A1(n902), .B0(n169), .B1(n903), .C0(n913), .Y(
        n1273) );
  AOI2BB2X1 U1854 ( .B0(n914), .B1(n1774), .A0N(n1774), .A1N(n177), .Y(n912)
         );
  AOI2BB2X1 U1855 ( .B0(n1680), .B1(n801), .A0N(n201), .A1N(n1680), .Y(n913)
         );
  OAI22XL U1856 ( .A0(n1766), .A1(n915), .B0(n185), .B1(n1761), .Y(n914) );
  OAI221XL U1857 ( .A0(n840), .A1(n834), .B0(n169), .B1(n835), .C0(n841), .Y(
        n1257) );
  AOI221XL U1858 ( .A0(\patterns[0][1] ), .A1(n1753), .B0(n1749), .B1(
        \patterns[6][1] ), .C0(n1755), .Y(n840) );
  AOI2BB2X1 U1859 ( .B0(n1682), .B1(n801), .A0N(n185), .A1N(n1682), .Y(n841)
         );
  OAI221XL U1860 ( .A0(n1002), .A1(n1003), .B0(n170), .B1(n1004), .C0(n1005), 
        .Y(n1288) );
  AOI2BB2X1 U1861 ( .B0(n1007), .B1(n1769), .A0N(n1769), .A1N(n178), .Y(n1002)
         );
  AOI2BB2X1 U1862 ( .B0(n1678), .B1(n798), .A0N(n218), .A1N(n1678), .Y(n1005)
         );
  OAI22XL U1863 ( .A0(n1009), .A1(n1744), .B0(n186), .B1(n1740), .Y(n1007) );
  OAI221XL U1864 ( .A0(n901), .A1(n902), .B0(n170), .B1(n903), .C0(n904), .Y(
        n1272) );
  AOI2BB2X1 U1865 ( .B0(n906), .B1(n1774), .A0N(n1774), .A1N(n178), .Y(n901)
         );
  AOI2BB2X1 U1866 ( .B0(n1680), .B1(n798), .A0N(n202), .A1N(n1680), .Y(n904)
         );
  OAI22XL U1867 ( .A0(n908), .A1(n1767), .B0(n186), .B1(n1762), .Y(n906) );
  OAI221XL U1868 ( .A0(n833), .A1(n834), .B0(n170), .B1(n835), .C0(n836), .Y(
        n1256) );
  AOI221XL U1869 ( .A0(\patterns[0][0] ), .A1(n1753), .B0(n1750), .B1(
        \patterns[6][0] ), .C0(n1754), .Y(n833) );
  AOI2BB2X1 U1870 ( .B0(n1682), .B1(n798), .A0N(n186), .A1N(n1682), .Y(n836)
         );
  OAI211X1 U1871 ( .A0(n220), .A1(n795), .B0(n796), .C0(n810), .Y(n1247) );
  AOI2BB2X1 U1872 ( .B0(n811), .B1(n1644), .A0N(n164), .A1N(n1644), .Y(n810)
         );
  OAI211X1 U1873 ( .A0(n222), .A1(n795), .B0(n796), .C0(n806), .Y(n1245) );
  AOI2BB2X1 U1874 ( .B0(n807), .B1(n1644), .A0N(n166), .A1N(n1644), .Y(n806)
         );
  OAI211X1 U1875 ( .A0(n223), .A1(n795), .B0(n796), .C0(n804), .Y(n1244) );
  AOI2BB2X1 U1876 ( .B0(n805), .B1(n1644), .A0N(n167), .A1N(n1644), .Y(n804)
         );
  OAI211X1 U1877 ( .A0(n224), .A1(n795), .B0(n796), .C0(n802), .Y(n1243) );
  AOI2BB2X1 U1878 ( .B0(n803), .B1(n1644), .A0N(n168), .A1N(n1644), .Y(n802)
         );
  OAI211X1 U1879 ( .A0(n225), .A1(n795), .B0(n796), .C0(n800), .Y(n1242) );
  AOI2BB2X1 U1880 ( .B0(n801), .B1(n1644), .A0N(n169), .A1N(n1644), .Y(n800)
         );
  OAI211X1 U1881 ( .A0(n795), .A1(n219), .B0(n796), .C0(n1201), .Y(n1576) );
  AOI2BB2X1 U1882 ( .B0(n854), .B1(n1644), .A0N(n163), .A1N(n1644), .Y(n1201)
         );
  OAI211X1 U1883 ( .A0(n795), .A1(n221), .B0(n796), .C0(n808), .Y(n1246) );
  AOI2BB2X1 U1884 ( .B0(n809), .B1(n1644), .A0N(n165), .A1N(n1644), .Y(n808)
         );
  OAI211X1 U1885 ( .A0(n795), .A1(n226), .B0(n796), .C0(n797), .Y(n1241) );
  AOI2BB2X1 U1886 ( .B0(n798), .B1(n1644), .A0N(n170), .A1N(n1644), .Y(n797)
         );
  OAI211X1 U1887 ( .A0(n171), .A1(n1683), .B0(n813), .C0(n824), .Y(n1255) );
  AOI222XL U1888 ( .A0(\patterns[0][7] ), .A1(n1684), .B0(n816), .B1(
        \patterns[7][7] ), .C0(chardata[7]), .C1(n817), .Y(n824) );
  OAI211X1 U1889 ( .A0(n172), .A1(n1683), .B0(n813), .C0(n823), .Y(n1254) );
  AOI222XL U1890 ( .A0(n1684), .A1(\patterns[0][6] ), .B0(n816), .B1(
        \patterns[7][6] ), .C0(n817), .C1(chardata[6]), .Y(n823) );
  OAI211X1 U1891 ( .A0(n173), .A1(n1683), .B0(n813), .C0(n822), .Y(n1253) );
  AOI222XL U1892 ( .A0(n1684), .A1(\patterns[0][5] ), .B0(n816), .B1(
        \patterns[7][5] ), .C0(n817), .C1(chardata[5]), .Y(n822) );
  OAI211X1 U1893 ( .A0(n174), .A1(n1683), .B0(n813), .C0(n821), .Y(n1252) );
  AOI222XL U1894 ( .A0(n1684), .A1(\patterns[0][4] ), .B0(n816), .B1(
        \patterns[7][4] ), .C0(n817), .C1(chardata[4]), .Y(n821) );
  OAI211X1 U1895 ( .A0(n175), .A1(n1683), .B0(n813), .C0(n820), .Y(n1251) );
  AOI222XL U1896 ( .A0(n1684), .A1(\patterns[0][3] ), .B0(n816), .B1(
        \patterns[7][3] ), .C0(n817), .C1(chardata[3]), .Y(n820) );
  OAI211X1 U1897 ( .A0(n176), .A1(n1683), .B0(n813), .C0(n819), .Y(n1250) );
  AOI222XL U1898 ( .A0(n1684), .A1(\patterns[0][2] ), .B0(n816), .B1(
        \patterns[7][2] ), .C0(n817), .C1(chardata[2]), .Y(n819) );
  OAI211X1 U1899 ( .A0(n177), .A1(n1683), .B0(n813), .C0(n818), .Y(n1249) );
  AOI222XL U1900 ( .A0(n1684), .A1(\patterns[0][1] ), .B0(n816), .B1(
        \patterns[7][1] ), .C0(n817), .C1(chardata[1]), .Y(n818) );
  OAI211X1 U1901 ( .A0(n178), .A1(n1683), .B0(n813), .C0(n814), .Y(n1248) );
  AOI222XL U1902 ( .A0(n1684), .A1(\patterns[0][0] ), .B0(n816), .B1(
        \patterns[7][0] ), .C0(n817), .C1(chardata[0]), .Y(n814) );
  OAI211X1 U1903 ( .A0(n219), .A1(n1639), .B0(n1067), .C0(n1068), .Y(n1296) );
  AOI222XL U1904 ( .A0(n1069), .A1(\patterns[7][7] ), .B0(n1070), .B1(n1071), 
        .C0(n1072), .C1(chardata[7]), .Y(n1068) );
  OAI22XL U1905 ( .A0(n171), .A1(n1677), .B0(n1849), .B1(n1074), .Y(n1071) );
  AOI2BB2X1 U1906 ( .B0(n1769), .B1(n1076), .A0N(n179), .A1N(n1769), .Y(n1074)
         );
  OAI211X1 U1907 ( .A0(n220), .A1(n1639), .B0(n1067), .C0(n1084), .Y(n1297) );
  AOI222XL U1908 ( .A0(n1069), .A1(\patterns[7][6] ), .B0(n1070), .B1(n1085), 
        .C0(n1072), .C1(chardata[6]), .Y(n1084) );
  OAI22XL U1909 ( .A0(n172), .A1(n1677), .B0(n1849), .B1(n1086), .Y(n1085) );
  AOI2BB2X1 U1910 ( .B0(n1087), .B1(n1769), .A0N(n180), .A1N(n756), .Y(n1086)
         );
  OAI211X1 U1911 ( .A0(n221), .A1(n1639), .B0(n1067), .C0(n1091), .Y(n1298) );
  AOI222XL U1912 ( .A0(n1069), .A1(\patterns[7][5] ), .B0(n1070), .B1(n1092), 
        .C0(n1072), .C1(chardata[5]), .Y(n1091) );
  OAI22XL U1913 ( .A0(n173), .A1(n1677), .B0(n1849), .B1(n1093), .Y(n1092) );
  AOI2BB2X1 U1914 ( .B0(n1094), .B1(n1770), .A0N(n181), .A1N(n1770), .Y(n1093)
         );
  OAI211X1 U1915 ( .A0(n222), .A1(n1639), .B0(n1067), .C0(n1098), .Y(n1299) );
  AOI222XL U1916 ( .A0(n1069), .A1(\patterns[7][4] ), .B0(n1070), .B1(n1099), 
        .C0(n1072), .C1(chardata[4]), .Y(n1098) );
  OAI22XL U1917 ( .A0(n174), .A1(n1677), .B0(n1849), .B1(n1100), .Y(n1099) );
  AOI2BB2X1 U1918 ( .B0(n1101), .B1(n1770), .A0N(n182), .A1N(n1770), .Y(n1100)
         );
  OAI211X1 U1919 ( .A0(n223), .A1(n1639), .B0(n1067), .C0(n1105), .Y(n1300) );
  AOI222XL U1920 ( .A0(n1069), .A1(\patterns[7][3] ), .B0(n1070), .B1(n1106), 
        .C0(n1072), .C1(chardata[3]), .Y(n1105) );
  OAI22XL U1921 ( .A0(n175), .A1(n1677), .B0(n1849), .B1(n1107), .Y(n1106) );
  AOI2BB2X1 U1922 ( .B0(n1108), .B1(n1769), .A0N(n183), .A1N(n1770), .Y(n1107)
         );
  OAI211X1 U1923 ( .A0(n224), .A1(n1639), .B0(n1067), .C0(n1112), .Y(n1301) );
  AOI222XL U1924 ( .A0(n1069), .A1(\patterns[7][2] ), .B0(n1070), .B1(n1113), 
        .C0(n1072), .C1(chardata[2]), .Y(n1112) );
  OAI22XL U1925 ( .A0(n176), .A1(n1677), .B0(n1849), .B1(n1114), .Y(n1113) );
  AOI2BB2X1 U1926 ( .B0(n1115), .B1(n1770), .A0N(n184), .A1N(n1770), .Y(n1114)
         );
  OAI211X1 U1927 ( .A0(n225), .A1(n1639), .B0(n1067), .C0(n1119), .Y(n1302) );
  AOI222XL U1928 ( .A0(n1069), .A1(\patterns[7][1] ), .B0(n1070), .B1(n1120), 
        .C0(n1072), .C1(chardata[1]), .Y(n1119) );
  OAI22XL U1929 ( .A0(n177), .A1(n1677), .B0(n1849), .B1(n1121), .Y(n1120) );
  AOI2BB2X1 U1930 ( .B0(n1122), .B1(n1770), .A0N(n185), .A1N(n1769), .Y(n1121)
         );
  OAI211X1 U1931 ( .A0(n226), .A1(n1639), .B0(n1067), .C0(n1126), .Y(n1303) );
  AOI222XL U1932 ( .A0(n1069), .A1(\patterns[7][0] ), .B0(n1070), .B1(n1127), 
        .C0(n1072), .C1(chardata[0]), .Y(n1126) );
  OAI22XL U1933 ( .A0(n178), .A1(n1677), .B0(n1849), .B1(n1128), .Y(n1127) );
  AOI2BB2X1 U1934 ( .B0(n1129), .B1(n1769), .A0N(n186), .A1N(n756), .Y(n1128)
         );
  NOR2X1 U1935 ( .A(n1841), .B(isstring), .Y(n1215) );
  OAI22XL U1936 ( .A0(n479), .A1(n1646), .B0(n1734), .B1(n1807), .Y(n1557) );
  OAI22XL U1937 ( .A0(n478), .A1(n1646), .B0(n1732), .B1(n1807), .Y(n1556) );
  OAI22XL U1938 ( .A0(n477), .A1(n1646), .B0(n1730), .B1(n1807), .Y(n1555) );
  OAI22XL U1939 ( .A0(n476), .A1(n1646), .B0(n1728), .B1(n1807), .Y(n1554) );
  OAI22XL U1940 ( .A0(n475), .A1(n1646), .B0(n1726), .B1(n1807), .Y(n1553) );
  OAI22XL U1941 ( .A0(n474), .A1(n1646), .B0(n1724), .B1(n1807), .Y(n1552) );
  OAI22XL U1942 ( .A0(n473), .A1(n1646), .B0(n1722), .B1(n1807), .Y(n1551) );
  OAI22XL U1943 ( .A0(n472), .A1(n1646), .B0(n1720), .B1(n1807), .Y(n1550) );
  OAI22XL U1944 ( .A0(n471), .A1(n1647), .B0(n1734), .B1(n1794), .Y(n1549) );
  OAI22XL U1945 ( .A0(n470), .A1(n1647), .B0(n1732), .B1(n1794), .Y(n1548) );
  OAI22XL U1946 ( .A0(n469), .A1(n1647), .B0(n1730), .B1(n1794), .Y(n1547) );
  OAI22XL U1947 ( .A0(n468), .A1(n1647), .B0(n1728), .B1(n1794), .Y(n1546) );
  OAI22XL U1948 ( .A0(n467), .A1(n1647), .B0(n1726), .B1(n1794), .Y(n1545) );
  OAI22XL U1949 ( .A0(n466), .A1(n1647), .B0(n1724), .B1(n1794), .Y(n1544) );
  OAI22XL U1950 ( .A0(n465), .A1(n1647), .B0(n1722), .B1(n1794), .Y(n1543) );
  OAI22XL U1951 ( .A0(n464), .A1(n1647), .B0(n1720), .B1(n1794), .Y(n1542) );
  OAI22XL U1952 ( .A0(n463), .A1(n1648), .B0(n1734), .B1(n1811), .Y(n1541) );
  OAI22XL U1953 ( .A0(n462), .A1(n1648), .B0(n1732), .B1(n1811), .Y(n1540) );
  OAI22XL U1954 ( .A0(n461), .A1(n1648), .B0(n1730), .B1(n1811), .Y(n1539) );
  OAI22XL U1955 ( .A0(n460), .A1(n1648), .B0(n1728), .B1(n1811), .Y(n1538) );
  OAI22XL U1956 ( .A0(n459), .A1(n1648), .B0(n1726), .B1(n1811), .Y(n1537) );
  OAI22XL U1957 ( .A0(n458), .A1(n1648), .B0(n1724), .B1(n1811), .Y(n1536) );
  OAI22XL U1958 ( .A0(n457), .A1(n1648), .B0(n1722), .B1(n1811), .Y(n1535) );
  OAI22XL U1959 ( .A0(n456), .A1(n1648), .B0(n1720), .B1(n1811), .Y(n1534) );
  OAI22XL U1960 ( .A0(n455), .A1(n1649), .B0(n1734), .B1(n1790), .Y(n1533) );
  OAI22XL U1961 ( .A0(n454), .A1(n1649), .B0(n1732), .B1(n1790), .Y(n1532) );
  OAI22XL U1962 ( .A0(n453), .A1(n1649), .B0(n1730), .B1(n1790), .Y(n1531) );
  OAI22XL U1963 ( .A0(n452), .A1(n1649), .B0(n1728), .B1(n1790), .Y(n1530) );
  OAI22XL U1964 ( .A0(n451), .A1(n1649), .B0(n1726), .B1(n1790), .Y(n1529) );
  OAI22XL U1965 ( .A0(n450), .A1(n1649), .B0(n1724), .B1(n1790), .Y(n1528) );
  OAI22XL U1966 ( .A0(n449), .A1(n1649), .B0(n1722), .B1(n1790), .Y(n1527) );
  OAI22XL U1967 ( .A0(n448), .A1(n1649), .B0(n1720), .B1(n1790), .Y(n1526) );
  OAI22XL U1968 ( .A0(n447), .A1(n1650), .B0(n1734), .B1(n1815), .Y(n1525) );
  OAI22XL U1969 ( .A0(n446), .A1(n1650), .B0(n1732), .B1(n1815), .Y(n1524) );
  OAI22XL U1970 ( .A0(n445), .A1(n1650), .B0(n1730), .B1(n1815), .Y(n1523) );
  OAI22XL U1971 ( .A0(n444), .A1(n1650), .B0(n1728), .B1(n1815), .Y(n1522) );
  OAI22XL U1972 ( .A0(n443), .A1(n1650), .B0(n1726), .B1(n1815), .Y(n1521) );
  OAI22XL U1973 ( .A0(n442), .A1(n1650), .B0(n1724), .B1(n1815), .Y(n1520) );
  OAI22XL U1974 ( .A0(n441), .A1(n1650), .B0(n1722), .B1(n1815), .Y(n1519) );
  OAI22XL U1975 ( .A0(n440), .A1(n1650), .B0(n1720), .B1(n1815), .Y(n1518) );
  OAI22XL U1976 ( .A0(n439), .A1(n1651), .B0(n1734), .B1(n1786), .Y(n1517) );
  OAI22XL U1977 ( .A0(n438), .A1(n1651), .B0(n1732), .B1(n1786), .Y(n1516) );
  OAI22XL U1978 ( .A0(n437), .A1(n1651), .B0(n1730), .B1(n1786), .Y(n1515) );
  OAI22XL U1979 ( .A0(n436), .A1(n1651), .B0(n1728), .B1(n1786), .Y(n1514) );
  OAI22XL U1980 ( .A0(n435), .A1(n1651), .B0(n1726), .B1(n1786), .Y(n1513) );
  OAI22XL U1981 ( .A0(n434), .A1(n1651), .B0(n1724), .B1(n1786), .Y(n1512) );
  OAI22XL U1982 ( .A0(n433), .A1(n1651), .B0(n1722), .B1(n1786), .Y(n1511) );
  OAI22XL U1983 ( .A0(n432), .A1(n1651), .B0(n1720), .B1(n1786), .Y(n1510) );
  OAI22XL U1984 ( .A0(n431), .A1(n1652), .B0(n1734), .B1(n1803), .Y(n1509) );
  OAI22XL U1985 ( .A0(n430), .A1(n1652), .B0(n1732), .B1(n1803), .Y(n1508) );
  OAI22XL U1986 ( .A0(n429), .A1(n1652), .B0(n1730), .B1(n1803), .Y(n1507) );
  OAI22XL U1987 ( .A0(n428), .A1(n1652), .B0(n1728), .B1(n1803), .Y(n1506) );
  OAI22XL U1988 ( .A0(n427), .A1(n1652), .B0(n1726), .B1(n1803), .Y(n1505) );
  OAI22XL U1989 ( .A0(n426), .A1(n1652), .B0(n1724), .B1(n1803), .Y(n1504) );
  OAI22XL U1990 ( .A0(n425), .A1(n1652), .B0(n1722), .B1(n1803), .Y(n1503) );
  OAI22XL U1991 ( .A0(n424), .A1(n1652), .B0(n1720), .B1(n1803), .Y(n1502) );
  OAI22XL U1992 ( .A0(n423), .A1(n1653), .B0(n1734), .B1(n1799), .Y(n1501) );
  OAI22XL U1993 ( .A0(n422), .A1(n1653), .B0(n1732), .B1(n1799), .Y(n1500) );
  OAI22XL U1994 ( .A0(n421), .A1(n1653), .B0(n1730), .B1(n1799), .Y(n1499) );
  OAI22XL U1995 ( .A0(n420), .A1(n1653), .B0(n1728), .B1(n1799), .Y(n1498) );
  OAI22XL U1996 ( .A0(n419), .A1(n1653), .B0(n1726), .B1(n1799), .Y(n1497) );
  OAI22XL U1997 ( .A0(n418), .A1(n1653), .B0(n1724), .B1(n1799), .Y(n1496) );
  OAI22XL U1998 ( .A0(n417), .A1(n1653), .B0(n1722), .B1(n1799), .Y(n1495) );
  OAI22XL U1999 ( .A0(n416), .A1(n1653), .B0(n1720), .B1(n1799), .Y(n1494) );
  OAI22XL U2000 ( .A0(n415), .A1(n1654), .B0(n1734), .B1(n1808), .Y(n1493) );
  OAI22XL U2001 ( .A0(n414), .A1(n1654), .B0(n1732), .B1(n1808), .Y(n1492) );
  OAI22XL U2002 ( .A0(n413), .A1(n1654), .B0(n1730), .B1(n1808), .Y(n1491) );
  OAI22XL U2003 ( .A0(n412), .A1(n1654), .B0(n1728), .B1(n1808), .Y(n1490) );
  OAI22XL U2004 ( .A0(n411), .A1(n1654), .B0(n1726), .B1(n1808), .Y(n1489) );
  OAI22XL U2005 ( .A0(n410), .A1(n1654), .B0(n1724), .B1(n1808), .Y(n1488) );
  OAI22XL U2006 ( .A0(n409), .A1(n1654), .B0(n1722), .B1(n1808), .Y(n1487) );
  OAI22XL U2007 ( .A0(n408), .A1(n1654), .B0(n1720), .B1(n1808), .Y(n1486) );
  OAI22XL U2008 ( .A0(n407), .A1(n1655), .B0(n1734), .B1(n1795), .Y(n1485) );
  OAI22XL U2009 ( .A0(n406), .A1(n1655), .B0(n1732), .B1(n1795), .Y(n1484) );
  OAI22XL U2010 ( .A0(n405), .A1(n1655), .B0(n1730), .B1(n1795), .Y(n1483) );
  OAI22XL U2011 ( .A0(n404), .A1(n1655), .B0(n1728), .B1(n1795), .Y(n1482) );
  OAI22XL U2012 ( .A0(n403), .A1(n1655), .B0(n1726), .B1(n1795), .Y(n1481) );
  OAI22XL U2013 ( .A0(n402), .A1(n1655), .B0(n1724), .B1(n1795), .Y(n1480) );
  OAI22XL U2014 ( .A0(n401), .A1(n1655), .B0(n1722), .B1(n1795), .Y(n1479) );
  OAI22XL U2015 ( .A0(n400), .A1(n1655), .B0(n1720), .B1(n1795), .Y(n1478) );
  OAI22XL U2016 ( .A0(n399), .A1(n1656), .B0(n1734), .B1(n1812), .Y(n1477) );
  OAI22XL U2017 ( .A0(n398), .A1(n1656), .B0(n1732), .B1(n1812), .Y(n1476) );
  OAI22XL U2018 ( .A0(n397), .A1(n1656), .B0(n1730), .B1(n1812), .Y(n1475) );
  OAI22XL U2019 ( .A0(n396), .A1(n1656), .B0(n1728), .B1(n1812), .Y(n1474) );
  OAI22XL U2020 ( .A0(n395), .A1(n1656), .B0(n1726), .B1(n1812), .Y(n1473) );
  OAI22XL U2021 ( .A0(n394), .A1(n1656), .B0(n1724), .B1(n1812), .Y(n1472) );
  OAI22XL U2022 ( .A0(n393), .A1(n1656), .B0(n1722), .B1(n1812), .Y(n1471) );
  OAI22XL U2023 ( .A0(n392), .A1(n1656), .B0(n1720), .B1(n1812), .Y(n1470) );
  OAI22XL U2024 ( .A0(n391), .A1(n1657), .B0(n1734), .B1(n1791), .Y(n1469) );
  OAI22XL U2025 ( .A0(n390), .A1(n1657), .B0(n1732), .B1(n1791), .Y(n1468) );
  OAI22XL U2026 ( .A0(n389), .A1(n1657), .B0(n1730), .B1(n1791), .Y(n1467) );
  OAI22XL U2027 ( .A0(n388), .A1(n1657), .B0(n1728), .B1(n1791), .Y(n1466) );
  OAI22XL U2028 ( .A0(n387), .A1(n1657), .B0(n1726), .B1(n1791), .Y(n1465) );
  OAI22XL U2029 ( .A0(n386), .A1(n1657), .B0(n1724), .B1(n1791), .Y(n1464) );
  OAI22XL U2030 ( .A0(n385), .A1(n1657), .B0(n1722), .B1(n1791), .Y(n1463) );
  OAI22XL U2031 ( .A0(n384), .A1(n1657), .B0(n1720), .B1(n1791), .Y(n1462) );
  OAI22XL U2032 ( .A0(n383), .A1(n1658), .B0(n1734), .B1(n1816), .Y(n1461) );
  OAI22XL U2033 ( .A0(n382), .A1(n1658), .B0(n1732), .B1(n1816), .Y(n1460) );
  OAI22XL U2034 ( .A0(n381), .A1(n1658), .B0(n1730), .B1(n1816), .Y(n1459) );
  OAI22XL U2035 ( .A0(n380), .A1(n1658), .B0(n1728), .B1(n1816), .Y(n1458) );
  OAI22XL U2036 ( .A0(n379), .A1(n1658), .B0(n1726), .B1(n1816), .Y(n1457) );
  OAI22XL U2037 ( .A0(n378), .A1(n1658), .B0(n1724), .B1(n1816), .Y(n1456) );
  OAI22XL U2038 ( .A0(n377), .A1(n1658), .B0(n1722), .B1(n1816), .Y(n1455) );
  OAI22XL U2039 ( .A0(n376), .A1(n1658), .B0(n1720), .B1(n1816), .Y(n1454) );
  OAI22XL U2040 ( .A0(n375), .A1(n1659), .B0(n1735), .B1(n1787), .Y(n1453) );
  OAI22XL U2041 ( .A0(n374), .A1(n1659), .B0(n1733), .B1(n1787), .Y(n1452) );
  OAI22XL U2042 ( .A0(n373), .A1(n1659), .B0(n1731), .B1(n1787), .Y(n1451) );
  OAI22XL U2043 ( .A0(n372), .A1(n1659), .B0(n1729), .B1(n1787), .Y(n1450) );
  OAI22XL U2044 ( .A0(n371), .A1(n1659), .B0(n1727), .B1(n1787), .Y(n1449) );
  OAI22XL U2045 ( .A0(n370), .A1(n1659), .B0(n1725), .B1(n1787), .Y(n1448) );
  OAI22XL U2046 ( .A0(n369), .A1(n1659), .B0(n1723), .B1(n1787), .Y(n1447) );
  OAI22XL U2047 ( .A0(n368), .A1(n1659), .B0(n1721), .B1(n1787), .Y(n1446) );
  OAI22XL U2048 ( .A0(n367), .A1(n1660), .B0(n1735), .B1(n1804), .Y(n1445) );
  OAI22XL U2049 ( .A0(n366), .A1(n1660), .B0(n1733), .B1(n1804), .Y(n1444) );
  OAI22XL U2050 ( .A0(n365), .A1(n1660), .B0(n1731), .B1(n1804), .Y(n1443) );
  OAI22XL U2051 ( .A0(n364), .A1(n1660), .B0(n1729), .B1(n1804), .Y(n1442) );
  OAI22XL U2052 ( .A0(n363), .A1(n1660), .B0(n1727), .B1(n1804), .Y(n1441) );
  OAI22XL U2053 ( .A0(n362), .A1(n1660), .B0(n1725), .B1(n1804), .Y(n1440) );
  OAI22XL U2054 ( .A0(n361), .A1(n1660), .B0(n1723), .B1(n1804), .Y(n1439) );
  OAI22XL U2055 ( .A0(n360), .A1(n1660), .B0(n1721), .B1(n1804), .Y(n1438) );
  OAI22XL U2056 ( .A0(n359), .A1(n1661), .B0(n1735), .B1(n1800), .Y(n1437) );
  OAI22XL U2057 ( .A0(n358), .A1(n1661), .B0(n1733), .B1(n1800), .Y(n1436) );
  OAI22XL U2058 ( .A0(n357), .A1(n1661), .B0(n1731), .B1(n1800), .Y(n1435) );
  OAI22XL U2059 ( .A0(n356), .A1(n1661), .B0(n1729), .B1(n1800), .Y(n1434) );
  OAI22XL U2060 ( .A0(n355), .A1(n1661), .B0(n1727), .B1(n1800), .Y(n1433) );
  OAI22XL U2061 ( .A0(n354), .A1(n1661), .B0(n1725), .B1(n1800), .Y(n1432) );
  OAI22XL U2062 ( .A0(n353), .A1(n1661), .B0(n1723), .B1(n1800), .Y(n1431) );
  OAI22XL U2063 ( .A0(n352), .A1(n1661), .B0(n1721), .B1(n1800), .Y(n1430) );
  OAI22XL U2064 ( .A0(n351), .A1(n1662), .B0(n1735), .B1(n1809), .Y(n1429) );
  OAI22XL U2065 ( .A0(n350), .A1(n1662), .B0(n1733), .B1(n1809), .Y(n1428) );
  OAI22XL U2066 ( .A0(n349), .A1(n1662), .B0(n1731), .B1(n1809), .Y(n1427) );
  OAI22XL U2067 ( .A0(n348), .A1(n1662), .B0(n1729), .B1(n1809), .Y(n1426) );
  OAI22XL U2068 ( .A0(n347), .A1(n1662), .B0(n1727), .B1(n1809), .Y(n1425) );
  OAI22XL U2069 ( .A0(n346), .A1(n1662), .B0(n1725), .B1(n1809), .Y(n1424) );
  OAI22XL U2070 ( .A0(n345), .A1(n1662), .B0(n1723), .B1(n1809), .Y(n1423) );
  OAI22XL U2071 ( .A0(n344), .A1(n1662), .B0(n1721), .B1(n1809), .Y(n1422) );
  OAI22XL U2072 ( .A0(n343), .A1(n1663), .B0(n1735), .B1(n1796), .Y(n1421) );
  OAI22XL U2073 ( .A0(n342), .A1(n1663), .B0(n1733), .B1(n1796), .Y(n1420) );
  OAI22XL U2074 ( .A0(n341), .A1(n1663), .B0(n1731), .B1(n1796), .Y(n1419) );
  OAI22XL U2075 ( .A0(n340), .A1(n1663), .B0(n1729), .B1(n1796), .Y(n1418) );
  OAI22XL U2076 ( .A0(n339), .A1(n1663), .B0(n1727), .B1(n1796), .Y(n1417) );
  OAI22XL U2077 ( .A0(n338), .A1(n1663), .B0(n1725), .B1(n1796), .Y(n1416) );
  OAI22XL U2078 ( .A0(n337), .A1(n1663), .B0(n1723), .B1(n1796), .Y(n1415) );
  OAI22XL U2079 ( .A0(n336), .A1(n1663), .B0(n1721), .B1(n1796), .Y(n1414) );
  OAI22XL U2080 ( .A0(n335), .A1(n1664), .B0(n1735), .B1(n1813), .Y(n1413) );
  OAI22XL U2081 ( .A0(n334), .A1(n1664), .B0(n1733), .B1(n1813), .Y(n1412) );
  OAI22XL U2082 ( .A0(n333), .A1(n1664), .B0(n1731), .B1(n1813), .Y(n1411) );
  OAI22XL U2083 ( .A0(n332), .A1(n1664), .B0(n1729), .B1(n1813), .Y(n1410) );
  OAI22XL U2084 ( .A0(n331), .A1(n1664), .B0(n1727), .B1(n1813), .Y(n1409) );
  OAI22XL U2085 ( .A0(n330), .A1(n1664), .B0(n1725), .B1(n1813), .Y(n1408) );
  OAI22XL U2086 ( .A0(n329), .A1(n1664), .B0(n1723), .B1(n1813), .Y(n1407) );
  OAI22XL U2087 ( .A0(n328), .A1(n1664), .B0(n1721), .B1(n1813), .Y(n1406) );
  OAI22XL U2088 ( .A0(n327), .A1(n1665), .B0(n1735), .B1(n1792), .Y(n1405) );
  OAI22XL U2089 ( .A0(n326), .A1(n1665), .B0(n1733), .B1(n1792), .Y(n1404) );
  OAI22XL U2090 ( .A0(n325), .A1(n1665), .B0(n1731), .B1(n1792), .Y(n1403) );
  OAI22XL U2091 ( .A0(n324), .A1(n1665), .B0(n1729), .B1(n1792), .Y(n1402) );
  OAI22XL U2092 ( .A0(n323), .A1(n1665), .B0(n1727), .B1(n1792), .Y(n1401) );
  OAI22XL U2093 ( .A0(n322), .A1(n1665), .B0(n1725), .B1(n1792), .Y(n1400) );
  OAI22XL U2094 ( .A0(n321), .A1(n1665), .B0(n1723), .B1(n1792), .Y(n1399) );
  OAI22XL U2095 ( .A0(n320), .A1(n1665), .B0(n1721), .B1(n1792), .Y(n1398) );
  OAI22XL U2096 ( .A0(n319), .A1(n1666), .B0(n1735), .B1(n1817), .Y(n1397) );
  OAI22XL U2097 ( .A0(n318), .A1(n1666), .B0(n1733), .B1(n1817), .Y(n1396) );
  OAI22XL U2098 ( .A0(n317), .A1(n1666), .B0(n1731), .B1(n1817), .Y(n1395) );
  OAI22XL U2099 ( .A0(n316), .A1(n1666), .B0(n1729), .B1(n1817), .Y(n1394) );
  OAI22XL U2100 ( .A0(n315), .A1(n1666), .B0(n1727), .B1(n1817), .Y(n1393) );
  OAI22XL U2101 ( .A0(n314), .A1(n1666), .B0(n1725), .B1(n1817), .Y(n1392) );
  OAI22XL U2102 ( .A0(n313), .A1(n1666), .B0(n1723), .B1(n1817), .Y(n1391) );
  OAI22XL U2103 ( .A0(n312), .A1(n1666), .B0(n1721), .B1(n1817), .Y(n1390) );
  OAI22XL U2104 ( .A0(n311), .A1(n1667), .B0(n1735), .B1(n1788), .Y(n1389) );
  OAI22XL U2105 ( .A0(n310), .A1(n1667), .B0(n1733), .B1(n1788), .Y(n1388) );
  OAI22XL U2106 ( .A0(n309), .A1(n1667), .B0(n1731), .B1(n1788), .Y(n1387) );
  OAI22XL U2107 ( .A0(n308), .A1(n1667), .B0(n1729), .B1(n1788), .Y(n1386) );
  OAI22XL U2108 ( .A0(n307), .A1(n1667), .B0(n1727), .B1(n1788), .Y(n1385) );
  OAI22XL U2109 ( .A0(n306), .A1(n1667), .B0(n1725), .B1(n1788), .Y(n1384) );
  OAI22XL U2110 ( .A0(n305), .A1(n1667), .B0(n1723), .B1(n1788), .Y(n1383) );
  OAI22XL U2111 ( .A0(n304), .A1(n1667), .B0(n1721), .B1(n1788), .Y(n1382) );
  OAI22XL U2112 ( .A0(n303), .A1(n1668), .B0(n1735), .B1(n1805), .Y(n1381) );
  OAI22XL U2113 ( .A0(n302), .A1(n1668), .B0(n1733), .B1(n1805), .Y(n1380) );
  OAI22XL U2114 ( .A0(n301), .A1(n1668), .B0(n1731), .B1(n1805), .Y(n1379) );
  OAI22XL U2115 ( .A0(n300), .A1(n1668), .B0(n1729), .B1(n1805), .Y(n1378) );
  OAI22XL U2116 ( .A0(n299), .A1(n1668), .B0(n1727), .B1(n1805), .Y(n1377) );
  OAI22XL U2117 ( .A0(n298), .A1(n1668), .B0(n1725), .B1(n1805), .Y(n1376) );
  OAI22XL U2118 ( .A0(n297), .A1(n1668), .B0(n1723), .B1(n1805), .Y(n1375) );
  OAI22XL U2119 ( .A0(n296), .A1(n1668), .B0(n1721), .B1(n1805), .Y(n1374) );
  OAI22XL U2120 ( .A0(n295), .A1(n1669), .B0(n1735), .B1(n1801), .Y(n1373) );
  OAI22XL U2121 ( .A0(n294), .A1(n1669), .B0(n1733), .B1(n1801), .Y(n1372) );
  OAI22XL U2122 ( .A0(n293), .A1(n1669), .B0(n1731), .B1(n1801), .Y(n1371) );
  OAI22XL U2123 ( .A0(n292), .A1(n1669), .B0(n1729), .B1(n1801), .Y(n1370) );
  OAI22XL U2124 ( .A0(n291), .A1(n1669), .B0(n1727), .B1(n1801), .Y(n1369) );
  OAI22XL U2125 ( .A0(n290), .A1(n1669), .B0(n1725), .B1(n1801), .Y(n1368) );
  OAI22XL U2126 ( .A0(n289), .A1(n1669), .B0(n1723), .B1(n1801), .Y(n1367) );
  OAI22XL U2127 ( .A0(n288), .A1(n1669), .B0(n1721), .B1(n1801), .Y(n1366) );
  OAI22XL U2128 ( .A0(n287), .A1(n1670), .B0(n1735), .B1(n1810), .Y(n1365) );
  OAI22XL U2129 ( .A0(n286), .A1(n1670), .B0(n1733), .B1(n1810), .Y(n1364) );
  OAI22XL U2130 ( .A0(n285), .A1(n1670), .B0(n1731), .B1(n1810), .Y(n1363) );
  OAI22XL U2131 ( .A0(n284), .A1(n1670), .B0(n1729), .B1(n1810), .Y(n1362) );
  OAI22XL U2132 ( .A0(n283), .A1(n1670), .B0(n1727), .B1(n1810), .Y(n1361) );
  OAI22XL U2133 ( .A0(n282), .A1(n1670), .B0(n1725), .B1(n1810), .Y(n1360) );
  OAI22XL U2134 ( .A0(n281), .A1(n1670), .B0(n1723), .B1(n1810), .Y(n1359) );
  OAI22XL U2135 ( .A0(n280), .A1(n1670), .B0(n1721), .B1(n1810), .Y(n1358) );
  OAI22XL U2136 ( .A0(n279), .A1(n1671), .B0(n1735), .B1(n1797), .Y(n1357) );
  OAI22XL U2137 ( .A0(n278), .A1(n1671), .B0(n1733), .B1(n1797), .Y(n1356) );
  OAI22XL U2138 ( .A0(n277), .A1(n1671), .B0(n1731), .B1(n1797), .Y(n1355) );
  OAI22XL U2139 ( .A0(n276), .A1(n1671), .B0(n1729), .B1(n1797), .Y(n1354) );
  OAI22XL U2140 ( .A0(n275), .A1(n1671), .B0(n1727), .B1(n1797), .Y(n1353) );
  OAI22XL U2141 ( .A0(n274), .A1(n1671), .B0(n1725), .B1(n1797), .Y(n1352) );
  OAI22XL U2142 ( .A0(n273), .A1(n1671), .B0(n1723), .B1(n1797), .Y(n1351) );
  OAI22XL U2143 ( .A0(n272), .A1(n1671), .B0(n1721), .B1(n1797), .Y(n1350) );
  OAI22XL U2144 ( .A0(n271), .A1(n1672), .B0(n1734), .B1(n1814), .Y(n1349) );
  OAI22XL U2145 ( .A0(n270), .A1(n1672), .B0(n1732), .B1(n1814), .Y(n1348) );
  OAI22XL U2146 ( .A0(n269), .A1(n1672), .B0(n1730), .B1(n1814), .Y(n1347) );
  OAI22XL U2147 ( .A0(n268), .A1(n1672), .B0(n1728), .B1(n1814), .Y(n1346) );
  OAI22XL U2148 ( .A0(n267), .A1(n1672), .B0(n1726), .B1(n1814), .Y(n1345) );
  OAI22XL U2149 ( .A0(n266), .A1(n1672), .B0(n1724), .B1(n1814), .Y(n1344) );
  OAI22XL U2150 ( .A0(n265), .A1(n1672), .B0(n1722), .B1(n1814), .Y(n1343) );
  OAI22XL U2151 ( .A0(n264), .A1(n1672), .B0(n1720), .B1(n1814), .Y(n1342) );
  OAI22XL U2152 ( .A0(n263), .A1(n1673), .B0(n1735), .B1(n1793), .Y(n1341) );
  OAI22XL U2153 ( .A0(n262), .A1(n1673), .B0(n1733), .B1(n1793), .Y(n1340) );
  OAI22XL U2154 ( .A0(n261), .A1(n1673), .B0(n1731), .B1(n1793), .Y(n1339) );
  OAI22XL U2155 ( .A0(n260), .A1(n1673), .B0(n1729), .B1(n1793), .Y(n1338) );
  OAI22XL U2156 ( .A0(n259), .A1(n1673), .B0(n1727), .B1(n1793), .Y(n1337) );
  OAI22XL U2157 ( .A0(n258), .A1(n1673), .B0(n1725), .B1(n1793), .Y(n1336) );
  OAI22XL U2158 ( .A0(n257), .A1(n1673), .B0(n1723), .B1(n1793), .Y(n1335) );
  OAI22XL U2159 ( .A0(n256), .A1(n1673), .B0(n1721), .B1(n1793), .Y(n1334) );
  OAI22XL U2160 ( .A0(n255), .A1(n1674), .B0(n1734), .B1(n1818), .Y(n1333) );
  OAI22XL U2161 ( .A0(n254), .A1(n1674), .B0(n1732), .B1(n1818), .Y(n1332) );
  OAI22XL U2162 ( .A0(n253), .A1(n1674), .B0(n1730), .B1(n1818), .Y(n1331) );
  OAI22XL U2163 ( .A0(n252), .A1(n1674), .B0(n1728), .B1(n1818), .Y(n1330) );
  OAI22XL U2164 ( .A0(n251), .A1(n1674), .B0(n1726), .B1(n1818), .Y(n1329) );
  OAI22XL U2165 ( .A0(n250), .A1(n1674), .B0(n1724), .B1(n1818), .Y(n1328) );
  OAI22XL U2166 ( .A0(n249), .A1(n1674), .B0(n1722), .B1(n1818), .Y(n1327) );
  OAI22XL U2167 ( .A0(n248), .A1(n1674), .B0(n1720), .B1(n1818), .Y(n1326) );
  OAI22XL U2168 ( .A0(n247), .A1(n1675), .B0(n1735), .B1(n1789), .Y(n1325) );
  OAI22XL U2169 ( .A0(n246), .A1(n1675), .B0(n1733), .B1(n1789), .Y(n1324) );
  OAI22XL U2170 ( .A0(n245), .A1(n1675), .B0(n1731), .B1(n1789), .Y(n1323) );
  OAI22XL U2171 ( .A0(n244), .A1(n1675), .B0(n1729), .B1(n1789), .Y(n1322) );
  OAI22XL U2172 ( .A0(n243), .A1(n1675), .B0(n1727), .B1(n1789), .Y(n1321) );
  OAI22XL U2173 ( .A0(n242), .A1(n1675), .B0(n1725), .B1(n1789), .Y(n1320) );
  OAI22XL U2174 ( .A0(n241), .A1(n1675), .B0(n1723), .B1(n1789), .Y(n1319) );
  OAI22XL U2175 ( .A0(n240), .A1(n1675), .B0(n1721), .B1(n1789), .Y(n1318) );
  OAI22XL U2176 ( .A0(n239), .A1(n1676), .B0(n1836), .B1(n1806), .Y(n1317) );
  OAI22XL U2177 ( .A0(n238), .A1(n1676), .B0(n1834), .B1(n1806), .Y(n1316) );
  OAI22XL U2178 ( .A0(n237), .A1(n1676), .B0(n1832), .B1(n1806), .Y(n1315) );
  OAI22XL U2179 ( .A0(n236), .A1(n1676), .B0(n1830), .B1(n1806), .Y(n1314) );
  OAI22XL U2180 ( .A0(n235), .A1(n1676), .B0(n1828), .B1(n1806), .Y(n1313) );
  OAI22XL U2181 ( .A0(n234), .A1(n1676), .B0(n1826), .B1(n1806), .Y(n1312) );
  OAI22XL U2182 ( .A0(n233), .A1(n1676), .B0(n1824), .B1(n1806), .Y(n1311) );
  OAI22XL U2183 ( .A0(n232), .A1(n1676), .B0(n1720), .B1(n1806), .Y(n1310) );
  OAI22XL U2184 ( .A0(n1798), .A1(n1837), .B0(n487), .B1(n1645), .Y(n1565) );
  OAI22XL U2185 ( .A0(n1798), .A1(n1835), .B0(n486), .B1(n1645), .Y(n1564) );
  OAI22XL U2186 ( .A0(n1798), .A1(n1833), .B0(n485), .B1(n1645), .Y(n1563) );
  OAI22XL U2187 ( .A0(n1798), .A1(n1831), .B0(n484), .B1(n1645), .Y(n1562) );
  OAI22XL U2188 ( .A0(n1798), .A1(n1829), .B0(n483), .B1(n1645), .Y(n1561) );
  OAI22XL U2189 ( .A0(n1798), .A1(n1827), .B0(n482), .B1(n1645), .Y(n1560) );
  OAI22XL U2190 ( .A0(n1798), .A1(n1825), .B0(n481), .B1(n1645), .Y(n1559) );
  OAI22XL U2191 ( .A0(n1798), .A1(n1823), .B0(n480), .B1(n1645), .Y(n1558) );
  CLKINVX1 U2192 ( .A(isstring), .Y(n1840) );
  NAND3X1 U2193 ( .A(n1215), .B(n489), .C(isStrPat[1]), .Y(n1185) );
  OAI221XL U2194 ( .A0(n1721), .A1(n1777), .B0(n187), .B1(n1681), .C0(n893), 
        .Y(n1271) );
  AOI2BB2X1 U2195 ( .B0(n868), .B1(n894), .A0N(n163), .A1N(n870), .Y(n893) );
  OAI22XL U2196 ( .A0(n1768), .A1(n895), .B0(n171), .B1(n1761), .Y(n894) );
  AOI221XL U2197 ( .A0(\patterns[0][7] ), .A1(n1752), .B0(n1758), .B1(
        \patterns[5][7] ), .C0(n1756), .Y(n895) );
  OAI221XL U2198 ( .A0(n1824), .A1(n1777), .B0(n188), .B1(n1681), .C0(n890), 
        .Y(n1270) );
  AOI2BB2X1 U2199 ( .B0(n868), .B1(n891), .A0N(n164), .A1N(n870), .Y(n890) );
  OAI22XL U2200 ( .A0(n1767), .A1(n892), .B0(n172), .B1(n1761), .Y(n891) );
  AOI221XL U2201 ( .A0(\patterns[0][6] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[5][6] ), .C0(n1755), .Y(n892) );
  OAI221XL U2202 ( .A0(n1826), .A1(n1777), .B0(n189), .B1(n1681), .C0(n887), 
        .Y(n1269) );
  AOI2BB2X1 U2203 ( .B0(n868), .B1(n888), .A0N(n165), .A1N(n870), .Y(n887) );
  OAI22XL U2204 ( .A0(n1765), .A1(n889), .B0(n173), .B1(n1761), .Y(n888) );
  AOI221XL U2205 ( .A0(\patterns[0][5] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[5][5] ), .C0(n1755), .Y(n889) );
  OAI221XL U2206 ( .A0(n1828), .A1(n1777), .B0(n190), .B1(n1681), .C0(n884), 
        .Y(n1268) );
  AOI2BB2X1 U2207 ( .B0(n868), .B1(n885), .A0N(n166), .A1N(n870), .Y(n884) );
  OAI22XL U2208 ( .A0(n1765), .A1(n886), .B0(n174), .B1(n1761), .Y(n885) );
  AOI221XL U2209 ( .A0(\patterns[0][4] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[5][4] ), .C0(n1755), .Y(n886) );
  OAI221XL U2210 ( .A0(n1830), .A1(n1777), .B0(n191), .B1(n1681), .C0(n881), 
        .Y(n1267) );
  AOI2BB2X1 U2211 ( .B0(n868), .B1(n882), .A0N(n167), .A1N(n870), .Y(n881) );
  OAI22XL U2212 ( .A0(n1765), .A1(n883), .B0(n175), .B1(n1761), .Y(n882) );
  AOI221XL U2213 ( .A0(\patterns[0][3] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[5][3] ), .C0(n1756), .Y(n883) );
  OAI221XL U2214 ( .A0(n1832), .A1(n1777), .B0(n192), .B1(n1681), .C0(n878), 
        .Y(n1266) );
  AOI2BB2X1 U2215 ( .B0(n868), .B1(n879), .A0N(n168), .A1N(n870), .Y(n878) );
  OAI22XL U2216 ( .A0(n1765), .A1(n880), .B0(n176), .B1(n1761), .Y(n879) );
  AOI221XL U2217 ( .A0(\patterns[0][2] ), .A1(n1752), .B0(n1749), .B1(
        \patterns[5][2] ), .C0(n1755), .Y(n880) );
  OAI221XL U2218 ( .A0(n1834), .A1(n1777), .B0(n193), .B1(n1681), .C0(n875), 
        .Y(n1265) );
  AOI2BB2X1 U2219 ( .B0(n868), .B1(n876), .A0N(n169), .A1N(n870), .Y(n875) );
  OAI22XL U2220 ( .A0(n1765), .A1(n877), .B0(n177), .B1(n1761), .Y(n876) );
  AOI221XL U2221 ( .A0(\patterns[0][1] ), .A1(n1752), .B0(n1758), .B1(
        \patterns[5][1] ), .C0(n1756), .Y(n877) );
  OAI221XL U2222 ( .A0(n1836), .A1(n1777), .B0(n194), .B1(n1681), .C0(n867), 
        .Y(n1264) );
  AOI2BB2X1 U2223 ( .B0(n868), .B1(n869), .A0N(n170), .A1N(n870), .Y(n867) );
  OAI22XL U2224 ( .A0(n1765), .A1(n871), .B0(n178), .B1(n1761), .Y(n869) );
  AOI221XL U2225 ( .A0(\patterns[0][0] ), .A1(n1752), .B0(n1750), .B1(
        \patterns[5][0] ), .C0(n1755), .Y(n871) );
  OAI221XL U2226 ( .A0(n1822), .A1(n1776), .B0(n203), .B1(n1679), .C0(n990), 
        .Y(n1287) );
  AOI2BB2X1 U2227 ( .B0(n950), .B1(n991), .A0N(n163), .A1N(n952), .Y(n990) );
  OAI22XL U2228 ( .A0(n1744), .A1(n992), .B0(n171), .B1(n1741), .Y(n991) );
  AOI2BB2X1 U2229 ( .B0(n993), .B1(n1774), .A0N(n1775), .A1N(n179), .Y(n992)
         );
  OAI221XL U2230 ( .A0(n1824), .A1(n1776), .B0(n204), .B1(n1679), .C0(n985), 
        .Y(n1286) );
  AOI2BB2X1 U2231 ( .B0(n950), .B1(n986), .A0N(n164), .A1N(n952), .Y(n985) );
  OAI22XL U2232 ( .A0(n1745), .A1(n987), .B0(n172), .B1(n1741), .Y(n986) );
  AOI2BB2X1 U2233 ( .B0(n988), .B1(n1773), .A0N(n1775), .A1N(n180), .Y(n987)
         );
  OAI221XL U2234 ( .A0(n1826), .A1(n1776), .B0(n205), .B1(n1679), .C0(n980), 
        .Y(n1285) );
  AOI2BB2X1 U2235 ( .B0(n950), .B1(n981), .A0N(n165), .A1N(n952), .Y(n980) );
  OAI22XL U2236 ( .A0(n1744), .A1(n982), .B0(n173), .B1(n1741), .Y(n981) );
  AOI2BB2X1 U2237 ( .B0(n983), .B1(n1773), .A0N(n1775), .A1N(n181), .Y(n982)
         );
  OAI221XL U2238 ( .A0(n1828), .A1(n1776), .B0(n206), .B1(n1679), .C0(n975), 
        .Y(n1284) );
  AOI2BB2X1 U2239 ( .B0(n950), .B1(n976), .A0N(n166), .A1N(n952), .Y(n975) );
  OAI22XL U2240 ( .A0(n1745), .A1(n977), .B0(n174), .B1(n1741), .Y(n976) );
  AOI2BB2X1 U2241 ( .B0(n978), .B1(n1773), .A0N(n1775), .A1N(n182), .Y(n977)
         );
  OAI221XL U2242 ( .A0(n1830), .A1(n1776), .B0(n207), .B1(n1679), .C0(n970), 
        .Y(n1283) );
  AOI2BB2X1 U2243 ( .B0(n950), .B1(n971), .A0N(n167), .A1N(n952), .Y(n970) );
  OAI22XL U2244 ( .A0(n1745), .A1(n972), .B0(n175), .B1(n1741), .Y(n971) );
  AOI2BB2X1 U2245 ( .B0(n973), .B1(n1773), .A0N(n1775), .A1N(n183), .Y(n972)
         );
  OAI221XL U2246 ( .A0(n1832), .A1(n1776), .B0(n208), .B1(n1679), .C0(n965), 
        .Y(n1282) );
  AOI2BB2X1 U2247 ( .B0(n950), .B1(n966), .A0N(n168), .A1N(n952), .Y(n965) );
  OAI22XL U2248 ( .A0(n1745), .A1(n967), .B0(n176), .B1(n1741), .Y(n966) );
  AOI2BB2X1 U2249 ( .B0(n968), .B1(n1773), .A0N(n1775), .A1N(n184), .Y(n967)
         );
  OAI221XL U2250 ( .A0(n1834), .A1(n1776), .B0(n209), .B1(n1679), .C0(n960), 
        .Y(n1281) );
  AOI2BB2X1 U2251 ( .B0(n950), .B1(n961), .A0N(n169), .A1N(n952), .Y(n960) );
  OAI22XL U2252 ( .A0(n1745), .A1(n962), .B0(n177), .B1(n1740), .Y(n961) );
  AOI2BB2X1 U2253 ( .B0(n963), .B1(n1773), .A0N(n1775), .A1N(n185), .Y(n962)
         );
  OAI221XL U2254 ( .A0(n1836), .A1(n1776), .B0(n210), .B1(n1679), .C0(n949), 
        .Y(n1280) );
  AOI2BB2X1 U2255 ( .B0(n950), .B1(n951), .A0N(n170), .A1N(n952), .Y(n949) );
  OAI22XL U2256 ( .A0(n1745), .A1(n953), .B0(n178), .B1(n1740), .Y(n951) );
  AOI2BB2X1 U2257 ( .B0(n955), .B1(n1773), .A0N(n1775), .A1N(n186), .Y(n953)
         );
  CLKINVX1 U2258 ( .A(ispattern), .Y(n1841) );
  BUFX16 U2259 ( .A(n1855), .Y(valid) );
  NOR2X1 U2260 ( .A(n145), .B(current_state[0]), .Y(n1855) );
  OAI222XL U2261 ( .A0(n786), .A1(n787), .B0(n788), .B1(n1820), .C0(n1778), 
        .C1(n1851), .Y(n1239) );
  XOR2X1 U2262 ( .A(n789), .B(n790), .Y(n787) );
  OAI2BB2XL U2263 ( .B0(n791), .B1(n1850), .A0N(n540), .A1N(n792), .Y(n789) );
  XNOR2X1 U2264 ( .A(n539), .B(patterns_num[2]), .Y(n790) );
  OAI222XL U2265 ( .A0(n788), .A1(n1802), .B0(n1212), .B1(n1843), .C0(n792), 
        .C1(n786), .Y(n1579) );
  AOI2BB1X1 U2266 ( .A0N(n524), .A1N(n1641), .B0(n1213), .Y(n1212) );
  OAI22XL U2267 ( .A0(n1184), .A1(n1185), .B0(n1838), .B1(n489), .Y(n1566) );
  OAI22XL U2268 ( .A0(n1184), .A1(n1840), .B0(n488), .B1(n1838), .Y(n1567) );
  CLKINVX1 U2269 ( .A(chardata[7]), .Y(n1823) );
  CLKINVX1 U2270 ( .A(chardata[6]), .Y(n1825) );
  CLKINVX1 U2271 ( .A(chardata[5]), .Y(n1827) );
  CLKINVX1 U2272 ( .A(chardata[4]), .Y(n1829) );
  CLKINVX1 U2273 ( .A(chardata[3]), .Y(n1831) );
  CLKINVX1 U2274 ( .A(chardata[2]), .Y(n1833) );
  CLKINVX1 U2275 ( .A(chardata[1]), .Y(n1835) );
  CLKINVX1 U2276 ( .A(chardata[0]), .Y(n1837) );
  ADDFX2 U2277 ( .A(start_cp_bit[1]), .B(n1686), .CI(\add_185_2/carry [1]), 
        .CO(\add_185_2/carry [2]), .S(N357) );
  OAI21XL U2278 ( .A0(n484), .A1(n586), .B0(n1781), .Y(n672) );
  OAI21XL U2279 ( .A0(n480), .A1(n586), .B0(n1781), .Y(n585) );
  OAI21XL U2280 ( .A0(n481), .A1(n586), .B0(n1781), .Y(n612) );
  OAI21XL U2281 ( .A0(n483), .A1(n586), .B0(n1781), .Y(n652) );
  NOR4X1 U2282 ( .A(n669), .B(n670), .C(n671), .D(n672), .Y(n653) );
  OAI22XL U2283 ( .A0(n591), .A1(n444), .B0(n592), .B1(n436), .Y(n669) );
  OAI22XL U2284 ( .A0(n589), .A1(n460), .B0(n590), .B1(n452), .Y(n670) );
  OAI22XL U2285 ( .A0(n587), .A1(n476), .B0(n588), .B1(n468), .Y(n671) );
  NOR4X1 U2286 ( .A(n582), .B(n583), .C(n584), .D(n585), .Y(n541) );
  OAI22XL U2287 ( .A0(n591), .A1(n440), .B0(n592), .B1(n432), .Y(n582) );
  OAI22XL U2288 ( .A0(n589), .A1(n456), .B0(n590), .B1(n448), .Y(n583) );
  OAI22XL U2289 ( .A0(n587), .A1(n472), .B0(n588), .B1(n464), .Y(n584) );
  NOR4X1 U2290 ( .A(n609), .B(n610), .C(n611), .D(n612), .Y(n593) );
  OAI22XL U2291 ( .A0(n591), .A1(n441), .B0(n592), .B1(n433), .Y(n609) );
  OAI22XL U2292 ( .A0(n589), .A1(n457), .B0(n590), .B1(n449), .Y(n610) );
  OAI22XL U2293 ( .A0(n587), .A1(n473), .B0(n588), .B1(n465), .Y(n611) );
  NOR4X1 U2294 ( .A(n649), .B(n650), .C(n651), .D(n652), .Y(n633) );
  OAI22XL U2295 ( .A0(n591), .A1(n443), .B0(n592), .B1(n435), .Y(n649) );
  OAI22XL U2296 ( .A0(n589), .A1(n459), .B0(n590), .B1(n451), .Y(n650) );
  OAI22XL U2297 ( .A0(n587), .A1(n475), .B0(n588), .B1(n467), .Y(n651) );
  AND3XL U2298 ( .A(match), .B(n1206), .C(star), .Y(n1204) );
  ADDFX2 U2299 ( .A(start_cp_bit[2]), .B(n1685), .CI(\add_185_2/carry [2]), 
        .CO(\add_185_2/carry [3]), .S(N358) );
  OAI222XL U2300 ( .A0(n555), .A1(n242), .B0(n556), .B1(n234), .C0(n557), .C1(
        n250), .Y(n617) );
  OAI221XL U2301 ( .A0(n1186), .A1(n1853), .B0(n1187), .B1(n160), .C0(n1190), 
        .Y(n1569) );
  NAND2X1 U2302 ( .A(N475), .B(n1189), .Y(n1190) );
  OAI221XL U2303 ( .A0(n1186), .A1(n1854), .B0(n1187), .B1(n161), .C0(n1188), 
        .Y(n1568) );
  NAND2X1 U2304 ( .A(N474), .B(n1189), .Y(n1188) );
  OAI221XL U2305 ( .A0(n1186), .A1(n1852), .B0(n1187), .B1(n159), .C0(n1191), 
        .Y(n1570) );
  NAND2X1 U2306 ( .A(N476), .B(n1189), .Y(n1191) );
  OAI221XL U2307 ( .A0(n1186), .A1(start_cp_bit[0]), .B0(n1187), .B1(n162), 
        .C0(n1192), .Y(n1571) );
  NAND2X1 U2308 ( .A(N473), .B(n1189), .Y(n1192) );
  OAI221XL U2309 ( .A0(n1186), .A1(n1595), .B0(n1187), .B1(n149), .C0(n1207), 
        .Y(n1578) );
  NAND2X1 U2310 ( .A(N477), .B(n1189), .Y(n1207) );
  OAI211X1 U2311 ( .A0(n490), .A1(n1197), .B0(n1198), .C0(n1199), .Y(n1575) );
  OA21XL U2312 ( .A0(n1200), .A1(n1196), .B0(n1847), .Y(n1199) );
  OAI21XL U2313 ( .A0(n485), .A1(n586), .B0(n1781), .Y(n692) );
  OAI21XL U2314 ( .A0(n486), .A1(n586), .B0(n1781), .Y(n712) );
  OAI21XL U2315 ( .A0(n487), .A1(n586), .B0(n1781), .Y(n746) );
  OAI21XL U2316 ( .A0(n482), .A1(n586), .B0(n1781), .Y(n632) );
  NOR4X1 U2317 ( .A(n617), .B(n618), .C(n619), .D(n620), .Y(n616) );
  OAI22XL U2318 ( .A0(n553), .A1(n266), .B0(n554), .B1(n258), .Y(n618) );
  OAI22XL U2319 ( .A0(n551), .A1(n282), .B0(n552), .B1(n274), .Y(n619) );
  OAI22XL U2320 ( .A0(n549), .A1(n298), .B0(n550), .B1(n290), .Y(n620) );
  NOR4X1 U2321 ( .A(n689), .B(n690), .C(n691), .D(n692), .Y(n673) );
  OAI22XL U2322 ( .A0(n591), .A1(n445), .B0(n592), .B1(n437), .Y(n689) );
  OAI22XL U2323 ( .A0(n589), .A1(n461), .B0(n590), .B1(n453), .Y(n690) );
  OAI22XL U2324 ( .A0(n587), .A1(n477), .B0(n588), .B1(n469), .Y(n691) );
  NOR4X1 U2325 ( .A(n709), .B(n710), .C(n711), .D(n712), .Y(n693) );
  OAI22XL U2326 ( .A0(n591), .A1(n446), .B0(n592), .B1(n438), .Y(n709) );
  OAI22XL U2327 ( .A0(n589), .A1(n462), .B0(n590), .B1(n454), .Y(n710) );
  OAI22XL U2328 ( .A0(n587), .A1(n478), .B0(n588), .B1(n470), .Y(n711) );
  NOR4X1 U2329 ( .A(n743), .B(n744), .C(n745), .D(n746), .Y(n713) );
  OAI22XL U2330 ( .A0(n591), .A1(n447), .B0(n592), .B1(n439), .Y(n743) );
  OAI22XL U2331 ( .A0(n589), .A1(n463), .B0(n590), .B1(n455), .Y(n744) );
  OAI22XL U2332 ( .A0(n587), .A1(n479), .B0(n588), .B1(n471), .Y(n745) );
  OAI22XL U2333 ( .A0(n1142), .A1(n229), .B0(n160), .B1(n1643), .Y(n1306) );
  OAI22XL U2334 ( .A0(n1142), .A1(n230), .B0(n161), .B1(n1643), .Y(n1307) );
  OAI22XL U2335 ( .A0(n1142), .A1(n231), .B0(n162), .B1(n1643), .Y(n1308) );
  OAI22XL U2336 ( .A0(n1142), .A1(n228), .B0(n159), .B1(n1643), .Y(n1305) );
  OAI22XL U2337 ( .A0(n1142), .A1(n227), .B0(n149), .B1(n1643), .Y(n1304) );
  OAI21XL U2338 ( .A0(n1142), .A1(n492), .B0(n1643), .Y(n1309) );
  OAI2BB2X1 U2339 ( .B0(n766), .B1(n1642), .A0N(N414), .A1N(n1642), .Y(
        pattern_cp_char[4]) );
  NOR3X1 U2340 ( .A(n767), .B(n768), .C(n769), .Y(n766) );
  OAI22XL U2341 ( .A0(n1739), .A1(n190), .B0(n1772), .B1(n198), .Y(n769) );
  OAI2BB2X1 U2342 ( .B0(n758), .B1(n1642), .A0N(N412), .A1N(n1642), .Y(
        pattern_cp_char[6]) );
  NOR3X1 U2343 ( .A(n759), .B(n760), .C(n761), .Y(n758) );
  OAI22XL U2344 ( .A0(n1739), .A1(n188), .B0(n1772), .B1(n196), .Y(n761) );
  OAI22XL U2345 ( .A0(n1193), .A1(n491), .B0(n1195), .B1(n1196), .Y(n1574) );
  OAI22XL U2346 ( .A0(n521), .A1(n1193), .B0(n539), .B1(n1194), .Y(n1577) );
  OAI22XL U2347 ( .A0(n523), .A1(n1193), .B0(n540), .B1(n1194), .Y(n1572) );
  OAI22XL U2348 ( .A0(n524), .A1(n1193), .B0(N329), .B1(n1194), .Y(n1573) );
  OAI2BB1XL U2349 ( .A0N(match), .A1N(star), .B0(n1206), .Y(n1200) );
  NAND2X1 U2350 ( .A(tmp_result), .B(match), .Y(n1196) );
  NOR3X1 U2351 ( .A(n771), .B(n772), .C(n773), .Y(n770) );
  OAI22XL U2352 ( .A0(n1739), .A1(n191), .B0(n1772), .B1(n199), .Y(n773) );
  OAI222XL U2353 ( .A0(n1677), .A1(n177), .B0(n1770), .B1(n185), .C0(n757), 
        .C1(n169), .Y(n779) );
  OAI222XL U2354 ( .A0(n1677), .A1(n171), .B0(n1770), .B1(n179), .C0(n757), 
        .C1(n163), .Y(n751) );
  OAI222XL U2355 ( .A0(n1677), .A1(n173), .B0(n1770), .B1(n181), .C0(n757), 
        .C1(n165), .Y(n763) );
  OAI222XL U2356 ( .A0(n1677), .A1(n176), .B0(n1770), .B1(n184), .C0(n757), 
        .C1(n168), .Y(n775) );
  OAI222XL U2357 ( .A0(n1677), .A1(n178), .B0(n1770), .B1(n186), .C0(n757), 
        .C1(n170), .Y(n783) );
  OAI2BB2X1 U2358 ( .B0(n782), .B1(n1642), .A0N(N418), .A1N(n1642), .Y(
        pattern_cp_char[0]) );
  NOR3X1 U2359 ( .A(n783), .B(n784), .C(n785), .Y(n782) );
  OAI22XL U2360 ( .A0(n1739), .A1(n194), .B0(n1772), .B1(n202), .Y(n785) );
  OAI2BB2X1 U2361 ( .B0(n749), .B1(n1642), .A0N(N411), .A1N(n1642), .Y(
        pattern_cp_char[7]) );
  NOR3X1 U2362 ( .A(n751), .B(n752), .C(n753), .Y(n749) );
  OAI22XL U2363 ( .A0(n1739), .A1(n187), .B0(n1772), .B1(n195), .Y(n753) );
  OAI2BB2X1 U2364 ( .B0(n762), .B1(n1642), .A0N(N413), .A1N(n1642), .Y(
        pattern_cp_char[5]) );
  NOR3X1 U2365 ( .A(n763), .B(n764), .C(n765), .Y(n762) );
  OAI22XL U2366 ( .A0(n1739), .A1(n189), .B0(n1772), .B1(n197), .Y(n765) );
  OAI22XL U2367 ( .A0(n1760), .A1(n209), .B0(n1752), .B1(n217), .Y(n780) );
  OAI22XL U2368 ( .A0(n1760), .A1(n207), .B0(n1751), .B1(n215), .Y(n772) );
  OAI22XL U2369 ( .A0(n1760), .A1(n203), .B0(n1752), .B1(n211), .Y(n752) );
  OAI22XL U2370 ( .A0(n1760), .A1(n204), .B0(n1751), .B1(n212), .Y(n760) );
  OAI22XL U2371 ( .A0(n1760), .A1(n206), .B0(n1751), .B1(n214), .Y(n768) );
  OAI22XL U2372 ( .A0(n1760), .A1(n205), .B0(n1751), .B1(n213), .Y(n764) );
  OAI22XL U2373 ( .A0(n1760), .A1(n208), .B0(n1751), .B1(n216), .Y(n776) );
  OAI22XL U2374 ( .A0(n1760), .A1(n210), .B0(n1752), .B1(n218), .Y(n784) );
  NOR2X1 U2375 ( .A(n523), .B(n1687), .Y(n1139) );
  NOR3X1 U2376 ( .A(n775), .B(n776), .C(n777), .Y(n774) );
  OAI22XL U2377 ( .A0(n1739), .A1(n192), .B0(n1772), .B1(n200), .Y(n777) );
  NOR2X1 U2378 ( .A(n521), .B(n1686), .Y(n1141) );
  NOR3X1 U2379 ( .A(n779), .B(n780), .C(n781), .Y(n778) );
  OAI22XL U2380 ( .A0(n1739), .A1(n193), .B0(n1772), .B1(n201), .Y(n781) );
  AND2X2 U2381 ( .A(n1139), .B(n521), .Y(n1596) );
  CLKBUFX3 U2382 ( .A(n756), .Y(n1769) );
  NAND2X1 U2383 ( .A(n1141), .B(n524), .Y(n756) );
  OAI211X1 U2384 ( .A0(patterns_num[0]), .A1(n1225), .B0(n1217), .C0(n1226), 
        .Y(n1219) );
  NAND2X1 U2385 ( .A(n1850), .B(n1851), .Y(n1225) );
  XNOR2X1 U2386 ( .A(n523), .B(n1227), .Y(n1226) );
  XNOR2X1 U2387 ( .A(n1850), .B(patterns_num[0]), .Y(n1227) );
  XNOR2X1 U2388 ( .A(strings_num[2]), .B(n160), .Y(n1238) );
  XNOR2X1 U2389 ( .A(strings_num[1]), .B(n161), .Y(n1237) );
  OAI22XL U2390 ( .A0(n187), .A1(n1739), .B0(n1746), .B1(n1078), .Y(n1076) );
  AOI2BB2X1 U2391 ( .B0(n1772), .B1(n1080), .A0N(n195), .A1N(n1774), .Y(n1078)
         );
  OAI22XL U2392 ( .A0(n203), .A1(n1761), .B0(n1768), .B1(n1082), .Y(n1080) );
  NOR2X1 U2393 ( .A(\patterns[1][7] ), .B(n1751), .Y(n1082) );
  NAND4X1 U2394 ( .A(n1233), .B(n1234), .C(n1235), .D(n1236), .Y(n1209) );
  XNOR2X1 U2395 ( .A(strings_num[4]), .B(start_cp_bit[4]), .Y(n1233) );
  NOR2X1 U2396 ( .A(n1237), .B(n1238), .Y(n1235) );
  XNOR2X1 U2397 ( .A(strings_num[0]), .B(start_cp_bit[0]), .Y(n1234) );
  OAI21XL U2398 ( .A0(patterns_num[0]), .A1(patterns_num[1]), .B0(
        patterns_num[2]), .Y(n1221) );
  NAND2X1 U2399 ( .A(current_state[0]), .B(n145), .Y(n863) );
  AOI211X1 U2400 ( .A0(n524), .A1(n1685), .B0(n1141), .C0(n1747), .Y(n539) );
  AOI221XL U2401 ( .A0(\patterns[0][0] ), .A1(n1753), .B0(n1750), .B1(
        \patterns[4][0] ), .C0(n1754), .Y(n908) );
  OAI22XL U2402 ( .A0(n1766), .A1(n995), .B0(n187), .B1(n1761), .Y(n993) );
  AOI221XL U2403 ( .A0(\patterns[0][7] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][7] ), .C0(n1755), .Y(n995) );
  OAI22XL U2404 ( .A0(n1766), .A1(n984), .B0(n189), .B1(n1762), .Y(n983) );
  AOI221XL U2405 ( .A0(\patterns[0][5] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][5] ), .C0(n1755), .Y(n984) );
  OAI22XL U2406 ( .A0(n1766), .A1(n979), .B0(n190), .B1(n1762), .Y(n978) );
  AOI221XL U2407 ( .A0(\patterns[0][4] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][4] ), .C0(n1755), .Y(n979) );
  OAI22XL U2408 ( .A0(n1766), .A1(n974), .B0(n191), .B1(n1762), .Y(n973) );
  AOI221XL U2409 ( .A0(\patterns[0][3] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][3] ), .C0(n1755), .Y(n974) );
  OAI22XL U2410 ( .A0(n1763), .A1(n969), .B0(n192), .B1(n1762), .Y(n968) );
  AOI221XL U2411 ( .A0(\patterns[0][2] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][2] ), .C0(n1755), .Y(n969) );
  OAI22XL U2412 ( .A0(n1763), .A1(n956), .B0(n194), .B1(n1762), .Y(n955) );
  AOI221XL U2413 ( .A0(\patterns[0][0] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[3][0] ), .C0(n1755), .Y(n956) );
  AOI221XL U2414 ( .A0(\patterns[0][7] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[4][7] ), .C0(n1754), .Y(n947) );
  AOI221XL U2415 ( .A0(\patterns[0][6] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[4][6] ), .C0(n1754), .Y(n935) );
  AOI2BB2X1 U2416 ( .B0(n1045), .B1(n1775), .A0N(n1775), .A1N(n189), .Y(n1044)
         );
  OAI22XL U2417 ( .A0(n1767), .A1(n1046), .B0(n197), .B1(n1762), .Y(n1045) );
  AOI221XL U2418 ( .A0(\patterns[0][5] ), .A1(n1753), .B0(n1750), .B1(
        \patterns[2][5] ), .C0(n1756), .Y(n1046) );
  AOI221XL U2419 ( .A0(\patterns[0][5] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[4][5] ), .C0(n1754), .Y(n931) );
  AOI221XL U2420 ( .A0(\patterns[0][4] ), .A1(n1753), .B0(n1758), .B1(
        \patterns[4][4] ), .C0(n1754), .Y(n927) );
  AOI221XL U2421 ( .A0(\patterns[0][3] ), .A1(n1753), .B0(n1749), .B1(
        \patterns[4][3] ), .C0(n1754), .Y(n923) );
  AOI221XL U2422 ( .A0(\patterns[0][2] ), .A1(n1753), .B0(n1750), .B1(
        \patterns[4][2] ), .C0(n1754), .Y(n919) );
  AOI221XL U2423 ( .A0(\patterns[0][1] ), .A1(n1753), .B0(n1749), .B1(
        \patterns[4][1] ), .C0(n1755), .Y(n915) );
  OAI22XL U2424 ( .A0(n1766), .A1(n989), .B0(n188), .B1(n1761), .Y(n988) );
  AOI221XL U2425 ( .A0(\patterns[0][6] ), .A1(n1754), .B0(n1758), .B1(
        \patterns[3][6] ), .C0(n1755), .Y(n989) );
  OAI22XL U2426 ( .A0(n1766), .A1(n964), .B0(n193), .B1(n1762), .Y(n963) );
  AOI221XL U2427 ( .A0(\patterns[0][1] ), .A1(n1754), .B0(n1758), .B1(
        \patterns[3][1] ), .C0(n1755), .Y(n964) );
  OAI22XL U2428 ( .A0(n188), .A1(n1739), .B0(n1746), .B1(n1088), .Y(n1087) );
  AOI2BB2X1 U2429 ( .B0(n1089), .B1(n1773), .A0N(n196), .A1N(n1774), .Y(n1088)
         );
  OAI22XL U2430 ( .A0(n204), .A1(n1761), .B0(n1768), .B1(n1090), .Y(n1089) );
  NOR2X1 U2431 ( .A(\patterns[1][6] ), .B(n1751), .Y(n1090) );
  OAI22XL U2432 ( .A0(n189), .A1(n1739), .B0(n1747), .B1(n1095), .Y(n1094) );
  AOI2BB2X1 U2433 ( .B0(n1096), .B1(n1773), .A0N(n197), .A1N(n1774), .Y(n1095)
         );
  OAI22XL U2434 ( .A0(n205), .A1(n1760), .B0(n1768), .B1(n1097), .Y(n1096) );
  NOR2X1 U2435 ( .A(\patterns[1][5] ), .B(n1751), .Y(n1097) );
  OAI22XL U2436 ( .A0(n190), .A1(n1739), .B0(n1746), .B1(n1102), .Y(n1101) );
  AOI2BB2X1 U2437 ( .B0(n1103), .B1(n1773), .A0N(n198), .A1N(n1774), .Y(n1102)
         );
  OAI22XL U2438 ( .A0(n206), .A1(n1760), .B0(n1768), .B1(n1104), .Y(n1103) );
  NOR2X1 U2439 ( .A(\patterns[1][4] ), .B(n1751), .Y(n1104) );
  OAI22XL U2440 ( .A0(n191), .A1(n1739), .B0(n1747), .B1(n1109), .Y(n1108) );
  AOI2BB2X1 U2441 ( .B0(n1110), .B1(n1772), .A0N(n199), .A1N(n1774), .Y(n1109)
         );
  OAI22XL U2442 ( .A0(n207), .A1(n1760), .B0(n1768), .B1(n1111), .Y(n1110) );
  NOR2X1 U2443 ( .A(\patterns[1][3] ), .B(n1751), .Y(n1111) );
  OAI22XL U2444 ( .A0(n192), .A1(n1740), .B0(n1747), .B1(n1116), .Y(n1115) );
  AOI2BB2X1 U2445 ( .B0(n1117), .B1(n1772), .A0N(n200), .A1N(n1774), .Y(n1116)
         );
  OAI22XL U2446 ( .A0(n208), .A1(n1760), .B0(n1768), .B1(n1118), .Y(n1117) );
  NOR2X1 U2447 ( .A(\patterns[1][2] ), .B(n1751), .Y(n1118) );
  OAI22XL U2448 ( .A0(n193), .A1(n1740), .B0(n1747), .B1(n1123), .Y(n1122) );
  AOI2BB2X1 U2449 ( .B0(n1124), .B1(n1772), .A0N(n201), .A1N(n1774), .Y(n1123)
         );
  OAI22XL U2450 ( .A0(n209), .A1(n1761), .B0(n1767), .B1(n1125), .Y(n1124) );
  NOR2X1 U2451 ( .A(\patterns[1][1] ), .B(n1751), .Y(n1125) );
  OAI22XL U2452 ( .A0(n194), .A1(n1740), .B0(n1746), .B1(n1130), .Y(n1129) );
  AOI2BB2X1 U2453 ( .B0(n1131), .B1(n1772), .A0N(n202), .A1N(n1774), .Y(n1130)
         );
  OAI22XL U2454 ( .A0(n210), .A1(n1760), .B0(n1768), .B1(n1132), .Y(n1131) );
  NOR2X1 U2455 ( .A(\patterns[1][0] ), .B(n1751), .Y(n1132) );
  NOR2X1 U2456 ( .A(cnt_num[3]), .B(cnt_num[4]), .Y(n1182) );
  AOI2BB2X1 U2457 ( .B0(n1011), .B1(n1773), .A0N(n1775), .A1N(n194), .Y(n1009)
         );
  OAI22XL U2458 ( .A0(n1013), .A1(n1767), .B0(n202), .B1(n1762), .Y(n1011) );
  AOI221XL U2459 ( .A0(\patterns[0][0] ), .A1(n1753), .B0(n1749), .B1(
        \patterns[2][0] ), .C0(n1756), .Y(n1013) );
  AOI2BB2X1 U2460 ( .B0(n1064), .B1(n1775), .A0N(n1774), .A1N(n187), .Y(n1063)
         );
  OAI22XL U2461 ( .A0(n1765), .A1(n1065), .B0(n195), .B1(n1762), .Y(n1064) );
  AOI221XL U2462 ( .A0(\patterns[0][7] ), .A1(n1754), .B0(n1757), .B1(
        \patterns[2][7] ), .C0(n1756), .Y(n1065) );
  AOI2BB2X1 U2463 ( .B0(n1051), .B1(n1775), .A0N(n1774), .A1N(n188), .Y(n1050)
         );
  OAI22XL U2464 ( .A0(n1766), .A1(n1052), .B0(n196), .B1(n1762), .Y(n1051) );
  AOI221XL U2465 ( .A0(\patterns[0][6] ), .A1(n1754), .B0(n1750), .B1(
        \patterns[2][6] ), .C0(n1756), .Y(n1052) );
  AOI2BB2X1 U2466 ( .B0(n1039), .B1(n1773), .A0N(n1775), .A1N(n190), .Y(n1038)
         );
  OAI22XL U2467 ( .A0(n1767), .A1(n1040), .B0(n198), .B1(n1762), .Y(n1039) );
  AOI221XL U2468 ( .A0(\patterns[0][4] ), .A1(n1754), .B0(n1750), .B1(
        \patterns[2][4] ), .C0(n1756), .Y(n1040) );
  AOI2BB2X1 U2469 ( .B0(n1033), .B1(n1773), .A0N(n1775), .A1N(n191), .Y(n1032)
         );
  OAI22XL U2470 ( .A0(n1767), .A1(n1034), .B0(n199), .B1(n1762), .Y(n1033) );
  AOI221XL U2471 ( .A0(\patterns[0][3] ), .A1(n1754), .B0(n1750), .B1(
        \patterns[2][3] ), .C0(n1756), .Y(n1034) );
  AOI2BB2X1 U2472 ( .B0(n1027), .B1(n1773), .A0N(n1775), .A1N(n192), .Y(n1026)
         );
  OAI22XL U2473 ( .A0(n1766), .A1(n1028), .B0(n200), .B1(n1762), .Y(n1027) );
  AOI221XL U2474 ( .A0(\patterns[0][2] ), .A1(n1754), .B0(n1750), .B1(
        \patterns[2][2] ), .C0(n1756), .Y(n1028) );
  AOI2BB2X1 U2475 ( .B0(n1021), .B1(n1773), .A0N(n1775), .A1N(n193), .Y(n1020)
         );
  OAI22XL U2476 ( .A0(n1767), .A1(n1022), .B0(n201), .B1(n1762), .Y(n1021) );
  AOI221XL U2477 ( .A0(\patterns[0][1] ), .A1(n1754), .B0(n1750), .B1(
        \patterns[2][1] ), .C0(n1756), .Y(n1022) );
  ADDFXL U2478 ( .A(start_cp_bit[2]), .B(n1685), .CI(\add_248/carry [2]), .CO(
        \add_248/carry [3]), .S(N475) );
  ADDFXL U2479 ( .A(start_cp_bit[1]), .B(n1686), .CI(\add_248/carry [1]), .CO(
        \add_248/carry [2]), .S(N474) );
  NAND2X1 U2480 ( .A(n1843), .B(n524), .Y(n792) );
  OAI33X1 U2481 ( .A0(n146), .A1(next_state[0]), .A2(n1641), .B0(n147), .B1(
        next_state[1]), .B2(n1847), .Y(N355) );
  OAI32X1 U2482 ( .A0(n1641), .A1(match_done), .A2(n1844), .B0(n1847), .B1(
        n1134), .Y(N344) );
  NAND2X1 U2483 ( .A(current_state[0]), .B(current_state[1]), .Y(N354) );
  OA21XL U2484 ( .A0(match_done), .A1(n1844), .B0(n1846), .Y(N345) );
  AO22X1 U2485 ( .A0(\patterns[3][0] ), .A1(n1637), .B0(\patterns[1][0] ), 
        .B1(n1638), .Y(n1597) );
  AOI221XL U2486 ( .A0(\patterns[5][0] ), .A1(n1635), .B0(\patterns[7][0] ), 
        .B1(n1636), .C0(n1597), .Y(n1600) );
  AO22X1 U2487 ( .A0(\patterns[2][0] ), .A1(n1637), .B0(\patterns[0][0] ), 
        .B1(n1638), .Y(n1598) );
  AOI221XL U2488 ( .A0(\patterns[4][0] ), .A1(n1635), .B0(\patterns[6][0] ), 
        .B1(n1636), .C0(n1598), .Y(n1599) );
  OAI22XL U2489 ( .A0(n1634), .A1(n1600), .B0(n1687), .B1(n1599), .Y(N418) );
  AO22X1 U2490 ( .A0(\patterns[3][1] ), .A1(n1637), .B0(\patterns[1][1] ), 
        .B1(n1638), .Y(n1601) );
  AOI221XL U2491 ( .A0(\patterns[5][1] ), .A1(n1635), .B0(\patterns[7][1] ), 
        .B1(n1636), .C0(n1601), .Y(n1604) );
  AO22X1 U2492 ( .A0(\patterns[2][1] ), .A1(n1637), .B0(\patterns[0][1] ), 
        .B1(n1638), .Y(n1602) );
  AOI221XL U2493 ( .A0(\patterns[4][1] ), .A1(n1635), .B0(\patterns[6][1] ), 
        .B1(n1636), .C0(n1602), .Y(n1603) );
  OAI22XL U2494 ( .A0(n1634), .A1(n1604), .B0(n1687), .B1(n1603), .Y(N417) );
  AO22X1 U2495 ( .A0(\patterns[3][2] ), .A1(n1637), .B0(\patterns[1][2] ), 
        .B1(n1638), .Y(n1605) );
  AOI221XL U2496 ( .A0(\patterns[5][2] ), .A1(n1635), .B0(\patterns[7][2] ), 
        .B1(n1636), .C0(n1605), .Y(n1608) );
  AO22X1 U2497 ( .A0(\patterns[2][2] ), .A1(n1637), .B0(\patterns[0][2] ), 
        .B1(n1638), .Y(n1606) );
  AOI221XL U2498 ( .A0(\patterns[4][2] ), .A1(n1635), .B0(\patterns[6][2] ), 
        .B1(n1636), .C0(n1606), .Y(n1607) );
  OAI22XL U2499 ( .A0(n1634), .A1(n1608), .B0(n1687), .B1(n1607), .Y(N416) );
  AO22X1 U2500 ( .A0(\patterns[3][3] ), .A1(n1637), .B0(\patterns[1][3] ), 
        .B1(n1638), .Y(n1609) );
  AOI221XL U2501 ( .A0(\patterns[5][3] ), .A1(n1635), .B0(\patterns[7][3] ), 
        .B1(n1636), .C0(n1609), .Y(n1612) );
  AO22X1 U2502 ( .A0(\patterns[2][3] ), .A1(n1637), .B0(\patterns[0][3] ), 
        .B1(n1638), .Y(n1610) );
  AOI221XL U2503 ( .A0(\patterns[4][3] ), .A1(n1635), .B0(\patterns[6][3] ), 
        .B1(n1636), .C0(n1610), .Y(n1611) );
  OAI22XL U2504 ( .A0(n1634), .A1(n1612), .B0(n1687), .B1(n1611), .Y(N415) );
  AO22X1 U2505 ( .A0(\patterns[3][4] ), .A1(n1637), .B0(\patterns[1][4] ), 
        .B1(n1638), .Y(n1613) );
  AOI221XL U2506 ( .A0(\patterns[5][4] ), .A1(n1635), .B0(\patterns[7][4] ), 
        .B1(n1636), .C0(n1613), .Y(n1616) );
  AO22X1 U2507 ( .A0(\patterns[2][4] ), .A1(n1637), .B0(\patterns[0][4] ), 
        .B1(n1638), .Y(n1614) );
  AOI221XL U2508 ( .A0(\patterns[4][4] ), .A1(n1635), .B0(\patterns[6][4] ), 
        .B1(n1636), .C0(n1614), .Y(n1615) );
  OAI22XL U2509 ( .A0(n1634), .A1(n1616), .B0(n1687), .B1(n1615), .Y(N414) );
  AO22X1 U2510 ( .A0(\patterns[3][5] ), .A1(n1637), .B0(\patterns[1][5] ), 
        .B1(n1638), .Y(n1617) );
  AOI221XL U2511 ( .A0(\patterns[5][5] ), .A1(n1635), .B0(\patterns[7][5] ), 
        .B1(n1636), .C0(n1617), .Y(n1620) );
  AO22X1 U2512 ( .A0(\patterns[2][5] ), .A1(n1637), .B0(\patterns[0][5] ), 
        .B1(n1638), .Y(n1618) );
  AOI221XL U2513 ( .A0(\patterns[4][5] ), .A1(n1635), .B0(\patterns[6][5] ), 
        .B1(n1636), .C0(n1618), .Y(n1619) );
  OAI22XL U2514 ( .A0(n1634), .A1(n1620), .B0(n1687), .B1(n1619), .Y(N413) );
  AO22X1 U2515 ( .A0(\patterns[3][6] ), .A1(n1637), .B0(\patterns[1][6] ), 
        .B1(n1638), .Y(n1621) );
  AOI221XL U2516 ( .A0(\patterns[5][6] ), .A1(n1635), .B0(\patterns[7][6] ), 
        .B1(n1636), .C0(n1621), .Y(n1624) );
  AO22X1 U2517 ( .A0(\patterns[2][6] ), .A1(n1637), .B0(\patterns[0][6] ), 
        .B1(n1638), .Y(n1622) );
  AOI221XL U2518 ( .A0(\patterns[4][6] ), .A1(n1635), .B0(\patterns[6][6] ), 
        .B1(n1636), .C0(n1622), .Y(n1623) );
  OAI22XL U2519 ( .A0(n1634), .A1(n1624), .B0(n1687), .B1(n1623), .Y(N412) );
  AO22X1 U2520 ( .A0(\patterns[3][7] ), .A1(n1637), .B0(\patterns[1][7] ), 
        .B1(n1638), .Y(n1625) );
  AOI221XL U2521 ( .A0(\patterns[5][7] ), .A1(n1635), .B0(\patterns[7][7] ), 
        .B1(n1636), .C0(n1625), .Y(n1632) );
  AO22X1 U2522 ( .A0(\patterns[2][7] ), .A1(n1637), .B0(\patterns[0][7] ), 
        .B1(n1638), .Y(n1628) );
  AOI221XL U2523 ( .A0(\patterns[4][7] ), .A1(n1635), .B0(\patterns[6][7] ), 
        .B1(n1636), .C0(n1628), .Y(n1631) );
  OAI22XL U2524 ( .A0(n1632), .A1(n1634), .B0(n1687), .B1(n1631), .Y(N411) );
  XOR2X1 U2525 ( .A(n1594), .B(\sub_255/carry [3]), .Y(N496) );
  AND2X1 U2526 ( .A(\sub_255/carry [2]), .B(n1591), .Y(\sub_255/carry [3]) );
  AND2X1 U2527 ( .A(n1687), .B(n1593), .Y(\sub_255/carry [2]) );
  XOR2X1 U2528 ( .A(n1593), .B(n1687), .Y(N494) );
  XOR2X1 U2529 ( .A(start_cp_bit[4]), .B(\add_248/carry [4]), .Y(N477) );
  AND2X1 U2530 ( .A(start_cp_bit[0]), .B(n1687), .Y(\add_248/carry [1]) );
  XOR2X1 U2531 ( .A(n1687), .B(start_cp_bit[0]), .Y(N473) );
  AND2X1 U2532 ( .A(\add_185_2/carry [4]), .B(start_cp_bit[4]), .Y(N362) );
  XOR2X1 U2533 ( .A(start_cp_bit[4]), .B(\add_185_2/carry [4]), .Y(N360) );
  AND2X1 U2534 ( .A(\add_185_2/carry [3]), .B(start_cp_bit[3]), .Y(
        \add_185_2/carry [4]) );
  XOR2X1 U2535 ( .A(start_cp_bit[3]), .B(\add_185_2/carry [3]), .Y(N359) );
  AND2X1 U2536 ( .A(start_cp_bit[0]), .B(n1687), .Y(\add_185_2/carry [1]) );
  XOR2X1 U2537 ( .A(n1687), .B(start_cp_bit[0]), .Y(N356) );
endmodule

