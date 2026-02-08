---
title: "Steepest Descent with SPD Matrices: Convergence"
date: 2026-02-04
categories: [Numerical Analysis, Optimization]
tags: [Steepest Descent, SPD, Convergence, Gradient Descent]
math: true
---


## 1. Motivation 
  This is a first step to navigate into the world of Sparse Linear Algebra(spLA) and Optimization. I chose to master this, **Steep-descent(SD)** algorithm first, as it provides the essential intuition for more advanced methods like **CG**, **Preconditioned CG**. A key question we will address is: how could iterative methods find the solution to $Ax=b$ faster than **QR**, **LU decomposition** etcs?

## 2. Prerequisite 
- **Eigenvalue and Eigenvector**:  
  Def : An eigenvalue $\lambda$ of $A$ is a scalar satisfying 

 $$ 
\quad \quad    Ax = \lambda x, \ \text{with} \ x\not=0 
 $$ 

 where $\lambda$ is a solution of $\det(\lambda I - A)=0$, x $\not=0$ is called **eigen-vector**.

- **Symmetric Matrix**:  
  def : a square matrix $A$ is symmetric matrix if $A^T = A$.

- **Positive definite**:   
  def : a matrix $A$ is positive definite if for any vector $x$, $x^T A x >0$.

- **SPD**:   
  def : We say that $A$ is **SPD**(symmetric, positive-definite) if $A$ is symmetric, and positive definite.  

- **normal matrix**:  
  def : a complex square matrix A is normal if ${A^*}A = A{A^*}$. If $A$ is a real-matrix, then $A^*$ = $A^T$. the operation $*$ denotes "conjugate and transpose" in $\mathbb{C}^{n \times n}$.    

- **Spectral Theorem** : Let $𝐴$ be a normal operator on a finite-dimensional inner product space $𝑉$. Then there exists an orthonormal basis of $𝑉$ consisting of eigenvectors of $𝐴$.  

    i.e. by Spectral theorem, if A is normal matrix, there exists an orthogonal basis $\beta$ of eigenvectors A. by basis change from $\alpha$ to $\beta$, we can define the change of basis matrix 

    $$ 
        Q = \begin{pmatrix} q_1, \ q_2, \ q_3, \ \ldots, \ q_n \end{pmatrix}
    $$  
    
    Then 
    $$ 
     A = Q^{-1} \Lambda Q 
    $$ 


Since 

$$
Q^T = \begin{pmatrix}
q_1^T \\
q_2^T \\
\vdots \\
q_n^T
\end{pmatrix}
$$


maps $x \in V$ to its projection coefficients onto each basis direction, 

  we have $Q^T = Q^{-1}$. i.e., $A = Q^T \Lambda Q $ if A is normal by spectral theorem.

 
- **Rayleigh Quotient**:   
  def : Ray(A) = $\frac{ x^T A x}{x^Tx}$  

- **Quadratic form**:  
  def : For a symmetric matrix $A \in \mathbb{R}^{n \times n}$, a **quadratic form** of $A$ is the function $f(x) = x^T A x$.   


- **Iterative update rule**:  
  def : 

  $$
    x_{k+1} = x_k  + \alpha_k r_k
  $$

where $r_k$ is **descent direction**, $\alpha_k$ is step-size.  

Intuitively, from $x_k$, move $\alpha_k$ units along $r_k$. 

- **Line search**:  
  To say whether it is a exact or inexact line search, the standard to distinguish is as below:

  $$
    \alpha_k^{\star} \in \arg\min_{\alpha>0} f(x_k + \alpha p_k)
  $$

  - In exact line search, calculate the exact $\alpha$ with respect to current residual vector and $x_k$. 
  - But In inexact line search problem, we don't need to calculate exhaustive solution of the arg-min optmization problem. 

  - why $\arg\min$? Because we want to find out the minimum optimizer of the next step. 
  <!-- 왜 argmin -->
<!-- - m-strongly convex:  
    def : Let $m>0$. we say that $f$ is $\text{\it{m-strongly convex}}$ if   
$$
    f(\alpha x + (1-\alpha) y ) \le \alpha f(x) + (1-\alpha) f(y) - \frac{m}{2} \alpha (1-\alpha )  \| x-y \|^2 \quad \forall x,y\in \mathbb{R}^n, \ \forall \alpha\in[0,1].
