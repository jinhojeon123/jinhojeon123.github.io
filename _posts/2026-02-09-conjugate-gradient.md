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

### 1. Motivation

Steepest Descent의 condition number 의존성을 줄이기 위해 이전 residual의 정보를 활용한다. 원문에서는 이를 linearly decreasing algorithm에서 quadratically decreasing algorithm으로의 전환이라고 표현한다.

[수정 필요]

- 문제: condition number의 제곱근 의존성 개선을 quadratic convergence라고 부른다.
- 왜 문제인지: iteration complexity의 $\kappa$ 의존성과 error sequence의 convergence order는 다른 개념이다.
- 어떻게 수정해야 하는지: SD와 CG의 energy-norm error bound에서 iteration 수의 condition number 의존성을 비교하고 quadratic convergence라는 표현을 바로잡을 것. exact arithmetic 가정을 구분할 것.

$V$를 finite-dimensional vector space, $k=\dim(V)$, $\alpha\in V$라 하자. $T$-cyclic subspace에 대한 원문의 식은 다음과 같다.

$$
\{g(T)\alpha:g\in F[x]\}
=\operatorname{span}(\alpha,A\alpha,A^2\alpha,\ldots,A^{k-1}\alpha).
$$

[수정 필요]

- 문제: $T$가 정의되지 않았고 abstract vector $\alpha$에 matrix $A$를 바로 적용한다.
- 왜 문제인지: linear map과 선택한 basis에서의 matrix representation을 동일시하는 convention이 필요하다.
- 어떻게 수정해야 하는지: $T:V\to V$, field와 선택한 basis, $A$의 관계를 명시하고 Cayley–Hamilton / minimal polynomial이 span의 끝을 제한하는 dependency를 표시할 것.

$\alpha=r_0$로 두고, 원문은 $\langle r_k,r_{k+1}\rangle=0$에서 $r_0,\ldots,r_i$가 모두 orthogonal이라고 결론낸다. 이어서 $r_{i+1}$을 현재 span에 projection하면 complement만 남아 zig-zag가 사라진다고 설명한다.

[수정 필요]

- 문제: 인접 residual의 orthogonality에서 모든 residual의 pairwise orthogonality를 추론한다. 무엇을 어떤 inner product로 projection하는지도 불명확하다.
- 왜 문제인지: 인접한 두 vector만 orthogonal이라는 사실은 그 이전 vector들과의 관계를 주지 않는다. SD의 성질을 CG의 전역 orthogonality로 사용할 수 없다.
- 어떻게 수정해야 하는지: CG recurrence에 근거한 residual orthogonality와 search direction의 $A$-conjugacy를 구별해 직접 증명할 것. affine Krylov space, error의 $A$-norm minimization, residual의 Galerkin condition을 연결하고 zig-zag가 사라진다는 주장의 범위를 재검토할 것.

### 2. Prerequisite

- TODO: $T$-invariant subspace / cyclic subspace
- TODO: Krylov subspace
- TODO: Projection — oblique / orthogonal
- TODO: Petrov–Galerkin condition

[보완 권장]

- 현재 설명의 한계: SPD와 $A$-inner product가 code의 핵심 전제인데 prerequisite 목록에서 드러나지 않는다.
- 추가하면 좋은 내용: SPD, $A$-inner product, $A$-conjugate directions, residual / error의 관계를 prerequisite로 직접 연결할 것.
- 이유: code의 positive denominator와 minimization property를 복원하기 위해 필요한 연결이다.

### 3. Algorithm & Code

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
         q = A*p; % r 대신 p 
         alpha = delta / (p' * q); % r 대신 p
         x = x + alpha * p; % r 대신 p 

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

[보완 권장]

- 현재 설명의 한계: recursive residual과 주기적으로 재계산한 true residual의 차이, 고정 iteration cap, 반환된 해의 종료 상태가 설명되지 않았다.
- 추가하면 좋은 내용: exact arithmetic의 orthogonality와 finite precision의 loss of orthogonality를 구분하고, relative residual 기준 및 zero initial residual, convergence status를 직접 점검할 것.
- 이유: 이 code를 mathematical finite-termination theorem의 직접 구현 보장으로 해석하지 않게 해야 한다.

### 4. Correctness

원문의 초안: Chevyshev polynomials → decreasing factor is quadratic,
$O(\frac{\sqrt\kappa-1}{\sqrt\kappa+1})$.

[수정 필요]

- 문제: Chebyshev polynomials의 이름과 한 비율만으로 correctness를 대신하고, bound의 norm, iteration exponent, 상수와 hypotheses가 빠져 있다.
- 왜 문제인지: convergence estimate는 CG recurrence의 correctness와 Krylov minimization property가 먼저 확보되어야 적용할 수 있다.
- 어떻게 수정해야 하는지: SPD / exact arithmetic, nonzero search directions, $A$-conjugacy, Krylov characterization, minimization, finite termination의 순서로 proof heading과 본인을 위한 TODO를 보완할 것. 그 뒤 polynomial error bound와 Chebyshev estimate의 정확한 statement를 직접 작성할 것.

### 5. Improvements and Limitations

Conditioning과 ellipsoid geometry에 대한 기존 다음 방향: ellipsoid를 sphere에 가깝게 바꾸는 preconditioning.

[보완 권장]

- 현재 설명의 한계: “modify A”라는 표현만으로는 원래 linear system과의 equivalence, CG에 필요한 symmetry / positive definiteness가 드러나지 않는다.
- 추가하면 좋은 내용: preconditioner의 assumptions와 transformed unknown / system, SPD를 유지하는 formulation을 직접 연결할 것.
- 이유: 단순한 matrix 변경으로 원래 문제의 해까지 바뀌는 해석을 피하고 PCG로 이어가기 위해 필요하다.

### 6. Reference

1. Hoffman, K., & Kunze, R. (1971). *Linear Algebra* (2nd ed.). Prentice-Hall.
2. Nocedal, J., & Wright, S. J. (2006). *Numerical Optimization* (2nd ed.). Springer.
3. [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf), §§6.7, 6.11.3: CG structure 및 convergence review.
