import numpy as np
import pandas as pd
import argparse
import sys
#innum=input('Please Specify the number of cities you want to generate: ')
#inputs:
#1.  number of cities, int
#2. if real random or persudo random, 0 true random, 1 presudo, int
ncities=int(sys.argv[1])
cities=np.random.RandomState(100).normal(0,1,(ncities,2))
path=r'D:\Learning\Graduate\isye524\project\experiments'
np.savez(r'datasave'+str(ncities),ncities,cities)
distance_matrix=np.zeros([ncities,ncities])
for i in range(ncities):
    for j in range(ncities):
        distance_matrix[i,j]=np.linalg.norm(cities[i,:]-cities[j,:])

# save the data
pd.DataFrame(data=distance_matrix,index=range(ncities),columns=[i for i in range(ncities)]).to_csv(str(ncities)+'_distance.csv',sep=',',float_format='%.2f')


real_random=int(sys.argv[2])
#creat not passing points
if real_random==0:
    sizenotcnt=int(ncities/3.33)
else :
    sizenotcnt=np.random.random_integers(0,ncities-1,1)

if real_random==0:
    temp1=np.random.RandomState(100).random_integers(0,ncities-1,sizenotcnt)
    temp2=np.random.RandomState(200).random_integers(0,ncities-1,sizenotcnt)
#for true randomness
else :
    temp1 = np.random.random_integers(0, ncities - 1, sizenotcnt)
    temp2 = np.random.random_integers(0, ncities - 1, sizenotcnt)
notconnecting=''
for i in range(sizenotcnt):
    notconnecting+=(str(temp1[i])+'.'+str(temp2[i]))+' '
filetemp=open(r'notconnectingdata_'+str(ncities)+'.dat', "w")
filetemp.write(notconnecting)
filetemp.close()
filetemp2=open(r'notconnectingdata''.dat', "w")
filetemp2.write(notconnecting)
filetemp2.close()
#traffic_jam
if real_random==0:
    weight_matrix=np.random.RandomState(100).poisson(0.1,(ncities,ncities))+np.random.RandomState(100).exponential(2,(ncities,ncities))
    weightchange_matrix=np.random.RandomState(100).normal(0,1,(ncities,ncities))*np.random.RandomState(100).exponential(0.5,(ncities,ncities))
    jam=weight_matrix+weightchange_matrix
else :
    weight_matrix = np.random.poisson(0.1, (ncities, ncities)) + np.random.exponential(2, (ncities, ncities))
    weightchange_matrix = np.random.normal(0, 1, (ncities, ncities)) * np.random.exponential(0.5, (ncities, ncities))
    jam = weight_matrix + weightchange_matrix
for i in range(ncities):
    for j in range(ncities):
        if jam[i,j]<0:
            jam[i,j]=0
frawnme=str(ncities)+r'_distance_withjam'
fnme=frawnme+'.csv'
distance_withjam=pd.DataFrame(data=distance_matrix+jam,index=range(ncities),columns=[i for i in range(ncities)]).to_csv(str(ncities)+'_distance_withjam.csv',sep=',',float_format='%.2f')
tempfile=pd.DataFrame(data=distance_matrix+jam,index=range(ncities),columns=[i for i in range(ncities)]).to_csv('distance.csv',sep=',',float_format='%.2f')

with open('output.txt','w') as f:
    f.write(fnme)
print('Successfully generated data for ',ncities, ' cities, to the file ', fnme)