$$ -->
- **strictly convex function**:  
  def : A differentiable function $f:\mathbb{R}^n \to \mathbb{R} $ is called **strictly convex** if 

  $$
    f(y)>f(x) + \nabla f(x)^T (y-x) \quad \forall x\neq y. 
  $$

- **Lipschitz continuous**:  
def : $f$ is called **Lipschitz continuous** satisfying as below:  

$$
  \| \nabla f(x) - \nabla f(y) \| \le M \| x-y \|.
$$
 
- **Condition Number**: 
   def : denote $\kappa(A) = \frac{ \sigma_{max} }{\sigma_{min} }$. In SPD, $\kappa(A) = \frac{ \lambda_{max}}{ \lambda_{min}}$ by spectral theorem.

 
 
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

The reason for using this **SD** is simple: we can find this solution without computationally expensive operations like QR, LU, Gaussian-elimination, which are $O(n^3)$ algorithm.   

In practice, since the exact error $e_k$ is unknown, we use the relative residual norm as the stopping criterion. In our code, we use $\|r_k\|_2$ compared to $\| r_0 \|_2 $ as relative error. 

## 4. correctness & convergence 

## correctness 

### existence and uniqueness

Consider the quadratic function

$$
  f(x) = \frac{1}{2} x^{T}A x - b^{T}x + c, 
$$

where $A \in \mathbb{R}^{n\times n}$ is symmetric positive definite. 

Since $A \succ 0$, The hessian of $f$ satisfies 

$$
   \nabla^2 f(x) = A \quad \forall x\in \mathbb{R}^{n} 
$$

and also, $A$ is invertible. Suppose that $\exists x \in ker(A)$ such that $x$ is not zero. Then it contradicts with the positive-definite property of $A$. Therefore, $A$ is invertible. 

Hence, $f$ is strictly convex.


Moreover, by the spectral theorem,

$$
  x^T Ax \ge \lambda_{\min}(A) \|x\|^2 
$$

which implies that $f$ is coercive and 

$$ 
  f(x) \to \infty \quad \text{as } \|x\| \to  \infty  
$$



Therefore, by strict convexity and coerciveness, $f$ has its global minimum, $x^{\star}$ such that $\nabla f(x^{\star})$ = 0, $i.e.$, $Ax^{\star} = b$. (Existence)  

Since $A$ is invertible, $x^{\star}=A^{-1}b$. (uniqueness)



### converge

### a. Constant step size with $0<\alpha<\frac{2}{\lambda_{\max}}$
Let  $f = \frac{1}{2} x^TAx -b^Tx + c $ where x is a column vector, size n. 

and let $\alpha$ be a fixed step size with $0<\alpha< \frac{2}{\lambda_{\max}} $

$\nabla f = Ax-b $ ( $\because$ $A$ SPD)

$x_k = x_k - \alpha \nabla f(x_k)$ 

let $r_k = -\nabla f(x_k) = b-Ax_k$  

$x_{k+1} = x_{k} + \alpha {r_k} $
 
 
$x_{k+1} - x^{\star} = x_{k} - x^{\star} + \alpha r_k$

Let $e_k = x_k - x^{\star}$  

$e_{k+1} = e_{k} + \alpha r_k = e_{k} + \alpha (A x^{\star} -Ax_k) = e_k - \alpha A e_k = (I-\alpha A)e_k$ 

Since $I = QQ^{T} $, and $A = Q \Lambda Q^T$, 

$$
    \|e_{k+1} \| = \| I - \alpha A \|  \| e_k\| \le \max\limits_{i} |1-\alpha \lambda_i| \ \|e_k\| 
$$

Therefore, to check whether it is convergent or not, we need to verify $\max\limits_{i} |1-\alpha \lambda_i|<1$. 

$$
  \begin{aligned}
  &|1-\alpha \lambda_i | < 1, \ \quad \quad \quad \ \quad \ \ \  \forall i  \\
  &\iff |1- \alpha \lambda_{i} |< 1, \ \quad \ \ \ \ \forall i \\ 
  &\iff -1<1-\alpha \lambda_i <1, \ \forall i \\  
  &\iff 0< \alpha < \frac{2}{\lambda_{i}}, \quad \ \ \ \ \ \ \ \ \forall i \\  
  &\iff 0< \alpha < \frac{2}{\lambda_{\max}} \quad \quad (1)  
  \end{aligned}
