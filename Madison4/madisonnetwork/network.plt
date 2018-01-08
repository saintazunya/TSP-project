reset
set terminal wxt size 1209,764 enhanced font 'Verdana,8' persist
unset key; unset tics; unset border
set size ratio -1
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1
set style textbox opaque border lc "blue"
unset key
unset tics
set label "1" at 891.00000,362.00000 center front nopoint boxed
set label "2" at 547.00000,148.00000 center front nopoint boxed
set label "3" at 738.00000,174.00000 center front nopoint boxed
set label "4" at 129.00000,357.00000 center front nopoint boxed
set label "5" at 960.00000,367.00000 center front nopoint boxed
set label "6" at 637.00000,218.00000 center front nopoint boxed
set label "7" at 679.00000,345.00000 center front nopoint boxed
set label "8" at 675.00000,678.00000 center front nopoint boxed
set label "9" at 1036.00000,367.00000 center front nopoint boxed
set label "10" at 369.00000,304.00000 center front nopoint boxed
set label "11" at 278.00000,58.00000 center front nopoint boxed
set label "12" at 511.00000,396.00000 center front nopoint boxed
set label "13" at 855.00000,502.00000 center front nopoint boxed
set label "14" at 873.00000,424.00000 center front nopoint boxed
set label "15" at 129.00000,298.00000 center front nopoint boxed
set label "16" at 769.00000,483.00000 center front nopoint boxed
set label "17" at 811.00000,445.00000 center front nopoint boxed
set label "18" at 252.00000,367.00000 center front nopoint boxed
set label "19" at 893.00000,300.00000 center front nopoint boxed
set label "20" at 411.00000,237.00000 center front nopoint boxed
set label "21" at 687.00000,654.00000 center front nopoint boxed
set label "22" at 315.00000,202.00000 center front nopoint boxed
set label "23" at 541.00000,316.00000 center front nopoint boxed
set label "24" at 325.00000,360.00000 center front nopoint boxed
set label "25" at 251.00000,226.00000 center front nopoint boxed
set label "26" at 478.00000,321.00000 center front nopoint boxed
set label "27" at 193.00000,311.00000 center front nopoint boxed
set label "28" at 740.00000,612.00000 center front nopoint boxed
set label "29" at 727.00000,505.00000 center front nopoint boxed
set label "30" at 465.00000,155.00000 center front nopoint boxed
set label "31" at 734.00000,380.00000 center front nopoint boxed
set label "32" at 619.00000,624.00000 center front nopoint boxed
set label "33" at 126.00000,165.00000 center front nopoint boxed
set label "34" at 465.00000,250.00000 center front nopoint boxed
set label "35" at 940.00000,415.00000 center front nopoint boxed
set label "36" at 314.00000,261.00000 center front nopoint boxed
set label "37" at 838.00000,293.00000 center front nopoint boxed
set label "38" at 476.00000,201.00000 center front nopoint boxed
set label "39" at 639.00000,323.00000 center front nopoint boxed
set label "40" at 1020.00000,662.00000 center front nopoint boxed
set label "41" at 198.00000,367.00000 center front nopoint boxed
set label "42" at 388.00000,171.00000 center front nopoint boxed
set label "43" at 134.00000,256.00000 center front nopoint boxed
set label "44" at 325.00000,113.00000 center front nopoint boxed
set label "45" at 914.00000,631.00000 center front nopoint boxed
set label "46" at 976.00000,699.00000 center front nopoint boxed
set label "47" at 248.00000,97.00000 center front nopoint boxed
set label "48" at 315.00000,323.00000 center front nopoint boxed
set label "49" at 742.00000,550.00000 center front nopoint boxed
set label "50" at 452.00000,353.00000 center front nopoint boxed
set label "51" at 642.00000,245.00000 center front nopoint boxed
set label "52" at 983.00000,205.00000 center front nopoint boxed
set label "53" at 1028.00000,417.00000 center front nopoint boxed
set label "54" at 368.00000,385.00000 center front nopoint boxed
set label "55" at 946.00000,471.00000 center front nopoint boxed
set label "56" at 949.00000,513.00000 center front nopoint boxed
set label "57" at 719.00000,411.00000 center front nopoint boxed
set label "58" at 818.00000,573.00000 center front nopoint boxed
set label "59" at 593.00000,348.00000 center front nopoint boxed
set label "60" at 422.00000,315.00000 center front nopoint boxed
set label "61" at 157.00000,117.00000 center front nopoint boxed
set label "62" at 251.00000,306.00000 center front nopoint boxed
set label "63" at 682.00000,603.00000 center front nopoint boxed
set label "64" at 782.00000,209.00000 center front nopoint boxed
set label "65" at 512.00000,272.00000 center front nopoint boxed
set label "66" at 597.00000,286.00000 center front nopoint boxed
plot 'madison.png' binary filetype=png with rgbimage,\
 'network.dat' using 1:2:3:4 with vectors nohead ls 0 lc rgb "black"

