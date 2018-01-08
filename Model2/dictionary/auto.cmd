python creat_distance.py %* > get_inner.gms
gams get_inner
python read_inner.py %* > MadisonTSP.gms
gams MadisonTSP
python Madison_Tsp_Result_vis.py %* 