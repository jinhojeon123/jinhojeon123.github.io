---
layout: post
title: "Trefethen 39 — Biorthogonalization Methods"
permalink: /study/trefethen/39-biorthogonalization-methods/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, biorthogonalization-methods]
note_type: numerical-method
series: trefethen-nla
series_order: 39
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 39, “Biorthogonalization Methods”
- **Part:** **VI — Iterative Methods**
- **학습 초점:** 알고리즘·구현
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

두 Krylov basis의 biorthogonality와 short recurrence를 구현한다.

## 선행 내용

- [Lecture 24 — Eigenvalue Problems]({% link _posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md %})
- [Lecture 33 — The Arnoldi Iteration]({% link _posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md %})
- [Lecture 36 — The Lanczos Iteration]({% link _posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md %})
- 배경: 복소 내적과 adjoint 연산

## 먼저 답할 질문

- 양쪽 Krylov basis의 biorthogonality는 어떤 조건인가?
- 짧은 recurrence에서 serious breakdown은 어떤 내적과 관련되는가?

## 핵심 내용 체크리스트

- [ ] bi-Lanczos의 두 recurrence와 비대칭 문제
- [ ] 선택 구현: BiCG와 shadow residual·adjoint 적용

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

**예정 대상:** `iterative.*`의 bi-Lanczos; BiCG는 선택 확장

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 최소 API와 입력 검사, 실패 상태를 정한다.
- [ ] 작은 정상 입력과 이 강의의 경계·실패 사례를 검증한다.
- [ ] Eigen 등 기준 구현과 비교할 때 부호·위상·순열 convention을 맞춘다.

## 수치 실험

**확인할 비교:** nonnormal 사례에서 biorthogonality와 breakdown/near-breakdown을 관찰한다.

### 지표

- 두 basis의 biorthogonality 오차
- 실제 잔차 이력·breakdown 상태·A 및 A* 호출 횟수

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**transpose와 adjoint convention 또는 shadow residual 선택 오류**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 구현과 경계 사례를 검증하고 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 38 — Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %})
- 다음: [Lecture 40 — Preconditioning]({% link _posts/trefethen/2026-09-15-trefethen-40-preconditioning.md %})
