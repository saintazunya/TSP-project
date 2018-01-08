$title	Calculate Shortest Paths in Primal and Dual Format

set	i	Nodes,
	xy	Coordinates /x,y/;

alias (i,j,k,L);

parameter	loc(i,xy)	Node locations;

set		a(i,j)		Arcs in the network;

$gdxin 'madisonnetwork.gdx'
$load i a loc

parameter	dist(i,j)	Distances between nodes;
dist(a(i,j)) = sqrt(sum(xy,sqr(loc(i,xy)-loc(j,xy))));

parameter	p(i,j)	Travel price;

nonnegative
variable	C(i,j)		Cost of traversing from i to j;

variable	OBJ		Objective function;

equations	objD, arbitrage;

objd..			OBJ =e= sum((i,j), C(i,j));

arbitrage(a(i,j),k)..	C(j,k) + p(a) =g= C(i,k);

C.FX(i,i) = 0;

model dual /arbitrage,objd/;

*	Random variation in travel speed:

p(a) = uniform(0.5,2)*dist(a);

option limrow=0, limcol=0, solprint=off;

solve dual using lp maximizing obj;

set		route(i,j,k,L,*) Route choice;

parameter	flow(i,j,j,*)	Network flow, 		
		delay(i,j,*)	Minimum travel time;

route(i,j,a(k,L),"dual") = yes$(not 
	round(C.L(i,j)-(C.L(i,k)+p(k,L)+C.L(L,j)),5));

flow(a(i,j),k,"dual") = -arbitrage.m(a,k);
delay(i,j,"dual") = C.L(i,j);

option route:1:4:1, delay:1:2:1, flow:3:3:1;
display route, flow, delay;

nonnegative
variable	X(i,j,k)	Shipments along (i-j) destine to k;

equations	objp, balance;

objp..		OBJ =e= sum((a,k), p(a)*X(a,k));

balance(i,k)$(not sameas(i,k))..	sum(a(i,j), X(a,k)) =e= sum(a(j,i), X(a,k)) + 1;

model primal /balance,objp/;
solve primal using lp minimizing OBJ;

route(i,j,a(k,L),"primal") = yes$(not round(balance.M(i,j)
	- (balance.M(i,k)+p(k,L)+balance.M(L,j)),5));

flow(a(i,j),k,"primal") = X.L(a,k);
delay(i,j,"primal") = balance.M(i,j);

option route:1:4:1, delay:1:2:1;
display route, delay,flow;

$include routeplot
