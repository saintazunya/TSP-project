import numpy as np
import sys
# creat distance inner the target points, then run the tsp gams programme to solve for the problem.
a=sys.argv[1:]

p1='''


set     i       Nodes on the map of Madison /1*79/

alias (i,j,k,ii,jj);

set     a(i,j)  Arcs in the network /
       1.59,3.2,4.3,5.4,6.5,7.6,8.7,8.72,9.8,9.10,10.7,10.11,11.6,11.12,12.5,
12.13,12.53,13.4,13.14,14.4,14.15,15.3,15.60,16.1,16.58,17.24,18.17,19.18,
20.19,20.21,21.18,21.22,22.17,22.23,23.16,23.24,24.1,25.23,25.56,26.22,
26.25,26.45,27.21,27.26,27.79,28.27,28.44,29.28,29.79,30.29,30.31,31.28,
31.43,32.31,32.38,32.41,32.68,33.30,33.32,34.32,34.33,34.68,34.78,35.36,
35.78,36.37,37.61,38.39,38.42,38.69,39.40,39.64,39.70,40.50,40.65,41.43,
41.49,42.40,42.41,42.49,43.44,43.48,44.45,45.46,46.25,46.55,47.54,48.47,
49.48,49.50,50.51,51.10,51.52,52.11,52.53,53.13,53.67,54.53,54.55,55.56,
55.67,56.16,56.57,57.14,57.58,58.15,58.59,59.60,60.2,61.63,62.66,63.62,
64.8,64.65,64.71,65.9,65.51,66.3,67.13,67.57,68.69,68.77,69.70,69.76,
70.71,70.75,71.72,71.74,72.73,73.62,74.63,74.73,75.61,75.74,76.37,76.75,
77.36,77.76,78.77,79.20/
;


set     oneway(i,j)     One way arcs in the network /
        1.59,2.3,4.13,5.4,6.5,7.6,8.7,9.65,10.9,11.10,12.11,12.53,13.12,13.14,
15.58,16.23,17.24,18.17,18.21,20.19,21.27,22.21,23.22,24.1,27.28,28.31,29.79,
30.29,31.32,32.68,33.30,34.33,34.68,35.36,35.78,36.37,37.61,40.42,41.43,42.41,
43.44,44.45,45.46,46.55,47.54,48.47,49.48,50.49,51.50,52.51,53.52,54.53,55.67,
58.16,59.60,60.2,65.40,67.13,68.69,68.77,69.70,70.71,71.72,73.74,74.75,75.76,
76.77,77.36,77.78,78.34,79.20
/;

*       Insert all arcs:

a(i,j)$a(j,i) = yes;
set ncnt(i,j);
*       Then remove the wrong-way arcs:

a(i,j)$oneway(j,i) = no;

set     twoway(i,j)     Two-way arcs;
twoway(a) = yes$(not oneway(a));

option twoway:0:0:1;
display twoway;


set     xy/x,y/;

table   loc(i,xy)       Locations of the nodes
        x               y
1       86.04921722     -412.8137207
2       86.04921722     -681.0211792
3       214.5054626     -675.1135254
4       352.8429565     -679.8396606
5       481.2991943     -678.6581421
6       564.0546875     -677.4766235
7       654.2210693     -677.4766235
8       788.8530884     -685.7473145
9       715.9788818     -600.677124
10      649.2804565     -601.8586426
11      567.7601318     -601.8586426
12      475.1234131     -598.3140259
13      413.3656006     -595.9509888
14      352.8429565     -593.5878906
15      219.4460907     -595.9509888
16      221.9163971     -413.9952393
17      87.28437042     -228.4949188
18      87.28437042     -149.3323517
19      115.6929626     -67.80673981
20      219.4460907     -74.8959198
21      223.1515503     -156.4215393
22      219.4460907     -228.4949188
23      223.1515503     -308.8390198
24      84.8140564      -307.6574707
25      351.6077881     -312.383606
26      350.3726501     -230.8579712
27      352.8429565     -148.1508331
28      486.2398376     -156.4215393
29      487.4749756     -74.8959198
30      571.4656372     -81.98510742
31      572.7007446     -149.3323517
32      787.6179199     -158.7846069
33      787.6179199     -80.80357361
34      854.3164063     -80.80357361
35      971.65625       -81.98510742
36      971.65625       -164.6922607
37      971.65625       -318.2912598
38      785.147644      -313.5651245
39      786.3828125     -417.5398254
40      719.6843872     -422.2659607
41      717.2140503     -242.6732788
42      723.3898315     -315.9281921
43      571.4656372     -236.765625
44      483.7695313     -229.6764526
45      426.9523315     -237.9471588
46      417.0710754     -313.5651245
47      494.8859253     -323.0173645
48      570.2304688     -317.1097107
49      645.5750122     -325.3804321
50      654.2210693     -418.7213745
51      644.3398438     -512.0623169
52      567.7601318     -514.425354
53      491.1804504     -510.8807678
54      480.0640564     -416.3583069
55      414.600769      -417.5398254
56      345.4320068     -415.1767578
57      347.9023438     -514.425354
58      216.975769      -517.9699707
59      87.28437042     -515.6068726
60      89.75468445     -592.4063721
61      965.4804688     -423.4474792
62      965.4804688     -711.7409668
63      971.65625       -527.4221802
64      783.9124756     -523.8776245
65      718.4492188     -513.2438354
66      216.975769      -774.3621216
67      417.0710754     -517.9699707
68      854.3928833     -161.8346558
69      857.1911011     -317.8414917
70      854.3928833     -421.3977356
71      854.3928833     -527.6437378
72      850.1955566     -686.3403931
73      904.7610474     -686.3403931
74      903.3619385     -527.6437378
75      906.1601563     -421.3977356
76      906.1601563     -320.53125
77      910.3574829     -159.1448975
78      907.5592651     -85.17613983
79      356.3079529     -73.07215881        ;
parameter        d(i,j)    Travel distance;
d(a(i,j)) = sqrt(sum(xy, sqr(loc(i,xy)-loc(j,xy))));
d(i,j)$(not a(i,j))=1000000;
d(i,i)=0;
option d:0:0:1;
display d;
nonnegative variable f(i,j) flow;
variable obj;
f.lo(i,j)=0;
*f.fx(i,j)$(not a(i,j))=0;
'''
p2='''
scalar start/1/,end/6/;
set loopi/ '''
p3='''

alias(loopi,loopj)
equations    in,out,flow,objdef,out2,in2;
out(i)$(i.val=start).. sum(j,f(i,j))=e=1;
in(j)$(j.val=end)..    sum(i,f(i,j))=e=1;
out2(i)$(i.val=end).. sum(j,f(i,j))=e=0;
in2(j)$(j.val=start)..    sum(i,f(i,j))=e=0;
flow(i)$(i.val<>start and i.val<>end)..              sum(j,f(i,j))=e=sum(j,f(j,i));
objdef..              obj=e=sum((i,j),f(i,j)*d(i,j));

model madison_pizza /all/;
parameter solsum,dist;
loop(loopi     ,
    loop( loopj ,
         start=loopi.val;
         end=loopj.val;
         solve madison_pizza using LP minimizing obj;
         solsum(loopi,loopj,i,j)=f.l(i,j);
         dist(loopi,loopj)=obj.l;
         );
);

solve madison_pizza using LP minimizing obj;
dist(loopi,loopi)=1e-5;
options solsum:0:0:1;
options dist:0:1:1;
display solsum,dist;
execute_unload 'distance_target.gdx',solsum,dist;
execute 'gdxxrw.exe i=distance_target.gdx o=innerroute.xls par=solsum rdim=4' ;
execute 'gdxxrw.exe i=distance_target.gdx o=innerdistance.xls par=dist rdim=1' ;
'''
for i in a:
    p2+=(str(i)+',')
p2=p2[0:len(p2)-1]
p2+=r'/;'
print(p1+p2+p3)