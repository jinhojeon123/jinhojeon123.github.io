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

Steepest Descent (SD)를 통해 sparse linear algebra와 optimization의 기초를 공부하고 CG / Preconditioned CG로 이어간다. $Ax=b$를 푸는 iterative method가 QR / LU 같은 direct method보다 유리해지는 조건을 살펴본다.

## 2. Prerequisite

- **Eigenvalue and Eigenvector**: $Ax=\lambda x$를 만족하는 scalar $\lambda$와 $x\ne0$. $\lambda$는 $\det(\lambda I-A)=0$의 해이다.
- **Symmetric Matrix**: $A^\top=A$인 square matrix.
- **Positive definite**: 원문에서는 모든 vector $x$에 대해 $x^\top Ax>0$인 matrix라고 정의한다.
- **SPD**: symmetric이면서 positive definite인 matrix.

[수정 필요]

- 문제: positive definiteness의 quantifier에 $x\ne0$이 빠져 있다.
- 왜 문제인지: $x=0$일 때 strict inequality를 만족하는 matrix는 없다.
- 어떻게 수정해야 하는지: real square matrix의 domain을 명시하고 nonzero vector에 대한 조건으로 definition을 직접 수정할 것.

- **Normal matrix**: complex square matrix에서 $A^\star A=AA^\star$. $\star$는 conjugate transpose이며 real matrix에서는 $A^\star=A^\top$이다.
- **Spectral Theorem**: finite-dimensional inner product space $V$의 normal operator $A$에 대해 eigenvector로 이루어진 orthonormal basis가 존재한다.

원문은 eigenvector를 column으로 갖는 matrix

$$
Q=\begin{pmatrix}q_1,&q_2,&\cdots,&q_n\end{pmatrix}
$$

를 두고 다음을 주장한다.

$$
A=Q^{-1}\Lambda Q.
$$

$Q^\top$의 row는 $q_i^\top$이므로 $Q^\top x$가 각 basis direction의 projection coefficient를 준다. 따라서 $Q^\top=Q^{-1}$이고, 원문에서는 $A=Q^\top\Lambda Q$라고 결론낸다.

[수정 필요]

- 문제: real / complex field의 가정이 빠졌고, eigenvector를 column으로 둔 $Q$와 diagonalization 식의 방향이 맞지 않는다. complex case에서도 transpose를 사용한다.
- 왜 문제인지: real normal matrix가 real eigenbasis를 갖는 것은 아니다. column eigenvector convention은 뒤 proof에서 사용하는 $A=Q\Lambda Q^\top$와 일치해야 한다.
- 어떻게 수정해야 하는지: 이 글의 real SPD case와 complex normal case를 구분하고, $AQ=Q\Lambda$에서 basis-change 방향을 직접 검산할 것. complex case에는 conjugate transpose와 unitary 조건을 명시할 것.

- **Rayleigh Quotient**: $Ray(A)=\frac{x^\top Ax}{x^\top x}$.
- **Quadratic form**: symmetric $A\in\mathbb R^{n\times n}$에 대해 $f(x)=x^\top Ax$.
- **Iterative update rule**:

$$
x_{k+1}=x_k+\alpha_k r_k,
$$

  여기서 $r_k$는 descent direction, $\alpha_k$는 step size이다.
- **Line search**:

$$
\alpha_k^\star\in\arg\min_{\alpha>0}f(x_k+\alpha p_k).
$$

  Exact line search는 이 minimizer를 계산하고, inexact line search는 정확한 minimizer까지 구하지 않는다.
- **Strictly convex function**: differentiable $f:\mathbb R^n\to\mathbb R$에 대해

$$
f(y)>f(x)+\nabla f(x)^\top(y-x)\qquad\forall x\ne y.
$$

- **Lipschitz continuous**: 원문의 조건은

$$
\|\nabla f(x)-\nabla f(y)\|\le M\|x-y\|.
$$

