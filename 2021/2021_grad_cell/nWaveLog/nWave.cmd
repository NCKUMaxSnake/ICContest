wvExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        wvSetCursor -win $_nWave1 1606.189124 -snap {("G1" 6)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 9407.679156 -snap {("G1" 6)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetCursor -win $_nWave1 52430.602125 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 27305.215111 -snap {("G2" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 98780.631137 -snap {("G5" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/u_geofence/READ/back_res\[9:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
{/testfixture/u_geofence/READ/front_res\[9:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/u_geofence/READ/back_res\[9:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
{/testfixture/u_geofence/READ/front_res\[9:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
}
wvSelectSignal -win $_nWave1 {( "G4" 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave1 {("G4" 8)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 3)}
wvSetPosition -win $_nWave1 {("G4" 5)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 7)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetCursor -win $_nWave1 71819.599410 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 71819.599410 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 54151.519044 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 53233.696687 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 62297.192459 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 77670.716934 -snap {("G5" 3)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetCursor -win $_nWave1 96600.803040 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 110482.866185 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 2 )} 
wvSetCursor -win $_nWave1 177483.898222 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 78186.992009 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 102624.012256 -snap {("G5" 4)}
wvSetCursor -win $_nWave1 97461.261499 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 25699.025987 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 177655.989914 -snap {("G5" 4)}
wvSetCursor -win $_nWave1 110597.593979 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 176852.895351 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 179376.906832 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 180180.001394 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 184654.385383 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 146105.846403 -snap {("G6" 0)}
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
wvSetCursor -win $_nWave1 0.660150 -snap {("G6" 0)}
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
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 177637.052632 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 95396.763910 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 105153.251128 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 107025.708271 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 82486.664662 -snap {("G5" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 79530.153383 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 99338.778947 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 110376.421053 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 90173.593985 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 51147.645113 -snap {("G4" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 177242.851128 -snap {("G5" 4)}
wvSetCursor -win $_nWave1 175518.219549 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 140237.184962 -snap {("G3" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 143292.246617 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 178179.079699 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 165761.732331 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/back_res\[9:0\]} \
{/testfixture/u_geofence/READ/front_res\[9:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/back_res\[9:0\]} \
{/testfixture/u_geofence/READ/front_res\[9:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetCursor -win $_nWave1 133634.309774 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 184092.102256 -snap {("G5" 6)}
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 187639.915789 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 192321.058647 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 197445.678195 -snap {("G3" 3)}
wvSetCursor -win $_nWave1 202570.297744 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 207694.917293 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 212622.436090 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 342708.932331 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 233465.840602 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 236619.452632 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 242236.824060 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 246573.040602 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 247262.893233 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 257413.581955 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 285598.989474 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 346850.902201 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 342219.034532 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 503348.899193 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 81698.261654 -snap {("G5" 3)}
wvSetCursor -win $_nWave1 111066.273684 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 116387.993985 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 181909.410780 -snap {("G3" 2)}
wvResizeWindow -win $_nWave1 26 96 1742 837
wvResizeWindow -win $_nWave1 26 96 1742 837
wvSetCursor -win $_nWave1 527489.221378 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 522645.563605 -snap {("G3" 2)}
wvSelectGroup -win $_nWave1 {G6}
wvSetCursor -win $_nWave1 31730.900917 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 182175.899829 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 194927.570291 -snap {("G6" 0)}
wvSetCursor -win $_nWave1 352545.637779 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 522513.543019 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 352003.795688 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 692445.361136 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 862398.438852 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 1032371.286600 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 1202428.156982 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 1372692.612697 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 1542744.540572 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 1512397.541875 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 1519712.453614 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoom -win $_nWave1 1563700.774200 1567160.529752
wvSetCursor -win $_nWave1 1565063.114205 -snap {("G5" 4)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 179942.816500 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 221133.182880 -snap {("G6" 0)}
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
wvSetCursor -win $_nWave1 196356.236606 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 193847.178755 -snap {("G6" 0)}
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
wvSetCursor -win $_nWave1 224687.681501 -snap {("G6" 0)}
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
wvSetCursor -win $_nWave1 218415.036875 -snap {("G5" 2)}
wvSetCursor -win $_nWave1 352060.558682 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 287556.863108 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 2031500.506319 -snap {("G6" 0)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvGetSignalOpen -win $_nWave1
wvSetCursor -win $_nWave1 322832.110103 -snap {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/u_geofence/READ/n1} \
{/testfixture/u_geofence/READ/n2} \
{/testfixture/u_geofence/READ/n3} \
{/testfixture/u_geofence/READ/n4} \
{/testfixture/u_geofence/READ/n5} \
{/testfixture/u_geofence/READ/n6} \
{/testfixture/u_geofence/READ/n7} \
{/testfixture/u_geofence/READ/n8} \
{/testfixture/u_geofence/READ/n9} \
{/testfixture/u_geofence/READ/n10} \
{/testfixture/u_geofence/READ/n11} \
{/testfixture/u_geofence/READ/n12} \
{/testfixture/u_geofence/READ/n13} \
{/testfixture/u_geofence/READ/n14} \
{/testfixture/u_geofence/READ/n15} \
{/testfixture/u_geofence/READ/n16} \
{/testfixture/u_geofence/READ/n17} \
{/testfixture/u_geofence/READ/n18} \
{/testfixture/u_geofence/READ/n19} \
{/testfixture/u_geofence/READ/n20} \
{/testfixture/u_geofence/READ/n21} \
{/testfixture/u_geofence/READ/n22} \
{/testfixture/u_geofence/READ/n23} \
{/testfixture/u_geofence/READ/n24} \
{/testfixture/u_geofence/READ/n25} \
{/testfixture/u_geofence/READ/n26} \
{/testfixture/u_geofence/READ/n28} \
{/testfixture/u_geofence/READ/n29} \
{/testfixture/u_geofence/READ/n30} \
{/testfixture/u_geofence/READ/n31} \
{/testfixture/u_geofence/READ/n32} \
{/testfixture/u_geofence/READ/n33} \
{/testfixture/u_geofence/READ/n34} \
{/testfixture/u_geofence/READ/n35} \
{/testfixture/u_geofence/READ/n36} \
{/testfixture/u_geofence/READ/n37} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvSetPosition -win $_nWave1 {("G1" 40)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/u_geofence/READ/n1} \
{/testfixture/u_geofence/READ/n2} \
{/testfixture/u_geofence/READ/n3} \
{/testfixture/u_geofence/READ/n4} \
{/testfixture/u_geofence/READ/n5} \
{/testfixture/u_geofence/READ/n6} \
{/testfixture/u_geofence/READ/n7} \
{/testfixture/u_geofence/READ/n8} \
{/testfixture/u_geofence/READ/n9} \
{/testfixture/u_geofence/READ/n10} \
{/testfixture/u_geofence/READ/n11} \
{/testfixture/u_geofence/READ/n12} \
{/testfixture/u_geofence/READ/n13} \
{/testfixture/u_geofence/READ/n14} \
{/testfixture/u_geofence/READ/n15} \
{/testfixture/u_geofence/READ/n16} \
{/testfixture/u_geofence/READ/n17} \
{/testfixture/u_geofence/READ/n18} \
{/testfixture/u_geofence/READ/n19} \
{/testfixture/u_geofence/READ/n20} \
{/testfixture/u_geofence/READ/n21} \
{/testfixture/u_geofence/READ/n22} \
{/testfixture/u_geofence/READ/n23} \
{/testfixture/u_geofence/READ/n24} \
{/testfixture/u_geofence/READ/n25} \
{/testfixture/u_geofence/READ/n26} \
{/testfixture/u_geofence/READ/n28} \
{/testfixture/u_geofence/READ/n29} \
{/testfixture/u_geofence/READ/n30} \
{/testfixture/u_geofence/READ/n31} \
{/testfixture/u_geofence/READ/n32} \
{/testfixture/u_geofence/READ/n33} \
{/testfixture/u_geofence/READ/n34} \
{/testfixture/u_geofence/READ/n35} \
{/testfixture/u_geofence/READ/n36} \
{/testfixture/u_geofence/READ/n37} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 )} 
wvSetPosition -win $_nWave1 {("G1" 40)}
wvGetSignalClose -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
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
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 225815.206548 -snap {("G3" 1)}
wvSelectSignal -win $_nWave1 {( "G3" 1 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 68476.370504 -snap {("G5" 0)}
wvSetCursor -win $_nWave1 12440.745176 -snap {("G6" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 5)}
wvSetPosition -win $_nWave1 {("G6" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G6" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G6" 5)}
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 7)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G3" 7 )} 
wvSetPosition -win $_nWave1 {("G3" 7)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G3" 2 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G5" 2 3 )} 
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 187322.809450 -snap {("G5" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 3 )} 
wvSetCursor -win $_nWave1 181693.110898 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 187233.946984 -snap {("G5" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G5" 3 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G5" 3 4 )} 
wvSetPosition -win $_nWave1 {("G5" 4)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 210860.908410 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 212533.613644 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 198205.847877 -snap {("G7" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/_test1\[19:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/_test1\[19:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetPosition -win $_nWave1 {("G5" 5)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G6" 1)}
wvSetCursor -win $_nWave1 579305.599355 -snap {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvExpandBus -win $_nWave1 {("G6" 1)}
wvSetCursor -win $_nWave1 440763.215311 -snap {("G6" 12)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 36904.059218 -snap {("G5" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSetCursor -win $_nWave1 29167.797513 -snap {("G6" 3)}
wvSetCursor -win $_nWave1 14113.450409 -snap {("G6" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectGroup -win $_nWave1 {G6}
wvSelectSignal -win $_nWave1 {( "G6" 1 )} 
wvSelectSignal -win $_nWave1 {( "G6" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvSetCursor -win $_nWave1 45894.849849 -snap {("G3" 0)}
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
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ/U1"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 6 )} 
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 6 )} 
wvSetPosition -win $_nWave1 {("G7" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSetCursor -win $_nWave1 63144.622572 -snap {("G7" 0)}
wvSetCursor -win $_nWave1 63249.166649 -snap {("G7" 1)}
wvSetCursor -win $_nWave1 63249.166649 -snap {("G7" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 7 8 )} 
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 7 8 )} 
wvSetPosition -win $_nWave1 {("G7" 8)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetCursor -win $_nWave1 53944.743787 -snap {("G7" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvSetCursor -win $_nWave1 182006.011037 -snap {("G7" 4)}
wvSetCursor -win $_nWave1 218047.581619 -snap {("G7" 5)}
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 )} 
wvSetCursor -win $_nWave1 217270.337060 -snap {("G7" 5)}
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 6 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 3 4 )} 
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[22:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 7 )} 
wvSetCursor -win $_nWave1 217374.881137 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 211102.236510 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 206606.841195 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 207443.193812 -snap {("G7" 6)}
wvSelectSignal -win $_nWave1 {( "G7" 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G7" 3 4 5 6 7 8 )} 
wvSetCursor -win $_nWave1 240165.489946 -snap {("G7" 4)}
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
wvSetCursor -win $_nWave1 191552.494092 -snap {("G7" 2)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvResizeWindow -win $_nWave1 22 111 1742 992
wvSetCursor -win $_nWave1 217688.513368 -snap {("G7" 5)}
wvSetCursor -win $_nWave1 249574.456886 -snap {("G7" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 221765.732375 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 217374.881137 -snap {("G7" 1)}
wvSetCursor -win $_nWave1 237238.255787 -snap {("G7" 5)}
wvSetCursor -win $_nWave1 218002.145600 -snap {("G7" 5)}
wvSetCursor -win $_nWave1 223961.157995 -snap {("G7" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 217688.513368 -snap {("G7" 5)}
wvSetCursor -win $_nWave1 262119.746138 -snap {("G7" 9)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 9 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSetCursor -win $_nWave1 274978.667622 -snap {("G5" 4)}
wvSetCursor -win $_nWave1 233683.757165 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 217479.425214 -snap {("G7" 1)}
wvSetCursor -win $_nWave1 262537.922447 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 267974.214456 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 251456.250273 -snap {("G7" 2)}
wvSetCursor -win $_nWave1 252919.867353 -snap {("G7" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvResizeWindow -win $_nWave1 22 31 1742 1128
wvSetCursor -win $_nWave1 293796.601501 -snap {("G3" 4)}
wvResizeWindow -win $_nWave1 22 31 1881 1128
wvSetCursor -win $_nWave1 275974.292371 -snap {("G3" 6)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetCursor -win $_nWave1 222087.227921 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 215199.234348 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 213111.963569 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 217808.322823 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 244212.298184 -snap {("G7" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 212485.782335 -snap {("G5" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 10 )} 
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G7" 10 )} 
wvSetPosition -win $_nWave1 {("G7" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 216462.033170 -snap {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G5" 6 )} 
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvSetPosition -win $_nWave1 {("G5" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
}
wvSelectSignal -win $_nWave1 {( "G5" 6 )} 
wvSetPosition -win $_nWave1 {("G5" 6)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 197780.959693 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 222306.391353 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 232220.927556 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 242866.008532 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 252154.363501 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 262590.717399 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 272296.526524 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 272790.494050 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 277591.216843 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 272477.403433 -snap {("G5" 6)}
wvSetCursor -win $_nWave1 246803.972844 -snap {("G7" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 282600.666713 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 267676.680639 -snap {("G5" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G5" 6 )} 
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 2 3 )} 
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 2 3 )} 
wvSetPosition -win $_nWave1 {("G8" 3)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 267259.226483 -snap {("G8" 2)}
wvSetCursor -win $_nWave1 272581.766971 -snap {("G8" 1)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetCursor -win $_nWave1 217164.727774 -snap {("G5" 5)}
wvSetCursor -win $_nWave1 272790.494049 -snap {("G7" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 3 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 1 )} 
wvSetCursor -win $_nWave1 258075.235053 -snap {("G7" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectStuckSignals -win $_nWave1
wvSetCursor -win $_nWave1 271736.422306 -snap {("G3" 4)}
wvSetCursor -win $_nWave1 288434.588542 -snap {("G3" 6)}
wvSetCursor -win $_nWave1 289686.951010 -snap {("G7" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSetPosition -win $_nWave1 {("G8" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 4 )} 
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSetPosition -win $_nWave1 {("G8" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 4 )} 
wvSetPosition -win $_nWave1 {("G8" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetCursor -win $_nWave1 299288.396596 -snap {("G8" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G8" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 2 )} 
wvSetCursor -win $_nWave1 272258.240001 -snap {("G1" 3)}
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 532298.721997 -snap {("G8" 3)}
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 792497.897377 -snap {("G8" 2)}
wvSetCursor -win $_nWave1 91318.096606 -snap {("G7" 1)}
wvResizeWindow -win $_nWave1 22 31 1881 1128
wvSetCursor -win $_nWave1 532551.699809 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 508688.739763 -snap {("G3" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 2 )} 
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSetPosition -win $_nWave1 {("G8" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 2 )} 
wvSetPosition -win $_nWave1 {("G8" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 3)}
wvSetPosition -win $_nWave1 {("G3" 4)}
wvSetPosition -win $_nWave1 {("G3" 5)}
wvSetPosition -win $_nWave1 {("G3" 6)}
wvSetPosition -win $_nWave1 {("G3" 7)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G5" 0)}
wvSetPosition -win $_nWave1 {("G5" 1)}
wvSetPosition -win $_nWave1 {("G5" 2)}
wvSetPosition -win $_nWave1 {("G5" 3)}
wvSetPosition -win $_nWave1 {("G5" 4)}
wvSetPosition -win $_nWave1 {("G5" 5)}
wvSetPosition -win $_nWave1 {("G6" 0)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 2)}
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 2 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} {( "G5" 5 )} {( "G8" 2 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 )} {( "G5" 5 )} {( "G8" 2 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 )} {( "G5" 5 )} {( "G8" 2 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G8" 5)}
wvSetPosition -win $_nWave1 {("G8" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/CTRL/valid} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G8" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G8" 3 )} 
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSetPosition -win $_nWave1 {("G8" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 5)}
wvSelectSignal -win $_nWave1 {( "G8" 3 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSetPosition -win $_nWave1 {("G8" 6)}
wvSetPosition -win $_nWave1 {("G8" 8)}
wvSetPosition -win $_nWave1 {("G8" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 9)}
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSelectSignal -win $_nWave1 {( "G8" 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSetPosition -win $_nWave1 {("G8" 6)}
wvSetPosition -win $_nWave1 {("G8" 7)}
wvSetPosition -win $_nWave1 {("G8" 8)}
wvSetPosition -win $_nWave1 {("G8" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 9)}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSetCursor -win $_nWave1 212348.830449 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 218007.417962 -snap {("G7" 2)}
wvSelectSignal -win $_nWave1 {( "G7" 3 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 9)}
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 5 6 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 6 7 8 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 3 4 7 8 )} 
wvSetCursor -win $_nWave1 185391.232396 -snap {("G7" 2)}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 6 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 )} 
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetPosition -win $_nWave1 {("G7" 1)}
wvSetPosition -win $_nWave1 {("G7" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 0)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 2)}
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 10 )} 
wvSelectSignal -win $_nWave1 {( "G7" 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/side_sum\[19:0\]} \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/CTRL/valid} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/side_sum\[19:0\]} \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/CTRL/valid} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSetPosition -win $_nWave1 {("G7" 4)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G7" 4 )} 
wvSetPosition -win $_nWave1 {("G7" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSelectSignal -win $_nWave1 {( "G7" 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} {( "G7" 5 6 )} 
wvSetCursor -win $_nWave1 222488.235787 -snap {("G7" 4)}
wvSelectSignal -win $_nWave1 {( "G7" 3 )} 
wvSetPosition -win $_nWave1 {("G7" 3)}
wvSetPosition -win $_nWave1 {("G7" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G7" 4)}
wvSelectSignal -win $_nWave1 {( "G7" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G7" 4 5 6 )} 
wvSetCursor -win $_nWave1 242287.198271 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 227073.258678 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 221758.800327 -snap {("G7" 6)}
wvSetCursor -win $_nWave1 272402.462260 -snap {("G8" 5)}
wvSetCursor -win $_nWave1 222279.825656 -snap {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 5)}
wvSetPosition -win $_nWave1 {("G7" 6)}
wvSetPosition -win $_nWave1 {("G7" 7)}
wvSetPosition -win $_nWave1 {("G7" 8)}
wvSetPosition -win $_nWave1 {("G7" 9)}
wvSetPosition -win $_nWave1 {("G7" 10)}
wvSetPosition -win $_nWave1 {("G7" 11)}
wvSetPosition -win $_nWave1 {("G7" 12)}
wvSetPosition -win $_nWave1 {("G8" 0)}
wvSetPosition -win $_nWave1 {("G8" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSetPosition -win $_nWave1 {("G8" 1)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 6)}
wvSetPosition -win $_nWave1 {("G8" 7)}
wvSetPosition -win $_nWave1 {("G8" 8)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 8)}
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 2 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 2 3 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 2 3 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 2 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 2 3 4 5 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetPosition -win $_nWave1 {("G8" 10)}
wvSetPosition -win $_nWave1 {("G8" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/inner_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/final_res\[21:0\]} \
{/testfixture/u_geofence/READ/front_res\[21:0\]} \
{/testfixture/u_geofence/READ/reach_cnt\[4:0\]} \
{/testfixture/u_geofence/READ/vecX\[4:0\]} \
{/testfixture/u_geofence/READ/vecY\[4:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/item1_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/item2_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/X\[5:0\]} \
{/testfixture/u_geofence/READ/Y\[5:0\]} \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_x\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_y\[19:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/R\[5:0\]} \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/side_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/CTRL/valid} \
{/testfixture/u_geofence/READ/side_A\[10:0\]} \
{/testfixture/u_geofence/READ/side_B\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSelectSignal -win $_nWave1 {( "G8" 9 10 )} 
wvSetPosition -win $_nWave1 {("G8" 10)}
wvSetPosition -win $_nWave1 {("G8" 9)}
wvSetPosition -win $_nWave1 {("G8" 7)}
wvSetPosition -win $_nWave1 {("G8" 6)}
wvSetPosition -win $_nWave1 {("G8" 5)}
wvSetPosition -win $_nWave1 {("G8" 4)}
wvSetPosition -win $_nWave1 {("G8" 3)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 3)}
wvSetPosition -win $_nWave1 {("G8" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSelectSignal -win $_nWave1 {( "G5" 2 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetCursor -win $_nWave1 272367.221621 -snap {("G7" 3)}
wvSetCursor -win $_nWave1 222452.995149 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 244231.853881 -snap {("G7" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 247670.621049 -snap {("G7" 5)}
wvSelectSignal -win $_nWave1 {( "G7" 1 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 9 )} 
wvSetCursor -win $_nWave1 232133.114051 -snap {("G8" 9)}
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 3 9 )} 
wvSetCursor -win $_nWave1 222546.248006 -snap {("G8" 3)}
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 3 9 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 3 6 9 )} 
wvSelectSignal -win $_nWave1 {( "G7" 1 2 )} {( "G8" 3 6 7 9 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 7 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSelectSignal -win $_nWave1 {( "G8" 1 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 7 )} 
wvSetCursor -win $_nWave1 302575.738468 -snap {("G7" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 222025.222678 -snap {("G8" 6)}
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSelectSignal -win $_nWave1 {( "G8" 6 7 )} 
wvSetCursor -win $_nWave1 537464.231078 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 531941.362596 -snap {("G1" 3)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSelectSignal -win $_nWave1 {( "G8" 8 )} 
wvSetPosition -win $_nWave1 {("G8" 8)}
wvSetPosition -win $_nWave1 {("G8" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G8" 9)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 9 )} 
wvSelectSignal -win $_nWave1 {( "G5" 4 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G7" 1 2 3 4 5 6 7 8 9 )} {( "G8" \
           1 2 3 4 5 6 7 8 9 )} 
wvSetPosition -win $_nWave1 {("G8" 8)}
wvSelectSignal -win $_nWave1 {( "G8" 7 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 8 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 8 9 )} 
wvSelectSignal -win $_nWave1 {( "G5" 5 )} {( "G8" 8 9 10 )} 
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 4182541.245253 -snap {("G8" 4)}
wvSetCursor -win $_nWave1 6268810.024726 -snap {("G8" 4)}
wvSetCursor -win $_nWave1 8338906.178001 -snap {("G8" 5)}
wvSelectGroup -win $_nWave1 {G1}
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 8340573.459053
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 8340573.459053
wvZoom -win $_nWave1 8082144.896103 8342240.740104
wvSelectUserMarker -win $_nWave1 -name "M1"
wvSetMarker -win $_nWave1 -keepViewRange -name "M1" 8341952.598474
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 8073443.018900 -snap {("G8" 8)}
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectGroup -win $_nWave1 {G1}
wvSelectGroup -win $_nWave1 {G1}
wvSelectSignal -win $_nWave1 {( "G8" 4 )} 
wvSelectSignal -win $_nWave1 {( "G8" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 )} 
wvSelectSignal -win $_nWave1 {( "G8" 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 6 )} 
wvSelectSignal -win $_nWave1 {( "G8" 3 4 5 6 7 )} 
wvResizeWindow -win $_nWave1 22 111 1881 992
wvSetCursor -win $_nWave1 8259496.177620 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
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
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 14422270.228969 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14904811.410747 -snap {("G8" 2)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 14894762.329802 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G5" 1 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvSetCursor -win $_nWave1 1021942.311728 -snap {("G5" 0)}
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
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence/READ"
wvGetSignalSetSignalFilter -win $_nWave1 "area"
wvSetPosition -win $_nWave1 {("G9" 0)}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/side_A\[10:0\]} \
{/testfixture/u_geofence/READ/side_B\[10:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvGetSignalSetSignalFilter -win $_nWave1 "area"
wvSetPosition -win $_nWave1 {("G9" 0)}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/side_A\[10:0\]} \
{/testfixture/u_geofence/READ/side_B\[10:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvGetSignalSetSignalFilter -win $_nWave1 "area"
wvSetPosition -win $_nWave1 {("G9" 0)}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/clk} \
{/testfixture/reset} \
{/testfixture/u_geofence/CTRL/cur_state\[2:0\]} \
{/testfixture/u_geofence/CTRL/next_state\[2:0\]} \
{/testfixture/X\[9:0\]} \
{/testfixture/Y\[9:0\]} \
{/testfixture/R\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/READ/rd_cnt\[2:0\]} \
{/testfixture/u_geofence/CTRL/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/READ/outer_cnt\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/READ/cross_done} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/READ/hex_area\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvAddSignal -win $_nWave1 -group {"G7" \
{/testfixture/u_geofence/READ/side_cnt\[2:0\]} \
{/testfixture/u_geofence/READ/diff_x\[9:0\]} \
{/testfixture/u_geofence/READ/diff_y\[9:0\]} \
{/testfixture/u_geofence/READ/sqr_sum\[19:0\]} \
{/testfixture/u_geofence/READ/root\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G8" \
{/testfixture/u_geofence/READ/side_length\[9:0\]} \
{/testfixture/u_geofence/READ/side_A\[10:0\]} \
{/testfixture/u_geofence/READ/side_B\[10:0\]} \
{/testfixture/u_geofence/READ/root1\[9:0\]} \
{/testfixture/u_geofence/READ/root2\[9:0\]} \
{/testfixture/u_geofence/READ/hept_area\[19:0\]} \
{/testfixture/u_geofence/READ/is_inside} \
{/testfixture/u_geofence/CTRL/valid} \
}
wvAddSignal -win $_nWave1 -group {"G9" \
}
wvSetPosition -win $_nWave1 {("G9" 0)}
wvSetCursor -win $_nWave1 1393837.107876 -snap {("G9" 0)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 3304024.015362 -snap {("G9" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G8" 6 )} 
wvSelectSignal -win $_nWave1 {( "G5" 1 )} {( "G8" 6 )} 
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 448072.585282 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 466321.555134 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 447688.396443 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 467666.216070 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 188064.637351 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 452578.653000 -snap {("G5" 1)}
wvSetRadix -win $_nWave1 -2Com
wvSetRadix -win $_nWave1 -2Com
wvSetCursor -win $_nWave1 512952.559084 -snap {("G8" 6)}
wvSetCursor -win $_nWave1 523133.563317 -snap {("G8" 6)}
wvSetCursor -win $_nWave1 533314.567550 -snap {("G8" 6)}
wvSetCursor -win $_nWave1 472036.447731 -snap {("G5" 1)}
wvSetRadix -win $_nWave1 -Unsigned
wvSetCursor -win $_nWave1 462047.537917 -snap {("G5" 1)}
wvSetCursor -win $_nWave1 457821.460688 -snap {("G5" 1)}
wvExit
