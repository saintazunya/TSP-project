reset

gifplot = 0

set terminal wxt size 1209,764 enhanced font 'Verdana,8' persist
unset key; unset tics; unset border
set size ratio -1
set lmargin screen 0
set bmargin screen 0
set rmargin screen 1
set tmargin screen 1

# line styles
set style line 1 lc rgb '#FFFFCC' # very light yellow-orange-red
set style line 2 lc rgb '#FFEDA0' #
set style line 3 lc rgb '#FED976' # light yellow-orange-red
set style line 4 lc rgb '#FEB24C' #
set style line 5 lc rgb '#FD8D3C' #
set style line 6 lc rgb '#FC4E2A' # medium yellow-orange-red
set style line 7 lc rgb '#E31A1C' #
set style line 8 lc rgb '#B10026' # dark yellow-orange-red
set palette defined ( 0 '#FFFFCC', 1 '#FFEDA0', 2 '#FED976', \
 3 '#FEB24C', 4 '#FD8D3C', 5 '#FC4E2A', 6 '#E31A1C', 7 '#B10026' )

set style textbox opaque border lc "blue"
set label "1" at 891.00,362.00 center font "Helvetica,4" front nopoint boxed
set label "2" at 547.00,148.00 center font "Helvetica,4" front nopoint boxed
set label "3" at 738.00,174.00 center font "Helvetica,4" front nopoint boxed
set label "4" at 129.00,357.00 center font "Helvetica,4" front nopoint boxed
set label "5" at 960.00,367.00 center font "Helvetica,4" front nopoint boxed
set label "6" at 637.00,218.00 center font "Helvetica,4" front nopoint boxed
set label "7" at 679.00,345.00 center font "Helvetica,4" front nopoint boxed
set label "8" at 675.00,678.00 center font "Helvetica,4" front nopoint boxed
set label "9" at 1036.00,367.00 center font "Helvetica,4" front nopoint boxed
set label "10" at 369.00,304.00 center font "Helvetica,4" front nopoint boxed
set label "11" at 278.00,58.00 center font "Helvetica,4" front nopoint boxed
set label "12" at 511.00,396.00 center font "Helvetica,4" front nopoint boxed
set label "13" at 855.00,502.00 center font "Helvetica,4" front nopoint boxed
set label "14" at 873.00,424.00 center font "Helvetica,4" front nopoint boxed
set label "15" at 129.00,298.00 center font "Helvetica,4" front nopoint boxed
set label "16" at 769.00,483.00 center font "Helvetica,4" front nopoint boxed
set label "17" at 811.00,445.00 center font "Helvetica,4" front nopoint boxed
set label "18" at 252.00,367.00 center font "Helvetica,4" front nopoint boxed
set label "19" at 893.00,300.00 center font "Helvetica,4" front nopoint boxed
set label "20" at 411.00,237.00 center font "Helvetica,4" front nopoint boxed
set label "21" at 687.00,654.00 center font "Helvetica,4" front nopoint boxed
set label "22" at 315.00,202.00 center font "Helvetica,4" front nopoint boxed
set label "23" at 541.00,316.00 center font "Helvetica,4" front nopoint boxed
set label "24" at 325.00,360.00 center font "Helvetica,4" front nopoint boxed
set label "25" at 251.00,226.00 center font "Helvetica,4" front nopoint boxed
set label "26" at 478.00,321.00 center font "Helvetica,4" front nopoint boxed
set label "27" at 193.00,311.00 center font "Helvetica,4" front nopoint boxed
set label "28" at 740.00,612.00 center font "Helvetica,4" front nopoint boxed
set label "29" at 727.00,505.00 center font "Helvetica,4" front nopoint boxed
set label "30" at 465.00,155.00 center font "Helvetica,4" front nopoint boxed
set label "31" at 734.00,380.00 center font "Helvetica,4" front nopoint boxed
set label "32" at 619.00,624.00 center font "Helvetica,4" front nopoint boxed
set label "33" at 126.00,165.00 center font "Helvetica,4" front nopoint boxed
set label "34" at 465.00,250.00 center font "Helvetica,4" front nopoint boxed
set label "35" at 940.00,415.00 center font "Helvetica,4" front nopoint boxed
set label "36" at 314.00,261.00 center font "Helvetica,4" front nopoint boxed
set label "37" at 838.00,293.00 center font "Helvetica,4" front nopoint boxed
set label "38" at 476.00,201.00 center font "Helvetica,4" front nopoint boxed
set label "39" at 639.00,323.00 center font "Helvetica,4" front nopoint boxed
set label "40" at 1020.00,662.00 center font "Helvetica,4" front nopoint boxed
set label "41" at 198.00,367.00 center font "Helvetica,4" front nopoint boxed
set label "42" at 388.00,171.00 center font "Helvetica,4" front nopoint boxed
set label "43" at 134.00,256.00 center font "Helvetica,4" front nopoint boxed
set label "44" at 325.00,113.00 center font "Helvetica,4" front nopoint boxed
set label "45" at 914.00,631.00 center font "Helvetica,4" front nopoint boxed
set label "46" at 976.00,699.00 center font "Helvetica,4" front nopoint boxed
set label "47" at 248.00,97.00 center font "Helvetica,4" front nopoint boxed
set label "48" at 315.00,323.00 center font "Helvetica,4" front nopoint boxed
set label "49" at 742.00,550.00 center font "Helvetica,4" front nopoint boxed
set label "50" at 452.00,353.00 center font "Helvetica,4" front nopoint boxed
set label "51" at 642.00,245.00 center font "Helvetica,4" front nopoint boxed
set label "52" at 983.00,205.00 center font "Helvetica,4" front nopoint boxed
set label "53" at 1028.00,417.00 center font "Helvetica,4" front nopoint boxed
set label "54" at 368.00,385.00 center font "Helvetica,4" front nopoint boxed
set label "55" at 946.00,471.00 center font "Helvetica,4" front nopoint boxed
set label "56" at 949.00,513.00 center font "Helvetica,4" front nopoint boxed
set label "57" at 719.00,411.00 center font "Helvetica,4" front nopoint boxed
set label "58" at 818.00,573.00 center font "Helvetica,4" front nopoint boxed
set label "59" at 593.00,348.00 center font "Helvetica,4" front nopoint boxed
set label "60" at 422.00,315.00 center font "Helvetica,4" front nopoint boxed
set label "61" at 157.00,117.00 center font "Helvetica,4" front nopoint boxed
set label "62" at 251.00,306.00 center font "Helvetica,4" front nopoint boxed
set label "63" at 682.00,603.00 center font "Helvetica,4" front nopoint boxed
set label "64" at 782.00,209.00 center font "Helvetica,4" front nopoint boxed
set label "65" at 512.00,272.00 center font "Helvetica,4" front nopoint boxed
set label "66" at 597.00,286.00 center font "Helvetica,4" front nopoint boxed
maxtime = 1099
nt = 101

if (gifplot==1) {
  set terminal gif size 1000,700 animate delay 20 optimize
  set output "routes.gif"
}

set style arrow 1 head ls 1 lw 3 lc rgb "blue"
set style arrow 2 head ls 1 lw 3 lc rgb "red"
#set cbrange [0:30]
unset colorbox

do for [t=1:nt]{
  if (gifplot==1) {set multiplot layout 1,1}
  kt = t+1
  km = t-1
  set label sprintf('Time Interval: %.f',t) at 600,700 center font 'Helvetica,14' front nopoint boxed
  plot  'madison.png' binary filetype=png with rgbimage,\
	'flow.dat'  index(km) using 1:2:3:4:5 with vectors ls 1 lw 5 lc palette notitle, \
        'route.dat' index(kt) using 1:2:3:4:7 with vectors as variable notitle, \
	'route.dat' index 1 using 1:2 with lines  ls 0 notitle
  if (gifplot==1)  {unset multiplot} else  {pause 0.1}
}

