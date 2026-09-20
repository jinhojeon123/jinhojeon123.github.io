---
title: "Cost Scaling Min-Cost Max-Flow with Epsilon-Optimal Push-Relabel"
date: 2026-01-10 18:00:00 +0900
categories: ["Numerical Methods"]
tags: ["network-flow", "cost-scaling", "epsilon-optimality", "push-relabel", "optimization", "cpp"]
description: "Working note on epsilon-optimal cost scaling and push-relabel; the implementation section contains pseudocode."
status: "working-note"
note_type: "numerical-method"
math: true
toc: true
permalink: "/posts/cost-scaling-mcmf-epsilon-optimal/"
---

## 1. Problem Definition

For a directed graph $G=(V,E)$ with capacities $c_e$ and costs $w_e$, the original objective is

$$
\begin{aligned}
\max\quad &\sum_{(u,v)\in E}f_{uv}\\
\min\quad &\sum_{(u,v)\in E}f_{uv}*w_{ev}
\end{aligned}
$$

[Correction required]

- Issue: The source, sink, and feasible-flow conditions are missing, and the sum of flows over all edges is used as the maximum-flow objective. $w_{ev}$ is also undefined.
- Why this matters: Summing flows over all edges differs from source-to-sink flow value and also rewards circulations. Without specifying the priority of the two objectives, the formulation does not define min-cost max-flow.
- Required revision: Specify $s,t$, capacity bounds, and flow conservation at internal vertices. Define flow value using net source outflow, then state the order of maximizing that value and minimizing cost, with consistent cost indices.

## 2. Epsilon-Optimality and Cost Scaling

### 2.1 Epsilon-Optimality

The original initial scaling parameter is

$$
\varepsilon ps=2^m\ge\max_{e\in E}|c_e|.
$$

Here $c_e$ is used to denote cost.

### 2.2 Cost-Scaling

The original reduced-cost condition is

$\hat c(u,v)=p[u]-e.cost-p[v]\ge-\varepsilon ps$.

[Correction required]

- Issue: $c_e$ denotes both capacity and cost, and the meaning of $\varepsilon ps$ is unclear. The residual graph, reverse-arc costs, potentials, and admissible arcs are undefined.
- Why this matters: Epsilon-optimality is an invariant over every residual arc, so it cannot be checked solely on edges of the original graph. The cost sign in the reduced-cost expression is also inconsistent with the later relabel formula.
- Required revision: Separate capacity, cost, potential, and epsilon notation, and define the residual network and reduced-cost convention. Recheck initialization, admissibility, reverse arcs, and the relabel formula under that convention.

## 3. Push-Relabel Algorithm

The original text introduces push-relabel as a heuristic for finding maximum flow, then adds costs.

[Correction required]

- Issue: Push-relabel and cost scaling are described only as heuristics, omitting the invariants and termination argument of the exact algorithm.
- Why this matters: Height labels in max-flow and potentials in min-cost flow play different roles. Correctness does not follow merely by adding costs.
- Required revision: Specify the cost-scaling variant in use and explain the roles of pseudoflow, excess, capacity feasibility, epsilon-optimality, and phase termination.

### 3.1 Push all edges

TODO: Identify the residual arcs to saturate and the amount to push.

### 3.2 Discharge and Relabel until excess becomes 0

After pushing, perform discharge/relabel operations to remove excess. The original potential update is

$$
p(u)=\max\{p(v)-e.cost-eps\mid e_{uv}\in E\text{ and }e.cap>0\}.
$$

[Correction required]

- Issue: This maximum-based update is inconsistent with the reduced-cost convention in §2.2.
- Why this matters: Under a consistent convention, the update must create an admissible arc while preserving the epsilon bound on residual outgoing arcs.
- Required revision: Derive relabeling by substituting the chosen reduced-cost formula into the epsilon-optimality inequality. Check that at least one admissible outgoing arc is created and specify what happens when no residual outgoing arc exists.

### 3.3 Exact optimality and termination

[Correction required]

- Issue: The explanation of why decreasing epsilon gives an exact optimum and the termination threshold are missing.
- Why this matters: Small epsilon alone does not imply exact optimality without integral costs and a feasible circulation.
- Required revision: Check the theorem connecting integer costs, residual-cycle lengths, and the epsilon bound. State the $\varepsilon<1/|V|$ criterion or a termination condition appropriate to cost rescaling, including zero excess at termination.

## 4. Pseudo Code and Implementation Tips

[Correction required]

- Issue: When integer eps is 1, `eps = (eps+1)/2` leaves it at 1, so the loop never terminates. The arbitrary positive cost/capacity of the added arc `(t,s)` and the final `cap == 0 and u<v` aggregation are also unjustified.
- Why this matters: Termination and maximum flow are not guaranteed, and partially used edges or vertex numbering may cause the aggregation to miss actual costs.
- Required revision: Apply a correct epsilon schedule and cost-scaling threshold. Either fix the maximum-flow value first or justify a circulation reduction. Design flow and cost reconstruction using original arc IDs, original capacities, and residual capacities, and check the range of magic constants and possible overflow.

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

TODO: State the assumptions of the selected variant, the number of phases, and the discharge/relabel costs.

## 6. Applications

### Bipartite Matching

- S(super source) → worker: cap=1, cost=0
- worker → job: cap=1, cost
- job → T(super sink): cap=1, cost=0
- (T,S): cap=max flow upper bound, cost=lower than min-cost

[Correction required]

- Issue: `cost = lower than min-cost` is undefined, so the matching objective represented by the added arc is unclear.
- Why this matters: Maximum-cardinality minimum-cost matching differs from minimum-cost matching with unrestricted cardinality.
- Required revision: State the desired cardinality priority and validate the model using the same capacity/cost conditions as the reduction chosen in §4.

## 7. Reference

1. Ford, L. R., Jr., and Fulkerson, D. R., *Flows in Networks*, Princeton Univ. Press, 1962.
2. Jack Edmonds, Richard M. Karp, *Theoretical Improvements in Algorithmic Efficiency for Network Flow Problems*, J. ACM., Vol. 19, No. 2, pp. 248–264, 1972.
3. E. A. Dinic, *Algorithm for Solution of a Problem of Maximum Flow in a Network with Power Estimation*, Doklady Akademii Nauk SSSR, Vol. 194, No. 4, pp. 754–757, 1970.
4. Goldberg, A. V., and Tarjan, R. E., *A New Approach to the Maximum-Flow Problem*, J. ACM., 35(4):921–940, 1988.
5. [Goldberg–Tarjan, Finding Minimum-Cost Circulations by Successive Approximation](https://www.cs.princeton.edu/research/techreps/634): direct source for cost scaling.
6. [Goldberg–Tardos–Tarjan, Network Flow Algorithms](https://www.cs.cornell.edu/~eva/Network.Flow.Algorithms.pdf): review of minimum-cost circulation and epsilon-optimality.
