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

## 1. Problem Definition.

  Given a directed graph $G = (V,E)$ with capacities $c_e$ and costs $w_e$, the min-cost max-flow problem is to find a flow $f$ that maximizes:

$$
\begin{aligned}
   \max \quad & \sum_{(u,v)\in E} f_{uv} \\ 
   \min \quad & \sum_{(u,v)\in E} f_{uv} * w_{ev} 
\end{aligned}
$$ 
       

## 2. Epsilon-Optimality and Cost Scaling.
    
   Initially, the scaling parameter $\varepsilon$ is depedent on its maximum cost: 

   $$
    \varepsilon ps = 2^m \ge \max_{e \in E}  |c_e| \\
   $$
   where $c_e$ denotes the cost associated with arc $e$.

## 3. 

## 4. 