- **Condition Number**: $\kappa(A)=\frac{\sigma_{\max}}{\sigma_{\min}}$. SPD에서는 spectral theorem에 의해 $\kappa(A)=\frac{\lambda_{\max}}{\lambda_{\min}}$.

[수정 필요]

- 문제: $Ray(A)$에 vector dependence와 $x\ne0$이 빠져 있다. Lipschitz condition은 $f$ 자체가 아니라 gradient에 대한 조건이다. condition number의 norm / nonsingularity도 명시하지 않았다.
- 왜 문제인지: 뒤의 step size는 residual 방향의 Rayleigh quotient에 의존한다. function의 Lipschitz continuity와 gradient의 Lipschitz continuity는 다른 성질이다.
- 어떻게 수정해야 하는지: Rayleigh quotient의 matrix와 vector 인자를 구분하고, gradient Lipschitz의 domain / quantifier / 상수를 작성할 것. condition number는 induced 2-norm과 invertibility를 명시할 것.

[보완 권장]

- 현재 설명의 한계: general search direction $p_k$와 뒤에서 정의할 residual $r_k$가 혼용된다.
- 추가하면 좋은 내용: SD에서는 residual이 negative gradient인 이유와, exact solution에 도달하면 line search 전에 멈추는 조건을 직접 연결할 것.
- 이유: 방향 선택과 step-size 선택을 구분하고 분모가 0이 되는 종료 상태를 처리하기 위해 필요하다.

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

원문은 SD의 장점으로 $O(n^3)$의 QR / LU / Gaussian elimination을 피한다는 점을 제시한다. 실제 error $e_k$를 모르므로 code에서는 $\|r_k\|_2$를 $\|r_0\|_2$와 비교하며, 이를 relative error라고 부른다.

[수정 필요]

- 문제: relative residual을 뒤 문장에서 relative error라고 불러 terminology가 흔들리고, direct method보다 유리한 이유를 $O(n^3)$ 연산을 피한다는 점만으로 설명한다.
- 왜 문제인지: residual과 solution error의 관계에는 conditioning이 관여한다. sparse direct cost와 iterative cost는 sparsity, fill, iteration 수와 tolerance에 따라 달라진다.
- 어떻게 수정해야 하는지: stopping criterion을 relative residual로 표시하고 forward error와의 관계 및 초기 residual이 0인 경우를 직접 정리할 것. dense / sparse model과 iteration 수를 명시해 비교할 것.

## 4. Correctness and Convergence

### Existence and uniqueness

$A\in\mathbb R^{n\times n}$를 SPD라 하고

$$
f(x)=\frac12 x^\top Ax-b^\top x+c
$$

를 생각한다. Hessian은

$$
\nabla^2f(x)=A\qquad\forall x\in\mathbb R^n
$$

이며 $f$는 strictly convex이다. $0\ne x\in\ker A$가 존재하면 positive definiteness에 모순이므로 $A$는 invertible이다.

Spectral theorem에 의해

$$
x^\top Ax\ge\lambda_{\min}(A)\|x\|^2,
$$

따라서 $f$는 coercive이며 $\|x\|\to\infty$일 때 $f(x)\to\infty$이다. Strict convexity와 coerciveness에 의해 global minimum $x^\star$가 존재하고,

$$
\nabla f(x^\star)=0,\qquad Ax^\star=b.
$$

$A$가 invertible이므로 $x^\star=A^{-1}b$는 유일하다.

[보완 권장]

- 현재 설명의 한계: quadratic lower bound에서 선형항을 포함한 coercivity로 가는 단계와 minimum attainment의 조건이 압축되어 있다.
- 추가하면 좋은 내용: $b\in\mathbb R^n$, $c\in\mathbb R$를 명시하고, 선형항의 성장률 비교 및 continuity / finite dimension을 사용하는 지점을 직접 표시할 것.
- 이유: positive definiteness가 existence와 uniqueness에 각각 어떻게 사용되는지 복원할 수 있다.

