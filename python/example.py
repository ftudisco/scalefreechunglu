import time
import networkx as nx
import fastchunglu as fcl


n = int(1e6)

# Model's Parameters: Generate a random Chung-Lu graph with average degree d, max degree m, and power-law degree distribution with exponent gamma
gamma = 2.2
m = n ** .5 
d = 10
p = 1/(gamma-1)
c = (1-p)*d*(n**p)
i0 = (c/m)**(1/p) - 1
w = [c/((i+i0)**p) for i in range(n)]

t = time.time()
A = fcl.make_sparse_adj_matrix(w)
print("Elapsed time with fcl sparse matrix: " + "{:.2f}".format(time.time() - t) + " seconds.")

t = time.time()
G = fcl.make_nx_graph(w)
print("Elapsed time with fcl networkx graph: " + "{:.2f}".format(time.time() - t) + " seconds.")

t = time.time()
G = nx.expected_degree_graph(w)
print("Elapsed time with networkx built in function: " + "{:.2f}".format(time.time() - t) + " seconds.")

    

 


