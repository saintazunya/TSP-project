In this model, we apply the data from Madison Downtown to the model.
Unlike the airports, we have to calculate distances from point to points by arcs. 
The solution is to seprate the sysyem into two parts:
1. we first calculate the shortest path between the given destinations by acrs, and then 
2. construct a series of new TSP cities with distance calculated by shortest problem. 

We apply the model constructed in experiment section to the data in Madison. 
This model set the objective as min max of the three cars to access each point.
We minimize the maximum distance by each of the cars.

sample input to cmd:
auto 25 16 23 44 11 70 
auto 13 54 74 12 19 63 41 14 

Workflow:
Use python file 'creat_distance.py' to calculate all the distance in Madison downtown on arcs and prepare the gams file to solve the shortest path problem. 
Use gams file get_inner to solve to the shortest path problem for the given destinations among all the points in Madison Downtown.
Use reader_inner.py to transform the given destinations to a new set of cities, with the distance calculated in the shortest path problem, then generate the gams file for next step.
Use gams MadisonTSP to solve for the new tsp problem. 
Use Madison_Tsp_Re.py to visualization the results. 


