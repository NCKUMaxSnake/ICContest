wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/max.chen/ICCONTEST/2014/STI_DAC.fsdb}
wvResizeWindow -win $_nWave1 5 31 1836 648
wvResizeWindow -win $_nWave1 5 31 1273 648
wvResizeWindow -win $_nWave1 -8 31 1287 648
wvResizeWindow -win $_nWave1 1 31 1306 648
wvResizeWindow -win $_nWave1 1 31 1278 648
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/out_data\[31:0\]} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/out_data\[31:0\]} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/out_data\[31:0\]} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/out_data\[31:0\]} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 82545.173861 -snap {("G1" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 16553.774704 -snap {("G2" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/cnt_bits\[4:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 114534.224978 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 101783.344463 -snap {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 163748.149773 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 99993.747198 -snap {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 136680.491136 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 58161.911122 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 100888.545830 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 262064.149535 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 259603.453295 -snap {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetCursor -win $_nWave1 731676.841911 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 237647.058824
wvSetCursor -win $_nWave1 644299.755434 -snap {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 706040.861086 -snap {("G2" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 9 )} 
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 5027403.747533 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 7280000.519475 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 10116064.785634 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetCursor -win $_nWave1 10336878.718199 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 15043743.225557 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvResizeWindow -win $_nWave1 1 105 1278 809
wvResizeWindow -win $_nWave1 5 74 1278 769
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetCursor -win $_nWave1 15135818.004855 -snap {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetCursor -win $_nWave1 18047940.154784 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 18530012.918119 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 18019306.598539 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 17955775.895622 -snap {("G2" 7)}
wvResizeWindow -win $_nWave1 -1 31 1278 648
wvSetCursor -win $_nWave1 18020201.397172 -snap {("G2" 8)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvSetPosition -win $_nWave1 {("G1" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 )} 
wvSetPosition -win $_nWave1 {("G1" 11)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 18042213.443538 -snap {("G1" 11)}
wvSetCursor -win $_nWave1 18018836.829262 -snap {("G2" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 18038276.329551 -snap {("G2" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1280 657
wvSetCursor -win $_nWave1 18016079.141828 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18056676.185730 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 18073731.384750 -snap {("G2" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18179552.788130 -snap {("G2" 7)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 18190511.895935 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18176922.602257 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 18186128.252813 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 18180429.516754 -snap {("G2" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvShowFilterTextField -win $_nWave1 -on
wvSetCursor -win $_nWave1 -end
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/PROC"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 18298411.145556 -snap {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18195927.281106 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18179927.857143 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18195781.831797 -snap {("G2" 7)}
wvResizeWindow -win $_nWave1 0 23 1280 657
wvSetCursor -win $_nWave1 18187861.314875 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18179451.473587 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18194808.575070 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18188958.250695 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18177988.892493 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18187130.024328 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18194808.575070 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18204315.352178 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18211993.902919 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18220403.744208 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18228082.294949 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18233932.619323 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 18242708.105885 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 18235395.200417 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 18244170.686979 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18254043.109361 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 18227716.649676 -snap {("G2" 7)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 18308231.738872 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18284099.150827 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18306769.157778 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 18317007.225433 -snap {("G2" 9)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_rtl/DAC"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_rtl/DAC/clk} \
{/testfixture1/u_rtl/DAC/reset} \
{/testfixture1/u_rtl/DAC/cur_state\[2:0\]} \
{/testfixture1/u_rtl/DAC/so_data} \
{/testfixture1/u_rtl/DAC/so_valid} \
{/testfixture1/u_rtl/DAC/oem_dataout\[7:0\]} \
{/testfixture1/u_rtl/DAC/wr_cnt\[7:0\]} \
{/testfixture1/u_rtl/DAC/oem_addr\[4:0\]} \
{/testfixture1/u_rtl/pi_end} \
{/testfixture1/u_rtl/pi_data\[15:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_rtl/DAC/mem_sel\[7:0\]} \
{/testfixture1/u_rtl/DAC/cnt_bits\[2:0\]} \
{/testfixture1/ODD1_MEM\[0:31\]} \
{/testfixture1/EVEN1_MEM\[0:31\]} \
{/testfixture1/ODD2_MEM\[0:31\]} \
{/testfixture1/EVEN2_MEM\[0:31\]} \
{/testfixture1/ODD3_MEM\[0:31\]} \
{/testfixture1/EVEN3_MEM\[0:31\]} \
{/testfixture1/ODD4_MEM\[0:31\]} \
{/testfixture1/EVEN4_MEM\[0:31\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvResizeWindow -win $_nWave1 0 23 1280 657
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSaveSignal -win $_nWave1 "/home/max.chen/ICCONTEST/2014/signal.rc"
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 12)}
wvExit
