---
layout: page
title: "Trefethen NLA in C++"
permalink: /study/trefethen/
math: true
toc: true
status: outline
---

Reference: Lloyd N. Trefethen and David Bau III, *Numerical Linear Algebra*,
SIAM, 1997 / 25th Anniversary Edition, 2022.

Sources: [저자 공식 소개](https://people.maths.ox.ac.uk/trefethen/text.html) ·
[SIAM 25주년판](https://epubs.siam.org/doi/book/10.1137/1.9781611977165)

책의 40개 lecture를 따라 수학적 유도와 수치적 의미를 정리하고,
C++20/Eigen으로 계산을 확인하는 학습 기록이다. 교재 범위와 개인 구현 확장을
구분한다. Lecture 09의 교재 주제는 MATLAB이며, C++/Eigen 대응은 개인 확장이다.

[전체 학습 roadmap]({% link STUDY-ROADMAP.md %}) ·
[Linear Algebra Review]({% link study/linear-algebra/index.md %}) ·
[Saad Study]({% link study/saad/index.md %})

## 글을 작성하는 순서

1. 해당 강의의 목표·선행 내용·질문을 확인한다.
2. 가정과 기호를 고정하고 핵심 결과를 직접 유도한다.
3. 아래 학습 초점에 맞춰 예제, 구현 또는 비교 실험을 진행한다.
4. 실제 결과와 남은 질문을 정리하고 글의 상태를 갱신한다.

| 학습 초점 | 핵심 산출물 |
|---|---|
| 이론·유도 | 정의·정리·유도, 작은 예와 가정의 한계. 새 solver 구현은 선택 |
| 알고리즘·구현 | 갱신식·비용·API·실패 처리, 테스트와 재현 실험 |
| 비교·실험 | 비교 조건·기준값·지표, 실제 관측과 해석 |

각 글의 선행 내용은 필요한 배경이고, 맨 아래 이전·다음 링크는 읽기 순서다.
빈 outline을 완료된 풀이로 취급하지 않는다. 전체 구현을 블로그에 중복하기보다
핵심 식·사용 예를 싣고 실제 코드의 파일·commit 링크를 연결한다.
아래 함수명과 파일명은 **구현 계획**이다. 코드 저장소 URL과 구현 여부는 확인 후 추가한다.

## 공통 표기와 재현 기록

- $A^*$는 켤레전치이며 실수 행렬에서는 전치와 같다. 행렬과 벡터의 차원을 먼저 쓴다.
- vector norm, induced matrix norm, Frobenius norm을 구분한다.
- 정확한 산술의 정리, 입력의 conditioning, 계산 과정의 stability를 구분한다.
- 상대오차·정규화 잔차의 분모를 밝히고 0인 경우의 처리도 기록한다.
- 실험에는 code commit, compiler/Eigen 버전, scalar type, build flags,
  입력 생성법·크기·seed, 필요한 tolerance, 실행 명령과 raw output을 남긴다.
- 시간 비교에는 반복 측정 방식과 setup 비용 포함 여부를 쓴다.
  해당 실험에 필요하지 않은 항목은 이유와 함께 생략한다.

## 새 글과 상태 관리

저장소의 `templates/trefethen-lecture.md`를 복사해 작성한다.
Lecture 01–40은 이미 파일이 있으므로 같은 번호의 글은 기존 파일을 채운다.
제목, 날짜, `series_order`, `permalink`를 확인하고 기존 글의 주소는 유지한다.
새 파일의 `published: false`는 공개 준비가 끝난 뒤 제거한다.

- `status: outline`: 읽기·작성 계획.
- `status: working-note`: 내용과 유도를 작성 중인 노트.
- `status: note`: 가정·유도·예제와 필요한 검증을 검토한 노트.

이 블로그의 시리즈 목록에서 `(outline)` 표시는 해당 **개별 글**의
`status: outline`에서 나온다. 실제로 본문을 채운 뒤 그 글의 상태를 변경한다.
이 안내 페이지의 상태만 바꾸어도 모든 글의 상태가 바뀌지는 않는다.

## 권장 순서

[Linear Algebra Review]({% link study/linear-algebra/index.md %})
→ Trefethen Part I–V
→ Trefethen Part VI
→ [Saad Study]({% link study/saad/index.md %})

## I — Fundamentals

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 01 | [Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %}) | 알고리즘·구현 | `nla::matvec_by_columns` in `fundamentals.*` |
| 02 | [Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %}) | 이론·유도 | `nla::orthogonality_error` and a unitary-invariance experiment |
| 03 | [Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %}) | 이론·유도 | planned norm helpers in `fundamentals.*` |
| 04 | [The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %}) | 이론·유도 | `experiments/l04_svd_geometry.cpp` |
| 05 | [More on the SVD]({% link _posts/trefethen/2026-09-15-trefethen-05-more-on-the-svd.md %}) | 이론·유도 | `nla::truncated_svd` in `fundamentals.*` |

## II — QR Factorization and Least Squares

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 06 | [Projectors]({% link _posts/trefethen/2026-09-15-trefethen-06-projectors.md %}) | 이론·유도 | `nla::orthogonal_projector` in `qr.*` |
| 07 | [QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %}) | 이론·유도 | `nla::QrFactorization` validation experiment |
| 08 | [Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %}) | 알고리즘·구현 | `nla::classical_gram_schmidt` and `nla::modified_gram_schmidt` |
| 09 | [MATLAB]({% link _posts/trefethen/2026-09-15-trefethen-09-matlab.md %}) | 비교·실험 | `experiments/l09_eigen_primer.cpp` |
| 10 | [Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %}) | 알고리즘·구현 | `nla::householder_qr` in `qr.*` |
| 11 | [Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md %}) | 알고리즘·구현 | `nla::least_squares_qr` in `qr.*` |