### a. Constant step size with $0<\alpha<2/\lambda_{\max}$

$\nabla f(x)=Ax-b$이므로 update와 residual은

$$
x_{k+1}=x_k-\alpha\nabla f(x_k)=x_k+\alpha r_k,
\qquad r_k=b-Ax_k.
$$

$e_k=x_k-x^\star$로 두고 $Ax^\star=b$를 사용하면

$$
e_{k+1}=e_k+\alpha(Ax^\star-Ax_k)=(I-\alpha A)e_k.
$$

$I=QQ^\top$, $A=Q\Lambda Q^\top$에서 원문은

$$
\|e_{k+1}\|=\|I-\alpha A\|\|e_k\|
\le\max_i|1-\alpha\lambda_i|\|e_k\|
$$

를 얻는다.

[수정 필요]

- 문제: matrix-vector product의 norm을 operator norm과 vector norm의 곱과 같다고 쓴다.
- 왜 문제인지: 일반적인 vector에서 equality는 보장되지 않는다. eigenvalue의 최대 절댓값으로 operator norm을 계산하는 단계도 norm과 symmetry에 의존한다.
- 어떻게 수정해야 하는지: vector 2-norm / induced matrix 2-norm을 명시하고 첫 equality를 operator-norm inequality로 바로잡을 것. symmetric matrix의 norm을 eigenvalue로 계산하는 dependency를 확인할 것.

모든 eigenvalue에 대해 contraction을 얻는 조건은

$$
\begin{aligned}
|1-\alpha\lambda_i|<1\quad\forall i
&\iff -1<1-\alpha\lambda_i<1\quad\forall i\\
&\iff 0<\alpha<2/\lambda_i\quad\forall i\\
&\iff 0<\alpha<2/\lambda_{\max}.
\end{aligned}
\tag{1}
$$

원문의 다음 문장에서는 $0<\alpha<1/\lambda_{\min}$을 선택하면 (1)을 만족한다고 주장한다. 이어 $\|e_k\|\to0$, $x_k\to x^\star$, $r_k\to0$를 결론낸다. $\alpha\ge2/\lambda_{\max}$에서는 수렴하지 않을 수 있다.

[수정 필요]

- 문제: $0<\alpha<1/\lambda_{\min}$은 (1)을 보장하지 않는다.
- 왜 문제인지: spectrum의 양 끝 비율에 따라 이 interval에는 contraction이 아닌 step size도 들어간다.
- 어떻게 수정해야 하는지: convergence 결론의 hypothesis를 바로 앞에서 얻은 (1)과 일치시킬 것. 모든 initial error에 대한 보장과 특정 eigenspace에서의 예외를 구분할 것.

### b. Exact line search (adaptive $\alpha_k$)

Energy norm은

$$
\|v\|_A^2=v^\top Av\qquad\forall v\in\mathbb R^n
$$

로 두고, $\|e_{k+1}\|_A/\|e_k\|_A$를 추정한다. 원문의 step size는

$$
\alpha_k=\frac1{Ray(A)}=\frac{r_k^\top r_k}{r_k^\top Ar_k}
$$

이며 $\phi(\tau)=f(x_k+\alpha_k r_k)$의 minimizer라고 설명한다.

[수정 필요]

- 문제: $\phi(\tau)$의 우변에 $\tau$가 없고, minimizer라는 주장에 derivation 및 $r_k\ne0$ 조건이 빠져 있다.
- 왜 문제인지: 현재 식은 $\tau$에 대해 상수이며, 해에 도달하면 step-size formula가 $0/0$이 된다.
- 어떻게 수정해야 하는지: line-search parameter와 optimizer를 구별하고 1-variable derivative / positive second derivative를 직접 확인할 것. residual이 0인 종료 경우를 분리하고 Rayleigh quotient의 vector 인자를 명시할 것.

