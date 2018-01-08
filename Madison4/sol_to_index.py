import numpy as np
import pandas as pd
def find_next(i,sol):
    return sol.loc[i].values[1]

def find_next_m(i,sol):
    return sol.loc[i].values[1]
def sol_to_index(path):#path=path+file
    sol=pd.read_excel(path,sep='',header=None)
    lst=[0]
    idx = 0
    while 1:
        idx=find_next(idx,sol)
        if idx==0:
            break
        lst.append(idx)
    return lst
def sol_to_index_mulit(path,numcar):
    sol_total = pd.read_excel(path, sep='', header=None)
    car_id=[x for x in range(1,numcar+1)]
    lst_total=[]
    for i in car_id:
        sol=sol_total[sol_total[0]==i].drop([0], axis=1)
        sol=sol.rename(index=sol[1])
        lst = [0]
        idx = 0
        while 1:
            idx = find_next_m(idx, sol)
            if idx == 0:
                break
            lst.append(idx)
        lst.append(0)
        lst_total.append(lst)
    return lst_total
