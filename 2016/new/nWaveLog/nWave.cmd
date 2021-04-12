wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/max.chen/ICCONTEST/2016/new/LBP.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_lbp_mem"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 8 9 10 11 12 13 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G3" 8)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 26 96 1716 829
wvResizeWindow -win $_nWave1 26 96 1716 829
wvResizeWindow -win $_nWave1 1 31 1741 899
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetCursor -win $_nWave1 4117.694961 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 5624.168727 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetCursor -win $_nWave1 7867.140778 -snap {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetCursor -win $_nWave1 34046.307111 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 19082.001036 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/READ/reset} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvSetPosition -win $_nWave1 {("G3" 9)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 5624.168726 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetCursor -win $_nWave1 9474.046128 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 3649.014233 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 3682.491428 -snap {("G2" 6)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 10 )} 
wvSetPosition -win $_nWave1 {("G3" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 3481.628259 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14328.239374 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 41243.903993 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 15499.941192 -snap {("G3" 4)}
wvSetCursor -win $_nWave1 4285.080934 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 4988.102025 -snap {("G3" 6)}
wvSetCursor -win $_nWave1 6193.281038 -snap {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G3" 8 )} 
wvSetCursor -win $_nWave1 19383.295789 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14160.853400 -snap {("G3" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetCursor -win $_nWave1 26480.461086 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1272.133402 -snap {("G4" 0)}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetCursor -win $_nWave1 15667.327166 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 28169.385564 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 40622.902029 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 52050.342474 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 787240684.142874 -snap {("G3" 5)}
wvSetCursor -win $_nWave1 787253137.659340 -snap {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetCursor -win $_nWave1 17006.414958 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 1539.950961 -snap {("G3" 9)}
wvSetCursor -win $_nWave1 16805.551789 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 2276.449246 -snap {("G3" 10)}
wvGetSignalOpen -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_lbp_mem"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/WRITE"
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G4" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 21224.541503 -snap {("G4" 6)}
wvSetCursor -win $_nWave1 27183.482177 -snap {("G4" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 15801.235945 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 25677.008411 -snap {("G4" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 15499.941192 -snap {("G3" 9)}
wvSetCursor -win $_nWave1 18780.706282 -snap {("G4" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetCursor -win $_nWave1 15700.804361 -snap {("G3" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvSetPosition -win $_nWave1 {("G4" 19)}
wvSetPosition -win $_nWave1 {("G4" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 11 12 13 14 15 16 17 18 19 )} 
wvSetPosition -win $_nWave1 {("G4" 19)}
wvSetPosition -win $_nWave1 {("G4" 19)}
wvSetPosition -win $_nWave1 {("G4" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 11 12 13 14 15 16 17 18 19 )} 
wvSetPosition -win $_nWave1 {("G4" 19)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetCursor -win $_nWave1 32941.559683 -snap {("G4" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 15633.849971 -snap {("G2" 2)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 3
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSetPosition -win $_nWave1 {("G3" 20)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 9 )} 
wvScrollUp -win $_nWave1 4
wvGetSignalOpen -win $_nWave1
wvScrollDown -win $_nWave1 2
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 20 )} 
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 16)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 19)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 19)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvScrollDown -win $_nWave1 2
wvSelectSignal -win $_nWave1 {( "G4" 10 )} 
wvSelectGroup -win $_nWave1 {G4}
wvAddSignal -win $_nWave1 "/testfixture/LBP/WRITE/result\[7:0\]"
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 16872.506179 -snap {("G3" 20)}
wvSetCursor -win $_nWave1 14261.284985 -snap {("G3" 8)}
wvSetCursor -win $_nWave1 15700.804361 -snap {("G2" 5)}
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 13290.446335 -snap {("G4" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetCursor -win $_nWave1 2494108.120540 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1628053.490185 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 1628053.490185 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 15600.372776 -snap {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 23)}
wvSetPosition -win $_nWave1 {("G3" 23)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 22 23 )} 
wvSetPosition -win $_nWave1 {("G3" 23)}
wvSetPosition -win $_nWave1 {("G3" 23)}
wvSetPosition -win $_nWave1 {("G3" 23)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 22 23 )} 
wvSetPosition -win $_nWave1 {("G3" 23)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 7
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G2" 3 )} {( "G3" 22 23 )} 
wvSetCursor -win $_nWave1 28294.925044 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 40748.441510 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 3239579.461856 -snap {("G3" 15)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSetPosition -win $_nWave1 {("G3" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
{/testfixture/LBP/CONTROL/next_counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 24 25 )} 
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSetPosition -win $_nWave1 {("G3" 25)}
wvSetPosition -win $_nWave1 {("G3" 25)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_array\[8:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_addr_array\[8:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
{/testfixture/LBP/CONTROL/next_counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G3" 24 25 )} 
wvSetPosition -win $_nWave1 {("G3" 25)}
wvGetSignalClose -win $_nWave1
wvScrollUp -win $_nWave1 9
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 34548.465033 -snap {("G3" 24)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 16805.551789 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 29995.566540 -snap {("G3" 22)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 24 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} {( "G3" 24 )} 
wvSetCursor -win $_nWave1 1578148.083686 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 1597230.084722 -snap {("G3" 19)}
wvSelectSignal -win $_nWave1 {( "G3" 15 )} 
wvSetCursor -win $_nWave1 1592543.277450 -snap {("G3" 13)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1608411.824133 -snap {("G3" 22)}
wvSetCursor -win $_nWave1 5629458.123065 -snap {("G3" 17)}
wvSetCursor -win $_nWave1 180319919.168002 -snap {("G3" 15)}
wvSelectStuckSignals -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollDown -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetSearchMode -win $_nWave1 -value 
wvResizeWindow -win $_nWave1 14 65 1869 899
wvSetSearchMode -win $_nWave1 -value 160
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetSearchMode -win $_nWave1 -value 160
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSetSearchMode -win $_nWave1 -value A0
wvSearchPrev -win $_nWave1
wvSearchPrev -win $_nWave1
wvSetCursor -win $_nWave1 3243012.092174 -snap {("G2" 3)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvZoom -win $_nWave1 3247693.321577 3250903.307453
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 3244871.394621 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 3245471.654946 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 3245171.524784 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 3244871.394621 -snap {("G1" 1)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 3245602.961891 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 3245115.250378 -snap {("G1" 1)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSetCursor -win $_nWave1 3155507.638804 -snap {("G4" 1)}
wvSetCursor -win $_nWave1 3150705.556208 -snap {("G3" 4)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 4
wvScrollUp -win $_nWave1 1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} {( "G3" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} {( "G3" 3 4 )} 
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 3148019.391255 3150795.595256
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 3149569.725776 -snap {("G3" 3)}
wvZoom -win $_nWave1 3147687.828542 3150543.120896
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvSetCursor -win $_nWave1 3149102.960654 -snap {("G3" 6)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 3150133.285288 -snap {("G3" 7)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchPrev -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 1
wvZoom -win $_nWave1 3148799.312177 3151468.979243
wvSetCursor -win $_nWave1 3148694.397576 -snap {("G3" 16)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollDown -win $_nWave1 3
wvScrollDown -win $_nWave1 1
wvSelectGroup -win $_nWave1 {G5}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 4 5 )} 
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvZoom -win $_nWave1 3244.942293 15226.267684
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 6511.399628 -snap {("G5" 1)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/clk} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 8)}
wvSetPosition -win $_nWave1 {("G3" 9)}
wvSetPosition -win $_nWave1 {("G3" 10)}
wvSetPosition -win $_nWave1 {("G3" 11)}
wvSetPosition -win $_nWave1 {("G3" 12)}
wvSetPosition -win $_nWave1 {("G3" 13)}
wvSetPosition -win $_nWave1 {("G3" 14)}
wvSetPosition -win $_nWave1 {("G3" 15)}
wvSetPosition -win $_nWave1 {("G3" 17)}
wvSetPosition -win $_nWave1 {("G3" 18)}
wvSetPosition -win $_nWave1 {("G3" 20)}
wvSetPosition -win $_nWave1 {("G3" 21)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 9)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G4" 11)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 3)}
wvZoom -win $_nWave1 7071.520026 18413.958087
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 7489.820312 -snap {("G5" 3)}
wvZoom -win $_nWave1 6097.906803 9511.408981
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 6183.700074 9135.918173
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 7573.550012 -snap {("G5" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4502.725633 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 5589.590441 -snap {("G5" 3)}
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvSetCursor -win $_nWave1 4364.711055 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 5606.842264 -snap {("G5" 3)}
wvSetCursor -win $_nWave1 4381.962877 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 4502.725633 -snap {("G5" 3)}
wvSetCursor -win $_nWave1 4485.473811 -snap {("G5" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/clk} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_addr_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetCursor -win $_nWave1 4554.481100 -snap {("G5" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetCursor -win $_nWave1 4330.207410 -snap {("G5" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/clk} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req_reg} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/clk} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req_reg} \
{/testfixture/LBP/gray_addr_reg\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSelectSignal -win $_nWave1 {( "G5" 3 )} 
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvZoom -win $_nWave1 4830.510258 9022.703089
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 4311.619800 39980.474508
wvZoom -win $_nWave1 5171.424187 7568.454598
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/clk} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_addr_reg\[13:0\]} \
{/testfixture/LBP/gray_req_reg} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetCursor -win $_nWave1 4482.394341 -snap {("G5" 5)}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectGroup -win $_nWave1 {G6}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvExpandBus -win $_nWave1 {("G5" 4)}
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvCollapseBus -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetCursor -win $_nWave1 5448.910621 -snap {("G5" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 5532.955515 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1137
wvSetCursor -win $_nWave1 5586.666528 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 5600.668199 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/next_state\[2:0\]} \
{/testfixture/LBP/CONTROL/global_index\[13:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/CONTROL/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/control_signal\[2:0\]} \
{/testfixture/LBP/READ/global_index\[13:0\]} \
{/testfixture/LBP/READ/gray_data\[7:0\]} \
{/testfixture/LBP/READ/read_done} \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/finish} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_addr\[13:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/CONTROL/counter\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/WRITE/mid_data0\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data1\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data2\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/WRITE/mid_data3\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data4\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data5\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data6\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data7\[7:0\]} \
{/testfixture/LBP/WRITE/mid_data8\[7:0\]} \
{/testfixture/LBP/WRITE/result\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/LBP/clk} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_req_reg} \
{/testfixture/LBP/READ/gray_addr\[13:0\]} \
{/testfixture/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_addr_reg\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvGetSignalOpen -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 )} {( "G3" 1 2 3 4 5 6 7 8 9 10 \
           11 12 13 14 15 16 17 18 19 20 )} {( "G4" 1 2 3 4 5 6 7 8 9 10 11 )} \
           {( "G5" 1 2 3 4 5 6 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSelectGroup -win $_nWave1 {G3}
wvSelectGroup -win $_nWave1 {G3} {G4} {G5} {G6}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 3584.427647 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetCursor -win $_nWave1 5474.653164 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 5670.676551 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 6566.783463 -snap {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetCursor -win $_nWave1 7000.835248 -snap {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 7140.851953 -snap {("G2" 3)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetCursor -win $_nWave1 4074.486114 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 18902.255170 -snap {("G3" 0)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetCursor -win $_nWave1 4634.552934 -snap {("G2" 5)}
wvZoom -win $_nWave1 2870.342452 11439.364796
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoom -win $_nWave1 3765.542213 14579.407030
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 7 8 9 10 11 12 13 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvSetPosition -win $_nWave1 {("G2" 14)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 7 8 9 10 11 12 13 14 )} 
wvSetPosition -win $_nWave1 {("G2" 14)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 15)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 15 )} 
wvSetPosition -win $_nWave1 {("G2" 15)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 16 )} 
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvSetPosition -win $_nWave1 {("G2" 16)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 16 )} 
wvSetPosition -win $_nWave1 {("G2" 16)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 15535.411427 -snap {("G2" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 17 18 )} 
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvSetPosition -win $_nWave1 {("G2" 18)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 17 18 )} 
wvSetPosition -win $_nWave1 {("G2" 18)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 6975.704347 -snap {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetCursor -win $_nWave1 4599.700246 -snap {("G2" 18)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 5056.624112 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 5620.163546 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 5498.317182 -snap {("G2" 18)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 6396.934117 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 6640.626845 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_lbp_mem"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/WRITE"
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetPosition -win $_nWave1 {("G2" 19)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
{/testfixture/LBP/READ/counter\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 19 )} 
wvSetPosition -win $_nWave1 {("G2" 19)}
wvSetCursor -win $_nWave1 8605.399467 -snap {("G2" 19)}
wvSetCursor -win $_nWave1 7554.474576 -snap {("G1" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/CONTROL"
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetCursor -win $_nWave1 5574.471159 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 6579.703663 -snap {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_data\[7:0\]} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetCursor -win $_nWave1 4584.469451 -snap {("G3" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetCursor -win $_nWave1 7508.782190 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 5620.163546 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 5604.932750 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 5498.317182 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4614.931042 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 5483.086386 -snap {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetCursor -win $_nWave1 4538.777064 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 5452.624795 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 4462.623086 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 5467.855591 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 4493.084677 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 5452.624795 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 4127.545585 -snap {("G3" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 7249.858666 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 6473.088095 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 7554.474576 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 4584.469451 -snap {("G3" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 7554.474576 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 6061.856616 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 6671.088436 -snap {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/gray_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 5528.778773 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 4432.161495 -snap {("G3" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetCursor -win $_nWave1 4432.161495 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 7996.167646 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 7950.475260 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 6518.780481 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 7478.320599 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7676.320941 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetCursor -win $_nWave1 4554.007860 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 8605.399467 -snap {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetCursor -win $_nWave1 3868.622061 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSetCursor -win $_nWave1 5589.701955 -snap {("G3" 2)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/gray_data_reg\[7:0\]} \
{/testfixture/LBP/gray_req_reg} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetCursor -win $_nWave1 6503.549686 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 5513.547977 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 6503.549686 -snap {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 7539.243781 -snap {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 7630.628554 -snap {("G3" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetCursor -win $_nWave1 6610.165254 -snap {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP/READ"
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/gray_data_reg\[7:0\]} \
{/testfixture/LBP/READ/gray_req} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 5 )} 
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 5513.547977 -snap {("G3" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 7386.935826 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 6945.242756 -snap {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 7676.320941 -snap {("G3" 4)}
wvSetCursor -win $_nWave1 6579.703663 -snap {("G3" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 7143.243097 -snap {("G3" 4)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvSetCursor -win $_nWave1 6366.472526 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 5635.394341 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 5742.009910 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 5650.625137 -snap {("G3" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetCursor -win $_nWave1 6671.088436 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 3914.314448 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 7554.474576 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 8437.860716 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7463.089803 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7965.706055 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7630.628554 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/LBP"
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/LBP/CONTROL/clk} \
{/testfixture/LBP/CONTROL/reset} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/LBP/gray_addr\[13:0\]} \
{/testfixture/LBP/gray_req} \
{/testfixture/LBP/gray_ready} \
{/testfixture/LBP/gray_ready_reg} \
{/testfixture/LBP/READ/mid_data0\[7:0\]} \
{/testfixture/LBP/READ/mid_data1\[7:0\]} \
{/testfixture/LBP/READ/mid_data2\[7:0\]} \
{/testfixture/LBP/READ/mid_data3\[7:0\]} \
{/testfixture/LBP/READ/mid_data4\[7:0\]} \
{/testfixture/LBP/READ/mid_data5\[7:0\]} \
{/testfixture/LBP/READ/mid_data6\[7:0\]} \
{/testfixture/LBP/READ/mid_data7\[7:0\]} \
{/testfixture/LBP/READ/mid_data8\[7:0\]} \
{/testfixture/LBP/lbp_valid} \
{/testfixture/LBP/lbp_valid_reg} \
{/testfixture/LBP/lbp_data\[7:0\]} \
{/testfixture/LBP/lbp_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/LBP/READ/counter\[3:0\]} \
{/testfixture/LBP/CONTROL/current_state\[2:0\]} \
{/testfixture/LBP/CONTROL/gray_ready} \
{/testfixture/LBP/gray_data_reg\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/LBP/gray_data\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetCursor -win $_nWave1 7067.089120 -snap {("G4" 1)}
wvSetCursor -win $_nWave1 7463.089803 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 6990.935142 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7524.012985 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7158.473893 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7524.012985 -snap {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetCursor -win $_nWave1 7006.165938 -snap {("G1" 1)}