SPD matrix의 Rayleigh quotient는 $[\lambda_{\min},\lambda_{\max}]$에 속한다. 원문의 eigenvalue 표현은

$$
Ray(A)=\frac{x^\top Ax}{x^\top x}
=\frac{\sum_{i=1}^n\lambda_i\|x_i\|^2}{\sum_{i=1}^n\|x_i\|^2}.
$$

Nonnegative weight의 합이 1이므로 이 weighted average는 최소 eigenvalue와 최대 eigenvalue 사이에 있다.

[수정 필요]

- 문제: $x_i$가 original coordinate인지 eigenbasis coordinate인지 명시되지 않았다.
- 왜 문제인지: 표시된 weighted eigenvalue 식은 eigenbasis에서의 coordinate를 사용해야 하며 $x=0$에서는 denominator가 0이다.
- 어떻게 수정해야 하는지: $Q^\top x$의 coordinate임을 명시하고 nonzero vector 가정 및 §2의 corrected diagonalization과 연결할 것.

Energy error를 전개하면

$$
\begin{aligned}
\|e_{k+1}\|_A^2
&=(e_k+\alpha_k r_k)^\top A(e_k+\alpha_k r_k)\\
&=\|e_k\|_A^2+2\alpha_k r_k^\top Ae_k+\alpha_k^2r_k^\top Ar_k.
\end{aligned}
$$

$r_k=-Ae_k$와 step-size 식을 대입하면

$$
\|e_{k+1}\|_A^2
=\|e_k\|_A^2
-2\frac{r_k^\top r_k}{r_k^\top Ar_k}(r_k^\top r_k)
+\frac{(r_k^\top r_k)^2}{(r_k^\top Ar_k)^2}(r_k^\top Ar_k),
$$

따라서

$$
\frac{\|e_{k+1}\|_A^2}{\|e_k\|_A^2}
=1-\frac{(r_k^\top r_k)^2}{r_k^\top Ar_k}\frac1{\|e_k\|_A^2}. \tag{2}
$$

$A=Q\Lambda Q^\top$에서 $y=Q^\top e_k$로 두고

$$
p_i=\frac{y_i^2}{\sum_jy_j^2},\quad p_i\ge0,\quad\sum_i p_i=1,
\qquad \beta=\sum_i y_i^2,\quad\beta p_i=y_i^2
$$

로 두자. 다음의 세 quantity를 사용한다.

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

원문은 이를 (2)에 대입해 다음 식을 쓴다.

$$
\frac{\|e_{k+1}\|_A}{\|e_k\|_A}=1-\frac{M_1^2}{M_2M_3}.
$$

[수정 필요]

- 문제: (2)와 달리 마지막 비율의 norm에서 square가 빠졌다. $p_i$와 error ratio는 $e_k=0$에서 정의되지 않는다. 원문의 $y$, $y_k$, $y_{k,i}$ 혼용은 위 전개에서 $y=Q^\top e_k$의 $i$번째 coordinate로 통일해 표시했다.
- 왜 문제인지: squared norm estimate와 norm estimate를 혼동하면 contraction factor가 달라진다.
- 어떻게 수정해야 하는지: 이 식의 square를 (2)와 일치시키고 해에 도달하지 않은 iteration에서만 나눗셈을 수행한다고 명시할 것.

이제

$$
a_i=\sqrt{\lambda_i}|y_i|,\qquad
b_i=\lambda_i^{3/2}|y_i|,
\qquad m=\lambda_{\min},\quad M=\lambda_{\max}
$$

로 둔다. 원문은 $b_i/a_i=\lambda_i\in[m,M]$를 사용해

$$
(Ma_i-b_i)(b_i-ma_i)\ge0
$$

를 얻고 다음 계산을 한다.

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

[수정 필요]

