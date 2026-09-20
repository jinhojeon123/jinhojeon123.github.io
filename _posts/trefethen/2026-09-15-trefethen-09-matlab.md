---
layout: post
title: "Trefethen 09 — MATLAB"
permalink: /study/trefethen/09-matlab/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, matlab]
note_type: numerical-method
series: trefethen-nla
series_order: 9
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 9, “MATLAB”
- **Part:** **II — QR Factorization and Least Squares**
- **학습 초점:** 비교·실험
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

책의 MATLAB 표기를 C++/Eigen의 index, block, adjoint, storage 표현으로 번역한다.

## 선행 내용

- [Lecture 01 — Matrix-Vector Multiplication]({% link _posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md %})
- [Lecture 02 — Orthogonal Vectors and Matrices]({% link _posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md %})
- [Lecture 07 — QR Factorization]({% link _posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md %})
- 배경: C++의 타입·배열·함수, Eigen의 기본 행렬 표현

## 먼저 답할 질문

- 책의 1-based slicing을 C++의 0-based block으로 어떻게 옮기는가?
- 행렬 곱·성분별 곱·transpose·adjoint는 코드에서 어떻게 구분하는가?

## 핵심 내용 체크리스트

- [ ] 책의 MATLAB 예제와 동등한 작은 Eigen 계산
- [ ] 개인 확장: 객체 수명, aliasing, storage order 확인

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

**예정 대상:** `experiments/l09_eigen_primer.cpp`

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 기준값을 어떻게 얻는지와 기준값의 정밀도를 적는다.
- [ ] 한 번에 바꿀 입력 변수와 고정할 환경을 구분한다.
- [ ] 예상과 다른 관측을 원본 출력과 함께 남긴다.

## 수치 실험

**확인할 비교:** 동일한 작은 계산을 MATLAB 표기와 Eigen 코드로 나란히 재현한다.

### 지표

- 작은 행렬에서 예상 원소와 실제 원소의 일치
- 실수·복소수, 직사각 입력의 차원과 결과

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**1-based/0-based index와 row-major/column-major 가정**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 비교 조건을 고정하고 실제 실행 결과와 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 08 — Gram-Schmidt Orthogonalization]({% link _posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md %})
- 다음: [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
