---
title: "Steepest Descent with SPD Matrices: Convergence"
date: 2026-02-04
categories: ["Solvers"]
tags: ["steepest-descent", "spd", "conditioning", "matlab", "python"]
description: "Derivations and MATLAB experiments for steepest descent on symmetric positive definite systems."
status: "working-note"
note_type: "numerical-method"
math: true
toc: true
permalink: "/numerical analysis/optimization/2026/02/04/steepest-descent-spd-convergence.html"
projects: ["krylov-solvers"]
---

## 1. Motivation

Study the foundations of sparse linear algebra and optimization through Steepest Descent (SD), then continue to CG and Preconditioned CG. Examine when an iterative method for $Ax=b$ becomes preferable to direct methods such as QR or LU.

## 2. Prerequisite

- **Eigenvalue and Eigenvector**: A scalar $\lambda$ and vector $x\ne0$ satisfying $Ax=\lambda x$. The eigenvalue $\lambda$ solves $\det(\lambda I-A)=0$.
- **Symmetric Matrix**: A square matrix satisfying $A^\top=A$.
- **Positive definite**: The original text defines this as a matrix satisfying $x^\top Ax>0$ for every vector $x$.
- **SPD**: A matrix that is symmetric and positive definite.

[Correction required]

- Issue: The quantifier in the definition of positive definiteness omits $x\ne0$.
- Why this matters: No matrix satisfies the strict inequality at $x=0$.
- Required revision: Specify the domain of real square matrices and revise the definition to quantify over nonzero vectors.

- **Normal matrix**: A complex square matrix satisfying $A^\star A=AA^\star$. Here $\star$ denotes the conjugate transpose; for a real matrix, $A^\star=A^\top$.
- **Spectral Theorem**: A normal operator $A$ on a finite-dimensional inner product space $V$ admits an orthonormal basis of eigenvectors.

The original text forms the matrix with eigenvectors as columns,

$$
Q=\begin{pmatrix}q_1,&q_2,&\cdots,&q_n\end{pmatrix}
$$

and makes the following claim:

$$
A=Q^{-1}\Lambda Q.
$$

The rows of $Q^\top$ are $q_i^\top$, so $Q^\top x$ gives the projection coefficients along the basis directions. Thus $Q^\top=Q^{-1}$, and the original text concludes that $A=Q^\top\Lambda Q$.

[Correction required]

- Issue: The real/complex field assumptions are missing, and the diagonalization formula has the wrong orientation for a matrix $Q$ whose columns are eigenvectors. Transpose is also used in the complex case.
- Why this matters: A real normal matrix need not have a real eigenbasis. The column-eigenvector convention must agree with $A=Q\Lambda Q^\top$, used in the later proof.
- Required revision: Distinguish this note's real SPD case from the complex normal case, and verify the direction of the basis change from $AQ=Q\Lambda$. Specify conjugate transpose and unitarity in the complex case.

- **Rayleigh Quotient**: $Ray(A)=\frac{x^\top Ax}{x^\top x}$.
- **Quadratic form**: For symmetric $A\in\mathbb R^{n\times n}$, let $f(x)=x^\top Ax$.
- **Iterative update rule**:

$$
x_{k+1}=x_k+\alpha_k r_k,
$$

Here $r_k$ is the descent direction and $\alpha_k$ is the step size.

- **Line search**:

$$
\alpha_k^\star\in\arg\min_{\alpha>0}f(x_k+\alpha p_k).
$$

Exact line search computes this minimizer; inexact line search does not require the exact minimizer.

- **Strictly convex function**: For differentiable $f:\mathbb R^n\to\mathbb R$,

$$
f(y)>f(x)+\nabla f(x)^\top(y-x)\qquad\forall x\ne y.
$$

- **Lipschitz continuous**: The original condition is

$$
\|\nabla f(x)-\nabla f(y)\|\le M\|x-y\|.
$$

- **Condition Number**: $\kappa(A)=\frac{\sigma_{\max}}{\sigma_{\min}}$. For SPD matrices, the spectral theorem gives $\kappa(A)=\frac{\lambda_{\max}}{\lambda_{\min}}$.

[Correction required]

