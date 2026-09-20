---
layout: post
title: "Trefethen 19 — Stability of Least Squares Algorithms"
permalink: /study/trefethen/19-stability-of-least-squares-algorithms/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, stability-of-least]
note_type: numerical-method
series: trefethen-nla
series_order: 19
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 19, “Stability of Least Squares Algorithms”
- **Part:** **III — Conditioning and Stability**
- **학습 초점:** 비교·실험
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

normal equations, CGS/MGS, Householder, SVD 방법을 안정성과 비용으로 비교한다.

## 선행 내용

- [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- [Lecture 18 — Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %})
- 배경: normal equations, Householder QR, 안정성 정의

## 먼저 답할 질문

- normal equations와 QR은 정확한 산술의 해가 같아도 왜 정확도가 달라지는가?
- 작은 최소제곱 잔차만으로 해의 정확도를 비교할 수 있는가?

## 핵심 내용 체크리스트

- [ ] CGS·MGS·Householder·normal equations의 비교 조건
- [ ] SVD 기준해의 정밀도와 rank tolerance 명시

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

**예정 대상:** `experiments/l19_least_squares_solvers.cpp`

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 기준값을 어떻게 얻는지와 기준값의 정밀도를 적는다.
- [ ] 한 번에 바꿀 입력 변수와 고정할 환경을 구분한다.
- [ ] 예상과 다른 관측을 원본 출력과 함께 남긴다.

## 수치 실험

**확인할 비교:** ill-conditioned design matrix에서 계수 오차, residual, backward error를 나란히 기록한다.

### 지표

- forward error·잔차·A* r 및 Q의 직교성
- 조건수별 정확도와 동일 환경의 실행시간

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**기준해 자체의 정밀도를 확인하지 않음**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 비교 조건을 고정하고 실제 실행 결과와 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 18 — Conditioning of Least Squares Problems]({% link _posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md %})
- 다음: [Lecture 20 — Gaussian Elimination]({% link _posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md %})
