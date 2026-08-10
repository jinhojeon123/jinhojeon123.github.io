---

# the default layout is 'page'

> **About This Site**
>
> This site is a personal study archive focused on **numerical analysis, optimization, PDEs, and scientific computing**, with an emphasis on connecting mathematical theory to practical implementation in C++ and Python.
> {: .prompt-tip }

## Areas of Interest

| Area | Topics | Focus |
| --- | --- | --- |
| **Numerical Analysis** | numerical linear algebra, iterative methods, stability, conditioning | Understanding both mathematical convergence and computational behavior |
| **Optimization / OR** | combinatorial optimization, network flow, scheduling | Connecting mathematical models, algorithms, and implementations |
| **FEM / PDE** | weak formulations, discretization, sparse systems, nonlinear solvers | Translating continuous mathematical problems into computable discrete systems |
| **Scientific Computing** | sparse linear algebra, memory access, parallel computation | Understanding how algorithmic structure interacts with computational performance |

---

## Organization of the Site

The site contains several different kinds of notes.

### Study Notes

Long-form notes developed while studying textbooks, papers, or individual mathematical topics.

Current subjects include:

- Real Analysis and Measure Theory
- Numerical Analysis
- Numerical Linear Algebra
- Optimization
- Partial Differential Equations
- Finite Element Methods

### Seminar Notes

Notes prepared or reorganized specifically for seminar presentations.

Compared with the study archive, these notes tend to emphasize:

- theorem statements,
- proof structure,
- intuition,
- examples and counterexamples,
- connections between related results.

### Computational Notes

Whenever appropriate, theoretical material is accompanied by small numerical experiments or implementations.

The general goal is to follow the path

**mathematical formulation → derivation → numerical method → implementation**

rather than treating theory and computation as separate subjects.

> Most notes are organized around  
> **definition → intuition → theorem/proof → example or counterexample → computational interpretation**,  
> whenever the topic allows it.
> {: .prompt-info }

---

## Current Directions

My current study is centered around several related themes:

- convergence theorems and functional-analytic foundations for numerical PDEs,
- sparse linear systems arising from discretized PDEs,
- iterative methods such as CG and preconditioned Krylov methods,
- preconditioning and domain decomposition,
- finite element discretization and weak formulations,
- the interaction between numerical algorithms and computational cost.

A recurring question throughout these notes is:

> **How does the mathematical structure of a problem determine the numerical method we should use?**

---

## Writing Principles

### Mathematical clarity

Assumptions, notation, and the precise scope of a result are stated explicitly whenever possible.

### Derivation over memorization

Rather than recording formulas alone, I try to preserve the reasoning that leads to them.

### Examples and counterexamples

Definitions and theorems are supplemented with examples whenever they help clarify why a hypothesis is necessary.

### Computational perspective

For numerical topics, I also consider practical issues such as:

- computational complexity,
- sparsity,
- conditioning,
- memory access,
- convergence behavior,
- and implementation details.

### Reproducibility

When numerical experiments are included, the goal is to keep them small enough to reproduce and inspect directly.

---

## Tools

I primarily use:

- **C++** for numerical algorithms and performance-oriented implementations,
- **Python** for prototyping, numerical experiments, and visualization,
- **Markdown / LaTeX** for mathematical notes,
- **Git / GitHub** for version control and maintaining this archive.

Topics that frequently appear in implementation-oriented notes include sparse linear algebra, graph algorithms, optimization, and numerical PDEs.

---

## Notes on the Archive

This site is primarily a **working study archive**, not a finished textbook.

Some posts are polished expository notes, while others reflect an intermediate stage of study and may be revised as my understanding develops.

Corrections, counterexamples, and comments on mathematical or computational errors are always welcome.

---

> **Last site build:** {{ site.time | date: "%Y-%m-%d" }}
> {: .prompt-info }