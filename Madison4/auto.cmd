python creat_distance.py %* > get_inner.gms
gams get_inner
python read_inner.py %* > MadisonTSP.gms
gams MadisonTSP
python vis2.py %*