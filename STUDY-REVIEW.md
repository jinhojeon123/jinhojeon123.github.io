---
layout: page
title: "Study Review and Remaining Corrections"
permalink: /study/review/
math: true
toc: true
---

# Study review

기준일: 2026-09-11. 기존 게시글 14개 전체와 archive fragment, project·navigation 문서를 검토했다. 핵심 proof, assumption, intermediate step과 대표 counterexample은 보존하고 반복 설명·중복 roadmap·단순 계산 예제를 줄였다. 기존 mathematical claim을 수정해야 하는 곳은 해당 위치에 `[수정 필요]` 또는 `[보완 권장]`을 남겼다.

- Section / element 분류: A 350 · B 42 · C 23. [전체 판단표]({% link study-review/section-decisions.md %})
- 남은 수정·보완: 61건 — High 31, Medium 25, Low 5. Archive fragment 1건 포함.
- 신규 skeleton: Folland Week 05–48 (44개), Linear Algebra 20개, Saad 15개. Definition·proof·derivation·example 본문은 비워 두었다.
- [전체 study roadmap]({% link STUDY-ROADMAP.md %})

## 기존 글별 편집

| 글 | A / B / C | 핵심 처리 |
| --- | --- | --- |
| [2026-07-23-folland-measurable-structures]({% link _posts/measure-theory/2026-07-23-folland-measurable-structures.md %}) | 27 / 0 / 2 | 핵심 구조 보존; 수정·보완 지시 0건. |
| [2026-07-24-folland-measures-and-set-convergence]({% link _posts/measure-theory/2026-07-24-folland-measures-and-set-convergence.md %}) | 40 / 0 / 2 | 핵심 구조 보존; 수정·보완 지시 0건. |
| [2026-07-25-folland-caratheodory-extension]({% link _posts/measure-theory/2026-07-25-folland-caratheodory-extension.md %}) | 50 / 0 / 3 | 핵심 구조 보존; 수정·보완 지시 1건. |
| [2026-07-26-folland-constructing-lebesgue-measure]({% link _posts/measure-theory/2026-07-26-folland-constructing-lebesgue-measure.md %}) | 48 / 0 / 2 | 핵심 구조 보존; 수정·보완 지시 0건. |
| [2026-07-27-folland-product-measurable-spaces]({% link _posts/measure-theory/2026-07-27-folland-product-measurable-spaces.md %}) | 39 / 0 / 2 | 핵심 구조 보존; 수정·보완 지시 0건. |
| [2026-07-28-folland-cantor-set-and-completion]({% link _posts/measure-theory/2026-07-28-folland-cantor-set-and-completion.md %}) | 36 / 0 / 1 | 핵심 구조 보존; 수정·보완 지시 0건. |
| [2025-07-18-ieee754-errors-and-algorithms]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) | 8 / 2 / 3 | 핵심 구조 보존; 수정·보완 지시 9건. |
| [2026-01-10-epsilon-optimal-cost-scaling-mcmf]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) | 9 / 1 / 2 | 핵심 구조 보존; 수정·보완 지시 7건. |
| [2026-01-23-bertsimas-linear-optimization-ch1-1]({% link _posts/2026-01-23-bertsimas-linear-optimization-ch1-1.md %}) | 5 / 0 / 0 | 핵심 구조 보존; 수정·보완 지시 1건. |
| [2026-02-04-steepest-descent-spd-convergence]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) | 11 / 7 / 1 | 핵심 구조 보존; 수정·보완 지시 18건. |
| [2026-02-09-conjugate-gradient]({% link _posts/2026-02-09-conjugate-gradient.md %}) | 5 / 2 / 1 | 핵심 구조 보존; 수정·보완 지시 7건. |
| [2026-07-31-measure-theory-seminar-03]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) | 5 / 0 / 1 | 핵심 구조 보존; 수정·보완 지시 4건. |
| [2026-08-07-fatou-dct]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) | 9 / 7 / 2 | 핵심 구조 보존; 수정·보완 지시 3건. |
| [2026-08-14-Lp-space-and-inequalities-04]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) | 58 / 23 / 1 | 핵심 구조 보존; 수정·보완 지시 10건. |

## 학습 구조 결정

- Folland 기존 기록의 진행 지점은 Seminar 04. 판본 표기가 없어 2판 (1999)을 reference edition으로 명시했다. 본인 교재의 edition·printing 대조는 [Folland index]({% link study/folland/index.md %})에 남겼다.
- 각 Folland Week는 prerequisite가 준비된 상태의 2–3시간 발표를 기준으로 배분했다. 실제 proof 준비에서 초과하면 연결된 Part 경계에서 다시 나누도록 workload에 표시했다.
- 기존 기록에서 확인되지 않은 선행 theorem은 [prerequisite checklist]({% link study/folland/prerequisite-checklist.md %})로 연결했다. 기존에 공부했다고 가정하거나 재작성하지 않았다.
- Saad의 기본 linear algebra 정의는 [Linear Algebra Review]({% link study/linear-algebra/index.md %})에서 소유하고 [Saad 00]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %})은 checklist로 연결했다. SVD existence → norms → low-rank approximation의 복귀 순서도 명시했다.
- Archive는 원래 byte를 보존했다. 수정된 active body의 preservation hash에는 날짜·이전 hash·이유를 기록했다.

