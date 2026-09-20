---
layout: post
title: "Trefethen 22 — Stability of Gaussian Elimination"
permalink: /study/trefethen/22-stability-of-gaussian-elimination/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, stability-of-gaussian]
note_type: numerical-method
series: trefethen-nla
series_order: 22
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 22, “Stability of Gaussian Elimination”
- **Part:** **IV — Systems of Equations**
- **학습 초점:** 비교·실험
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

element growth가 elimination 안정성에 미치는 영향을 측정한다.

## 선행 내용

- [Lecture 14 — Stability]({% link _posts/trefethen/2026-09-15-trefethen-14-stability.md %})
- [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
- [Lecture 21 — Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %})
- 배경: 중간 소거 행렬과 rounding error

## 먼저 답할 질문

- growth factor는 원래 행렬의 조건수와 같은 것인가?
- 보통의 입력과 큰 element growth를 보이는 입력을 어떻게 비교하는가?

## 핵심 내용 체크리스트

- [ ] 소거 중 element growth의 정의와 측정 범위
- [ ] growth를 포함한 backward-error bound의 가정

## 수학적 정리

### 설정과 표기

<!-- TODO: 행렬 크기, 실수·복소수, rank·대칭성 등 실제로 필요한 가정과 norm을 정한다. -->

### 정의와 결과

<!-- TODO: 핵심 결과의 가정과 결론을 구분해 자신의 말로 쓴다. -->

### 유도와 예제

<!-- TODO: 핵심 식 또는 proof sketch를 직접 전개하고 작은 예·경계 사례를 붙인다. -->

## C++ 비교 실험 계획

기존 연산·구현을 사용해 변수를 통제한 실험을 만든다.
비교하는 구현이 서로 다른 정밀도·종료 조건을 사용한다면 함께 기록한다.

**예정 대상:** growth-factor diagnostics in `experiments/l22_growth_factor.cpp`

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 기준값을 어떻게 얻는지와 기준값의 정밀도를 적는다.
- [ ] 한 번에 바꿀 입력 변수와 고정할 환경을 구분한다.
- [ ] 예상과 다른 관측을 원본 출력과 함께 남긴다.

## 수치 실험

**확인할 비교:** 구조적 large-growth 사례와 난수 행렬의 growth factor 분포를 비교한다.

### 지표

- 모든 소거 단계에서 추적한 growth factor
- growth·조건수·backward error·forward error의 동시 기록

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**condition number와 growth factor를 같은 양으로 해석**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 비교 조건을 고정하고 실제 실행 결과와 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 21 — Pivoting]({% link _posts/trefethen/2026-09-15-trefethen-21-pivoting.md %})
- 다음: [Lecture 23 — Cholesky Factorization]({% link _posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md %})