- 문제: 제곱한 줄의 numerator가 $4(mM)^2$로 되어 다음 줄의 $4mM$과 다르다. inequality를 약화시키는 단계에도 equivalence를 사용하며 $y_i=0$일 때 $b_i/a_i$를 정의할 수 없다. 원문의 중복 substitution 설명에서는 $b_i$의 $|y_i|$가 빠졌고 sum 안의 $\lambda$ index도 일부 누락되어 있었다. 위에서는 앞의 정의와 동일한 index를 표시했다.
- 왜 문제인지: 이 bound가 최종 contraction factor의 핵심이므로 coefficient와 implication이 맞아야 한다. zero eigenbasis coordinate도 허용되어야 한다.
- 어떻게 수정해야 하는지: 제곱 단계의 coefficient를 직접 검산하고 AM–GM을 사용하는 곳의 implication을 바로잡을 것. zero coordinate를 나누지 않는 방식으로 coordinatewise inequality를 정당화할 것.

[보완 권장]

- 현재 설명의 한계: 긴 inequality에서 왜 $a_i,b_i$를 선택했는지 proof idea가 드러나지 않는다.
- 추가하면 좋은 내용: 세 spectral moment의 ratio를 비교하는 목적, spectrum interval을 coordinatewise inequality로 옮기는 단계, AM–GM의 역할을 본인의 말로 표시할 것.
- 이유: 이 proof technique는 단순한 algebra와 달리 다른 convergence estimate에서도 재사용할 가치가 있다.

따라서 원문의 결론은

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

원문은 $\kappa=\lambda_{\max}/\lambda_{\min}>0$이므로 $(\kappa-1)/(\kappa+1)$이 positive이고 1보다 작다고 하여 exact line search의 convergence를 결론낸다.

### Speed of convergence

(3)을 반복하면, 원문에서 $q=(\kappa-1)/(\kappa+1)\in(0,1)$로 놓았을 때

$$
\|e_k\|_A\le q^k\|e_0\|_A\qquad(k\ge0).
$$

원문의 approximate loop count는

$$
N=\frac{\log(1/\varepsilon)}{\log(d)},\qquad
d=\frac{\kappa+1}{\kappa-1}>1. \tag{4}
$$

[수정 필요]

- 문제: $\kappa=1$이면 $q=0$이어서 positive라는 주장과 $d$의 식을 그대로 사용할 수 없다. worst-case error bound를 실제 loop count의 근사식처럼 사용한다.
- 왜 문제인지: SPD에서는 $\kappa\ge1$이며 endpoint를 분리해야 한다. upper bound의 달성 정도는 spectrum과 initial error에 따라 달라진다.
- 어떻게 수정해야 하는지: $\kappa=1$ 및 초기 해의 경우를 분리하고, $\kappa>1$에서 prescribed energy-norm tolerance를 보장하는 sufficient iteration count로 (4)를 해석할 것. 정수 ceiling과 exact arithmetic 가정도 명시할 것.

기존 실험은 $n=1000$, $\kappa=1800$, $\varepsilon=10^{-13}$에서 (4)와 관측 loop count를 비교한다.

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

[수정 필요]

- 문제: 호출부는 `[~, i]` 두 output을 요구하지만 function signature는 `x` 하나만 반환한다.
- 왜 문제인지: 제시된 code를 그대로 실행하면 보고된 iteration count를 재현할 수 없다. random matrix 한 번의 관측도 bound의 일반적 sharpness를 증명하지 않는다.
- 어떻게 수정해야 하는지: 반환값과 호출을 일치시키고 random seed / arithmetic 환경 / 실제 종료 조건을 기록할 것. computed reference solution의 error와 residual drift도 고려해 tolerance 달성 여부를 확인할 것.

## 5. Limitations and Next Direction

### Conditioning and cost

원문에서는 큰 $\kappa$에서 per-iteration error reduction을

