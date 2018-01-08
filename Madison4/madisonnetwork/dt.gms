$title	Batinclude interface for table_delaunay.exe

*	n	Node index set
*	loc	Node locations (x-y)
*	a(n,n)	Arcs from the delaunay triangulation	

$setargs n loc a

$if not defined knode file knode /%gams.scrdir%dt_nodes.txt/; 

knode.nd=5; knode.nw=12; put knode;
loop(%n%, put %loc%(%n%,"x"),%loc%(%n%,"y")/;); putclose;

* http://people.sc.fsu.edu/~jburkardt/f_src/table_delaunay/table_delaunay.html

execute 'table_delaunay.exe %gams.scrdir%dt';

$onecho >%gams.scrdir%dt_arcs.gms
alias (i,j,k,*);
set	dt(i,j,k)	Trangles /
$ondelim
$include %gams.scrdir%dt_elements.txt
$offdelim
/;
set	a(i,j)	Arcs in the network;
loop(dt(i,j,k), a(i,j) = yes; a(j,k) = yes; a(k,i) = yes;);
$offecho

execute 'gams %gams.scrdir%dt_arcs gdx=%gams.scrdir%dt_arcs.gdx';
execute_load '%gams.scrdir%dt_arcs.gdx',%a%=a;
