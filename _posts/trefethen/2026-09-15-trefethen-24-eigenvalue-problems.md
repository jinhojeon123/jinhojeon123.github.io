---
layout: post
title: "Trefethen 24 — Eigenvalue Problems"
permalink: /study/trefethen/24-eigenvalue-problems/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, eigenvalue-problems]
note_type: numerical-method
series: trefethen-nla
series_order: 24
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 24, “Eigenvalue Problems”
- **Part:** **V — Eigenvalues**
- **학습 초점:** 이론·유도
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

normal/nonnormal eigenvalue problem의 conditioning 차이를 이해한다.

## 선행 내용

- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 03 — Norms]({% link _posts/trefethen/2026-09-15-trefethen-03-norms.md %})
- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- 배경: 고유값·고유벡터·similarity

## 먼저 답할 질문

- Schur form과 diagonalization은 어떤 가정이 다른가?
- normal 행렬과 nonnormal 행렬의 eigenvalue sensitivity는 어떻게 다른가?

## 핵심 내용 체크리스트

- [ ] 고유값 문제의 구조와 조건수
- [ ] Hermitian·normal·defective 사례 구분

## 수학적 정리

### 설정과 표기

<!-- TODO: 행렬 크기, 실수·복소수, rank·대칭성 등 실제로 필요한 가정과 norm을 정한다. -->

### 정의와 결과

<!-- TODO: 핵심 결과의 가정과 결론을 구분해 자신의 말로 쓴다. -->

### 유도와 예제

<!-- TODO: 핵심 식 또는 proof sketch를 직접 전개하고 작은 예·경계 사례를 붙인다. -->

## C++ 확인 실험 계획

이론 강의에서는 작은 계산으로 정의·정리의 의미를 확인한다.
새 solver 구현은 필요한 경우에만 추가한다.

**예정 대상:** `experiments/l24_eigenvalue_conditioning.cpp`

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 손계산 가능한 작은 예와 가정이 깨지는 예를 고른다.
- [ ] 기존 연산 또는 검증 라이브러리로 관찰할 값을 계산한다.
- [ ] 유한한 실험 사례와 일반적인 증명을 구분한다.

## 수치 실험

**확인할 비교:** 작은 matrix perturbation 뒤 eigenvalue 이동과 eigenvector conditioning을 측정한다.

### 지표

- 정규화한 eigenpair 잔차
- perturbation 전후 고유값 집합의 변화와 대응 방법

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**정렬된 eigenvalue의 index만으로 perturbation 전후를 매칭**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 작은 예 또는 확인 실험으로 정리의 의미와 한계를 설명했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 23 — Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %})
- 다음: [Lecture 25 — Overview of Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md %})