- Issue: $Ray(A)$ omits vector dependence and $x\ne0$. The Lipschitz condition applies to the gradient rather than $f$ itself. The norm and nonsingularity assumptions for the condition number are also missing.
- Why this matters: The later step size depends on the Rayleigh quotient in the residual direction. Lipschitz continuity of a function and of its gradient are different properties.
- Required revision: Distinguish the matrix and vector arguments of the Rayleigh quotient, and state the domain, quantifiers, and constant for a Lipschitz gradient. Specify the induced 2-norm and invertibility for the condition number.

[Suggested addition]

- Limitation of the current explanation: The general search direction $p_k$ is mixed with the residual $r_k$ defined later.
- Suggested addition: Connect the fact that the SD residual is the negative gradient with the requirement to stop before line search when the exact solution is reached.
- Reason: This distinguishes direction selection from step-size selection and handles termination when the denominator is zero.

## 3. Algorithm

```matlab
code : matlab
input : A, SPD n x n, b = n x 1 vector
output : x = n x 1 vector


function x = steep_descent(A,b) % A must be SPD
    n = length(b);
    x = zeros(n,1);
    i = 0;
    r = b-A*x;
    delta = r' * r;
    delta_0 = delta;
    epsilon = 1e-13;
    iter_number = 27000;

    while i < iter_number  && delta > epsilon * epsilon * delta_0
                                    % until ||r_k||^2_2 < eps^2 ||r_0||^2_2
        q = A*r;                    % next step
        alpha = delta / (r' * q);   % alpha_k = (r'r)/r'Ar
        x = x + alpha * r;          % x_{k+1} = x_k + alpha_k r_k
        if ( mod(i,50) == 0)
            r = b - A*x;            % avoiding floating error, redefine
        else
            r = r - alpha * q;      % r_{k+1} = r_k - alpha_k A r_k
                                    % from x_{k+1} = x_{k} + alpha_k r_k
        end
        delta = r' * r;             % ||r_k||^2_2
        i=i+1;
    end
end
```

The original text presents avoiding $O(n^3)$ QR/LU/Gaussian elimination as an advantage of SD. Since the actual error $e_k$ is unknown, the code compares $\|r_k\|_2$ with $\|r_0\|_2$ and calls this relative error.

[Correction required]

- Issue: The terminology shifts from relative residual to relative error, and the advantage over direct methods is explained only as avoiding $O(n^3)$ work.
- Why this matters: The relation between residual and solution error involves conditioning. Sparse direct and iterative costs depend on sparsity, fill, iteration count, and tolerance.
- Required revision: Label the stopping criterion as a relative residual and explain its relation to forward error, including a zero initial residual. State the dense/sparse model and iteration count when comparing costs.

## 4. Correctness and Convergence

### Existence and uniqueness

Let $A\in\mathbb R^{n\times n}$ be SPD and consider

$$
f(x)=\frac12 x^\top Ax-b^\top x+c
$$

whose Hessian is

$$
\nabla^2f(x)=A\qquad\forall x\in\mathbb R^n
$$

so $f$ is strictly convex. A vector $0\ne x\in\ker A$ would contradict positive definiteness, so $A$ is invertible.

By the spectral theorem,

$$
x^\top Ax\ge\lambda_{\min}(A)\|x\|^2,
$$

Thus $f$ is coercive: $f(x)\to\infty$ as $\|x\|\to\infty$. Strict convexity and coercivity imply that a global minimizer $x^\star$ exists, with

$$
\nabla f(x^\star)=0,\qquad Ax^\star=b.
$$

Since $A$ is invertible, $x^\star=A^{-1}b$ is unique.

[Suggested addition]

- Limitation of the current explanation: The passage from the quadratic lower bound to coercivity including the linear term, and the conditions for attaining the minimum, are compressed.
- Suggested addition: State $b\in\mathbb R^n$ and $c\in\mathbb R$, compare the growth of the linear term, and identify where continuity and finite dimensionality are used.
- Reason: This makes it possible to reconstruct the separate roles of positive definiteness in existence and uniqueness.

### a. Constant step size with $0<\alpha<2/\lambda_{\max}$

