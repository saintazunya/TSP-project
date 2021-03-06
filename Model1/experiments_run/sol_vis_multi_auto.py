import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import sol_to_index
import sys

path=r''
file=r'route.xls'
ncities=np.load('datasave'+sys.argv[1]+'.npz')['arr_0']
cities=np.load('datasave'+sys.argv[1]+'.npz')['arr_1']
numcars=3
solidx=sol_to_index.sol_to_index_mulit(path+file,numcars)
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(cities[0,0],cities[0,1],'x',markersize=30)
#ax.plot(cities[:,0],cities[:,1],'o',markersize=15)
clist=['r','g','k']
for i in range(3):
    ax.plot(cities[solidx[i], 0], cities[solidx[i], 1], '.', markersize=25, c=clist[i])
for i in range(3):
    ax.plot(cities[solidx[i],0],cities[solidx[i],1],'--',markersize=15,label=str(i+1)+'th car',c=clist[i])
ax.legend(loc='best')
plt.savefig(file[1:len(file)-4]+str(ncities)+'.jpg')
plt.show()
pass
