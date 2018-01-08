This model contains a single airport problem:
What is the shortest path to go through all the cities and finally get back to the origin?
you can run the model with auto.cmd in this dictionary.
In this model we generate the cities randomly and solve them. 
* Note, we also generate some cities without direct filght between them. i.e. we can not go from city A to B if they are not connected. 
there are two inputs for the cmd file:
1. numc, number of cities, in integer
2. 0/1, bool value 0 indicates a pseudo random result, we can reproduce the same result each time. 
	1 indicates a true random result.  

sample input to cmd:

auto 10 1

auto 13 0 

Workflow:
1. Use python file 'project_data_gen.py' to generate all random data for cities
2. Use python file 'modify_gams_file' to modify gams file 'temp' to suit for the generated data. 
3. Use temp.gms to solve the tsp problem.
4. USe python file 'sol_vis_multi_auto.py' to visualize the results. 