Since $\nabla f(x)=Ax-b$, the update and residual are

$$
x_{k+1}=x_k-\alpha\nabla f(x_k)=x_k+\alpha r_k,
\qquad r_k=b-Ax_k.
$$

Set $e_k=x_k-x^\star$ and use $Ax^\star=b$ to obtain

$$
e_{k+1}=e_k+\alpha(Ax^\star-Ax_k)=(I-\alpha A)e_k.
$$

Using $I=QQ^\top$ and $A=Q\Lambda Q^\top$, the original text obtains

$$
\|e_{k+1}\|=\|I-\alpha A\|\|e_k\|
\le\max_i|1-\alpha\lambda_i|\|e_k\|
$$

[Correction required]

- Issue: The norm of a matrix-vector product is written as equal to the product of the operator norm and vector norm.
- Why this matters: Equality is not guaranteed for a general vector. Computing the operator norm as the largest absolute eigenvalue also depends on the norm and symmetry assumptions.
- Required revision: Specify the vector 2-norm and induced matrix 2-norm, and replace the first equality with the operator-norm inequality. Check the prerequisite result relating a symmetric matrix's norm to its eigenvalues.

The condition for contraction at every eigenvalue is

$$
\begin{aligned}
|1-\alpha\lambda_i|<1\quad\forall i
&\iff -1<1-\alpha\lambda_i<1\quad\forall i\\
&\iff 0<\alpha<2/\lambda_i\quad\forall i\\
&\iff 0<\alpha<2/\lambda_{\max}.
\end{aligned}
\tag{1}
$$

The next sentence in the original text claims that choosing $0<\alpha<1/\lambda_{\min}$ satisfies (1), then concludes $\|e_k\|\to0$, $x_k\to x^\star$, and $r_k\to0$. Convergence may fail when $\alpha\ge2/\lambda_{\max}$.

[Correction required]

- Issue: $0<\alpha<1/\lambda_{\min}$ does not guarantee (1).
- Why this matters: Depending on the ratio of the spectral endpoints, this interval can include step sizes that do not give contraction.
- Required revision: Make the convergence hypotheses consistent with (1), derived immediately above. Distinguish a guarantee for every initial error from exceptions restricted to particular eigenspaces.

### b. Exact line search (adaptive $\alpha_k$)

Define the energy norm by

$$
\|v\|_A^2=v^\top Av\qquad\forall v\in\mathbb R^n
$$

and estimate $\|e_{k+1}\|_A/\|e_k\|_A$. The original step size is

$$
\alpha_k=\frac1{Ray(A)}=\frac{r_k^\top r_k}{r_k^\top Ar_k}
$$

and is described as the minimizer of $\phi(\tau)=f(x_k+\alpha_k r_k)$.

[Correction required]

- Issue: The right-hand side of $\phi(\tau)$ contains no $\tau$, and the minimizer claim lacks both a derivation and the assumption $r_k\ne0$.
- Why this matters: The current expression is constant in $\tau$, and the step-size formula becomes $0/0$ at the solution.
- Required revision: Distinguish the line-search parameter from its optimizer and verify the one-variable derivative and positive second derivative. Separate termination at zero residual and specify the vector argument of the Rayleigh quotient.

The Rayleigh quotient of an SPD matrix lies in $[\lambda_{\min},\lambda_{\max}]$. The original eigenvalue expression is

$$
Ray(A)=\frac{x^\top Ax}{x^\top x}
=\frac{\sum_{i=1}^n\lambda_i\|x_i\|^2}{\sum_{i=1}^n\|x_i\|^2}.
$$

Because the nonnegative weights sum to 1, this weighted average lies between the smallest and largest eigenvalues.

[Correction required]

- Issue: It is unspecified whether $x_i$ is an original coordinate or an eigenbasis coordinate.
- Why this matters: The displayed weighted-eigenvalue expression requires eigenbasis coordinates, and its denominator is zero at $x=0$.
- Required revision: State that it is a coordinate of $Q^\top x$, and connect it to the nonzero-vector assumption and the corrected diagonalization in §2.

Expanding the energy error gives

