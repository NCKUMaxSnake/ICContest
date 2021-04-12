wvResizeWindow -win $_nWave1 0 23 1280 657
wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/max.chen/ICCONTEST/2018/B_ICC2018_priliminary_grad_cell_based/huffman.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1280 657
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/TREE"
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvSetPosition -win $_nWave1 {("G1" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 )} 
wvSetPosition -win $_nWave1 {("G1" 13)}
wvGetSignalClose -win $_nWave1
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
wvSetCursor -win $_nWave1 135885.406016 -snap {("G2" 0)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/TREE"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/ENCODE"
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G1" 24)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree\[9:0\]} \
{/tb/u_huffman/ENCODE/huff_tree1\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree2\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree3\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree4\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree5\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree6\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree7\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree8\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree9\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree10\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 14 15 16 17 18 19 20 21 22 23 24 )} 
wvSetPosition -win $_nWave1 {("G1" 24)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree1\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree2\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree3\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree4\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree5\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree6\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree7\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree8\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree9\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree10\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree1\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree2\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree3\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree4\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree5\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree6\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree7\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree8\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree9\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree10\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 )} 
wvSetPosition -win $_nWave1 {("G2" 11)}
wvGetSignalClose -win $_nWave1
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvScrollDown -win $_nWave1 0
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G2" 11)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/TREE"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/GRAYCOUNTER"
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/ENCODE"
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree1\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree2\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree3\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree4\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree5\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree6\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree7\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree8\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree9\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree10\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
{/tb/u_huffman/ENCODE/hc\[5:0\]} \
{/tb/u_huffman/ENCODE/idx\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvSetPosition -win $_nWave1 {("G2" 13)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree1\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree2\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree3\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree4\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree5\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree6\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree7\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree8\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree9\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree10\[13:0\]} \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
{/tb/u_huffman/ENCODE/hc\[5:0\]} \
{/tb/u_huffman/ENCODE/idx\[5:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 12 13 )} 
wvSetPosition -win $_nWave1 {("G2" 13)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 148910.333080 -snap {("G2" 12)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 129376.578701 -snap {("G2" 11)}
wvSetCursor -win $_nWave1 130540.167942 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 131631.032855 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 132794.622096 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 133521.865371 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 134249.108647 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 135339.973560 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 136430.838473 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 138612.568300 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 140648.849471 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 142248.784677 -snap {("G2" 13)}
wvSetCursor -win $_nWave1 130540.167942 -snap {("G2" 13)}
wvSelectSignal -win $_nWave1 {( "G2" 10 )} 
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 6 7 8 9 10 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G2" 3)}
wvZoomIn -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/tb/u_huffman/ENCODE"
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
{/tb/u_huffman/ENCODE/hc\[5:0\]} \
{/tb/u_huffman/ENCODE/idx\[5:0\]} \
{/tb/u_huffman/ENCODE/tree_cnt\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvSetPosition -win $_nWave1 {("G2" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/tb/u_huffman/TREE/clk} \
{/tb/u_huffman/TREE/control_signal\[2:0\]} \
{/tb/u_huffman/TREE/huff_tree1\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree2\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree3\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree4\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree5\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree6\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree7\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree8\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree9\[13:0\]} \
{/tb/u_huffman/TREE/huff_tree10\[13:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/tb/u_huffman/ENCODE/huff_tree\[9:0\]} \
{/tb/u_huffman/ENCODE/hc\[5:0\]} \
{/tb/u_huffman/ENCODE/idx\[5:0\]} \
{/tb/u_huffman/ENCODE/tree_cnt\[3:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSetPosition -win $_nWave1 {("G2" 4)}
wvGetSignalClose -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 131376.497709 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 131594.670691 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 132503.724786 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 133485.503208 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 130369.265772 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 150612.082344 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 148539.439009 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 146212.260528 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 144212.341520 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 143448.736081 -snap {("G2" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 135776.319525 -snap {("G3" 0)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 138456.210995 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 139656.162400 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 140456.130003 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 146455.887025 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 141546.994916 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 140492.492167 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 139328.902926 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 138565.297487 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 130601.983621 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 131474.675551 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 130601.983621 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 131511.037715 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 132529.178301 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 133510.956723 -snap {("G2" 3)}
wvSetCursor -win $_nWave1 134638.183799 -snap {("G2" 3)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 137619.881229 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 131911.021517 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 132492.816137 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 133183.697249 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 134456.372981 -snap {("G2" 4)}
wvSetCursor -win $_nWave1 133438.232395 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 132420.091809 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 134420.010817 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 130420.172802 -snap {("G2" 2)}
wvSetCursor -win $_nWave1 134383.648653 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 134492.735144 -snap {("G2" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
