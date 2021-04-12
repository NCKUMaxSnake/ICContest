wvResizeWindow -win $_nWave1 10 31 1289 1128
wvResizeWindow -win $_nWave1 10 254 1289 460
wvResizeWindow -win $_nWave1 10 31 1289 1128
wvResizeWindow -win $_nWave1 10 62 1289 652
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/max.chen/ICCONTEST/final/2019/icc2019cb/IOTDF_F1.fsdb}
wvResizeWindow -win $_nWave1 10 62 1495 706
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/CTRL"
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/READ"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/comp_data\[7:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/comp_data\[7:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 3 4 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
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
wvSetCursor -win $_nWave1 4303.249643 -snap {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetCursor -win $_nWave1 3530.335872 -snap {("G1" 1)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 2485.857803 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 3467.667188 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 5431.285957 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 7457.573410 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 5389.506834 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 7436.683848 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 5431.285957 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 7582.910778 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 2339.630874 -snap {("G3" 0)}
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
wvSetCursor -win $_nWave1 4447.734072 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 3721.573407 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 4508.247461 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 5506.718375 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 19455.054478 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 20483.782087 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 54636.025854 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4417.477378 -snap {("G2" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 19364.284395 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 131488.029547 -snap {("G2" 3)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetCursor -win $_nWave1 3570.289935 -snap {("G2" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test/u_IOTDF/CTRL"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/CTRL/busy} \
{/test/u_IOTDF/READ/comp_data\[7:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/CTRL/busy} \
{/test/u_IOTDF/READ/comp_data\[7:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetCursor -win $_nWave1 9803.168975 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 49477.259464 -snap {("G3" 0)}
wvSetCursor -win $_nWave1 130323.146814 -snap {("G2" 5)}
wvSetCursor -win $_nWave1 133530.356417 -snap {("G2" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 131432.054663 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 12223.704524 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/CTRL/busy} \
{/test/u_IOTDF/READ/comp_data\[127:0\]} \
{/test/u_IOTDF/READ/fn_sel\[2:0\]} \
{/test/u_IOTDF/READ/local_max\[127:0\]} \
{/test/u_IOTDF/READ/valid} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/u_IOTDF/clk} \
{/test/u_IOTDF/rst} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/u_IOTDF/CTRL/cur_state\[2:0\]} \
{/test/u_IOTDF/CTRL/busy} \
{/test/u_IOTDF/READ/comp_data\[127:0\]} \
{/test/u_IOTDF/READ/fn_sel\[2:0\]} \
{/test/u_IOTDF/READ/local_max\[127:0\]} \
{/test/u_IOTDF/READ/valid} \
{/test/u_IOTDF/READ/byte_cnt\[3:0\]} \
{/test/u_IOTDF/READ/data_cnt\[2:0\]} \
{/test/u_IOTDF/READ/in_en} \
{/test/u_IOTDF/READ/iot_in\[7:0\]} \
{/test/u_IOTDF/READ/read_done} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 4 5 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 9)}
wvSetPosition -win $_nWave1 {("G2" 10)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetCursor -win $_nWave1 19424.797784 -snap {("G2" 8)}
wvSetCursor -win $_nWave1 20725.835642 -snap {("G2" 10)}
wvSetCursor -win $_nWave1 39574.243398 -snap {("G2" 10)}
wvSetCursor -win $_nWave1 58455.933518 -snap {("G2" 10)}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetCursor -win $_nWave1 5294.921514 -snap {("G2" 11)}
wvExit