$$
\begin{aligned}
\|e_{k+1}\|_A^2
&=(e_k+\alpha_k r_k)^\top A(e_k+\alpha_k r_k)\\
&=\|e_k\|_A^2+2\alpha_k r_k^\top Ae_k+\alpha_k^2r_k^\top Ar_k.
\end{aligned}
$$

Substituting $r_k=-Ae_k$ and the step-size formula gives

$$
\|e_{k+1}\|_A^2
=\|e_k\|_A^2
-2\frac{r_k^\top r_k}{r_k^\top Ar_k}(r_k^\top r_k)
+\frac{(r_k^\top r_k)^2}{(r_k^\top Ar_k)^2}(r_k^\top Ar_k),
$$

Therefore,

$$
\frac{\|e_{k+1}\|_A^2}{\|e_k\|_A^2}
=1-\frac{(r_k^\top r_k)^2}{r_k^\top Ar_k}\frac1{\|e_k\|_A^2}. \tag{2}
$$

In $A=Q\Lambda Q^\top$, set $y=Q^\top e_k$ to obtain

$$
p_i=\frac{y_i^2}{\sum_jy_j^2},\quad p_i\ge0,\quad\sum_i p_i=1,
\qquad \beta=\sum_i y_i^2,\quad\beta p_i=y_i^2
$$

and use the following three quantities.

$$
\begin{aligned}
M_1&=r_k^\top r_k=e_k^\top A^2e_k
=\sum_i\lambda_i^2y_i^2=\beta\sum_i\lambda_i^2p_i,\\
M_2&=r_k^\top Ar_k=e_k^\top A^3e_k
=\sum_i\lambda_i^3y_i^2=\beta\sum_i\lambda_i^3p_i,\\
M_3&=\|e_k\|_A^2=e_k^\top Ae_k
=\sum_i\lambda_i y_i^2=\beta\sum_i\lambda_i p_i.
\end{aligned}
$$

The original text substitutes this into (2) and writes

$$
\frac{\|e_{k+1}\|_A}{\|e_k\|_A}=1-\frac{M_1^2}{M_2M_3}.
$$

[Correction required]

- Issue: Unlike (2), the final ratio omits the square on the norm. Neither $p_i$ nor the error ratio is defined at $e_k=0$. The original mixture of $y$, $y_k$, and $y_{k,i}$ was standardized above to the $i$th coordinate of $y=Q^\top e_k$.
- Why this matters: Confusing a squared-norm estimate with a norm estimate changes the contraction factor.
- Required revision: Make the square in this expression consistent with (2), and state that division is performed only before the solution is reached.

Now set

$$
a_i=\sqrt{\lambda_i}|y_i|,\qquad
b_i=\lambda_i^{3/2}|y_i|,
\qquad m=\lambda_{\min},\quad M=\lambda_{\max}
$$

and use $b_i/a_i=\lambda_i\in[m,M]$, as in the original text, to obtain

$$
(Ma_i-b_i)(b_i-ma_i)\ge0
$$

and perform the following calculation.

$$
\begin{aligned}
\sum_i(Ma_i-b_i)(b_i-ma_i)&\ge0\\
\iff (m+M)\sum_i a_ib_i
&\ge\sum_i b_i^2+mM\sum_i a_i^2\\
&\ge2\sqrt{mM}\sqrt{(\sum_i a_i^2)(\sum_i b_i^2)}\\
\iff \frac{(\sum_i a_ib_i)^2}{(\sum_i a_i^2)(\sum_i b_i^2)}
&\ge\frac{4(mM)^2}{(m+M)^2}\\
\iff \frac{(\sum_i\lambda_i^2y_i^2)^2}{(\sum_i\lambda_i^3y_i^2)(\sum_i\lambda_i y_i^2)}
&\ge\frac{4mM}{(m+M)^2}\\
\iff\frac{M_1^2}{M_2M_3}&\ge\frac{4mM}{(m+M)^2}.
\end{aligned}
$$

[Correction required]

