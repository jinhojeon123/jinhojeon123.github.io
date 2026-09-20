---
layout: post
title: "Trefethen 31 — Computing the SVD"
permalink: /study/trefethen/31-computing-the-svd/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, computing-the-svd]
note_type: numerical-method
series: trefethen-nla
series_order: 31
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 31, “Computing the SVD”
- **Part:** **V — Eigenvalues**
- **학습 초점:** 알고리즘·구현
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

bidiagonalization과 bidiagonal SVD의 역할을 구분한다.
먼저 양쪽 Householder reduction을 구현하고 전체 SVD solver는 선택 확장으로 남긴다.

## 선행 내용

- [Lecture 04 — The Singular Value Decomposition]({% link _posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md %})
- [Lecture 10 — Householder Triangularization]({% link _posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md %})
- [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- 배경: 양쪽 직교 변환과 bidiagonal 행렬

## 먼저 답할 질문

- SVD를 계산하기 위해 A*A를 만들면 어떤 정확도 문제가 생기는가?
- bidiagonalization과 bidiagonal SVD 단계는 어떻게 연결되는가?

## 핵심 내용 체크리스트

- [ ] 양쪽 Householder 변환과 bidiagonal reduction
- [ ] 이번 구현은 reduction까지, 전체 SVD 반복은 선택 확장

## 수학적 정리

### 설정과 표기

<!-- TODO: 행렬 크기, 실수·복소수, rank·대칭성 등 실제로 필요한 가정과 norm을 정한다. -->

### 정의와 결과

<!-- TODO: 핵심 결과의 가정과 결론을 구분해 자신의 말로 쓴다. -->

### 유도와 예제

<!-- TODO: 핵심 식 또는 proof sketch를 직접 전개하고 작은 예·경계 사례를 붙인다. -->

## 알고리즘과 비용

<!-- 아래 항목을 이 강의의 계산 절차로 채운다. 직접법에는 반복 종료 조건을 억지로 넣지 않는다. -->

- [ ] 입력·출력의 차원과 필요한 가정을 명시한다.
- [ ] 핵심 갱신식을 유도하고 손으로 계산한 작은 예를 적는다.
- [ ] 종료·실패 조건 또는 분해가 불가능한 입력을 정의한다.
- [ ] 연산량, 추가 저장량, 재사용 가능한 분해를 구분한다.

## C++ 구현 계획

**예정 대상:** `eigenvalues.*`의 bidiagonalization; 전체 SVD solver는 선택 확장

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 최소 API와 입력 검사, 실패 상태를 정한다.
- [ ] 작은 정상 입력과 이 강의의 경계·실패 사례를 검증한다.
- [ ] Eigen 등 기준 구현과 비교할 때 부호·위상·순열 convention을 맞춘다.

## 수치 실험

**확인할 비교:** 먼저 bidiagonalization의 재구성과 직교성을 확인한다. 전체 SVD 비교는 기준 라이브러리를 사용하거나 solver 구현 후 별도로 실행한다.

### 지표

- A−UBV*의 상대 Frobenius norm 및 U·V 직교성
- 기준 singular value와 triplet 잔차, 작은 singular value의 상대오차

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**A*A를 직접 만들어 condition number를 제곱**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 구현과 경계 사례를 검증하고 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 30 — Other Eigenvalue Algorithms]({% link _posts/trefethen/2026-09-15-trefethen-30-other-eigenvalue-algorithms.md %})
- 다음: [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