## III — Conditioning and Stability

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 12 | [Conditioning and Condition Numbers]({% link _posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md %}) | 이론·유도 | `nla::condition_number_2` in `stability.*` |
| 13 | [Floating Point Arithmetic]({% link _posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md %}) | 비교·실험 | `experiments/l13_floating_point.cpp` |
| 14 | [Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %}) | 이론·유도 | `nla::linear_system_backward_error` in `stability.*` |
| 15 | [More on Stability]({% link _posts/trefethen/2026-09-15-trefethen-15-more-on-stability.md %}) | 이론·유도 | `experiments/l15_stability_composition.cpp` |
| 16 | [Stability of Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-16-stability-of-householder-triangularization.md %}) | 비교·실험 | Householder QR diagnostics in `experiments/l16_householder_stability.cpp` |
| 17 | [Stability of Back Substitution]({% link _posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md %}) | 알고리즘·구현 | `nla::back_substitution` in `systems.*` |
| 18 | [Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %}) | 이론·유도 | `experiments/l18_least_squares_conditioning.cpp` |
| 19 | [Stability of Least Squares Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-19-stability-of-least-squares-algorithms.md %}) | 비교·실험 | `experiments/l19_least_squares_solvers.cpp` |

## IV — Systems of Equations

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 20 | [Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %}) | 알고리즘·구현 | `nla::lu_factor` in `systems.*` |
| 21 | [Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %}) | 알고리즘·구현 | `nla::lu_factor_partial_pivoting` in `systems.*` |
| 22 | [Stability of Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-22-stability-of-gaussian-elimination.md %}) | 비교·실험 | growth-factor diagnostics in `experiments/l22_growth_factor.cpp` |
| 23 | [Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %}) | 알고리즘·구현 | `nla::cholesky` in `systems.*` |

## V — Eigenvalues

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 24 | [Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %}) | 이론·유도 | `experiments/l24_eigenvalue_conditioning.cpp` |
| 25 | [Overview of Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md %}) | 이론·유도 | 개인 확장: `nla::power_iteration` in `eigenvalues.*` |
| 26 | [Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %}) | 알고리즘·구현 | `nla::hessenberg_reduction` in `eigenvalues.*` |
| 27 | [Rayleigh Quotient, Inverse Iteration]({% link _posts/trefethen/2026-09-15-trefethen-27-rayleigh-quotient-inverse-iteration.md %}) | 알고리즘·구현 | `nla::inverse_iteration` and `nla::rayleigh_quotient_iteration` |
| 28 | [QR Algorithm without Shifts]({% link _posts/trefethen/2026-09-15-trefethen-28-qr-algorithm-without-shifts.md %}) | 알고리즘·구현 | `nla::qr_algorithm(..., false)` in `eigenvalues.*` |
| 29 | [QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %}) | 알고리즘·구현 | `nla::qr_algorithm(..., true)` with shift and deflation |
| 30 | [Other Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-30-other-eigenvalue-algorithms.md %}) | 이론·유도 | 선택 확장: `experiments/l30_other_eigensolver.cpp`에서 한 방법 비교 |
| 31 | [Computing the SVD]({% link _posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md %}) | 알고리즘·구현 | `eigenvalues.*`의 bidiagonalization; 전체 SVD solver는 선택 확장 |

## VI — Iterative Methods

| L | Lecture | 초점 | C++ 확인·구현 계획 |
|---:|---|---|---|
| 32 | [Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %}) | 비교·실험 | `nla::LinearOperator` and `experiments/l32_matrix_free.cpp` |
| 33 | [The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %}) | 알고리즘·구현 | `nla::arnoldi` in `iterative.*` |
| 34 | [How Arnoldi Locates Eigenvalues]({% link _posts/trefethen/2026-09-15-trefethen-34-how-arnoldi-locates-eigenvalues.md %}) | 이론·유도 | `experiments/l34_ritz_values.cpp` |
| 35 | [GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %}) | 알고리즘·구현 | `nla::gmres` in `iterative.*` |
| 36 | [The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %}) | 알고리즘·구현 | `nla::lanczos` in `iterative.*` |
| 37 | [From Lanczos to Gauss Quadrature]({% link _posts/trefethen/2026-09-15-trefethen-37-from-lanczos-to-gauss-quadrature.md %}) | 이론·유도 | `experiments/l37_gauss_quadrature.cpp` |
| 38 | [Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %}) | 알고리즘·구현 | `nla::conjugate_gradient` in `iterative.*` |
| 39 | [Biorthogonalization Methods]({% link _posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md %}) | 알고리즘·구현 | `iterative.*`의 bi-Lanczos; BiCG는 선택 확장 |
| 40 | [Preconditioning]({% link _posts/trefethen/2026-09-15-trefethen-40-preconditioning.md %}) | 알고리즘·구현 | `nla::preconditioned_cg` in `iterative.*` |


## 현재 다음 작업

- [ ] [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})의 열벡터 전개를 유도하고 작은 예를 손으로 계산한다.
- [ ] `matvec_by_columns`를 구현하고 Eigen 결과와 비교한다.
- [ ] 실제 코드 저장소 URL·commit, 실행 환경·명령·결과를 첫 글에 기록한다.
