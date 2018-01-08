$setargs n loc a png

$ifthen.defined not defined network_plt

file network_plt /network.plt/; network_plt.nd=5; network_plt.nw=0; network_plt.lw=0; 
file network_dat /network.dat/; network_dat.nd=5; network_dat.nw=0; network_dat.lw=0; 
file network_utl;

alias (network_i,network_j,*);

$endif.defined

put network_plt;
$onput
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
$offput

loop(%n%,	
  put 'set label "',%n%.tl,'" at ',%loc%(%n%,"x"),',',%loc%(%n%,"y"),
	' center front nopoint boxed'/;);

*.$ifthen "%png%"==""

*.put "plot 'network.dat' using 1:2:3:4 with vectors nohead lw 3 ls 0 lc rgb",
*.	' "black" notitle'//;
*.$else	 

put "plot '%png%.png' binary filetype=png with rgbimage,\"/
    " 'network.dat' using 1:2:3:4 with vectors nohead ls 0 lc rgb",
    ' "black"'//;

*.$endif
putclose;

put network_dat;
$onuni

loop(%a%(network_i,network_j),
    put %loc%(network_i,"x"),' ',%loc%(network_i,"y"),' ',
        (%loc%(network_j,"x")-%loc%(network_i,"x")),' ',
        (%loc%(network_j,"y")-%loc%(network_i,"y"))/);

$offuni

putclose;

put_utility network_utl, 'shell' /'=wgnuplot -persist network.plt';