$$


Since we choose $0< \alpha < \frac{1}{\lambda_{\min}}$, satisfying inequality $(1)$,
it follows that $\max_i |1-\alpha\lambda_i|<1$.
Hence, $\|e_k\|\to 0$ as $k\to\infty$, which implies $x_k\to x^\star$
and equivalently $r_k=b-Ax_k\to 0$.

However, sadly, if $\alpha \ge \frac{2}{\lambda_{\max}}$, then it might not converge. Hence, we need to investigate another way to examine its convergence when $\alpha$ is dependent of each iterations. 

### b. Exact line search (adaptive $\alpha_k$)  

Before diving into calculation, define $\| v \|^{2}_{A} = v^T A v \ \ \forall v\in \mathbb{R}^n$ (easily can check that is is a norm, **energy norm**).

Our goal : 

$$
    \| e_{k+1} \|_A  \le \ ? \ \| e_{k} \|_A  
$$

with $\alpha_k = \frac{1}{Ray(A)} = \frac{r^T_k r_k}{r_k^T A r_k} $

Since we set $\alpha_k$ = $\frac{1}{Ray(A)} = \frac{r_{k}^T r_{k}}{r_{k}^T A r_k}$, which is the optimum minimizer of $\phi(\tau) = f(x_k + \alpha r_k)$.    

 
when $A$ is SPD, Rayleigh quotient of A is in $\left[\lambda_{\min},\lambda_{\max}\right]$. Return to the definition of Rayleigh quotient of $A$ with SPD.  

$$
     Ray(A) = \frac{x^T A x}{x^T x} = \frac{\sum_{i=1}^{n} \lambda_i \| x_i\|^2}{\sum_{i=1}^{n} \| x_i \|^2 }
$$

in terms of linear combination of eigenvalues(see **Support**), 

$$
  \lambda_{\min}=\frac{\sum_{i=1}^{n} \lambda_{\min} \| x_i \|^2 }{\sum_{i=1}^{n} \| x_i \|^2} \le \frac{\sum_{i=1}^{n} \lambda_i \| x_i \|^2 }{\sum_{i=1}^{n} \| x_i \|^2} \le \frac{\sum_{i=1}^{n} \lambda_{\max} \| x_i \|^2}{\sum_{i=1}^{n} \| x_i \|^2 } = \lambda_{\max} 
$$


$\| e_{k+1}\|^{2}_{A} =  e^{T}_{k+1} A e_{k+1} = (e_k + \alpha_k r_k)^{T} A (e_k + \alpha_k r_k) = (e^{T}_k + \alpha_k r^{T}_k) A(e_k + \alpha_k r_k) $   

$= (e^{T}_k + \alpha_k r^{T}_k) (A e_k + \alpha_k A r_k) = e_k^T A e_k + \alpha_k r_k^T A e_k + \alpha_k e_k^T A r_k + \alpha^2_k r^T_k Ar_k $  

$= \| e_k\|^2_A + 2 \alpha_k r^T_k A e_k + \alpha^2_k r^T_k Ar_k $

use $r_k = -Ae_k$,  

$\|e_{k+1}\|^2_A= \| e_k \|^2_{A} - 2 \frac{r^T_k r_k}{r^T_k Ar_k} (r^T_k r_k) + \frac{(r^T_k r_k)^2}{(r^T_k Ar_k)^2} {r^T_k A r_k}$  

$\iff  \frac{\| e_{k+1}\|^2_A}{\|e_k\|^2_A}= 1 - \frac{(r^T_kr_k)^2}{r^T_k Ar_k} \frac{1}{\| e_k \|^2_A} \quad \quad (2)$

Let $y = Q^T e_k$ where $Q$ is from $A = Q\Lambda Q^T$. 

and  $p_i:= \frac{y^2_i}{\sum\nolimits_{j}{y^2_j}} \ \text{with} \ p_i \ge 0, \sum_{i} p_i = 1$,

and $\beta = \sum_{i}  y_i^2$, $\beta p_i = y_{i}^2$, $i.e.$  

$M_1 = r_k^T r_k = (-Ae_k)^T (-Ae_k) = e^T_k A^TAe_k = e^T_k A^2 e_k = e_k^TQ\Lambda^2 Q^Te_k = y^T_k \Lambda^2 y_k $  

