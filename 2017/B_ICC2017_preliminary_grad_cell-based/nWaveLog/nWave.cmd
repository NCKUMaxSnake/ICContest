wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/max.chen/ICCONTEST/2017/B_ICC2017_preliminary_grad_cell-based/DT.fsdb}
wvAddAllSignals -win $_nWave1
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
wvSetCursor -win $_nWave1 4644677.320495 -snap {("G1" 21)}
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
wvScrollDown -win $_nWave1 31
wvScrollDown -win $_nWave1 31
wvScrollDown -win $_nWave1 12
wvScrollDown -win $_nWave1 0
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvScrollUp -win $_nWave1 8
wvScrollUp -win $_nWave1 77
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectGroup -win $_nWave1 {G1}
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/getSmallest"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/getSmallest"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/clk} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 1)}
wvSetCursor -win $_nWave1 74665069.200134 -snap {("G3" 0)}
wvResizeWindow -win $_nWave1 8 31 1906 648
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/getSmallest"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 2 )} 
wvSetPosition -win $_nWave1 {("G2" 2)}
wvGetSignalClose -win $_nWave1
wvResizeWindow -win $_nWave1 8 31 1271 648
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
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CHKSTI"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CTRL"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 0)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 0)}
wvSetPosition -win $_nWave1 {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvSetPosition -win $_nWave1 {("G2" 3)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSetPosition -win $_nWave1 {("G2" 3)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CTRL"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDSTI"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/control_signal\[3:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/control_signal\[3:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDSTI"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 5534939.661841 -snap {("G2" 1)}
wvSetCursor -win $_nWave1 111524079.674067 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 111525361.756266 -snap {("G2" 7)}
wvSetCursor -win $_nWave1 111526069.111963 -snap {("G2" 6)}
wvSetCursor -win $_nWave1 111519128.184194 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDSTI"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/RDRES/res_rd} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvSetPosition -win $_nWave1 {("G2" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/RDRES/res_rd} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 7 )} 
wvSetPosition -win $_nWave1 {("G2" 7)}
wvGetSignalClose -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDSTI"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/RDRES"
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/RDRES/res_rd} \
{/testfixture/u_dut/RDRES/res_addr\[13:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvSetPosition -win $_nWave1 {("G2" 8)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_dut/CTRL/current_state\[3:0\]} \
{/testfixture/u_dut/CTRL/next_state\[3:0\]} \
{/testfixture/u_dut/WRRES/smallest\[7:0\]} \
{/testfixture/u_dut/WRRES/smallestResult\[7:0\]} \
{/testfixture/u_dut/RDSTI/global_idx\[13:0\]} \
{/testfixture/u_dut/RDRES/rd_addr_idx_fw\[3:0\]} \
{/testfixture/u_dut/RDRES/res_rd} \
{/testfixture/u_dut/RDRES/res_addr\[13:0\]} \
{/testfixture/u_dut/WRRES/clk} \
{/testfixture/u_dut/WRRES/res_di\[7:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 8 )} 
wvSetPosition -win $_nWave1 {("G2" 8)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 4420052.264871 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 3 )} 
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 3 4 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CHKSTI"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/WRRES"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut/CHKSTI"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_dut"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalClose -win $_nWave1
