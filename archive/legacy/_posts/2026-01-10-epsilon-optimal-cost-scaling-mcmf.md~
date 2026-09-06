---
title: "Cost Scaling Min-Cost Max-Flow with Epsilon-Optimal Push-Relabel"
date: 2026-01-10 18:00:00 +0900

categories: [Algorithms, Optimization]
tags: [
  min-cost max-flow,
  cost-scaling,
  epsilon-optimal,
  push-relabel,
  network-flow,
  combinatorial-optimization,
  cplusplus,
  graph-algorithms,
  operations-research
]

math: true
permalink: /posts/cost-scaling-mcmf-epsilon-optimal/

sitemap:
  changefreq: monthly
  priority: 0.6

description: "Implementation and analysis of a cost-scaling epsilon-optimal push-relabel algorithm for the min-cost max-flow problem."
author: "JIN HO JEON"
---

## 0. Caution.

a. This is continuously updated. 

## 1. Problem Definition.

  Given a directed graph $G = (V,E)$ with capacities $c_e$ and costs $w_e$, the min-cost max-flow problem is to find a flow $f$ that maximizes:

$$
\begin{aligned}
   \max \quad & \sum_{(u,v)\in E} f_{uv} \\ 
   \min \quad & \sum_{(u,v)\in E} f_{uv} * w_{ev} 
\end{aligned}
$$ 


## 2. Epsilon-Optimality and Cost Scaling.

    
### 2.1. Epsilon-Optimality 
   Initially, the scaling parameter $\varepsilon$ is depedent on its maximum cost: 

   $$
    \varepsilon ps = 2^m \ge \max_{e \in E}  |c_e| \\
   $$
   where $c_e$ denotes the cost associated with arc $e$.

### 2.2. Cost-Scaling.

   Define $\hat{c}(u,v)$ = $p[u]$ - $e.cost$ - $p[v]$ >= - $\varepsilon ps$ 

## 3. Push-Relabel Algorithm.

   This is an heuristic algorithm to find out max-flow for given directed weight graph G = (V, E).
   From this concept, we add one more property "cost." 



### 3.1. Push all edges. 
    
   "Push"

### 3.2. Discharge and Relabel until excess becomes 0.
    
   Now after pushing the capacity of edges, we need to do "Discharge" and "Relabel".

   This is simply for setting new admissible arc following the condition of epsilon. (2.1.)
   In this reason, while doing relabelling, we set the value of potential of u as below:

   $$
   \begin{aligned}
    p(u) \ = \ \max \{ \ p(v) - e.cost - eps \ | \ e_{uv} \in E \ and \  e.cap >0 \}  
   \end{aligned}
   $$ 

### 3.3  How could it obtain the exact solution with heuristic algorithm using eps?



## 4. Pseudo Code and Implementation Tips
    
```cpp

solve(int n, int s, int t){
 
    G <- addEdge(t,s, 1e9, 1e16); 

    while(eps>=1){
        
    for each admissible edge (u,v):
        push(u,v)

    for each active vertex u:
        discharge(u)

        eps = (eps+1)/2 
    }

    for each edge (u, v, cap, cost):
        findMaxFlow

    for each edge (u, v, cap, cost):
        if (cap == 0 and u<v):
            collectAllCost
}
```

## 5. Time Complexity and Limitation  

   Since 

## 6. Applications and  Future.
  
   1. Bipartite Matching 
    Model design : 
      - S(super source) -> worker (cap=1, cost=0)
      - worker -> job (cap=1, cost)
      - job -> T(super sink) (cap=1, cost=0)
      - (T,S) (cap=max flow upper bound, cost = lower than min-cost) if you used the algorithm to solve this.
   
   2.  

## 7. Reference.
