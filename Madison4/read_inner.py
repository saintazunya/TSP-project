#read in the position files and generate the gams file to tsp
import pandas as pd
import numpy as np
import sys

dist=pd.read_excel(r'innerdistance.xls')

#dist.columns=[i for i in range(dist.shape[1])]
#dist.index=  [i for i in range(dist.shape[0])]
#dist.to_csv(r'distance.csv',sep=',',float_format='%.2f')

targets=[]
targetidx=[]
for a in sys.argv[1:]:
    targets.append(int(a))

#targets=[25,16,23,14,18,33,64]
for g in targets:
    targetidx.append(np.where(dist.index.values==g)[0][0])
pd.DataFrame(dist.values[targetidx,:][:,targetidx]).to_csv(r'distance.csv',sep=',',float_format='%.2f')
targets.extend([i for i in range(dist.shape[1])])
targets=np.reshape(targets, (2,-1))
#print(targets)
add=r'set     n       Pizza Targets /0*'+str(dist.shape[0]-1)+r'/;  '
body='''

$title  Madison TSP Model
$if not set ds $set ds distance


alias (i,j,n);
set ks(i)/0/;
set m number of cars/1*10/;
table   c(i,j)  Travel distances
$ondelim
$include %ds%.csv
$offdelim
;

binary variable        X(m,i,j)  Travel assignment,caras(m);

variable        OBJ     Objective, objmin,timeeach(m);

variable U(m,i) Position of node in tour;
variable len_each(m);
equations       objdef, out, in,lendef,initc,initcend,consistdef,objdef2,timeconsm,timedef;
lendef(m)..        len_each(m) =e= sum((i,j),c(i,j)*X(m,i,j))/1200;
out(i)$(ord(i)>1)..        sum((m,j),X(m,i,j)) =e= 1;
in(j)$(ord(j)>1)..         sum((m,i),X(m,i,j)) =e= 1;
initc(m)..         sum(j,X(m,'0',j)) =l= caras(m);
initcend(m)..      sum(i,X(m,i,'0')) =l= caras(m);
objdef(m)..        obj=g=len_each(m);
objdef2..          objmin=e=sum(m,len_each(m))*25*2.5+sum(m,caras(m)*10)+0.01*sum(m,0.01*sum(j,X(m,'0',j))*m.val);
consistdef(m,i)..  sum(n,X(m,n,i)) =e= sum(n,X(m,i,n));
timeconsm(m)..     len_each(m)/0.33+(sum((i,j),X(m,i,j)))*2-caras(m)*4=l=10;
timedef(m)..       timeeach(m)=e=len_each(m)/0.33+(sum((i,j),X(m,i,j)))*2-caras(m)*4;
X.FX(m,i,i) = 0;


equation subtour;
subtour(m,i,j)$(ord(j)>1).. U(m,i) - U(m,j) + card(n) *X(m,i,j) =L= card(n) - 1;
U.LO(m,i) = 1;
U.UP(m,i) = card(n);
model mtz /all/;

solve mtz using mip minimizing objmin;

option X:0:0:1;
display X.L;
parameter route;
display timeeach.l;
display objmin.l;
route(m,i,j)=x.l(m,i,j)$(x.l(m,i,j)>0) ;
execute_unload 'Madison_pizza.gdx',route;
execute 'gdxxrw.exe i=Madison_pizza.gdx o=route.xls par=route rdim=3' ;
'''
add+=body
print(add)
pass


    


