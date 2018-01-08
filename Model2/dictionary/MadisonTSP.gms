set     n       Pizza Targets /0*7/;  

$title  Madison TSP Model
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
variable len_each(m);
equations       objdef, out, in,lendef,initc,initcend,consistdef;

lendef(m)..        len_each(m) =e= sum((i,j),c(i,j)*X(m,i,j));

out(i)$(ord(i)>1)..        sum((m,j),X(m,i,j)) =e= 1;

in(j)$(ord(j)>1)..         sum((m,i),X(m,i,j)) =e= 1;
initc(m)..         sum(j,X(m,'0',j)) =e= 1;
initcend(m)..      sum(i,X(m,i,'0')) =e= 1;
objdef(m)..     obj=g=len_each(m);
consistdef(m,i)..        sum(n,X(m,n,i)) =e= sum(n,X(m,i,n));
X.FX(m,i,i) = 0;


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
execute_unload 'Madison_pizza.gdx',route;
execute 'gdxxrw.exe i=Madison_pizza.gdx o=route.xls par=route rdim=3' ;

