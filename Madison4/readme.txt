In this model we fit the model to make it more realistic- as if we are deliverying pizza . 

We make the number of cars to be floating, we now have a maximum time for each car to complete its trip. 
meanwhile, we have a const for fuel, fixed cost for each car, if used in the delivery. 
We set the objective function as the total cost, and we try to minimize the cost in the problem. 

you can run the model throuth auto.cmd
sample input:
auto 25 17 36 14 12 74 3

the first int is the starting point, and the others are the points on the map, ranging from 1 to 79.

sample input to cmd:
auto 25 16 23 44 11 70 
auto 13 54 74 12 19 63 41 14 

Workflow:
Use python file 'creat_distance.py' to calculate all the distance in Madison downtown on arcs and prepare the gams file to solve the shortest path problem.  
Use gams file get_inner to solve to the shortest path problem for the given destinations among all the points in Madison Downtown.
Use reader_inner.py to transform the given destinations to a new set of cities, with the distance calculated in the shortest path problem, then generate the gams file for next step.
Use gams MadisonTSP to solve for the new tsp problem. 
Use Madison_Tsp_Re.py to visualize the results. 