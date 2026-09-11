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

Directed graph $G=(V,E)$, capacities $c_e$, costs $w_e$에 대한 원문의 objective는 다음과 같다.

$$
\begin{aligned}
\max\quad &\sum_{(u,v)\in E}f_{uv}\\
\min\quad &\sum_{(u,v)\in E}f_{uv}*w_{ev}
\end{aligned}
$$

[수정 필요]

- 문제: source / sink와 feasible flow 조건이 없고, 모든 edge의 flow 합을 maximum-flow objective로 사용한다. $w_{ev}$도 정의되지 않았다.
- 왜 문제인지: edge 전체의 flow 합은 source-to-sink flow value와 다르며 circulation까지 보상한다. 두 objective의 우선순위도 빠져 min-cost max-flow를 정의하지 못한다.
- 어떻게 수정해야 하는지: $s,t$, capacity bounds, internal vertex의 flow conservation을 명시하고 source의 net outflow를 기준으로 flow value를 작성할 것. maximum value를 먼저 고정한 뒤 cost를 최소화하는 순서와 cost index를 정리할 것.

## 2. Epsilon-Optimality and Cost Scaling

### 2.1 Epsilon-Optimality

원문의 초기 scaling parameter:

$$
\varepsilon ps=2^m\ge\max_{e\in E}|c_e|.
$$

여기서는 $c_e$를 cost라고 사용한다.

### 2.2 Cost-Scaling

원문의 reduced-cost 조건:

$\hat c(u,v)=p[u]-e.cost-p[v]\ge-\varepsilon ps$.

[수정 필요]

- 문제: $c_e$가 capacity와 cost로 중복 사용되고 $\varepsilon ps$의 의미가 불명확하다. residual graph, reverse arc cost, potential과 admissible arc가 정의되지 않았다.
- 왜 문제인지: epsilon-optimality는 residual arc 전체에 대한 invariant이므로 원래 graph의 edge 조건만으로는 확인할 수 없다. reduced cost의 cost 부호와 뒤 relabel 식도 맞지 않는다.
- 어떻게 수정해야 하는지: capacity / cost / potential / epsilon notation을 분리하고 residual network 및 reduced-cost convention을 직접 정의할 것. 그 convention으로 initialization, admissibility, reverse arc와 relabel 식을 모두 재검산할 것.

## 3. Push-Relabel Algorithm

원문은 push-relabel을 max-flow를 찾는 heuristic algorithm으로 소개하고 cost를 추가한다.

[수정 필요]

- 문제: push-relabel과 cost scaling을 heuristic으로만 소개해 exact algorithm의 invariant와 종료 논리가 빠져 있다.
- 왜 문제인지: max-flow의 height label과 min-cost의 potential은 역할이 다르며, cost를 추가하는 것만으로 correctness가 따라오지 않는다.
- 어떻게 수정해야 하는지: 사용 중인 cost-scaling variant를 정하고 pseudoflow, excess, capacity feasibility, epsilon-optimality의 역할과 phase 종료 조건을 직접 정리할 것.

### 3.1 Push all edges

TODO: saturation 대상 residual arc와 push 양.

### 3.2 Discharge and Relabel until excess becomes 0

Push 후 excess를 없애기 위해 discharge / relabel을 수행한다. 원문의 potential update:

$$
p(u)=\max\{p(v)-e.cost-eps\mid e_{uv}\in E\text{ and }e.cap>0\}.
$$

[수정 필요]

- 문제: 이 max update는 §2.2의 reduced-cost convention과 일치하지 않는다.
- 왜 문제인지: 같은 convention으로 residual outgoing arc의 epsilon bound를 보존하면서 admissible arc를 만들 수 있어야 한다.
- 어떻게 수정해야 하는지: 선택한 reduced-cost 식을 epsilon-optimality 부등식에 직접 대입해 relabel을 유도할 것. 최소 하나의 admissible outgoing arc가 생기는지, residual outgoing arc가 없는 경우는 어떻게 처리하는지 확인할 것.

### 3.3 Exact optimality and termination

[수정 필요]

- 문제: epsilon을 줄이면 exact optimum을 얻는 이유와 종료 threshold가 비어 있다.
- 왜 문제인지: 작은 epsilon만으로는 cost의 integrality 및 feasible circulation 조건 없이 exact optimality를 결론낼 수 없다.
- 어떻게 수정해야 하는지: integer cost, residual cycle 길이와 epsilon bound를 연결하는 theorem을 직접 확인하고 $\varepsilon<1/|V|$ 기준 또는 cost rescaling에 맞는 종료 조건을 작성할 것. 종료 시 excess가 0인지도 포함할 것.

## 4. Pseudo Code and Implementation Tips

[수정 필요]

- 문제: `eps = (eps+1)/2`는 integer eps가 1이면 그대로 1이어서 loop가 끝나지 않는다. 추가 arc `(t,s)`의 임의의 positive cost / capacity와 마지막 `cap == 0 and u<v` 집계도 정당화되지 않았다.
- 왜 문제인지: 종료와 최대 flow를 보장하지 못하며, 부분 사용된 edge와 vertex numbering 때문에 실제 cost를 놓칠 수 있다.
- 어떻게 수정해야 하는지: 정확한 epsilon schedule과 cost-scaling threshold를 적용할 것. maximum flow를 먼저 고정하거나 정당화한 circulation reduction을 택하고, original arc id / original capacity / residual capacity를 이용한 flow 및 cost 복원을 직접 설계할 것. magic constant의 범위와 overflow도 확인할 것.

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

TODO: 선택한 variant의 assumptions, phase 수, discharge / relabel 비용.

## 6. Applications

### Bipartite Matching

- S(super source) → worker: cap=1, cost=0
- worker → job: cap=1, cost
- job → T(super sink): cap=1, cost=0
- (T,S): cap=max flow upper bound, cost=lower than min-cost

[수정 필요]

- 문제: `cost = lower than min-cost`가 정의되지 않아 추가 arc가 어떤 matching objective를 구현하는지 알 수 없다.
- 왜 문제인지: maximum-cardinality minimum-cost matching과 cardinality가 자유로운 minimum-cost matching은 서로 다르다.
- 어떻게 수정해야 하는지: 원하는 cardinality 우선순위를 명시하고 §4에서 정한 reduction과 같은 capacity / cost 조건을 사용해 model을 직접 검증할 것.

## 7. Reference

1. Ford, L. R., Jr., and Fulkerson, D. R., *Flows in Networks*, Princeton Univ. Press, 1962.
2. Jack Edmonds, Richard M. Karp, *Theoretical Improvements in Algorithmic Efficiency for Network Flow Problems*, J. ACM., Vol. 19, No. 2, pp. 248–264, 1972.
3. E. A. Dinic, *Algorithm for Solution of a Problem of Maximum Flow in a Network with Power Estimation*, Doklady Akademii Nauk SSSR, Vol. 194, No. 4, pp. 754–757, 1970.
4. Goldberg, A. V., and Tarjan, R. E., *A New Approach to the Maximum-Flow Problem*, J. ACM., 35(4):921–940, 1988.
5. [Goldberg–Tarjan, Finding Minimum-Cost Circulations by Successive Approximation](https://www.cs.princeton.edu/research/techreps/634): cost scaling의 직접 출처.
6. [Goldberg–Tardos–Tarjan, Network Flow Algorithms](https://www.cs.cornell.edu/~eva/Network.Flow.Algorithms.pdf): minimum-cost circulation, epsilon-optimality 검토.
