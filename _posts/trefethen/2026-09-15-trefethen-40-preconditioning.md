---
layout: post
title: "Trefethen 40 — Preconditioning"
permalink: /study/trefethen/40-preconditioning/
math: true
toc: true
status: outline
date: 2026-09-15 00:00:00 +0900
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau, preconditioning]
note_type: numerical-method
series: trefethen-nla
series_order: 40
---

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture 40, “Preconditioning”
- **Part:** **VI — Iterative Methods**
- **학습 초점:** 알고리즘·구현
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

operator 형태의 preconditioner를 적용하고 비용 대비 수렴 개선을 평가한다.

## 선행 내용

- [Lecture 32 — Overview of Iterative Methods]({% link _posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md %})
- [Lecture 35 — GMRES]({% link _posts/trefethen/2026-09-15-trefethen-35-gmres.md %})
- [Lecture 38 — Conjugate Gradients]({% link _posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md %})
- 배경: 선형계 solve와 SPD 조건

## 먼저 답할 질문

- 좋은 preconditioner는 반복 횟수 외에 어떤 비용을 줄여야 하는가?
- left·right preconditioning과 PCG의 가정은 어떻게 다른가?

## 핵심 내용 체크리스트

- [ ] M의 inverse 행렬 대신 solve 연산으로 적용
- [ ] PCG의 SPD 가정, scaling, spectrum과 수렴의 관계

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

**예정 대상:** `nla::preconditioned_cg` in `iterative.*`

<!-- TODO: 실제 구현 후 코드 저장소의 파일·commit 링크와 최소 사용 예를 추가한다.
위 이름은 구현 계획이며, 현재 존재하거나 검증된 API라는 뜻이 아니다. -->

- [ ] 최소 API와 입력 검사, 실패 상태를 정한다.
- [ ] 작은 정상 입력과 이 강의의 경계·실패 사례를 검증한다.
- [ ] Eigen 등 기준 구현과 비교할 때 부호·위상·순열 convention을 맞춘다.

## 수치 실험

**확인할 비교:** none/Jacobi/선택 전처리의 iteration 수, residual, total time을 비교한다.

### 지표

- 원래 선형계의 실제 상대 잔차
- 무전처리·Jacobi의 반복 횟수와 setup 포함 총시간

각 norm과 정규화를 명시한다. 상대오차의 분모가 0인 경우에는 절대오차를 함께 기록한다.

### 실행 기록

<!-- TODO: 시리즈 안내의 재현 기록 항목을 채운다.
compiler/Eigen 버전, scalar type, build flags, matrix family·size, seed,
관련된 조건수·spectrum·tolerance, 실행 명령, code commit, raw output.
아직 실행하지 않은 결과를 수치·그래프로 작성하지 않는다. -->

### 결과와 해석

<!-- TODO: 실제 실행 후 표·그림과 함께 예상, 관측, 차이의 원인을 쓴다. -->

## 주의할 점

**명시적 inverse 형성 또는 setup cost 제외**

<!-- TODO: 이 강의에 해당하는 가정 위반·conditioning·rounding·비용 문제를 설명한다. -->

## 복습과 남은 질문

- [ ] 위 질문에 책을 덮고 답하고 핵심 유도를 재구성했다.
- [ ] 구현과 경계 사례를 검증하고 재현 명령을 기록했다.
- [ ] 아직 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

<!-- TODO: 학습 날짜와 해결되지 않은 질문을 적는다. 본문이 채워지면 status를 갱신한다. -->

## 이전 / 다음

- 이전: [Lecture 39 — Biorthogonalization Methods]({% link _posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md %})
- 다음: [Saad Study]({% link study/saad/index.md %}) — 반복법과 전처리 심화
