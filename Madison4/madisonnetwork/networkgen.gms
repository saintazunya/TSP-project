$title	Generate a Network for a Set of Points in 2d

set	i	Nodes /1*20/;

set	xy	Coordinates /x,y/;

alias (i,j);

set	a(i,j)	Arcs

parameter	loc(i,xy)	Node locations;
loc(i,xy) = uniform(0,1);

*	Generate a triangulation:

$batinclude dt i loc a

*	Plot the resulting network:

$batinclude networkplot i loc a

$label madison

set	d	/1*66/

alias	(d,dd);

set	ad(d,dd)	Nodes in the network;

table	coord(d,*)	Coordinates of neighborhoods on the map (pixel) 

             x           y
1          891         362
2          547         148
3          738         174
4          129         357
5          960         367
6          637         218
7          679         345
8          675         678
9         1036         367
10         369         304
11         278          58
12         511         396
13         855         502
14         873         424
15         129         298
16         769         483
17         811         445
18         252         367
19         893         300
20         411         237
21         687         654
22         315         202
23         541         316
24         325         360
25         251         226
26         478         321
27         193         311
28         740         612
29         727         505
30         465         155
31         734         380
32         619         624
33         126         165
34         465         250
35         940         415
36         314         261
37         838         293
38         476         201
39         639         323
40        1020         662
41         198         367
42         388         171
43         134         256
44         325         113
45         914         631
46         976         699
47         248          97
48         315         323
49         742         550
50         452         353
51         642         245
52         983         205
53        1028         417
54         368         385
55         946         471
56         949         513
57         719         411
58         818         573
59         593         348
60         422         315
61         157         117
62         251         306
63         682         603
64         782         209
65         512         272
66         597         286;

$batinclude dt d coord ad

set	drop(d,dd) Identify some arcs to be dropped /
	54.12, 59.12, 64.37, 2.11, 57.59, 65.2, 65.6,
	29.32, 7.(37,64), (31,17).37, (1.17),
	(4,41,18,54,12,59).(8,32,29), 11.52, 11.3, 11.61, 8.28,
	9.40, 51.7, 51.39, 46.8, 3.52 /;

ad(d,dd)$(drop(d,dd) or drop(dd,d)) = no;
ad(d,dd)$ad(dd,d) = yes;
ad(d,d) = no;

$batinclude networkplot d coord ad madison

execute_unload 'madisonnetwork.gdx',d=i, ad=a, coord=loc;
