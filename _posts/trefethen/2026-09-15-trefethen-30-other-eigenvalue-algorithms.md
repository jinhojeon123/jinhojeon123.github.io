---
layout: post
title: "Trefethen 30 — Other Eigenvalue Algorithms"
permalink: /study/trefethen/30-other-eigenvalue-algorithms/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, other-eigenvalue-algorithms]
note_type: numerical-method
series: trefethen-nla
series_order: 30
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 30, “Other Eigenvalue Algorithms”
- **Part:** **V — Eigenvalues**
- **학습 초점:** 이론·유도
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

교재가 소개하는 고유값 알고리즘의 가정·아이디어·비용을 비교한다.
전체 알고리즘을 모두 구현하는 대신 관심 있는 한 방법을 선택 확장으로 다룬다.

## 선행 내용

- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 26 — Reduction to Hessenberg or Tridiagonal Form]({% link _posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md %})
- [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- 배경: Hermitian eigenproblem의 구조

## 먼저 답할 질문

- bisection·divide-and-conquer 등은 어떤 입력과 출력을 겨냥하는가?
- 일부 eigenvalue만 구할 때 전체 QR과 비교할 비용은 무엇인가?

## 핵심 내용 체크리스트

- [ ] 교재의 대안 알고리즘별 가정·핵심 아이디어·비용
- [ ] 선택 확장: 한 방법만 구현하거나 검증 라이브러리로 비교

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

**예정 대상:** 선택 확장: `experiments/l30_other_eigensolver.cpp`에서 한 방법 비교

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 손계산 가능한 작은 예와 가정이 깨지는 예를 고른다.
- [ ] 기존 연산 또는 검증 라이브러리로 관찰할 값을 계산한다.
- [ ] 유한한 실험 사례와 일반적인 증명을 구분한다.

## 수치 실험

**확인할 비교:** 선택한 한 방법을 QR 또는 검증된 기준 solver와 비교한다. 입력의 구조와 요구하는 고유값 범위를 먼저 고정한다.

### 지표

- 선택한 방법의 eigenpair 잔차와 필요한 고유값 범위
- 동일 정확도 목표에서 시간·메모리 비교

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**서로 다른 목표의 알고리즘을 iteration 수만으로 비교**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 작은 예 또는 확인 실험으로 정리의 의미와 한계를 설명했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 29 — QR Algorithm with Shifts]({% link _posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md %})
- 다음: [Lecture 31 — Computing the SVD]({% link _posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md %})
