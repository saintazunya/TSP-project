import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import sol_to_index
def animate(i):
    line.set_xdata(solution[0:i,0])
    line.set_ydata(solution[0:i,1])
    return line
#result
path=''
file=r'100_distance_sol.xlsx'
ncities=np.load('datasave.npz')['arr_1']
cities=np.load('datasave.npz')['arr_1']
solidx=sol_to_index.sol_to_index(path+file)
solution=cities[solidx]
#visualization needs some debuging
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(cities[:,0],cities[:,1],'x',markersize=1)
ax.plot(solution[:,0],solution[:,1],markersize=0.1)

line, = ax.plot([],[],'o',markersize=10,label='route')
#animate(10)
ax.legend(loc='best')
plt.axes().set_aspect(0.8, adjustable='box')
FuncAnimation(fig, animate, frames=300)
a=1
plt.show()