## 검증

- Source validator: 14개 posts, 14개 body revision, 13개 legacy URL, 10개 archive checksum, 기존 snapshot 확인.
- Production build 및 HTMLProofer: 200개 HTML, 내부 링크 998개 통과.
- `/preview` rendering smoke: code highlighting, 수식 설정, bibliography, base URL assertions 통과; 201개 HTML, 내부 링크 1009개 검사 통과.
- 기존 front matter와 code block 12개 보존 확인. Numerical review의 29개 보존·진단 검사 및 두 independent review 반영.
- 신규 skeleton의 prerequisite cycle, missing topic, definition/proof 본문 대필 여부 점검. 오류를 찾은 heading·dependency·chapter mapping을 수정.
- 브라우저에서 roadmap, operator-norm heading, 검토 보고서 확인. SD의 equation tag 두 곳은 aligned 환경 밖으로 옮겨 수식 렌더링을 복구.
- Windows sandbox의 Ruby absolute glob 문제 때문에 로컬 검사에만 relative-glob compatibility shim을 사용. 저장소·CI에는 해당 shim을 추가하지 않음.
- 수학적 오류 및 미완성 proof의 해결은 아래 수정 지시로 남김. 기존 numerical program 전체를 실행해 정확성을 인증한 것은 아님.

## 검토에 사용한 출처

