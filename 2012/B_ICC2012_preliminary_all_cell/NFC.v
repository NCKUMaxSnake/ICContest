`timescale 1ns/100ps
module NFC(clk, rst, done, F_IO_A, F_CLE_A, F_ALE_A, F_REN_A, F_WEN_A, F_RB_A, F_IO_B, F_CLE_B, F_ALE_B, F_REN_B, F_WEN_B, F_RB_B);

  input clk;
  input rst;
  output done;
  inout [7:0] F_IO_A;
  output F_CLE_A;
  output F_ALE_A;
  output F_REN_A;
  output F_WEN_A;
  input  F_RB_A;
  inout [7:0] F_IO_B;
  output F_CLE_B;
  output F_ALE_B;
  output F_REN_B;
  output F_WEN_B;
  input  F_RB_B;
endmodule