- Issue: The numerator in the squared line is $4(mM)^2$, inconsistent with $4mM$ in the next line. Equivalence is used where an inequality is weakened, and $b_i/a_i$ is undefined when $y_i=0$. The original repeated substitution also omitted $|y_i|$ from $b_i$ and some indices on $\lambda$ in the sum. The indices above were made consistent with the earlier definitions.
- Why this matters: This bound determines the final contraction factor, so its coefficients and implications must be correct. Zero eigenbasis coordinates must also be allowed.
- Required revision: Verify the coefficient in the squaring step and correct the implication where AM–GM is used. Justify the coordinatewise inequality without dividing by zero coordinates.

[Suggested addition]

- Limitation of the current explanation: The long inequality does not reveal why $a_i,b_i$ were chosen.
- Suggested addition: Explain in your own words the comparison of three spectral moments, the conversion of the spectral interval into a coordinatewise inequality, and the role of AM–GM.
- Reason: This proof technique can be reused in other convergence estimates and is more than a routine algebraic manipulation.

The original conclusion is therefore

$$
\begin{aligned}
\frac{\|e_{k+1}\|_A^2}{\|e_k\|_A^2}
&=1-\frac{M_1^2}{M_2M_3}
\le1-\frac{4mM}{(m+M)^2}
=\frac{(\kappa-1)^2}{(\kappa+1)^2},\\
\|e_{k+1}\|_A&\le\frac{\kappa-1}{\kappa+1}\|e_k\|_A.
\end{aligned}
\tag{3}
$$

The original text argues that $\kappa=\lambda_{\max}/\lambda_{\min}>0$ makes $(\kappa-1)/(\kappa+1)$ positive and less than 1, and concludes convergence under exact line search.

### Speed of convergence

Iterating (3), with $q=(\kappa-1)/(\kappa+1)\in(0,1)$ as in the original text, gives

$$
\|e_k\|_A\le q^k\|e_0\|_A\qquad(k\ge0).
$$

The original approximate loop count is

$$
N=\frac{\log(1/\varepsilon)}{\log(d)},\qquad
d=\frac{\kappa+1}{\kappa-1}>1. \tag{4}
$$

[Correction required]

- Issue: When $\kappa=1$, $q=0$, so neither the positivity claim nor the formula for $d$ applies as written. A worst-case error bound is treated as an approximation to the actual loop count.
- Why this matters: For SPD matrices, $\kappa\ge1$, and the endpoint must be treated separately. How closely the upper bound is attained depends on the spectrum and initial error.
- Required revision: Separate $\kappa=1$ and the case where the initial iterate is already the solution. For $\kappa>1$, interpret (4) as a sufficient iteration count for a prescribed energy-norm tolerance, and state the integer ceiling and exact-arithmetic assumption.

The existing experiment compares (4) with the observed loop count at $n=1000$, $\kappa=1800$, and $\varepsilon=10^{-13}$.

Python:

```python
import math as m
>>> d = (1800-1)/(1800+1)
>>> k = m.log(10**(-13))/m.log(d)
>>> k
26940.242816399925
```

MATLAB:

```matlab

>> n = 1000;
>> [Q, ~] = qr(randn(n)); % QR
>> D = sparse(1:n, 1:n, linspace(1, 1800, n)); % to break Guassian-distribution
>> A_bad = Q*D*Q';                             % SPD
>> [~, i] = steep_descent_eA2(A_bad,[1:1:1000]');

i =

       26703

```

Validation code:

```matlab

% This is for validation of its loop counts.

function x = steep_descent_eA2(A,b) % A must be SPD
    n = length(b);
    x = zeros(n,1);

    xstar = A \ b;    % For validation purpose only
    e = x - xstar;
    eA2 = e' * A * e; % ||e_0||^2_A
    eA2_0 = eA2;

    i = 0;
    r = b-A*x;
    delta = r' * r;

    epsilon = 1e-13;
    while i < 100000 &&  eA2 > epsilon * epsilon * eA2_0
                                  % ||e_{k+1}||^2_A > eps^2 * ||e_0||^2_A

        q = A*r;

        alpha = delta / (r' * q); % a_k = r'r /(r'Ar)
        x = x + alpha * r;        % x_{k+1} = x_k + a_k * r_k (r_k = -A e_k)
        if ( mod(i,50) == 0)      % for reducing floating error
            r = b - A*x;
        else
            r = r - alpha * q;    % r_{k+1} = r_{k} - alpha_k q(=Ar)
        end

        delta = r' * r;
        e = x - xstar;
        eA2 = e' * A * e;
        i=i+1;
    end
    i
end

```

