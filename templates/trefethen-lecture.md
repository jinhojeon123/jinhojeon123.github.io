---
layout: post
title: "Trefethen NN — Replace with the lecture title"
date: YYYY-MM-DD 00:00:00 +0900
permalink: /study/trefethen/NN-replace-with-lecture-slug/
categories: [Numerical Methods]
tags: [numerical-linear-algebra, cpp, trefethen-bau]
status: outline
note_type: numerical-method
series: trefethen-nla
series_order: NN
math: true
toc: true
published: false
---

<!-- Lecture 01–40은 이미 _posts/trefethen/에 있다. 해당 파일을 먼저 찾아 채운다.
새 파일이 필요하면 _posts/trefethen/YYYY-MM-DD-trefethen-NN-slug.md에 복사하고
날짜·제목·URL·series_order를 실제 값으로 교체한다. series_order는 중복 없는 정수다.
기존 글을 대체할 때는 기존 permalink를 유지한다.
공개 준비 후 published:false를 제거한다. 본문을 작성한 후 status를 갱신한다.
YAML은 파일 첫 줄의 ---부터 다음 ---까지 한 번만 쓴다. -->

- **Reference:** Trefethen and Bau, *Numerical Linear Algebra*, Lecture NN, “TODO”
- **Part:** TODO
- **학습 초점:** TODO: 이론·유도 / 알고리즘·구현 / 비교·실험 중 선택
- **Series:** [Trefethen NLA in C++]({% link study/trefethen/index.md %})

## 목표와 범위

<!-- 이 강의를 마치면 설명할 수 있어야 하는 것을 1–2문장으로 쓴다.
교재에서 다루는 내용과 개인적인 C++ 확장을 구분한다. -->

## 선행 내용

- [ ] TODO: 필요한 정의·정리와 실제 선행 글 링크

## 먼저 답할 질문

- TODO: 이 강의에서 해결하는 수학적 문제는 무엇인가?
- TODO: 다음 강의에 넘겨줄 결과는 무엇인가?

## 핵심 내용 체크리스트

- [ ] TODO: 이 강의만의 결과와 핵심 유도
- [ ] TODO: 가정이 필요한 이유와 경계 사례

## 수학적 정리

### 설정과 표기

<!-- 행렬 크기·실수/복소수·rank·구조 가정·norm을 명시한다. -->

### 정의와 결과

<!-- 정리의 가정과 결론을 분리하고 출처의 강의·정리 번호를 기록한다. -->

### 유도와 예제

<!-- 핵심 계산이나 proof sketch를 자신의 말로 작성한다. 증명과 실험 관찰을 구분한다. -->

## 알고리즘과 비용

<!-- 알고리즘 강의에서 사용한다. 이론·비교 중심 강의라면 이 절을 삭제한다. -->

- 입력·출력: TODO
- 갱신식과 invariant: TODO
- 종료·실패 조건: TODO
- 연산량·추가 저장량: TODO

## C++ 구현 또는 확인 실험

<!-- 이론 강의: 손계산 예를 확인하는 작은 프로그램이면 충분하다.
알고리즘 강의: API·입력 검사·실패 상태와 경계 사례를 다룬다.
비교 강의: 기존 구현을 재사용하고 비교 조건을 고정한다. -->

- 예정 대상: TODO
- 실제 코드·commit: TODO: 구현한 뒤 링크

<!-- 핵심 update 또는 최소 사용 예만 cpp 코드 블록으로 작성한다.
아직 존재하지 않는 API를 사용 가능한 구현처럼 소개하지 않는다. -->

## 수치 실험

### 질문과 지표

- 확인할 비교: TODO
- 지표·norm·정규화: TODO
- 기준값을 얻는 방법과 정밀도: TODO

### 실행 기록

<!-- 필요한 항목만 남긴다. 입력·참조값이 0인 경우 상대오차 분모 처리도 적는다. -->

| 항목 | 기록 |
|---|---|
| 코드 commit / 실행 명령 | TODO |
| compiler / Eigen / scalar type | TODO |
| build type / flags | TODO |
| 입력 생성법 / 크기 / seed | TODO |
| 조건수·spectrum / tolerance | TODO: 필요한 경우 |
| raw output / 반복 측정 방식 | TODO |

### 결과와 해석

<!-- 실제 실행한 결과만 표·그림으로 제시한다. 예상과 관측을 구분하고 차이를 설명한다. -->

## 주의할 점

<!-- 이 강의와 관련된 가정 위반, conditioning, rounding, breakdown, 비용을 설명한다. -->

## 복습과 남은 질문

- [ ] 핵심 질문에 책을 덮고 답하고 유도를 재구성했다.
- [ ] 선택한 학습 초점에 필요한 예제·구현·검증을 마쳤다.
- [ ] 이해하지 못한 단계와 다음에 확인할 자료를 적었다.

## 이전 / 다음

<!-- 실제로 존재하는 소스 경로에 Jekyll link 태그를 사용한다.
선행 지식 링크와 순서상 이전·다음 링크는 다를 수 있다. -->

- 이전: TODO
- 다음: TODO