$= \sum_i \lambda_i^2 y_i^2 = \beta \sum_{i} \lambda_{i}^2 p_i $

$M^2_1 = (r_k^T r_k)^2 =  (e^T_kA A e_k)^2 = (e^T_k Q\Lambda^2 Q^Te_k)^2 = (y^T_k \Lambda^2 y_k)^2 = \beta^2 (\sum_{i} \lambda_{i}^2 p_i )^2$

$M_2 = r^T_k A r_k = (-Ae_k)^T A (-Ae_k) = e^T_k A^3 e_k = e^T_k Q \Lambda^3 Q^T e_k  = \sum_{i} \lambda_i^3 y_i^2 = \beta \sum_{i} \lambda_i^3 p_i $ 

$M_3 = \| e_k \|^2_A = e^T_k A e_k = e^T_k Q \Lambda Q^T e_k  = y_k^T \Lambda y_k = \sum_{i} \lambda_i y_i^2 = \beta \sum_{i} \lambda_i p_i $  


Now, apply these $M_1, M_2, M_3$ into $(2)$, Then:

$$
  \frac{\| e_{k+1} \|_A} {\| e_{k} \|_A} = 1 - \frac{M^2_{1}}{M_2 M_3} $$


Let $a_i := \sqrt{\lambda_i} |y_i|, \quad$ $b_i:= \lambda_i^{\frac{3}{2}} |y_i$   

Therefore, $\frac{b_i}{a_i} = \lambda_i \in [m=\lambda_{\min}, M=\lambda_{\max}]$  

$(Ma_i -b_i)(b_i - ma_i) \ge 0 \quad (\because M-\lambda_i\ge 0 \ \text{and} \ \lambda_i -m \ge 0)$  

$$ 
  \begin{aligned}
  &\sum_{i} (Ma_i-b_i)(b_i-m a_i) \ge 0 \\ 
  &\iff \sum_{i} M a_i b_i + m b_i a_i - b_i^2 - mM a_i^2 \ge 0 \\ 
  &\iff (m+M) \sum_{i} a_i b_i \ge  \sum_{i} b_i^2 + mM \sum_{i} a_i^2 \ge 2\sqrt{mM} \sqrt{(\sum_{i}{a_i^2}) (\sum_{i} b_i^2)}\\
  &\iff (m+M) \sum_{i} a_i b_i \ge 2\sqrt{mM} \sqrt{(\sum_{i} {a_i^2}) (\sum_{i} b_i^2)} \\ 
  &\iff \frac{(\sum_{i} a_i b_i)^2}{ (\sum_{i} {a_i^2}) (\sum_{i} {b_i^2})} \ge \frac{4(mM)^2}{(m+M)^2} \\ 
  &\\
  &\iff  \frac{(\sum_{i} \lambda_i^2 y_i^2)^2}{(\sum_{i} \lambda^3 y_i^2) (\sum_{i} \lambda y_i^2 )} \ge \frac{4mM}{(m+M)^2}\quad ( \text{Substitute $a_i = \sqrt{\lambda_i} |y_i| $, $b_i = \lambda_i^{\frac{3}{2}}$, resp.}) \\ 
  &\\
  &\iff \frac{M_1^2}{M_2 M_3 } = \frac{(\sum_{i} \lambda_i^2 y_i^2)^2}{(\sum_{i} \lambda^3 y_i^2) (\sum_{i} \lambda y_i^2 )} \ge \frac{4mM}{(m+M)^2}
  \end{aligned}
$$

Hence, 


$$
  \begin{aligned}
       &\frac { \| e_{k+1} \|^2_A}{\| e_k \|^2_A} = 1-\frac{M_1^2}{M_2 M_3} \le 1 - \frac{4mM}{(m+M)^2}=\frac{(M-m)^2}{(M+m)^2} = \frac{(\kappa-1)^2}{(\kappa+1)^2 } \\ 
       &\\
        &\frac { \| e_{k+1}\|_A} {\| e_k \|_A} \le \frac{\kappa-1}{\kappa+1} \iff  \|e_{k+1} \|_A \le \frac{\kappa-1}{\kappa+1} \| e_k \|_A \quad (3)
  \end{aligned}
