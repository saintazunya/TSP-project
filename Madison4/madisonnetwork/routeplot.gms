set	tick	Ticks /0*100/;

parameter	dloc(tick,i,j,xy)	Dynamic location,
		traffic(tick,i,j)	Traffic flow by arc,
		time			Time point
		maxtime			Maximum travel time,
		phi(i,j)		Arc angle 
		alpha			Multiplier;

maxtime = smax((i,k),C.L(i,k));
display maxtime;

set	enroute(tick,i,j,k,L)	Vehicle traveling from i-j is on arc k-L;

traffic(tick,k,L) = 0;
loop((i,j,tick)$(not sameas(i,j)),

*	The time at this tick:

	time = tick.val/100 * maxtime;

*	A car from i to j reaches not k at C.L(i,k).

*	If a car from i travels along arc k-L, it reaches
*	node k at C.L(i,k)+p(k,L)

*	A car from i to j which traverses arch k-L is on that
*	arc between times C.L(i,k) and C.L(i,k)+p(k,L)

	loop(route(i,j,k,L,"dual")$((C.L(i,k)<time) and (C.L(i,k)+p(k,L)>=time)),

*	Make note that at this time tick, someone traveling from i to j
*	is on the k-L arc:

	  enroute(tick,i,j,k,L) = yes;

*	Update the traffic count for this time tick:

	  traffic(tick,k,L) = traffic(tick,k,L) + 1;

*	What fraction of the k-L arc has been traversed?

	  alpha = (time-C.L(i,k))/p(k,L);

*	Calculate the location of vehicle at this time tick
*	along the k-L arc:

	  dloc(tick,i,j,xy) = alpha * loc(L,xy) + (1-alpha)*loc(k,xy)););

option dloc:3:1:3;
display dloc;

*	=============================================================
*	GNUPLOT input gets generated here
*	=============================================================

*	A. Generate a data file with the locations.  This file
*	contains several data sets:

file kroute /'route.dat'/; 
kroute.nw=10; kroute.nd=2; kroute.lw=0; kroute.pw=2048; put kroute;

*	------------------------------------------------------
*	1. First data set is simply the network nodes:

loop(i,	loop(xy, put loc(i,xy);); put @32,i.val/;);

*	Two blank lines indicate the end of the first dataset.

put //;

*	------------------------------------------------------
*	2. The second dataset has the network arcs:

loop(a(i,j),	loop(xy, put  loc(i,xy);) put/;
		loop(xy, put loc(j,xy);)  put/;	put /;);

*	Compute the angle of travel on the i-j arc:

loop(a(i,j),
  if (not round(loc(j,"x")-loc(i,"x"),5),
	if (loc(j,"y")>loc(i,"y"),
	  phi(a) = pi/2;
	else
	  phi(a) = -pi/2;
	);
  else
	phi(a) = arctan((loc(j,"y")-loc(i,"y"))/
                      (loc(j,"x")-loc(i,"x")));
	phi(a)$(loc(j,"x")<loc(i,"x")) = phi(a) + pi;
  );
);

parameter	w	Plotting width (tuning parameter) /3/
		theta	Angle toward the right side of the current arc;

*	------------------------------------------------------
*	3. Generate one dataset for each time interval:

loop(tick$(tick.val>0),

	put //'# Time interval: ',tick.tl/;

*	Look at arcs where we have flow in this time interval:

	loop(enroute(tick,i,j,a(k,L)),

*	Given a direction of travel phi, the direction 
*	of the right-hand side of the road is theta: 

	  theta = phi(a)-pi/2;

*	The data are organized as x,y,dx,dy.

*	We choose x,y to locate the car on 
*	the right side of the road:

	  put (dloc(tick,i,j,"x")+w*cos(theta));
	  put (dloc(tick,i,j,"y")+w*sin(theta));

*	Draw arrow heads in the direction of travel:

	  put (w/4*(cos(phi(a)))),(w/4*sin(phi(a)));

*	Add labels for the source and destination of this
*	vehicle:

	  put @48,i.val,' ',j.val;

*	Add a color index (2 for blue -- not approaching
*	the final node, 1 for red -- approaching the final node):

	  if (sameas(j,L), put (2)/; else put (1)/;); )
);

putclose;
	
*	------------------------------------------------------
*	B. Create a data table in which we define the
*	color for each arc at each time interval.

file kflow /'flow.dat'/; 
kflow.nw=10; kflow.nd=2; kflow.lw=0; kflow.pw=2048; put kflow;

parameter	astyle(tick,k,L)	Arrow style;

*	Define a traffic intensity index for which 0 indicates
*	no vehicles and 4 indicates traffic flow over 10 vehicles:

astyle(tick,k,L) =  1$(traffic(tick,k,L)+traffic(tick,L,k)>=0)
		  + 1$(traffic(tick,k,L)+traffic(tick,L,k)>0)
		  + 1$(traffic(tick,k,L)+traffic(tick,L,k)>5)
		  + 1$(traffic(tick,k,L)+traffic(tick,L,k)>10);

*	Place traffic flow for each time interval:

loop(tick$(tick.val>0 and sum(enroute(tick,i,j,k,L),1)),
	put '# Time interval: ',tick.tl/;
	loop(a(k,L)$(ord(L)>ord(k)),
	  loop(xy, put loc(k,xy););
	  loop(xy, put (loc(L,xy)-loc(k,xy)););
	  put (traffic(tick,k,L)+traffic(tick,L,k)), astyle(tick,k,L)/;);
	put //;
);
putclose;

*	------------------------------------------------------
*	C. Generate the GNUPLOT command file.


file kplt /route.plt/;  put kplt;
file.nw=0; file.nd=2; file.lw=0; 

$onput
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
$offput

loop(i,  put 'set label "',i.tl,'" at ',

    loc(i,"x"),',',loc(i,"y"),' center font "Helvetica,4" front nopoint boxed'/;);

file.nd=0;
put 'maxtime = ',maxtime/;
put 'nt = ',card(tick)/;

$onput

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

$offput
putclose;

*	Display the plot:

file kplot;
put_utility kplot, 'shell' /'=wgnuplot -persist route.plt';