- [Princeton MAT425 Lecture Notes, Definition 2.73](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT425_spring_2025/MAT425_Lecture_Notes.pdf)
- [V. Sverak, PDE course notes, Lecture 42](https://www-users.cse.umn.edu/~sverak/course-notes.pdf)
- [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf) — §5.3.1 / Theorem 5.9, §6.7, §6.11.3 / Theorem 6.29: SD energy contraction, CG orthogonality / polynomial bound의 hypothesis 확인.
- [Goldberg, What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html) — number formats, cancellation, rounding model, Kahan summation 검토.
- [Ogita–Rump–Oishi, Accurate Sum and Dot Product](https://www.tuhh.de/ti3/paper/rump/OgRuOi05.pdf) — TwoSum / error-free transformation과 compensated summation 구별 확인.
- [Goldberg–Tarjan, Finding Minimum-Cost Circulations by Successive Approximation](https://www.cs.princeton.edu/research/techreps/634) — cost-scaling 논문의 저자 / 제목과 직접 reference 확인.
- [Goldberg–Tardos–Tarjan, Network Flow Algorithms](https://www.cs.cornell.edu/~eva/Network.Flow.Algorithms.pdf) — §§3.2–3.4, Theorem 3.2.1: integral costs, epsilon-optimal circulation과 exact optimality threshold 확인.
- [Wiley publisher catalogue — edition and chapter order](https://www.wiley-vch.de/en?isbn=9780471317166&option=com_eshop&view=product)
- [Gerald B. Folland author errata — printing distinction](https://sites.math.washington.edu/~folland/)
- [Folland book itself, 2nd edition, Contents pp. xiii–xiv (secondary-hosted scan consulted; publisher catalogue corroborates chapters)](https://djvu.online/file/NPF4BEtSuqdFA)

## 남은 수정 사항

아래 항목의 실제 수정과 proof 작성은 사용자가 직접 수행한다. 빈 skeleton 전체를 오류로 세지 않았으며, 작성된 claim의 문제와 재구성에 필요한 보완만 기록했다.

### 01. High — false sufficient condition

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Absorption
- 문제 유형: false sufficient condition
- 현재 문제: $|x-y|>2^{52}$만으로 작은 항이 사라진다고 주장한다.
- 필요한 수정: $x,y$의 부호와 표현 가능 여부를 명시하고 ulp와 rounding interval로 조건을 다시 세울 것. 현재 부등식이 성립하지만 합이 바뀌는 반례를 직접 확인할 것.
- 우선순위: High

### 02. High — formula / code mismatch

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Loss of significance
- 문제 유형: formula / code mismatch
- 현재 문제: 두 displayed formula는 같지 않으며, 아래 code의 $f_2$는 denominator에 plus를 사용한다.
- 필요한 수정: 본문의 denominator 부호를 code와 대조해 수정하고, 허용 domain과 rationalization의 핵심 중간 단계를 직접 확인할 것.
- 우선순위: High

### 03. High — algorithm identity / incomplete code / error bound

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Kahan Two Sum
- 문제 유형: algorithm identity / incomplete code / error bound
- 현재 문제: heading이 TwoSum과 Kahan compensated summation을 혼동한다. 아래 function의 type annotation은 Python syntax에 맞지 않고 return이 없다. $O(n\epsilon)$은 어떤 error인지 명시하지 않는다.
- 필요한 수정: algorithm 이름과 output contract를 확인하고 annotation / return을 직접 수정할 것. rounding assumption, unit roundoff, 입력 크기와 cancellation을 포함하는 error statement를 출처와 대조할 것.
- 우선순위: High

### 04. High — incorrect compensation update / syntax

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Neumaier
- 문제 유형: incorrect compensation update / syntax
- 현재 문제: magnitude 비교에 partial sum $t$ 대신 total을 사용하고, 첫 branch의 correction에서 $x\_ele$를 빼고 있다. type annotation도 Python syntax에 맞지 않는다.
- 필요한 수정: Neumaier 원식과 magnitude 조건 및 correction의 부호를 대조해 직접 고칠 것. 두 branch, 큰 cancellation, 정확히 표현되는 작은 정수 합을 검증하고 error claim의 norm / scale / assumptions를 명시할 것.
- 우선순위: High

### 05. High — bit weights / range / special values / exactness

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Superaccumulator
- 문제 유형: bit weights / range / special values / exactness
- 현재 문제: subnormal의 bit weight가 한 자리 어긋나며 기본 bins의 exponent 범위가 binary64의 작은 자리들을 잘라낸다. infinity는 sign과 뒤의 NaN을 확인하지 않고 즉시 반환한다.
- 필요한 수정: normal / subnormal의 bit-to-exponent mapping과 필요한 전체 exponent 범위를 직접 검산할 것. integer accumulation, carry 및 최종 rounding, ±infinity / NaN policy, return contract를 설계하고 각 경계값으로 확인할 것.
- 우선순위: High

### 06. High — incorrect objective / missing constraints

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 1 Problem Definition
- 문제 유형: incorrect objective / missing constraints
- 현재 문제: source / sink와 feasible flow 조건이 없고, 모든 edge의 flow 합을 maximum-flow objective로 사용한다. $w_{ev}$도 정의되지 않았다.
- 필요한 수정: $s,t$, capacity bounds, internal vertex의 flow conservation을 명시하고 source의 net outflow를 기준으로 flow value를 작성할 것. maximum value를 먼저 고정한 뒤 cost를 최소화하는 순서와 cost index를 정리할 것.
- 우선순위: High

### 07. High — inconsistent notation / missing invariant

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 2 Epsilon-Optimality and Cost Scaling
- 문제 유형: inconsistent notation / missing invariant
- 현재 문제: $c_e$가 capacity와 cost로 중복 사용되고 $\varepsilon ps$의 의미가 불명확하다. residual graph, reverse arc cost, potential과 admissible arc가 정의되지 않았다.
- 필요한 수정: capacity / cost / potential / epsilon notation을 분리하고 residual network 및 reduced-cost convention을 직접 정의할 것. 그 convention으로 initialization, admissibility, reverse arc와 relabel 식을 모두 재검산할 것.
- 우선순위: High

### 08. High — inconsistent reduced-cost sign

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3.2 Relabel
- 문제 유형: inconsistent reduced-cost sign
- 현재 문제: 이 max update는 §2.2의 reduced-cost convention과 일치하지 않는다.
- 필요한 수정: 선택한 reduced-cost 식을 epsilon-optimality 부등식에 직접 대입해 relabel을 유도할 것. 최소 하나의 admissible outgoing arc가 생기는지, residual outgoing arc가 없는 경우는 어떻게 처리하는지 확인할 것.
- 우선순위: High

### 09. High — missing theorem / termination hypothesis

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3.3 Exact optimality and termination
- 문제 유형: missing theorem / termination hypothesis
- 현재 문제: epsilon을 줄이면 exact optimum을 얻는 이유와 종료 threshold가 비어 있다.
- 필요한 수정: integer cost, residual cycle 길이와 epsilon bound를 연결하는 theorem을 직접 확인하고 $\varepsilon<1/|V|$ 기준 또는 cost rescaling에 맞는 종료 조건을 작성할 것. 종료 시 excess가 0인지도 포함할 것.
- 우선순위: High

### 10. High — nontermination / invalid reduction / cost reconstruction

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 4 Pseudo Code
- 문제 유형: nontermination / invalid reduction / cost reconstruction
- 현재 문제: `eps = (eps+1)/2`는 integer eps가 1이면 그대로 1이어서 loop가 끝나지 않는다. 추가 arc `(t,s)`의 임의의 positive cost / capacity와 마지막 `cap == 0 and u<v` 집계도 정당화되지 않았다.
- 필요한 수정: 정확한 epsilon schedule과 cost-scaling threshold를 적용할 것. maximum flow를 먼저 고정하거나 정당화한 circulation reduction을 택하고, original arc id / original capacity / residual capacity를 이용한 flow 및 cost 복원을 직접 설계할 것. magic constant의 범위와 overflow도 확인할 것.
- 우선순위: High

### 11. High — ambiguous circulation reduction

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 6 Bipartite Matching
- 문제 유형: ambiguous circulation reduction
- 현재 문제: `cost = lower than min-cost`가 정의되지 않아 추가 arc가 어떤 matching objective를 구현하는지 알 수 없다.
- 필요한 수정: 원하는 cardinality 우선순위를 명시하고 §4에서 정한 reduction과 같은 capacity / cost 조건을 사용해 model을 직접 검증할 것.
- 우선순위: High

### 12. High — missing quantifier restriction

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Positive definite
- 문제 유형: missing quantifier restriction
- 현재 문제: positive definiteness의 quantifier에 $x\ne0$이 빠져 있다.
- 필요한 수정: real square matrix의 domain을 명시하고 nonzero vector에 대한 조건으로 definition을 직접 수정할 것.
- 우선순위: High

### 13. High — wrong field hypothesis / reversed similarity

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Spectral Theorem / basis change
- 문제 유형: wrong field hypothesis / reversed similarity
- 현재 문제: real / complex field의 가정이 빠졌고, eigenvector를 column으로 둔 $Q$와 diagonalization 식의 방향이 맞지 않는다. complex case에서도 transpose를 사용한다.
- 필요한 수정: 이 글의 real SPD case와 complex normal case를 구분하고, $AQ=Q\Lambda$에서 basis-change 방향을 직접 검산할 것. complex case에는 conjugate transpose와 unitary 조건을 명시할 것.
- 우선순위: High

### 14. High — false equality / unspecified norm

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.a Operator norm bound
- 문제 유형: false equality / unspecified norm
- 현재 문제: matrix-vector product의 norm을 operator norm과 vector norm의 곱과 같다고 쓴다.
- 필요한 수정: vector 2-norm / induced matrix 2-norm을 명시하고 첫 equality를 operator-norm inequality로 바로잡을 것. symmetric matrix의 norm을 eigenvalue로 계산하는 dependency를 확인할 것.
- 우선순위: High

### 15. High — false sufficient condition

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.a Constant step-size condition
- 문제 유형: false sufficient condition
- 현재 문제: $0<\alpha<1/\lambda_{\min}$은 (1)을 보장하지 않는다.
- 필요한 수정: convergence 결론의 hypothesis를 바로 앞에서 얻은 (1)과 일치시킬 것. 모든 initial error에 대한 보장과 특정 eigenspace에서의 예외를 구분할 것.
- 우선순위: High

### 16. High — wrong dummy variable / missing derivation / zero denominator

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Exact line search
- 문제 유형: wrong dummy variable / missing derivation / zero denominator
- 현재 문제: $\phi(\tau)$의 우변에 $\tau$가 없고, minimizer라는 주장에 derivation 및 $r_k\ne0$ 조건이 빠져 있다.
- 필요한 수정: line-search parameter와 optimizer를 구별하고 1-variable derivative / positive second derivative를 직접 확인할 것. residual이 0인 종료 경우를 분리하고 Rayleigh quotient의 vector 인자를 명시할 것.
- 우선순위: High

### 17. High — missing squares / missing nonzero case

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Energy-error ratio / moments
- 문제 유형: missing squares / missing nonzero case
- 현재 문제: (2)와 달리 마지막 비율의 norm에서 square가 빠졌다. $p_i$와 error ratio는 $e_k=0$에서 정의되지 않는다. 원문의 $y$, $y_k$, $y_{k,i}$ 혼용은 위 전개에서 $y=Q^\top e_k$의 $i$번째 coordinate로 통일해 표시했다.
- 필요한 수정: 이 식의 square를 (2)와 일치시키고 해에 도달하지 않은 iteration에서만 나눗셈을 수행한다고 명시할 것.
- 우선순위: High

### 18. High — algebraic coefficient / implication direction / zero coordinates

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Kantorovich-type inequality
- 문제 유형: algebraic coefficient / implication direction / zero coordinates
- 현재 문제: 제곱한 줄의 numerator가 $4(mM)^2$로 되어 다음 줄의 $4mM$과 다르다. inequality를 약화시키는 단계에도 equivalence를 사용하며 $y_i=0$일 때 $b_i/a_i$를 정의할 수 없다. 원문의 중복 substitution 설명에서는 $b_i$의 $|y_i|$가 빠졌고 sum 안의 $\lambda$ index도 일부 누락되어 있었다. 위에서는 앞의 정의와 동일한 index를 표시했다.
- 필요한 수정: 제곱 단계의 coefficient를 직접 검산하고 AM–GM을 사용하는 곳의 implication을 바로잡을 것. zero coordinate를 나누지 않는 방식으로 coordinatewise inequality를 정당화할 것.
- 우선순위: High

### 19. High — missing endpoint / bound versus observed count

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 Contraction endpoint / speed of convergence
- 문제 유형: missing endpoint / bound versus observed count
- 현재 문제: $\kappa=1$이면 $q=0$이어서 positive라는 주장과 $d$의 식을 그대로 사용할 수 없다. worst-case error bound를 실제 loop count의 근사식처럼 사용한다.
- 필요한 수정: $\kappa=1$ 및 초기 해의 경우를 분리하고, $\kappa>1$에서 prescribed energy-norm tolerance를 보장하는 sufficient iteration count로 (4)를 해석할 것. 정수 ceiling과 exact arithmetic 가정도 명시할 것.
- 우선순위: High

### 20. High — unjustified componentwise decrease

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Zig-zag / spectral interpretation
- 문제 유형: unjustified componentwise decrease
- 현재 문제: (5), (6)만으로 largest-eigenvalue component가 매 iteration 감소한다고 결론낼 수 없다.
- 필요한 수정: exact line search에서 (5)가 나오는 이유를 직접 확인하고 (6)의 multiplier sign / magnitude를 분석할 것. total energy decrease, oscillation, componentwise change를 구분할 것.
- 우선순위: High

### 21. High — convergence-rate confusion

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Motivation / convergence terminology
- 문제 유형: convergence-rate confusion
- 현재 문제: condition number의 제곱근 의존성 개선을 quadratic convergence라고 부른다.
- 필요한 수정: SD와 CG의 energy-norm error bound에서 iteration 수의 condition number 의존성을 비교하고 quadratic convergence라는 표현을 바로잡을 것. exact arithmetic 가정을 구분할 것.
- 우선순위: High

### 22. High — invalid implication / geometric confusion

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Residual orthogonality / projection
- 문제 유형: invalid implication / geometric confusion
- 현재 문제: 인접 residual의 orthogonality에서 모든 residual의 pairwise orthogonality를 추론한다. 무엇을 어떤 inner product로 projection하는지도 불명확하다.
- 필요한 수정: CG recurrence에 근거한 residual orthogonality와 search direction의 $A$-conjugacy를 구별해 직접 증명할 것. affine Krylov space, error의 $A$-norm minimization, residual의 Galerkin condition을 연결하고 zig-zag가 사라진다는 주장의 범위를 재검토할 것.
- 우선순위: High

### 23. High — missing theorem / proof chain / imprecise bound

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 4 Correctness
- 문제 유형: missing theorem / proof chain / imprecise bound
- 현재 문제: Chebyshev polynomials의 이름과 한 비율만으로 correctness를 대신하고, bound의 norm, iteration exponent, 상수와 hypotheses가 빠져 있다.
- 필요한 수정: SPD / exact arithmetic, nonzero search directions, $A$-conjugacy, Krylov characterization, minimization, finite termination의 순서로 proof heading과 본인을 위한 TODO를 보완할 것. 그 뒤 polynomial error bound와 Chebyshev estimate의 정확한 statement를 직접 작성할 것.
- 우선순위: High

### 24. High — incomplete definition / missing hypothesis / malformed TeX

- 위치: [2026-07-25-folland-caratheodory-extension.md]({% link _posts/measure-theory/2026-07-25-folland-caratheodory-extension.md %}) — 2.2 Definition of a Premeasure
- 문제 유형: incomplete definition / missing hypothesis / malformed TeX
- 현재 문제: 두 번째 axiom이 미완성이라 premeasure를 정의하지 못한다. 원문의 잘못된 TeX를 code로 보존하고 현 위치에 [수정 필요]를 남겼다.
- 필요한 수정: 사용자가 모든 pairwise disjoint sequence에 대한 quantifier, 각 집합과 union이 algebra에 속한다는 조건, countable additivity 등식을 직접 완성한다.
- 우선순위: High

### 25. High — proof gap / hypothesis / notation

- 위치: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Monotone Convergence Theorem
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: $L^+$의 definition과 MCT의 proof가 비어 있어 이 문서만으로 theorem을 복원할 수 없다.
- 필요한 수정: $L^+$의 domain/codomain과 measurability를 명시하고, simple function 및 $0<c<1$을 사용하는 lower-bound proof를 직접 채운다. 증가 집합의 union과 $c\uparrow1$ 단계도 확인한다.
- 우선순위: High

### 26. High — proof gap / hypothesis / notation

- 위치: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Statement
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: limit $f$의 measurability와 함수의 scalar field가 명시되지 않았다.
- 필요한 수정: $f$도 measurable이라고 가정하거나 measurable representative를 선택한다. real-valued theorem임을 명시하고, complex-valued version을 포함하려면 real/imaginary parts로의 reduction을 직접 추가한다. a.e. 조건은 공통 null set 밖에서 다루도록 정리한다.
- 우선순위: High

### 27. High — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — The Space $L^p$
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: $\mathcal L^p$에서 $L^p$로 가는 quotient definition과 $L^\infty$의 definition이 비어 있다.
- 필요한 수정: equivalence relation, quotient $L^p$, representative independence를 직접 명시한다. essential supremum의 quantifier, $L^\infty$와 그 norm을 채운다. §9에서 사용할 complex-valued version의 scalar field도 정한다.
- 우선순위: High

### 28. High — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Normalization / Proof Using Young — TODO
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: statement의 exponent 범위와 zero-norm case가 명시되지 않고 normalization 뒤 proof가 비어 있다.
- 필요한 수정: $1\le p,q\le\infty$, $1/\infty=0$ convention을 명시하고 zero-norm case를 분리한다. $1<p<\infty$의 normalized Young integration과 endpoint proof를 각각 직접 채운다.
- 우선순위: High

### 29. High — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Statement
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: $f,g$의 membership assumption이 생략되었고 Hölder 적용 전 $f+g\in L^p$를 확보하는 단계가 없다.
- 필요한 수정: $f,g\in L^p(X)$를 명시하고 preliminary integrability estimate 또는 truncation으로 finiteness를 먼저 확보한다. zero-norm case와 $p=1,\infty$ endpoint도 분리한다.
- 우선순위: High

### 30. High — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof: $L^p$ Convergence / Original Sequence — TODO
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: $g\in L^p$, $f$의 measurable extension과 membership, norm convergence가 TODO이고 $p=\infty$ proof가 분리되지 않았다.
- 필요한 수정: $1\le p<\infty$에서 $g_m^p$의 limit과 summable tail estimate를 직접 채우고 exceptional measurable null set에서 $f$를 정의한다. 이후 원래 sequence로 돌아가는 triangle estimate를 적는다. $p=\infty$에는 공통 null set 밖 uniform Cauchy argument를 별도로 작성한다.
- 우선순위: High

### 31. High — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Weak Derivatives / Sobolev Preview
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: $\Omega$의 조건, index $i$의 quantifier, $D_i$의 의미가 빠져 있다.
- 필요한 수정: $\Omega\subset\mathbb R^n$ open, 모든 $i=1,\ldots,n$, distributional/weak derivative라는 조건을 명시한다. 이 위치는 preview로 두고 실제 definition과 proof는 이후 §9.3 study에서 직접 채운다.
- 우선순위: High

### 32. Medium — missing cases / format scope

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 1.1–1.2 IEEE 754 representation
- 문제 유형: missing cases / format scope
- 현재 문제: 표현식이 normal number에만 해당하는데 모든 IEEE 754 값의 표현식처럼 제시되어 있다. float / double도 특정 언어의 type 이름과 IEEE format을 구분하지 않는다.
- 필요한 수정: binary32 / binary64를 다루는 범위를 명시하고, normal의 exponent 범위와 subnormal / zero / special value의 구분을 직접 정리할 것. 표의 fraction bits와 significand precision도 구분할 것.
- 우선순위: Medium

### 33. Medium — missing domain / ambiguous notation

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.1 Error definitions
- 문제 유형: missing domain / ambiguous notation
- 현재 문제: relative error에서 $x=0$이 제외되지 않았고, heading의 machine epsilon이 정의되지 않았다.
- 필요한 수정: exact value와 rounded value의 역할, $x\ne0$, rounding mode를 명시하고 machine epsilon / unit roundoff의 convention을 직접 작성할 것.
- 우선순위: Medium

### 34. Medium — conceptual distinction

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Error taxonomy
- 문제 유형: conceptual distinction
- 현재 문제: truncation error를 decimal을 자르는 error로 한정하고, computation error와 rounding-off error의 구분도 불명확하다.
- 필요한 수정: approximation / truncation, representation / rounding, conditioning에 따른 error amplification을 구분해 직접 정리하고 overflow / underflow의 처리 범위를 채울 것.
- 우선순위: Medium

### 35. Medium — pedagogical gap

- 위치: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Decimal experiment
- 문제 유형: pedagogical gap
- 현재 문제: 50-digit Decimal 실험을 IEEE binary64의 직접 실험처럼 읽을 수 있고, cancellation의 원인이 설명되지 않았다.
- 필요한 수정: Decimal precision과 binary64 precision을 구분하고, 각 square root의 rounding error가 subtraction 후 상대적으로 커지는 위치를 직접 표시할 것.
- 우선순위: Medium

### 36. Medium — algorithm classification / missing invariant

- 위치: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3 Push-Relabel Algorithm
- 문제 유형: algorithm classification / missing invariant
- 현재 문제: push-relabel과 cost scaling을 heuristic으로만 소개해 exact algorithm의 invariant와 종료 논리가 빠져 있다.
- 필요한 수정: 사용 중인 cost-scaling variant를 정하고 pseudoflow, excess, capacity feasibility, epsilon-optimality의 역할과 phase 종료 조건을 직접 정리할 것.
- 우선순위: Medium

### 37. Medium — ambiguous notation / wrong definition label

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Rayleigh quotient / smoothness / condition number
- 문제 유형: ambiguous notation / wrong definition label
- 현재 문제: $Ray(A)$에 vector dependence와 $x\ne0$이 빠져 있다. Lipschitz condition은 $f$ 자체가 아니라 gradient에 대한 조건이다. condition number의 norm / nonsingularity도 명시하지 않았다.
- 필요한 수정: Rayleigh quotient의 matrix와 vector 인자를 구분하고, gradient Lipschitz의 domain / quantifier / 상수를 작성할 것. condition number는 induced 2-norm과 invertibility를 명시할 것.
- 우선순위: Medium

### 38. Medium — pedagogical gap

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Iterative update / line search
- 문제 유형: pedagogical gap
- 현재 문제: general search direction $p_k$와 뒤에서 정의할 residual $r_k$가 혼용된다.
- 필요한 수정: SD에서는 residual이 negative gradient인 이유와, exact solution에 도달하면 line search 전에 멈추는 조건을 직접 연결할 것.
- 우선순위: Medium

### 39. Medium — residual-error confusion / missing cost assumptions

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 3 Residual stopping / cost comparison
- 문제 유형: residual-error confusion / missing cost assumptions
- 현재 문제: relative residual을 뒤 문장에서 relative error라고 불러 terminology가 흔들리고, direct method보다 유리한 이유를 $O(n^3)$ 연산을 피한다는 점만으로 설명한다.
- 필요한 수정: stopping criterion을 relative residual로 표시하고 forward error와의 관계 및 초기 residual이 0인 경우를 직접 정리할 것. dense / sparse model과 iteration 수를 명시해 비교할 것.
- 우선순위: Medium

### 40. Medium — ambiguous basis / missing nonzero vector

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Rayleigh quotient coordinates
- 문제 유형: ambiguous basis / missing nonzero vector
- 현재 문제: $x_i$가 original coordinate인지 eigenbasis coordinate인지 명시되지 않았다.
- 필요한 수정: $Q^\top x$의 coordinate임을 명시하고 nonzero vector 가정 및 §2의 corrected diagonalization과 연결할 것.
- 우선순위: Medium

### 41. Medium — pedagogical gap

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Kantorovich proof idea
- 문제 유형: pedagogical gap
- 현재 문제: 긴 inequality에서 왜 $a_i,b_i$를 선택했는지 proof idea가 드러나지 않는다.
- 필요한 수정: 세 spectral moment의 ratio를 비교하는 목적, spectrum interval을 coordinatewise inequality로 옮기는 단계, AM–GM의 역할을 본인의 말로 표시할 것.
- 우선순위: Medium

### 42. Medium — function-output mismatch / experiment interpretation

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 MATLAB validation experiment
- 문제 유형: function-output mismatch / experiment interpretation
- 현재 문제: 호출부는 `[~, i]` 두 output을 요구하지만 function signature는 `x` 하나만 반환한다.
- 필요한 수정: 반환값과 호출을 일치시키고 random seed / arithmetic 환경 / 실제 종료 조건을 기록할 것. computed reference solution의 error와 residual drift도 고려해 tolerance 달성 여부를 확인할 것.
- 우선순위: Medium

### 43. Medium — bound versus equality / complexity parameters

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Conditioning and cost
- 문제 유형: bound versus equality / complexity parameters
- 현재 문제: worst-case contraction bound를 실제 감소량으로 읽게 하고, $\kappa$와 tolerance dependence를 constant로 취급해 전체 complexity를 $O(n^2)$라고 부른다.
- 필요한 수정: guaranteed reduction bound와 실제 감소를 구분하고 per-iteration / total cost를 분리할 것. fixed tolerance 여부, dense cost와 sparse $\operatorname{nnz}(A)$ 비용을 명시할 것.
- 우선순위: Medium

### 44. Medium — pedagogical gap

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Connection to CG
- 문제 유형: pedagogical gap
- 현재 문제: 원문의 두 convergence ratio 비교만으로는 CG의 bound가 SD의 one-step contraction을 그대로 대체하는 것처럼 보인다.
- 필요한 수정: CG의 Krylov minimization과 polynomial error bound를 다음 글에서 연결하고 bound의 norm / 상수 / iteration dependence를 직접 대조할 것.
- 우선순위: Medium

### 45. Medium — undefined map / basis identification

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Cyclic subspace
- 문제 유형: undefined map / basis identification
- 현재 문제: $T$가 정의되지 않았고 abstract vector $\alpha$에 matrix $A$를 바로 적용한다.
- 필요한 수정: $T:V\to V$, field와 선택한 basis, $A$의 관계를 명시하고 Cayley–Hamilton / minimal polynomial이 span의 끝을 제한하는 dependency를 표시할 것.
- 우선순위: Medium

### 46. Medium — pedagogical gap

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 2 Prerequisite
- 문제 유형: pedagogical gap
- 현재 문제: SPD와 $A$-inner product가 code의 핵심 전제인데 prerequisite 목록에서 드러나지 않는다.
- 필요한 수정: SPD, $A$-inner product, $A$-conjugate directions, residual / error의 관계를 prerequisite로 직접 연결할 것.
- 우선순위: Medium

### 47. Medium — pedagogical gap

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 3 Algorithm & Code
- 문제 유형: pedagogical gap
- 현재 문제: recursive residual과 주기적으로 재계산한 true residual의 차이, 고정 iteration cap, 반환된 해의 종료 상태가 설명되지 않았다.
- 필요한 수정: exact arithmetic의 orthogonality와 finite precision의 loss of orthogonality를 구분하고, relative residual 기준 및 zero initial residual, convergence status를 직접 점검할 것.
- 우선순위: Medium

### 48. Medium — pedagogical gap

- 위치: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 5 Preconditioning direction
- 문제 유형: pedagogical gap
- 현재 문제: “modify A”라는 표현만으로는 원래 linear system과의 equivalence, CG에 필요한 symmetry / positive definiteness가 드러나지 않는다.
- 필요한 수정: preconditioner의 assumptions와 transformed unknown / system, SPD를 유지하는 formulation을 직접 연결할 것.
- 우선순위: Medium

### 49. Medium — pedagogical / dependency

- 위치: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.1
- 문제 유형: pedagogical / dependency
- 현재 문제: generating collection만 검사해도 되는 이유가 없다.
- 필요한 수정: measurable preimage를 갖는 집합들의 collection이 $\sigma$-algebra가 되는 proof와 이 판정법의 motivation.
- 우선순위: Medium

### 50. Medium — pedagogical / dependency

- 위치: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.13
- 문제 유형: pedagogical / dependency
- 현재 문제: simple-function integral의 definition과 extended integral convention이 생략되어 있다.
- 필요한 수정: canonical representation에 따른 integral definition, representation independence, $0\cdot\infty=0$ convention, measure의 continuity from below와의 연결.
- 우선순위: Medium

### 51. Medium — proof gap / hypothesis / notation

- 위치: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Why Domination Is Necessary
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: heading이 domination을 limit–integral interchange의 necessary condition으로 읽히게 한다.
- 필요한 수정: heading을 “Pointwise Convergence Alone Is Insufficient”로 바꾸고, common integrable dominator가 존재하지 않음을 직접 확인한다.
- 우선순위: Medium

### 52. Medium — pedagogical / dependency

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof / Equality Case — TODO
- 문제 유형: pedagogical / dependency
- 현재 문제: statement만 있고 proof와 equality condition이 비어 있다.
- 필요한 수정: 사용할 convexity 또는 calculus argument의 핵심과 equality condition.
- 우선순위: Medium

### 53. Medium — pedagogical / dependency

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof Using Hölder — TODO
- 문제 유형: pedagogical / dependency
- 현재 문제: norm estimate와 finite measure assumption의 역할을 연결하는 proof가 없다.
- 필요한 수정: Hölder에 넣을 두 함수와 conjugate exponents, $q=\infty$ case, infinite measure 반례의 §7 연결.
- 우선순위: Medium

### 54. Medium — proof gap / hypothesis / notation

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Power Functions Near Infinity
- 문제 유형: proof gap / hypothesis / notation
- 현재 문제: 두 power-function 판정에서 $p$의 finite 범위, $\alpha$의 범위와 measure가 생략되었다.
- 필요한 수정: Lebesgue measure, $1\le p<\infty$, $\alpha\in\mathbb R$를 명시하고 $p=\infty$는 essential boundedness로 별도 확인한다.
- 우선순위: Medium

### 55. Medium — pedagogical / dependency

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof: $L^p$ Convergence / Original Sequence — TODO
- 문제 유형: pedagogical / dependency
- 현재 문제: subsequence 선택의 목적이 드러나지 않는다.
- 필요한 수정: summable norm increments → a.e. absolute convergence → norm convergence라는 proof idea를 자기 말로 기록.
- 우선순위: Medium

### 56. Medium — pedagogical / dependency

- 위치: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Hilbert Spaces / Banach vs. Hilbert
- 문제 유형: pedagogical / dependency
- 현재 문제: inner product의 well-definedness와 §2의 real-valued convention을 확장하는 위치가 분명하지 않다.
- 필요한 수정: $f,g\in L^2$와 Cauchy–Schwarz에 의한 integrability, representative independence, complex scalar field와 linear-slot convention.
- 우선순위: Medium

### 57. Low — pedagogical gap

- 위치: [2026-01-23-bertsimas-linear-optimization-ch1-1.md]({% link _posts/2026-01-23-bertsimas-linear-optimization-ch1-1.md %}) — Canonical Form
- 문제 유형: pedagogical gap
- 현재 문제: matrix / vector의 크기, scalar field와 canonical form이라는 명칭의 convention이 없다.
- 필요한 수정: $A,b,c,x$의 domain과 dimension, inequality의 componentwise 의미를 명시하고 해당 textbook의 form 이름을 확인할 것.
- 우선순위: Low

### 58. Low — pedagogical gap

- 위치: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 Existence and uniqueness
- 문제 유형: pedagogical gap
- 현재 문제: quadratic lower bound에서 선형항을 포함한 coercivity로 가는 단계와 minimum attainment의 조건이 압축되어 있다.
- 필요한 수정: $b\in\mathbb R^n$, $c\in\mathbb R$를 명시하고, 선형항의 성장률 비교 및 continuity / finite dimension을 사용하는 지점을 직접 표시할 것.
- 우선순위: Low

### 59. Low — pedagogical / dependency

- 위치: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.3
- 문제 유형: pedagogical / dependency
- 현재 문제: codomain의 $\sigma$-algebra와 Proposition 2.1과의 dependency가 암묵적이다.
- 필요한 수정: $\mathbb R$의 Borel $\sigma$-algebra 명시와 각 family의 generation 확인.
- 우선순위: Low

### 60. Low — pedagogical / dependency

- 위치: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Statement
- 문제 유형: pedagogical / dependency
- 현재 문제: 공통 measure space와 $L^+$ notation이 생략되어 있다.
- 필요한 수정: $(X,\mathcal M,\mu)$, $L^+$의 extended-valued codomain 및 integral notation을 문서 앞에 명시.
- 우선순위: Low

### 61. Low — missing hypothesis / ambiguous notation (archived fragment)

- 위치: [01-weak-derivatives.md](https://github.com/jinhojeon123/jinhojeon123.github.io/blob/main/archive/legacy/_posts/sobolev-foundations/01-weak-derivatives.md) — 유일한 display equation
- 문제 유형: missing hypothesis / ambiguous notation (archived fragment)
- 현재 문제: 가정 없이 마지막 적분을 유한하다고 단정하고, support가 적분 domain으로 조판되지 않았다. 수식 외의 본문은 없다.
- 필요한 수정: Archive 원본은 유지한다. 향후 활성 note로 복구할 때 open domain, local integrability, smooth compactly supported test function의 가정과 support 표기를 사용자가 명시한다.
- 우선순위: Low