$$
 
In this case, as discussed in the prerequisite, 
$\operatorname{cond}(A)=\kappa=\frac{\lambda_{\max}}{\lambda_{\min}}>0$.
Hence, the quantity $\frac{\kappa-1}{\kappa+1}$ is positive and strictly less than $1$.
Therefore, under exact line search, the algorithm converges.

### speed of convergence 

From the previous inequality $(3)$, per each step, the error based on energy norm decreases $\frac{\kappa-1}{\kappa+1}$. 

By induction, letting $q:=\frac{\kappa-1}{\kappa+1}\in(0,1)$, we have

$$
\|e_k\|_A \le q^k \|e_0\|_A \qquad (k \ge 0).
$$

Equivalently,

$$
\begin{aligned}
\| e_{k+1}\|_A 
&\le \frac{\kappa-1}{\kappa+1} \| e_k \|_A \\
&\le \left(\frac{\kappa-1}{\kappa+1}\right)^2 \| e_{k-1}\|_A \\
&\le \cdots \\
&\le \left(\frac{\kappa-1}{\kappa+1}\right)^{k} \| e_1\|_A .
\end{aligned}
$$

The number of loops is approximately

$$
N = \frac{\log(1/\varepsilon)}{\log(d)}, \quad (4)
$$

where $\varepsilon$ is a prescribed relative tolerance and

$$
d := \frac{\kappa+1}{\kappa-1} > 1.
$$



I tested this through matlab when n=1000 approximately when eps = 1e-13. The number of steps is really close to the calculation from $(4)$: 

python: 
```python
import math as m
>>> d = (1800-1)/(1800+1)
>>> k = m.log(10**(-13))/m.log(d)
>>> k
26940.242816399925
```

matlab:
```matlab
>> [~, i] = steep_descent(A_bad,[1:1:1000]');

i =

       26703

``` 

From this code 
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


## 5. limitation & next direction
 
- ill-condition : As we said in the section "speed of convergence", due to its condition number, its convergence speed is very slow. when $\kappa$ is high, (e.g., 5000), the error reduction per iteration is $1-\frac{\kappa-1}{\kappa+1} = \frac{2}{\kappa+1} \approx 0$ for $\kappa \gg 1$. This implies that the number of iterations required for convergence $O(\kappa)$, leading to a slow linear convergence rate, rather than $O(\sqrt{\kappa})$.

- the time complexity of **SD** is $O(n^2 * | loop| ) = O(n^2 \frac{\log(1/\varepsilon)}{\log{(d)}}) = O(\kappa n^2 \log(1/\varepsilon)) \\ 
 \text{where} \ d = \frac{\kappa+1}{\kappa-1}, \log(\frac{\kappa+1}{\kappa-1})= \log(1+\frac{2}{\kappa-1})\approx \frac{2}{\kappa}$.

- Zig-zag : 
We have discussed about this problem in terms of numerical words. I want to say this in terms of linear algebraic point of view, so-called "zig-zag". People normally focus on this expression: 

$$
   \langle r_k, r_{k+1} \rangle = 0, \ (5)
$$

  Meanwhile, beyond this, the zig-zag behavior is tied to the spectral properties of $A$. It's related to Rayleigh quotient and error formulas:
  
  $$
          y_{k+1} = (I-\alpha_k \Lambda) y_k \iff y_{k+1,i} = (1 - \alpha_k \lambda_i) y_{k,i} \ \forall i \ \text{where} \ {\frac{1}{\lambda_{\max}}\le\alpha_k \le \frac{1}{\lambda_{\min}}}, \  (6) 
  $$

  From (5), (6), we have through **SD**, while performing zig-zag, it will reduce its largest eigenvalue part of $r_k$ until satisfying the stopping criteria. 

Therefore, the main challenge is to increase the convergence rate from $\frac{\kappa-1}{\kappa+1}$ to $\frac{\sqrt{\kappa}-1}{\sqrt{\kappa}+1}$, thereby reducing the depedency on condition number.


## 6. Reference 

1. J. Nocedal and S. J. Wright,
Numerical Optimization,
2nd ed., Springer, 2006. 

2. https://www.cs.cmu.edu/~quake-papers/painless-conjugate-gradient.pdf

3. https://optimization.cbe.cornell.edu/index.php?title=Line_search_methods
