wvResizeWindow -win $_nWave1 26 96 1718 958
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/max.chen/ICCONTEST/2015/SET.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/CTRL"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/PROC"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/read_done} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state} \
{/testfixture1/u_set/CTRL/next_state} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G3" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G3" 4)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
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
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 0)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 3768.663859 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetCursor -win $_nWave1 3858.393951 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 11410.676685 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 13280.053599 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1031.896057 -snap {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 16944.032351 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 5563.265697 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4202.359303 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5309.030436 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 4531.369640 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18260.073698 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 3753.708844 -snap {("G4" 0)}
wvSetCursor -win $_nWave1 16600.066998 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14252.129594 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 5323.985452 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetCursor -win $_nWave1 6924.172090 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 2 )} 
wvSetPosition -win $_nWave1 {("G4" 2)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 15702.766080 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 19262.059724 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 278115.444448 -snap {("G5" 0)}
wvSetCursor -win $_nWave1 317731.280015 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G4" 7)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 13519.333844 -snap {("G4" 4)}
wvSetCursor -win $_nWave1 16764.572167 -snap {("G2" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 8 )} {( "G4" 3 4 5 6 7 )} 
wvSetCursor -win $_nWave1 15194.295559 -snap {("G4" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 18140.433576 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/point_cnt\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/point_cnt\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/PROC"
wvSetCursor -win $_nWave1 17422.592841 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 13534.288859 -snap {("G4" 2)}
wvSetCursor -win $_nWave1 2243.252297 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 7642.012825 -snap {("G5" 0)}
wvSetCursor -win $_nWave1 3499.473583 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/u_set/PROC/candidate\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/u_set/PROC/candidate\[6:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetPosition -win $_nWave1 {("G5" 1)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture1"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/PROC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/PROC"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture1/u_set"
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/u_set/PROC/candidate\[6:0\]} \
{/testfixture1/u_set/candidate\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture1/u_set/clk} \
{/testfixture1/u_set/rst} \
{/testfixture1/u_set/busy} \
{/testfixture1/u_set/candidate\[7:0\]} \
{/testfixture1/u_set/central\[23:0\]} \
{/testfixture1/u_set/en} \
{/testfixture1/u_set/mode\[1:0\]} \
{/testfixture1/u_set/radius\[11:0\]} \
{/testfixture1/u_set/valid} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture1/u_set/CTRL/cur_state\[2:0\]} \
{/testfixture1/u_set/CTRL/next_state\[2:0\]} \
{/testfixture1/u_set/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture1/u_set/PROC/read_done} \
{/testfixture1/u_set/PROC/reg_central\[23:0\]} \
{/testfixture1/u_set/PROC/reg_mode\[1:0\]} \
{/testfixture1/u_set/PROC/reg_radius\[11:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture1/u_set/PROC/cntX\[3:0\]} \
{/testfixture1/u_set/PROC/cntY\[3:0\]} \
{/testfixture1/u_set/PROC/r_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/x\[3:0\]} \
{/testfixture1/u_set/PROC/x_sqr\[7:0\]} \
{/testfixture1/u_set/PROC/y\[3:0\]} \
{/testfixture1/u_set/PROC/y_sqr\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture1/u_set/PROC/candidate\[6:0\]} \
{/testfixture1/u_set/candidate\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetPosition -win $_nWave1 {("G5" 2)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 17548.214969 -snap {("G4" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 13044.767973 -snap {("G6" 0)}
wvZoomAll -win $_nWave1
wvSetCursor -win $_nWave1 94725.007657 -snap {("G5" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 29451.801780 -snap {("G4" 2)}
wvSetCursor -win $_nWave1 21464.435777 -snap {("G4" 4)}
wvSetCursor -win $_nWave1 29516.216022 -snap {("G4" 2)}
wvSetCursor -win $_nWave1 21464.435777 -snap {("G4" 2)}
wvSelectSignal -win $_nWave1 {( "G4" 4 )} 
wvSelectSignal -win $_nWave1 {( "G4" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 3 5 7 )} 
wvSetCursor -win $_nWave1 26440.435969 -snap {("G4" 1)}
wvSetCursor -win $_nWave1 27501.660605 -snap {("G4" 5)}
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 29450.191424 -snap {("G4" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
