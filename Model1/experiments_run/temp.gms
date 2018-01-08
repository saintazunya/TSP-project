set     n       Airport locations /0*9/  
$if not set ds $set ds distance
$title  TSP Model
$if not set ds $set ds distance


alias (i,j,n);
set ks(i)/0/;
set m number of cars/1*3/;
table   c(i,j)  Travel distances
$ondelim
$include %ds%.csv
$offdelim
;

binary variable        X(m,i,j)  Travel assignment;

variable        OBJ     Objective function;

variable U(m,i) Position of node in tour;
set notconnecting(i,j)   /
$include notconnectingdata.dat
/;
variable len_each(m);
equations       objdef,
		out cars out of each cities except for the original city is 1,
		in  cars go into each cities except for the original city is 1,
		lendef traveling distance of each car,
		initc each car goes out of the original city once,
		initcend each car goes out of the original city once,
		consistdef if a city is visited by one car _ the car should also be out of the city;

lendef(m)..        len_each(m) =e= sum((i,j),c(i,j)*X(m,i,j));

out(i)$(ord(i)>1)..        sum((m,j),X(m,i,j)) =e= 1;

in(j)$(ord(j)>1)..         sum((m,i),X(m,i,j)) =e= 1;
initc(m)..         sum(j,X(m,'0',j)) =e= 1;
initcend(m)..      sum(i,X(m,i,'0')) =e= 1;
objdef(m)..     obj=g=len_each(m);
consistdef(m,i)..        sum(n,X(m,n,i)) =e= sum(n,X(m,i,n));
X.FX(m,i,i) = 0;
X.FX(m,notconnecting(i,j))=0;


equation subtour;
subtour(m,i,j)$(ord(j)>1).. U(m,i) - U(m,j) + card(n) *X(m,i,j) =L= card(n) - 1;
U.LO(m,i) = 1;
U.UP(m,i) = card(n);
model mtz /all/;

solve mtz using mip minimizing OBJ;

option X:0:0:1;
display X.L;
parameter route;
route(m,i,j)=x.l(m,i,j)$(x.l(m,i,j)>0) ;
execute_unload 'multi_ver2.9.gdx',route;
execute 'gdxxrw.exe i=multi_ver2.9.gdx o=route.xls par=route rdim=3' ;
*execute 'gdxxrw.exe results.gdx o=results.xls var=solsum'
*execute  'cd /D D:\Learning\Graduate\isye524\project';
*execute  'cd /D D:\Learning\Graduate\isye524\project';
