---
# the default layout is 'page'
icon: fas fa-info-circle
order: 4
title: About
---

> **TL;DR**  
> 수학(수치해석/최적화)을 중심으로, 시스템(운영체제/메모리)과 구현(C++/Python)을 연결해 정리하는 학습 기록입니다.
{: .prompt-tip }

## 관심 축

| Track | Keywords | Notes |
|---|---|---|
| Numerical Analysis | IEEE 754, rounding error, stability, conditioning | “정확도 vs 성능”을 같이 다룹니다 |
| Optimization / OR | MILP, scheduling, network flow | 모델링–해석–구현의 연결을 목표로 합니다 |
| FEM / PDE | discretization, weak form, Newton, sparse solve | 이론을 구현 가능한 형태로 정리합니다 |
| Systems | process/thread, virtual memory, cache/NUMA | 성능 병목을 “구조”로 설명합니다 |

---

## 이 사이트의 구성

- **Numerical Analysis**
  - Floating-point & Stability
  - Iterative Methods & Linear Algebra
  - FEM / PDE
- **Operating Systems**
  - Processes / Threads
  - Synchronization & Concurrency
  - Memory / Virtual Memory
  - File Systems & I/O
  - Scheduling
  - Cache & Memory Hierarchy

> 각 글은 “정의 → 직관 → 예제/반례 → 구현 관점(가능하면)” 순서로 정리하는 것을 기본 규칙으로 삼습니다.
{: .note }

---

## 작성 원칙

- **재현 가능성**: 수식/가정/기호를 명시하고, 필요한 경우 최소 예제(코드/수치 실험)를 포함합니다.
- **정확성 우선**: 단정 대신 조건을 분리해 서술합니다. (예: “항상”보다 “일반적으로/특정 가정 하에서”)
- **성능 관점**: 시간복잡도뿐 아니라 메모리 접근(캐시, 지역성, NUMA)까지 함께 고려합니다.

---

## 진행 중인 테마

- 부동소수점 오차가 알고리즘 설계에 미치는 영향 (stability / backward error)
- 대규모 문제에서의 선형해법(반복법/전처리)과 성능 병목 분석
- 스케줄링/최적화 문제를 **수학적 모델**과 **구현**으로 동시에 정리

---

## 사용 도구

- **Languages**: C++ (C++17/20), Python, Java, TypeScript/Node
- **Topics**: sparse linear algebra, graph algorithms, optimization modeling
- **Workflow**: 글로 개념을 고정한 뒤, 작은 실험 코드로 검증하는 방식

---

## 문의 / 링크

- GitHub / CV / 기타 링크는 사이트 상단 또는 하단의 소셜 링크 영역을 통해 연결합니다.
- 오탈자/논리 오류 제보는 언제든 환영합니다. (근거/반례가 포함되면 가장 빠르게 반영됩니다.)

> 마지막 갱신: {{ site.time | date: "%Y-%m-%d" }}
{: .prompt-info }
