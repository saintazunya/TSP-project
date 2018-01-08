import pandas as pd
madison= pd.read_excel(r"Madison.xlsm","nodes")#coordinates of the points
# position of cento iloc=25 351,-312
import matplotlib.pyplot as plt
import networkx as nx
import sys
import numpy as np
#arcs prepare arcs data
arcs=pd.read_excel(r"D:\matlab\2017a\Madison.xlsm","arcdata",index_col=None,names=['f','t',1,2,3])[['f','t']].iloc[0:420]# get only the numerical points
arcs.drop_duplicates(inplace=True)# drop the duplicate items
newindex=[i for i in range(arcs.shape[0])]
arcs.index=newindex #change the index of pair of points for convenience
#oneways
connecting=''
for i in range(arcs.shape[0]):
    connecting+=(str(arcs.values[i][0])+'.'+str(arcs.values[i][1]))+','
#print(connecting)
single=pd.read_excel(r"Madison.xlsm","oneway",index_col=None,names=['f','t',1,2,3])[['f','t']].iloc[0:212].astype('int')
single.drop_duplicates(inplace=True)
newindex=[i for i in range(single.shape[0])]
single.index=newindex
oneway=''
for i in range(single.shape[0]):
    oneway+=(str(single.values[i][0])+'.'+str(single.values[i][1]))+','
#print(oneway)

#----------------
fig = plt.figure()
ax = fig.add_subplot(111)
ax.get_xaxis().get_major_formatter().set_useOffset(False)
# plot the single ways
'''
for i in single.index:
#    print(i)
    xt=madison.loc[single.iloc[i]]['x'].values
    yt=madison.loc[single.iloc[i]]['y'].values
    x=xt[0]
    y=yt[0]
    dx=xt[1]-x
    dy=yt[1]-y

    ax.arrow(x,y,dx,dy,head_width=10, head_length=20, fc='r', ec='r', zorder=10,label=None)
#Mute the single ways
'''


# connect the roads
for i in arcs.index:
#    print(i)
    ax.plot(madison.loc[arcs.iloc[i]]['x'],madison.loc[arcs.iloc[i]]['y'],'--',c='b',label=None)# get the cooridinate of each pair of points and plot

ax.scatter(madison.x, madison.y,label=None)#plot the points
#targets=[1,2,3,4,9,10,13,56]
#      [0 1 2 3 4 5 6 7]
targets=[]
for a in sys.argv[1:]:
    targets.append(int(a))
targets=np.array(targets)
innerroute=pd.read_excel(r'innerroute.xls',header=None)
tsproute=pd.read_excel(r'route.xls',header=None)
print(innerroute.head())
import sol_to_index
route=pd.read_excel(r'route.xls',header=None,index=None)
numcars=max(route[0].values)
tspidx=sol_to_index.sol_to_index_mulit(r'route.xls',numcars)
def find_next(i,sol):
    return sol[sol[2]==i][3].values[0]
def find_inner_route():#tsp route, inner route
    totalroute=[]
    for i in range(numcars):
        real_target=targets[tspidx[i]]
        idxouter=[]
        for j in range(len(real_target)-1):

            stp=real_target[j]
            idxinner = [stp]
            edp = real_target[j+1]
            idxtemp=stp
            while 1:
                idxtemp=find_next(idxtemp,innerroute[innerroute[0]==real_target[j]][innerroute[1]==real_target[j+1]])
                if idxtemp==edp:
                    break
                idxinner.append(idxtemp)

            idxouter.extend(idxinner)
        idxouter.append(edp)
        totalroute.append(idxouter)
        pass
        kp=1
    return totalroute

troute=find_inner_route()
print(troute)
cnt=0
clist=['c','y','k','r','g','']
#----------------plot the arrows----------------
for i in troute:
    for j in range(len(i)-1):
        #print(i)
        xt=madison.loc[[i[j],i[j+1]]]['x'].values
        yt=madison.loc[[i[j],i[j+1]]]['y'].values
        x=xt[0]
        y=yt[0]
        dx=xt[1]-x
        dy=yt[1]-y
        ax.arrow(x,y,dx,dy,head_width=14, head_length=20, fc='r', ec='r', zorder=40,label=None,ls='--',overhang=1)
#------------end of arrows-------
for points in troute:
    ax.plot(madison.loc[points]['x'],madison.loc[points]['y'],markersize=20,c=clist[cnt],label=str(cnt),zorder=30,linewidth=(11-cnt)/2)
    cnt+=1
ax.plot(madison.loc[troute[0][0]]['x'],madison.loc[troute[0][0]]['y'],'o',markersize=30,label='Cento',c='b',alpha=0.5)# plot location of starting point
print(targets)
ax.plot(madison.x.loc[targets],madison.y.loc[targets],'x',markersize=20,c='g')
#ax.legend(loc='best')
plt.savefig(str(sys.argv[1:])+'solution.jpg')
plt.show()




#plt.show()

