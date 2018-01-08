file = r'temp.gms'
import sys
source=r'tsp_multi_ver2.9.gms'
with open(file, "w") as f:
    f.seek(0)
    f.write(r'set     n       Airport locations /0*'+str(int(sys.argv[1])-1)+r'/  ')
    with open(source,'r') as g:
        f.write(g.read())

