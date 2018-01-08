COPY "tsp_multi_ver2.9.gms"  "temp.gms"
python project_data_gen.py %1 %2
python modify_gams_file.py %1
gams temp.gms
python sol_vis_multi_auto.py %1