$$
1-\frac{\kappa-1}{\kappa+1}=\frac2{\kappa+1}\approx0
$$

로 설명하고, iteration 수가 $O(\kappa)$라서 $O(\sqrt\kappa)$보다 느리다고 비교한다. Dense matrix-vector product를 사용한 원문의 cost 식은

$$
O(n^2|\mathrm{loop}|)
=O\left(n^2\frac{\log(1/\varepsilon)}{\log d}\right)
=O\bigl(\kappa n^2\log(1/\varepsilon)\bigr),
$$

$$
\log d=\log\left(1+\frac2{\kappa-1}\right)\approx\frac2\kappa.
$$

원문은 이를 “theoretical complexity는 $O(n^2)$이지만 $\kappa$와 $1/\varepsilon$의 큰 constant 때문에 $O(n^3)$보다 느릴 수 있다”고 설명한다.

[수정 필요]

- 문제: worst-case contraction bound를 실제 감소량으로 읽게 하고, $\kappa$와 tolerance dependence를 constant로 취급해 전체 complexity를 $O(n^2)$라고 부른다.
- 왜 문제인지: actual reduction은 iteration에 따라 달라지며 $n$, conditioning, tolerance의 변화는 구분해야 한다. 앞의 tolerance dependence는 $1/\varepsilon$ 자체가 아니라 logarithm이다.
- 어떻게 수정해야 하는지: guaranteed reduction bound와 실제 감소를 구분하고 per-iteration / total cost를 분리할 것. fixed tolerance 여부, dense cost와 sparse $\operatorname{nnz}(A)$ 비용을 명시할 것.

### Zig-zag

기존 관찰은 adjacent residual의 orthogonality와 eigenbasis error update이다.

$$
\langle r_k,r_{k+1}\rangle=0. \tag{5}
$$

$$
y_{k+1}=(I-\alpha_k\Lambda)y_k,
\qquad y_{k+1,i}=(1-\alpha_k\lambda_i)y_{k,i},
\qquad \frac1{\lambda_{\max}}\le\alpha_k\le\frac1{\lambda_{\min}}. \tag{6}
$$

원문은 (5), (6)에서 SD가 zig-zag하면서 residual의 largest-eigenvalue component를 줄인다고 결론낸다. 다음 학습 목표는 condition-number dependence를 줄이는 CG이다.

[수정 필요]

- 문제: (5), (6)만으로 largest-eigenvalue component가 매 iteration 감소한다고 결론낼 수 없다.
- 왜 문제인지: individual multiplier의 절댓값이 항상 1보다 작지는 않으며 energy norm의 감소와 각 component의 감소는 다르다.
- 어떻게 수정해야 하는지: exact line search에서 (5)가 나오는 이유를 직접 확인하고 (6)의 multiplier sign / magnitude를 분석할 것. total energy decrease, oscillation, componentwise change를 구분할 것.

[보완 권장]

- 현재 설명의 한계: 원문의 두 convergence ratio 비교만으로는 CG의 bound가 SD의 one-step contraction을 그대로 대체하는 것처럼 보인다.
- 추가하면 좋은 내용: CG의 Krylov minimization과 polynomial error bound를 다음 글에서 연결하고 bound의 norm / 상수 / iteration dependence를 직접 대조할 것.
- 이유: condition number의 제곱근 의존성 개선을 quadratic convergence와 혼동하지 않기 위해 필요하다.

## 6. Reference

- J. Nocedal and S. J. Wright, *Numerical Optimization*, 2nd ed., Springer, 2006.
  https://link.springer.com/book/10.1007/978-0-387-40065-5
- “Painless Conjugate Gradient,” CMU:
  https://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf
- Line Search Methods — Cornell Optimization Wiki:
  https://optimization.cbe.cornell.edu/index.php?title=Line_search_methods
- [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf), §§5.3.1, 6.11.3: SD / CG의 convergence statement 검토.