[Correction required]

- Issue: The call requests two outputs, `[~, i]`, but the function signature returns only `x`.
- Why this matters: Running the code as written cannot reproduce the reported iteration count. A single random-matrix experiment also does not establish the general sharpness of the bound.
- Required revision: Make the return values and call consistent, and record the random seed, arithmetic environment, and actual stopping criterion. Account for reference-solution error and residual drift when checking whether the tolerance was attained.

## 5. Limitations and Next Direction

### Conditioning and cost

For large $\kappa$, the original text describes the per-iteration error reduction as

$$
1-\frac{\kappa-1}{\kappa+1}=\frac2{\kappa+1}\approx0
$$

and compares the $O(\kappa)$ iteration count unfavorably with $O(\sqrt\kappa)$. Its cost expression using dense matrix-vector products is

$$
O(n^2|\mathrm{loop}|)
=O\left(n^2\frac{\log(1/\varepsilon)}{\log d}\right)
=O\bigl(\kappa n^2\log(1/\varepsilon)\bigr),
$$

$$
\log d=\log\left(1+\frac2{\kappa-1}\right)\approx\frac2\kappa.
$$

The original explanation is: “The theoretical complexity is $O(n^2)$, but large constants involving $\kappa$ and $1/\varepsilon$ may make it slower than $O(n^3)$.”

[Correction required]

- Issue: A worst-case contraction bound is presented as the actual reduction, and dependence on $\kappa$ and tolerance is treated as constant when the total complexity is called $O(n^2)$.
- Why this matters: Actual reduction varies between iterations; changes in $n$, conditioning, and tolerance must be distinguished. The earlier tolerance dependence is logarithmic, not proportional to $1/\varepsilon$ itself.
- Required revision: Distinguish a guaranteed reduction bound from the observed reduction, and separate per-iteration and total costs. State whether tolerance is fixed and distinguish dense costs from sparse costs involving $\operatorname{nnz}(A)$.

### Zig-zag

The existing observations concern orthogonality of adjacent residuals and the error update in an eigenbasis.

$$
\langle r_k,r_{k+1}\rangle=0. \tag{5}
$$

$$
y_{k+1}=(I-\alpha_k\Lambda)y_k,
\qquad y_{k+1,i}=(1-\alpha_k\lambda_i)y_{k,i},
\qquad \frac1{\lambda_{\max}}\le\alpha_k\le\frac1{\lambda_{\min}}. \tag{6}
$$

From (5) and (6), the original text concludes that SD zig-zags while reducing the residual component associated with the largest eigenvalue. The next study topic is CG, which improves condition-number dependence.

[Correction required]

- Issue: Equations (5) and (6) alone do not imply that the component associated with the largest eigenvalue decreases at every iteration.
- Why this matters: Individual multipliers need not have magnitude less than 1. Decrease of the energy norm is different from decrease of every component.
- Required revision: Verify why exact line search gives (5), and analyze the sign and magnitude of the multiplier in (6). Distinguish total energy decrease, oscillation, and componentwise changes.

[Suggested addition]

- Limitation of the current explanation: The comparison of two convergence ratios suggests that the CG bound directly replaces the one-step contraction factor for SD.
- Suggested addition: Connect CG's Krylov minimization to its polynomial error bound in the next note, and compare the norms, constants, and iteration dependence of the bounds.
- Reason: This avoids confusing improved square-root dependence on the condition number with quadratic convergence.

## 6. Reference

- J. Nocedal and S. J. Wright, _Numerical Optimization_, 2nd ed., Springer, 2006.
  https://link.springer.com/book/10.1007/978-0-387-40065-5
- “Painless Conjugate Gradient,” CMU:
  https://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf
- Line Search Methods — Cornell Optimization Wiki:
  https://optimization.cbe.cornell.edu/index.php?title=Line_search_methods
- [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf), §§5.3.1, 6.11.3: review of SD/CG convergence statements.
