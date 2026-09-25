---
title: "Conjugate Gradient Method: Theory and Implementation"
date: 2026-02-09 15:06:00 +0900
categories: ["Solvers"]
tags: ["conjugate-gradient", "krylov-methods", "spd", "matlab"]
description: "Working note connecting Krylov subspaces to a MATLAB conjugate gradient implementation; some derivations remain incomplete."
status: "working-note"
note_type: "numerical-method"
math: true
toc: true
permalink: "/numerical analysis/optimization/2026/02/09/conjugate-gradient.html"
projects: ["krylov-solvers"]
---

## 1. Motivation

Use information from previous residuals to reduce the condition-number dependence of Steepest Descent. The original text describes this as moving from a linearly decreasing algorithm to a quadratically decreasing algorithm.

[Correction required]

- Issue: The improved square-root dependence on the condition number is called quadratic convergence.
- Why this matters: Dependence of iteration complexity on $\kappa$ and the convergence order of an error sequence are different concepts.
- Required revision: Compare the condition-number dependence of iteration counts in the SD and CG energy-norm error bounds, and correct the phrase quadratic convergence. State the exact-arithmetic assumption separately.

Let $V$ be a finite-dimensional vector space, $k=\dim(V)$, and $\alpha\in V$. The original expression for the $T$-cyclic subspace is

$$
\{g(T)\alpha:g\in F[x]\}
=\operatorname{span}(\alpha,A\alpha,A^2\alpha,\ldots,A^{k-1}\alpha).
$$

[Correction required]

- Issue: $T$ is undefined, and the matrix $A$ is applied directly to an abstract vector $\alpha$.
- Why this matters: A convention is needed to identify a linear map with its matrix representation in a chosen basis.
- Required revision: Specify $T:V\to V$, the field, the chosen basis, and its relationship to $A$. Identify the Cayley–Hamilton/minimal-polynomial result that limits how far the span must extend.

Setting $\alpha=r_0$, the original text infers from $\langle r_k,r_{k+1}\rangle=0$ that $r_0,\ldots,r_i$ are all orthogonal. It then says that projecting $r_{i+1}$ onto the current span leaves only the complementary component and eliminates zig-zagging.

[Correction required]

- Issue: Pairwise orthogonality of all residuals is inferred from orthogonality of adjacent residuals. The object being projected and the inner product used are also unclear.
- Why this matters: Orthogonality of adjacent vectors says nothing by itself about earlier vectors. A property of SD cannot be used as global orthogonality for CG.
- Required revision: Use the CG recurrence to prove residual orthogonality separately from $A$-conjugacy of search directions. Connect the affine Krylov space, $A$-norm error minimization, and the residual Galerkin condition, and reassess the scope of the claim that zig-zagging disappears.

## 2. Prerequisite

- TODO: $T$-invariant subspace / cyclic subspace
- TODO: Krylov subspace
- TODO: Projection — oblique / orthogonal
- TODO: Petrov–Galerkin condition

[Suggested addition]

- Limitation of the current explanation: SPD and the $A$-inner product are essential assumptions of the code but are absent from the prerequisite list.
- Suggested addition: Link SPD matrices, the $A$-inner product, $A$-conjugate directions, and the residual/error relationship as prerequisites.
- Reason: These connections are needed to reconstruct the positive denominator and minimization property in the code.

## 3. Algorithm & Code

   ```matlab

   function x = CG_my(A,b) % A must be SPD
      n = length(b);
      x = zeros(n,1);
      i = 0;
      r = b-A*x;
      p = r;
      delta = r' * r;
      delta_0 = delta;
      epsilon = 1e-13;
      while i < 1000 && delta > epsilon * epsilon * delta_0
         % recursive 
         q = A*p; % use p instead of r
         alpha = delta / (p' * q); % use p instead of r
         x = x + alpha * p; % use p instead of r

         if ( mod(i,50) == 0)
            r = b - A*x;
         else
            r = r - alpha * q;
         end

         delta_old = delta; 
         delta = r' * r;
         beta = delta / delta_old; 
         p = r + beta * p;
         i=i+1;
      end
end
   ```

[Suggested addition]

- Limitation of the current explanation: The distinction between the recursively updated residual and periodically recomputed true residual, the fixed iteration cap, and the termination status of the returned solution are unexplained.
- Suggested addition: Distinguish exact-arithmetic orthogonality from loss of orthogonality in finite precision, and check the relative-residual criterion, zero initial residual, and convergence status.
- Reason: The code should not be interpreted as directly guaranteeing the mathematical finite-termination theorem.

## 4. Correctness

Original draft: Chevyshev polynomials → decreasing factor is quadratic,
$O(\frac{\sqrt\kappa-1}{\sqrt\kappa+1})$.

[Correction required]

- Issue: The name Chebyshev polynomials and a single ratio replace a correctness argument. The bound omits its norm, iteration exponent, constant, and hypotheses.
- Why this matters: The convergence estimate applies only after correctness of the CG recurrence and the Krylov minimization property have been established.
- Required revision: Add proof headings and TODOs in the order SPD/exact arithmetic, nonzero search directions, $A$-conjugacy, Krylov characterization, minimization, and finite termination. Then write precise statements of the polynomial error bound and Chebyshev estimate.

## 5. Improvements and Limitations

The existing next direction concerns conditioning and ellipsoid geometry: preconditioning that makes the ellipsoid closer to a sphere.

[Suggested addition]

- Limitation of the current explanation: The phrase “modify A” does not establish equivalence to the original linear system or the symmetry and positive definiteness required by CG.
- Suggested addition: Connect the preconditioner assumptions to the transformed unknown/system and a formulation that preserves SPD structure.
- Reason: This avoids interpreting an arbitrary matrix change as preserving the original solution and provides a path to PCG.

## 6. Reference

1. Hoffman, K., & Kunze, R. (1971). *Linear Algebra* (2nd ed.). Prentice-Hall.
2. Nocedal, J., & Wright, S. J. (2006). *Numerical Optimization* (2nd ed.). Springer.
3. [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf), §§6.7, 6.11.3: review of CG structure and convergence.
