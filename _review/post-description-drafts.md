# 게시글 description 초안 (작성자 검토용)

> 이 파일은 검토용 초안입니다. 게시글 본문, front matter, URL, 인용문, review annotation은 수정하지 않았습니다.
> `_review/`는 밑줄로 시작하므로 Jekyll 빌드와 `tools/validate.rb` 검사 대상에서 빠집니다.

## 요약

| 항목 | 수 |
| --- | ---: |
| 조사한 게시글 (`_posts/**/*.md`, 제외 설정된 `_posts/measure-theory/README.md` 빼고) | 133 |
| description이 이미 있는 글 | 14 |
| **description 누락 (키 없음)** | **119** |
| description 빈 값 (`""` 또는 null) | 0 |
| 초안 완료 | 118 |
| 보류: 작성자 검토 필요 | 1 |

- 기준: `main` 98a5a21 (Merge pull request #2). 2026-09-25에 다시 셌습니다.
- 누락된 119개는 모두 `status: outline`인 학습 개요 글입니다: Folland Seminar 44, Linear Algebra Review 20, Saad Study 15, Trefethen NLA in C++ 40.
- 이 119개 가운데 `[Correction required]`/`[Suggested addition]` review annotation이 있는 글은 없습니다. 60개 annotation은 모두 description이 이미 있는 14개 글에 있습니다.
- 이전 세션에서 추정한 "약 127개"와 8개 차이가 납니다. 게시글 기준으로는 119개가 정확합니다. 게시글이 아닌 페이지 21개(`_tabs/` 5, `_projects/` 4, `study/` 5, `index.html`, `archives/`, `categories/`, `tags/`, `measure-theory/`, `start-here/`, `study-review/`)에도 description이 없으므로, 이전 수치는 집계 기준이 달랐던 것으로 보입니다. 이 페이지들은 이번 범위에서 뺐습니다.

## 작성 방법

- 각 글의 본문을 직접 읽고, 본문에 적힌 범위(참고 절, 목표, 체크리스트, 소제목, 계획된 실험)만 요약했습니다.
- 본문이 모두 영어라서 초안도 영어로 썼습니다. 이미 있는 14개 description처럼 개요 글은 "outline"이라고 밝혔습니다.
- 문장 길이는 136~160자(평균 149자)입니다. 검색 결과에서 잘리지 않도록 160자를 넘지 않게 맞췄습니다.
- 모든 초안이 서로 다릅니다. `$`, `\`, `*`, `_`, 백틱, 대괄호, `<`, `>` 같은 TeX/마크다운/HTML 기호는 쓰지 않았고, §·–·∞ 같은 일반 유니코드 문자만 썼습니다.
- 초안에 콜론과 작은따옴표가 들어 있으므로 front matter에는 아래 예시처럼 큰따옴표로 감싸 넣어야 합니다.

## 작성자가 결정할 사항

1. **Week 05 (보류 1건):** 로컬의 미커밋 Week 05 초안을 반영한 뒤 description을 확정할지 정해 주세요. 아래 문장은 현재 main에 커밋된 개요만 보고 쓴 임시안입니다.
2. **"outline" 표기 유지 여부:** 119개 초안 모두 개요라고 밝혔습니다. 나중에 `status`를 `working-note`로 바꿀 때 description도 함께 고쳐야 합니다. 이 표기를 빼려면 문장 앞부분만 바꾸면 됩니다.
3. **Trefethen의 "planned C++" 표기:** 구현 전이므로 계획으로만 적었습니다. 구현과 실험 결과가 생기면 description도 갱신해야 합니다.
4. **Week 16 해석 확인:** 본문의 짧은 항목을 풀어 쓴 문장이 의도와 맞는지 확인이 필요합니다(해당 항목의 메모 참고).
5. **적용 방식:** 채택한 문장을 각 글의 front matter에 `description:`으로 넣는 작업은 별도 변경으로 해야 합니다. 이 119개는 `docs/content-preservation.json`의 보존 대상이 아니고, front matter만 고치면 revision 기록도 필요 없습니다.
6. **게시글이 아닌 페이지 21개**의 description을 따로 준비할지 정해 주세요.

## Folland Seminar (44)

Folland 2판 절(§) 번호와 "Must cover" 목록을 기준으로 썼습니다. 길이 때문에 "Part I/II" 표기는 생략했고, 같은 절을 나눈 주차는 다루는 내용으로 구분됩니다.

### 001. Folland Week 05 — Duality of Lp

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-05-duality-of-lp.md`
- 상태: **작성자 검토 필요 (보류, 임시안)** · 157자

```yaml
description: "Seminar outline for Folland §6.2: the isometry from Lq into the dual of Lp and its Radon–Nikodym proof of surjectivity, with the endpoints p = 1, ∞ deferred."
```

> 검토 메모: 작성자 로컬에 이 글의 미커밋 초안이 있습니다(이번 작업 범위 밖). 그 초안이 반영되면 본문과 status가 달라져 이 설명, 특히 'outline' 표현이 맞지 않을 수 있습니다. 위 문장은 현재 main에 커밋된 개요만 보고 쓴 임시안이므로, 초안 반영 후 다시 확인해 주세요.

### 002. Folland Week 06 — Lp Duality — Endpoints and Consequences

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-06-lp-duality-endpoints-and-consequences.md`
- 상태: 초안 완료 · 158자

```yaml
description: "Seminar outline for Folland §6.2: the p = 1 and p = ∞ endpoints of Lp duality, sigma-finite and semifinite hypotheses, reflexivity, and weak-star convergence."
```

### 003. Folland Week 07 — Integral Inequalities and Kernel Operators

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-07-integral-inequalities-and-kernel-operators.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Seminar outline for Folland §6.3: Chebyshev's inequality, Minkowski's inequality for integrals, and Lp bounds for integral kernel operators via Fubini–Tonelli."
```

### 004. Folland Week 08 — Homogeneous Kernels and Hardy Inequalities

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-08-homogeneous-kernels-and-hardy-inequalities.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Seminar outline for Folland §6.3: operators with homogeneous kernels on (0, ∞), their adjoints, scaling hypotheses, and the Hardy and Hilbert inequalities."
```

### 005. Folland Week 09 — Distribution Functions and Weak Lp

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-09-distribution-functions-and-weak-lp.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Seminar outline for Folland §6.4: distribution functions, the layer-cake formula, the weak Lp quasi-norm, and strong-type versus weak-type operators."
```

### 006. Folland Week 10 — Riesz–Thorin Interpolation

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-10-riesz-thorin-interpolation.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Seminar outline for Folland §6.5: the Riesz–Thorin interpolation theorem, its use of the Hadamard three-lines lemma, and the reduction to simple functions."
```

### 007. Folland Week 11 — Marcinkiewicz Interpolation

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-11-marcinkiewicz-interpolation.md`
- 상태: 초안 완료 · 145자

```yaml
description: "Seminar outline for Folland §6.5: Marcinkiewicz interpolation for sublinear operators, from weak-type endpoint bounds via distribution functions."
```

### 008. Folland Week 12 — Radon Representation — Measure Construction

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-12-radon-representation-measure-construction.md`
- 상태: 초안 완료 · 160자

```yaml
description: "Seminar outline for Folland §7.1: positive linear functionals on Cc(X) for locally compact Hausdorff X and the construction of their representing Radon measure."
```

### 009. Folland Week 13 — Radon Representation — Integral and Uniqueness

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-13-radon-representation-integral-and-uniqueness.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §7.1: completing the Riesz representation theorem for positive functionals: integral representation, regularity, and uniqueness."
```

### 010. Folland Week 14 — Radon Regularity and Approximation

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-14-radon-regularity-and-approximation.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Seminar outline for Folland §7.2: regularity criteria for Radon measures, sigma-compactness hypotheses, Lusin's theorem, and density of Cc(X) in Lp."
```

### 011. Folland Week 15 — The Dual of C0

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-15-the-dual-of-c0.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §7.3: representing the dual of C0(X) by complex Radon measures with the total variation norm, and vague (weak-star) convergence."
```

### 012. Folland Week 16 — Products of Radon Measures

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-16-products-of-radon-measures.md`
- 상태: 초안 완료 · 153자

```yaml
description: "Seminar outline for Folland §7.4: products of Radon measures, where product and Borel sigma-algebras can differ, and Fubini's theorem for Radon products."
```

> 검토 메모: 본문 항목 'product Borel sigma-algebra distinction'을 'product sigma-algebra와 Borel sigma-algebra의 차이'로 풀어 썼습니다. 의도와 같은지 확인해 주세요.

### 013. Folland Week 17 — Fourier Preliminaries and Convolution

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-17-fourier-preliminaries-and-convolution.md`
- 상태: 초안 완료 · 153자

```yaml
description: "Seminar outline for Folland §8.1–8.2: multi-index notation, smooth cutoff functions, convolution with its support and regularity, and Young's inequality."
```

### 014. Folland Week 18 — Approximate Identities and Smooth Approximation

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-18-approximate-identities-and-smooth-approximation.md`
- 상태: 초안 완료 · 152자

```yaml
description: "Seminar outline for Folland §8.2: approximate identities, continuity of translation in Lp, smooth compactly supported approximation, and Schwartz space."
```

### 015. Folland Week 19 — Fourier Transform on L1 and Schwartz Space

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-19-fourier-transform-on-l1-and-schwartz-space.md`
- 상태: 초안 완료 · 145자

```yaml
description: "Seminar outline for Folland §8.3: the Fourier transform on L1 and Schwartz space, the Riemann–Lebesgue lemma, basic identities, and the Gaussian."
```

### 016. Folland Week 20 — Fourier Inversion and Plancherel

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-20-fourier-inversion-and-plancherel.md`
- 상태: 초안 완료 · 151자

```yaml
description: "Seminar outline for Folland §8.3: Fourier inversion via Gaussian regularization, the Plancherel theorem by density, and the Hausdorff–Young inequality."
```

### 017. Folland Week 21 — Periodization and Summation of Fourier Integrals

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-21-summation-of-fourier-integrals.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §8.3–8.4: periodization and Fourier coefficients on the torus, Poisson summation, and summability kernels for Fourier integrals."
```

### 018. Folland Week 22 — Summation of Fourier Series

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-22-summation-of-fourier-series.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Seminar outline for Folland §8.4: Dirichlet and Fejér kernels, Cesàro summability and Fejér's theorem, and Abel summability with the Poisson kernel."
```

### 019. Folland Week 23 — Pointwise Fourier Convergence — Localization

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-23-pointwise-fourier-convergence-localization.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §8.5: the localization principle for Fourier series, the Dini criterion, and the Dirichlet–Jordan theorem for bounded variation."
```

### 020. Folland Week 24 — Pointwise Fourier Convergence — Limits of the Theory

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-24-pointwise-fourier-convergence-limits.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §8.5: partial-sum operator norms and the uniform boundedness proof that some continuous functions have divergent Fourier series."
```

### 021. Folland Week 25 — Fourier Analysis of Measures

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-25-fourier-analysis-of-measures.md`
- 상태: 초안 완료 · 157자

```yaml
description: "Seminar outline for Folland §8.6: the Fourier–Stieltjes transform, convolution of finite measures, the uniqueness theorem, and vague convergence of measures."
```

### 022. Folland Week 26 — Fourier Methods for PDE — Poisson and Heat Kernels

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-26-fourier-pde-poisson-and-heat-kernels.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Seminar outline for Folland §8.7: Fourier methods for constant-coefficient PDE, with the Poisson kernel for the Dirichlet problem and the heat kernel."
```

### 023. Folland Week 27 — Fourier Methods for PDE — Wave Equation

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-27-fourier-pde-wave-equation.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Seminar outline for Folland §8.7: the Fourier solution of the wave equation, dimension-dependent wave kernels, and the limitations that motivate distributions."
```

### 024. Folland Week 28 — Distributions — Test Functions and Derivatives

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-28-distributions-test-functions-and-derivatives.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Seminar outline for Folland §9.1: the test-function topology, distributions as continuous functionals, distributional derivatives, and smooth multipliers."
```

### 025. Folland Week 29 — Distributions — Localization and Regularization

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-29-distributions-localization-and-regularization.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Seminar outline for Folland §9.1: the support of a distribution, localization by partitions of unity, regularization by convolution, and fundamental solutions."
```

### 026. Folland Week 30 — Compactly Supported Distributions

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-30-compactly-supported-distributions.md`
- 상태: 초안 완료 · 158자

```yaml
description: "Seminar outline for Folland §9.2: compactly supported distributions, their finite order and structure theorem, extension to smooth functions, and convolution."
```

### 027. Folland Week 31 — Tempered Distributions and Fourier Transform

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-31-tempered-distributions-and-fourier-transform.md`
- 상태: 초안 완료 · 152자

```yaml
description: "Seminar outline for Folland §9.2: tempered distributions, slow growth, the Fourier transform and inversion for distributions, and fundamental solutions."
```

### 028. Folland Week 32 — Periodic Distributions and Fourier Coefficients

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-32-periodic-distributions-and-fourier-coefficients.md`
- 상태: 초안 완료 · 158자

```yaml
description: "Seminar outline for Folland §9.2: periodic distributions, periodization, growth of Fourier coefficients, distributional Fourier series, and Poisson summation."
```

### 029. Folland Week 33 — Sobolev Spaces — Fourier and Hilbert Structure

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-33-sobolev-spaces-fourier-and-hilbert-structure.md`
- 상태: 초안 완료 · 157자

```yaml
description: "Seminar outline for Folland §9.3: Sobolev spaces via distributional derivatives and Fourier multipliers, their Hilbert structure, and negative-order duality."
```

### 030. Folland Week 34 — Sobolev Embedding and Localization

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-34-sobolev-embedding-and-localization.md`
- 상태: 초안 완료 · 141자

```yaml
description: "Seminar outline for Folland §9.3: the Sobolev embedding theorem, regularity from Fourier decay, smooth multipliers, and local Sobolev spaces."
```

### 031. Folland Week 35 — Elliptic Regularity in Sobolev Spaces

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-35-elliptic-regularity-in-sobolev-spaces.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Seminar outline for Folland §9.3: Sobolev estimates and local regularity for elliptic constant-coefficient operators, hypoellipticity, and numerical PDE links."
```

### 032. Folland Week 36 — Probability — Measure and Independence

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-36-probability-measure-and-independence.md`
- 상태: 초안 완료 · 151자

```yaml
description: "Seminar outline for Folland §10.1: probability spaces, random variables, expectation, independence, the Borel–Cantelli lemma, and modes of convergence."
```

### 033. Folland Week 37 — Laws of Large Numbers — Weak Law and Maximal Estimate

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-37-large-numbers-weak-law-and-maximal-estimate.md`
- 상태: 초안 완료 · 145자

```yaml
description: "Seminar outline for Folland §10.2: the weak law of large numbers under variance assumptions and Kolmogorov's maximal inequality for partial sums."
```

### 034. Folland Week 38 — Strong Law of Large Numbers

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-38-strong-law-of-large-numbers.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Seminar outline for Folland §10.2: the strong law of large numbers, its moment hypotheses, and truncation, subsequence, and Borel–Cantelli arguments."
```

### 035. Folland Week 39 — Central Limit Theorem

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-39-central-limit-theorem.md`
- 상태: 초안 완료 · 144자

```yaml
description: "Seminar outline for Folland §10.3: characteristic functions, normalized sums, and the central limit theorem via a Fourier convergence criterion."
```

### 036. Folland Week 40 — Construction of Sample Spaces

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-40-construction-of-sample-spaces.md`
- 상태: 초안 완료 · 140자

```yaml
description: "Seminar outline for Folland §10.4: consistent finite-dimensional distributions, the Kolmogorov extension theorem, and the canonical process."
```

### 037. Folland Week 41 — Wiener Process — Gaussian Construction

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-41-wiener-process-gaussian-construction.md`
- 상태: 초안 완료 · 138자

```yaml
description: "Seminar outline for Folland §10.5: building the Wiener process from Gaussian finite-dimensional distributions with independent increments."
```

### 038. Folland Week 42 — Wiener Process — Continuous Paths

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-42-wiener-process-continuous-paths.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Seminar outline for Folland §10.5: a continuous modification of the Wiener process via Kolmogorov's continuity argument, and Wiener measure on path space."
```

### 039. Folland Week 43 — Haar Measure — Existence

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-43-haar-measure-existence.md`
- 상태: 초안 완료 · 153자

```yaml
description: "Seminar outline for Folland §11.1: locally compact groups, translations, and the existence of Haar measure constructed from a positive linear functional."
```

### 040. Folland Week 44 — Haar Measure — Uniqueness and Modular Function

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-44-haar-measure-uniqueness-and-modular-function.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Seminar outline for Folland §11.1: uniqueness of Haar measure, left versus right Haar measure, the modular function, and integration on groups."
```

### 041. Folland Week 45 — Hausdorff Measure and Dimension

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-45-hausdorff-measure.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Seminar outline for Folland §11.2: Hausdorff outer measures, Borel measurability, Hausdorff dimension, Lipschitz bounds, and bi-Lipschitz invariance."
```

### 042. Folland Week 46 — Hausdorff Measure on Submanifolds

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-46-hausdorff-measure-on-submanifolds.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Seminar outline for Folland §11.2: Hausdorff versus Lebesgue measure, and surface measure on smooth submanifolds via parametrizations and Gram determinants."
```

### 043. Folland Week 47 — Self-Similarity and Dimension

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-47-self-similarity-and-dimension.md`
- 상태: 초안 완료 · 151자

```yaml
description: "Seminar outline for Folland §11.3: iterated similarity systems, invariant compact sets, the open set condition, and the dimension of self-similar sets."
```

### 044. Folland Week 48 — Integration on Manifolds

- 파일: `_posts/folland-seminar/2026-09-11-folland-week-48-integration-on-manifolds.md`
- 상태: 초안 완료 · 153자

```yaml
description: "Seminar outline for Folland §11.4: smooth densities, Riemannian volume, Haar measure on Lie groups, differential forms and orientation, and intrinsic Lp."
```

## Linear Algebra Review (20)

20개 모두 본문에 소제목과 선수·연결 링크만 있습니다(설명 문단, 참고 문헌, 체크리스트 없음). 소제목에 적힌 범위만 요약했고 결과나 증명이 있다고 쓰지 않았습니다.

### 045. Linear Algebra 00 — Scalars, Vectors, Matrices and Maps

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-00-scalars-vectors-matrices-and-maps.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Linear algebra review outline: scalar, vector, and matrix types, real and complex scalars, matrices as linear maps, composition, and conjugate transposes."
```

### 046. Linear Algebra 01 — Vector Spaces and Subspaces

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-01-vector-spaces-and-subspaces.md`
- 상태: 초안 완료 · 147자

```yaml
description: "Linear algebra review outline: vector spaces and subspaces, span, linear independence, bases and dimension, coordinates, and the dimension theorem."
```

### 047. Linear Algebra 02 — Linear Maps

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-02-linear-maps.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Linear algebra review outline: linear maps, kernel and image, matrix representations, change of basis, and dual spaces with dual bases and transposes."
```

### 048. Linear Algebra 03 — Rank and Fundamental Subspaces

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-03-rank-and-fundamental-subspaces.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Linear algebra review outline: rank, the four fundamental subspaces, rank–nullity, equality of row and column rank, and solvability of linear systems."
```

### 049. Linear Algebra 04 — Quotient and Isomorphism Viewpoint

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-04-quotient-and-isomorphism-viewpoint.md`
- 상태: 초안 완료 · 151자

```yaml
description: "Linear algebra review outline: equivalence relations, quotient spaces, and the first isomorphism theorem, with a link to almost-everywhere equivalence."
```

### 050. Linear Algebra 05 — Inner Product Geometry

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-05-inner-product-geometry.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Linear algebra review outline: inner products, orthogonality, Cauchy–Schwarz, classical and modified Gram–Schmidt, adjoints, and Riesz representation."
```

### 051. Linear Algebra 06 — Orthogonal Decomposition

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-06-orthogonal-decomposition.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Linear algebra review outline: orthogonal complements and projections, orthogonality of fundamental subspaces, and least squares via normal equations."
```

### 052. Linear Algebra 07 — Eigenvalues and Eigenvectors

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-07-eigenvalues-and-eigenvectors.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Linear algebra review outline: eigenvalues and eigenvectors, the characteristic polynomial, algebraic and geometric multiplicity, and spectral radius."
```

### 053. Linear Algebra 08 — Diagonalization

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-08-diagonalization.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Linear algebra review outline: diagonalization, similarity as a change of basis, conditions for an eigenbasis, and the case of distinct eigenvalues."
```

### 054. Linear Algebra 09 — Special Matrix Classes

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-09-special-matrix-classes.md`
- 상태: 초안 완료 · 136자

```yaml
description: "Linear algebra review outline: symmetric, Hermitian, unitary, normal, and positive definite matrices, quadratic forms, and nonnormality."
```

### 055. Linear Algebra 10 — Spectral Theorem

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-10-spectral-theorem.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Linear algebra review outline: the spectral theorem for symmetric, Hermitian, and normal matrices, SPD consequences, and the Rayleigh quotient."
```

### 056. Linear Algebra 11 — Singular Value Decomposition

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-11-svd.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Linear algebra review outline: the singular value decomposition, its geometry and existence, the pseudoinverse, operator norms, and low-rank approximation."
```

### 057. Linear Algebra 12 — Matrix and Operator Norms

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-12-matrix-and-operator-norms.md`
- 상태: 초안 완료 · 142자

```yaml
description: "Linear algebra review outline: vector norms, induced 1-, 2-, and infinity norms, the Frobenius norm, submultiplicativity, and spectral radius."
```

### 058. Linear Algebra 13 — Conditioning

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-13-conditioning.md`
- 상태: 초안 완료 · 140자

```yaml
description: "Linear algebra review outline: condition numbers, their singular-value meaning, perturbed linear systems, and conditioning versus stability."
```

### 059. Linear Algebra 14 — Matrix Factorizations

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-14-matrix-factorizations.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Linear algebra review outline: LU with pivoting, Cholesky for SPD matrices, and QR by Householder and Givens, with backward error, cost, and fill-in."
```

### 060. Linear Algebra 15 — Schur Decomposition

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-15-schur-decomposition.md`
- 상태: 초안 완료 · 144자

```yaml
description: "Linear algebra review outline: the Schur decomposition, unitary similarity, the real Schur form, and Schur versus Jordan form in numerical work."
```

### 061. Linear Algebra 16 — Jordan and Canonical Structure

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-16-jordan-and-canonical-structure.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Linear algebra review outline: minimal polynomials, generalized eigenvectors, Jordan chains and blocks, and the numerical instability of Jordan form."
```

### 062. Linear Algebra 17 — Polynomial Viewpoint

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-17-polynomial-viewpoint.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Linear algebra review outline: Cayley–Hamilton, polynomials on invariant subspaces, Chebyshev approximation, and spectral versus nonnormal behavior."
```

### 063. Linear Algebra 18 — Krylov Bridge

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-18-krylov-bridge.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Linear algebra review outline bridging to Krylov methods: polynomials applied to a vector, invariant subspaces, and projections that lead to Krylov spaces."
```

### 064. Linear Algebra 19 — Bridge to Numerical PDE

- 파일: `_posts/linear-algebra-review/2026-09-11-linear-algebra-19-bridge-to-numerical-pde.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Linear algebra review outline bridging to numerical PDE: SPD matrices from elliptic problems, FEM stiffness and mass matrices, and mesh-dependent conditioning."
```

## Saad Study (15)

본문의 "Source scope"(Saad 2판 장·절)를 접두어로 썼습니다. 00은 개요가 아니라 준비 점검표라서 "Readiness checklist"로 표현했습니다.

### 065. Saad 00 — Prerequisites

- 파일: `_posts/saad/2026-09-11-saad-00-prerequisites.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Readiness checklist for the Saad iterative-methods study, linking review notes on norms, eigenvalues, SPD matrices, projections, and conditioning."
```

### 066. Saad 01 — Sparse Linear Systems

- 파일: `_posts/saad/2026-09-11-saad-01-sparse-linear-systems.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Saad Ch. 3 study outline: sparse matrices, sparsity patterns, COO, CSR, and CSC storage, graph representations, reorderings, and matrix-vector cost."
```

### 067. Saad 02 — Stationary Iterative Methods

- 파일: `_posts/saad/2026-09-11-saad-02-stationary-iterative-methods.md`
- 상태: 초안 완료 · 136자

```yaml
description: "Saad Ch. 4 study outline: matrix splittings, Jacobi, Gauss–Seidel, SOR, and block iterations, with spectral-radius convergence criteria."
```

### 068. Saad 03 — Projection Methods

- 파일: `_posts/saad/2026-09-11-saad-03-projection-methods.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Saad Ch. 5 study outline: projection methods with search and test spaces, Galerkin and Petrov–Galerkin conditions, steepest descent, and minimum residual."
```

### 069. Saad 04 — Krylov Subspaces

- 파일: `_posts/saad/2026-09-11-saad-04-krylov-subspaces.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Saad §6.2 study outline: Krylov subspaces, their polynomial interpretation, the relative minimal polynomial, invariance, and residual polynomials."
```

### 070. Saad 05 — Arnoldi

- 파일: `_posts/saad/2026-09-11-saad-05-arnoldi.md`
- 상태: 초안 완료 · 141자

```yaml
description: "Saad §6.3–6.4 study outline: the Arnoldi process, Hessenberg matrices, breakdown, the full orthogonalization method, and reorthogonalization."
```

### 071. Saad 06 — GMRES

- 파일: `_posts/saad/2026-09-11-saad-06-gmres.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Saad §6.5 study outline: GMRES as Arnoldi plus least squares, Givens rotations, restarting, stagnation, and the polynomial view of convergence."
```

### 072. Saad 07 — Lanczos

- 파일: `_posts/saad/2026-09-11-saad-07-lanczos.md`
- 상태: 초안 완료 · 151자

```yaml
description: "Saad §6.6 study outline: the symmetric Lanczos process, its three-term recurrence and tridiagonalization, breakdown, and selective reorthogonalization."
```

### 073. Saad 08 — Conjugate Gradient

- 파일: `_posts/saad/2026-09-11-saad-08-conjugate-gradient.md`
- 상태: 초안 완료 · 142자

```yaml
description: "Saad §6.7 study outline: conjugate gradients, A-conjugate directions, Krylov minimization, condition-number bounds, and eigenvalue clustering."
```

### 074. Saad 09 — Preconditioning

- 파일: `_posts/saad/2026-09-11-saad-09-preconditioning.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Saad Ch. 9 study outline: left, right, and split preconditioning, what makes a good preconditioner, preconditioned CG and GMRES, and flexible GMRES."
```

### 075. Saad 10 — Basic Preconditioners

- 파일: `_posts/saad/2026-09-11-saad-10-basic-preconditioners.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Saad Ch. 10 study outline: Jacobi, Gauss–Seidel, SSOR, ILU(0), and incomplete Cholesky preconditioners, with fill-in, ordering, and setup cost."
```

### 076. Saad 11 — Nonsymmetric Krylov Methods

- 파일: `_posts/saad/2026-09-11-saad-11-nonsymmetric-krylov-methods.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Saad Ch. 7 study outline: two-sided Lanczos and biorthogonality, BiCG, CGS, BiCGSTAB, and QMR, compared with GMRES and normal-equation methods."
```

### 077. Saad 12 — Convergence and Spectral Interpretation

- 파일: `_posts/saad/2026-09-11-saad-12-convergence-and-spectral-interpretation.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Saad study outline on Krylov convergence: polynomial residual bounds, nonnormality and the field of values, and why eigenvalues alone may be insufficient."
```

### 078. Saad 13 — Parallel / PDE Connection

- 파일: `_posts/saad/2026-09-11-saad-13-parallel-and-pde-connection.md`
- 상태: 초안 완료 · 145자

```yaml
description: "Saad study outline linking Krylov solvers to PDE discretization and parallel computing: distributed SpMV, halo exchange, reductions, and scaling."
```

### 079. Saad 14 — Domain Decomposition Bridge

- 파일: `_posts/saad/2026-09-11-saad-14-domain-decomposition-bridge.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Saad Ch. 14 study outline: additive and restricted additive Schwarz, coarse correction, two-level methods, Schur complements, and links to multigrid."
```

## Trefethen NLA in C++ (40)

본문에 "planned work, not an existing or validated API", "Do not invent measurements"라고 적혀 있어, C++ 구현과 실험은 모두 "planned"로만 표현했습니다. 개인 확장·선택 과제는 본문대로 "personal extension", "optional"로 적었습니다.

### 080. Trefethen 01 — Matrix-Vector Multiplication

- 파일: `_posts/trefethen/2026-09-15-trefethen-01-matrix-vector-multiplication.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Trefethen–Bau Lecture 1 outline: matrix-vector products as combinations of columns, dimensions and operation counts, and a planned C++ check against Eigen."
```

### 081. Trefethen 02 — Orthogonal Vectors and Matrices

- 파일: `_posts/trefethen/2026-09-15-trefethen-02-orthogonal-vectors-and-matrices.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 2 outline: complex inner products, the conjugate transpose, and unitary matrices, with a planned C++ test of norm preservation."
```

### 082. Trefethen 03 — Norms

- 파일: `_posts/trefethen/2026-09-15-trefethen-03-norms.md`
- 상태: 초안 완료 · 140자

```yaml
description: "Trefethen–Bau Lecture 3 outline: vector p-norms, induced matrix norms, the Frobenius norm, and submultiplicativity, with planned C++ checks."
```

### 083. Trefethen 04 — The Singular Value Decomposition

- 파일: `_posts/trefethen/2026-09-15-trefethen-04-the-singular-value-decomposition.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Trefethen–Bau Lecture 4 outline: full and reduced SVDs, their geometry and link to the fundamental subspaces, and a planned check against Eigen's SVD."
```

### 084. Trefethen 05 — More on the SVD

- 파일: `_posts/trefethen/2026-09-15-trefethen-05-more-on-the-svd.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Trefethen–Bau Lecture 5 outline: best rank-k approximation, numerical rank, and the pseudoinverse, with a planned truncated-SVD experiment in C++."
```

### 085. Trefethen 06 — Projectors

- 파일: `_posts/trefethen/2026-09-15-trefethen-06-projectors.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Trefethen–Bau Lecture 6 outline: orthogonal versus oblique projectors, their defining conditions, projectors from orthonormal bases, and planned C++ checks."
```

### 086. Trefethen 07 — QR Factorization

- 파일: `_posts/trefethen/2026-09-15-trefethen-07-qr-factorization.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Trefethen–Bau Lecture 7 outline: the structure, existence, and uniqueness of reduced and full QR factorizations, with planned C++ verification."
```

### 087. Trefethen 08 — Gram-Schmidt Orthogonalization

- 파일: `_posts/trefethen/2026-09-15-trefethen-08-gram-schmidt-orthogonalization.md`
- 상태: 초안 완료 · 147자

```yaml
description: "Trefethen–Bau Lecture 8 outline: classical versus modified Gram–Schmidt, loss of orthogonality, and reorthogonalization, with planned C++ versions."
```

### 088. Trefethen 09 — MATLAB

- 파일: `_posts/trefethen/2026-09-15-trefethen-09-matlab.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Trefethen–Bau Lecture 9 outline: translating the book's MATLAB notation into C++ and Eigen, including indexing, blocks, adjoints, and storage order."
```

### 089. Trefethen 10 — Householder Triangularization

- 파일: `_posts/trefethen/2026-09-15-trefethen-10-householder-triangularization.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Trefethen–Bau Lecture 10 outline: Householder reflectors for QR, sign choices that avoid cancellation, and implicit Q, with a planned C++ version."
```

### 090. Trefethen 11 — Least Squares Problems

- 파일: `_posts/trefethen/2026-09-15-trefethen-11-least-squares-problems.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Trefethen–Bau Lecture 11 outline: full-rank least squares by Householder QR, the orthogonal residual, and normal equations, with a planned C++ solver."
```

### 091. Trefethen 12 — Conditioning and Condition Numbers

- 파일: `_posts/trefethen/2026-09-15-trefethen-12-conditioning-and-condition-numbers.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Trefethen–Bau Lecture 12 outline: absolute and relative condition numbers as properties of a problem, singular values, and planned perturbation tests."
```

### 092. Trefethen 13 — Floating Point Arithmetic

- 파일: `_posts/trefethen/2026-09-15-trefethen-13-floating-point-arithmetic.md`
- 상태: 초안 완료 · 138자

```yaml
description: "Trefethen–Bau Lecture 13 outline: IEEE 754 rounding, unit roundoff versus machine epsilon, and cancellation, with planned C++ experiments."
```

### 093. Trefethen 14 — Stability

- 파일: `_posts/trefethen/2026-09-15-trefethen-14-stability.md`
- 상태: 초안 완료 · 153자

```yaml
description: "Trefethen–Bau Lecture 14 outline: forward error, backward error, and stability, their relation to conditioning, and a planned C++ backward-error measure."
```

### 094. Trefethen 15 — More on Stability

- 파일: `_posts/trefethen/2026-09-15-trefethen-15-more-on-stability.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 15 outline: whether stable steps compose into a stable algorithm and the scope of backward stability, with planned experiments."
```

### 095. Trefethen 16 — Stability of Householder Triangularization

- 파일: `_posts/trefethen/2026-09-15-trefethen-16-stability-of-householder-triangularization.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 16 outline: backward stability of Householder QR, errors in computed Q and R versus their product, and planned C++ diagnostics."
```

### 096. Trefethen 17 — Stability of Back Substitution

- 파일: `_posts/trefethen/2026-09-15-trefethen-17-stability-of-back-substitution.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Trefethen–Bau Lecture 17 outline: back substitution and its backward-error analysis, with a planned C++ solver that handles small or zero diagonals."
```

### 097. Trefethen 18 — Conditioning of Least Squares Problems

- 파일: `_posts/trefethen/2026-09-15-trefethen-18-conditioning-of-least-squares-problems.md`
- 상태: 초안 완료 · 142자

```yaml
description: "Trefethen–Bau Lecture 18 outline: conditioning of least squares via singular values and the residual angle, with A and b perturbed separately."
```

### 098. Trefethen 19 — Stability of Least Squares Algorithms

- 파일: `_posts/trefethen/2026-09-15-trefethen-19-stability-of-least-squares-algorithms.md`
- 상태: 초안 완료 · 159자

```yaml
description: "Trefethen–Bau Lecture 19 outline: stability and cost of normal equations, Gram–Schmidt, Householder QR, and SVD for least squares, in a planned C++ comparison."
```

### 099. Trefethen 20 — Gaussian Elimination

- 파일: `_posts/trefethen/2026-09-15-trefethen-20-gaussian-elimination.md`
- 상태: 초안 완료 · 140자

```yaml
description: "Trefethen–Bau Lecture 20 outline: Gaussian elimination as rank-one updates, LU and the Schur complement, and a planned C++ LU factorization."
```

### 100. Trefethen 21 — Pivoting

- 파일: `_posts/trefethen/2026-09-15-trefethen-21-pivoting.md`
- 상태: 초안 완료 · 144자

```yaml
description: "Trefethen–Bau Lecture 21 outline: partial pivoting and permutation bookkeeping in LU, with a planned C++ version tested on small-pivot examples."
```

### 101. Trefethen 22 — Stability of Gaussian Elimination

- 파일: `_posts/trefethen/2026-09-15-trefethen-22-stability-of-gaussian-elimination.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Trefethen–Bau Lecture 22 outline: element growth and the stability of Gaussian elimination, growth factor versus condition number, and planned experiments."
```

### 102. Trefethen 23 — Cholesky Factorization

- 파일: `_posts/trefethen/2026-09-15-trefethen-23-cholesky-factorization.md`
- 상태: 초안 완료 · 148자

```yaml
description: "Trefethen–Bau Lecture 23 outline: Cholesky factorization of Hermitian positive definite matrices, positive pivots, and planned C++ failure handling."
```

### 103. Trefethen 24 — Eigenvalue Problems

- 파일: `_posts/trefethen/2026-09-15-trefethen-24-eigenvalue-problems.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 24 outline: conditioning of eigenvalue problems for normal, nonnormal, and defective matrices, with planned perturbation tests."
```

### 104. Trefethen 25 — Overview of Eigenvalue Algorithms

- 파일: `_posts/trefethen/2026-09-15-trefethen-25-overview-of-eigenvalue-algorithms.md`
- 상태: 초안 완료 · 142자

```yaml
description: "Trefethen–Bau Lecture 25 outline: why eigenvalue algorithms combine reduction and iteration, plus a personal C++ extension on power iteration."
```

### 105. Trefethen 26 — Reduction to Hessenberg or Tridiagonal Form

- 파일: `_posts/trefethen/2026-09-15-trefethen-26-reduction-to-hessenberg-or-tridiagonal-form.md`
- 상태: 초안 완료 · 145자

```yaml
description: "Trefethen–Bau Lecture 26 outline: two-sided Householder reduction to Hessenberg or Hermitian tridiagonal form, with a planned C++ implementation."
```

### 106. Trefethen 27 — Rayleigh Quotient, Inverse Iteration

- 파일: `_posts/trefethen/2026-09-15-trefethen-27-rayleigh-quotient-inverse-iteration.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 27 outline: the Rayleigh quotient, inverse iteration, Rayleigh quotient iteration, and shift choice, with planned C++ versions."
```

### 107. Trefethen 28 — QR Algorithm without Shifts

- 파일: `_posts/trefethen/2026-09-15-trefethen-28-qr-algorithm-without-shifts.md`
- 상태: 초안 완료 · 147자

```yaml
description: "Trefethen–Bau Lecture 28 outline: the unshifted QR algorithm, its link to simultaneous iteration, and slow convergence, with a planned C++ version."
```

### 108. Trefethen 29 — QR Algorithm with Shifts

- 파일: `_posts/trefethen/2026-09-15-trefethen-29-qr-algorithm-with-shifts.md`
- 상태: 초안 완료 · 157자

```yaml
description: "Trefethen–Bau Lecture 29 outline: shifts and scale-aware deflation in the QR algorithm, starting from Hermitian tridiagonal matrices, with planned C++ tests."
```

### 109. Trefethen 30 — Other Eigenvalue Algorithms

- 파일: `_posts/trefethen/2026-09-15-trefethen-30-other-eigenvalue-algorithms.md`
- 상태: 초안 완료 · 158자

```yaml
description: "Trefethen–Bau Lecture 30 outline: assumptions and costs of alternative eigenvalue methods such as bisection and divide-and-conquer, with an optional C++ test."
```

### 110. Trefethen 31 — Computing the SVD

- 파일: `_posts/trefethen/2026-09-15-trefethen-31-computing-the-svd.md`
- 상태: 초안 완료 · 156자

```yaml
description: "Trefethen–Bau Lecture 31 outline: SVD by Householder bidiagonalization and a bidiagonal stage, and why forming the Gram matrix squares the condition number."
```

### 111. Trefethen 32 — Overview of Iterative Methods

- 파일: `_posts/trefethen/2026-09-15-trefethen-32-overview-of-iterative-methods.md`
- 상태: 초안 완료 · 142자

```yaml
description: "Trefethen–Bau Lecture 32 outline: direct versus iterative methods and their costs, with a planned matrix-free C++ operator for large problems."
```

### 112. Trefethen 33 — The Arnoldi Iteration

- 파일: `_posts/trefethen/2026-09-15-trefethen-33-the-arnoldi-iteration.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Trefethen–Bau Lecture 33 outline: Arnoldi iteration for an orthonormal Krylov basis and Hessenberg projection, breakdown, and reorthogonalization."
```

### 113. Trefethen 34 — How Arnoldi Locates Eigenvalues

- 파일: `_posts/trefethen/2026-09-15-trefethen-34-how-arnoldi-locates-eigenvalues.md`
- 상태: 초안 완료 · 149자

```yaml
description: "Trefethen–Bau Lecture 34 outline: how Arnoldi finds eigenvalues through Ritz values and Krylov polynomials, and why Ritz residuals judge convergence."
```

### 114. Trefethen 35 — GMRES

- 파일: `_posts/trefethen/2026-09-15-trefethen-35-gmres.md`
- 상태: 초안 완료 · 138자

```yaml
description: "Trefethen–Bau Lecture 35 outline: GMRES as residual minimization through a small Hessenberg least-squares problem, breakdown, and restart."
```

### 115. Trefethen 36 — The Lanczos Iteration

- 파일: `_posts/trefethen/2026-09-15-trefethen-36-the-lanczos-iteration.md`
- 상태: 초안 완료 · 155자

```yaml
description: "Trefethen–Bau Lecture 36 outline: the three-term Lanczos recurrence for Hermitian matrices, loss of orthogonality, and ghost Ritz values in floating point."
```

### 116. Trefethen 37 — From Lanczos to Gauss Quadrature

- 파일: `_posts/trefethen/2026-09-15-trefethen-37-from-lanczos-to-gauss-quadrature.md`
- 상태: 초안 완료 · 146자

```yaml
description: "Trefethen–Bau Lecture 37 outline: how the Lanczos tridiagonal matrix yields Gauss quadrature nodes and weights, and its link to spectral measures."
```

### 117. Trefethen 38 — Conjugate Gradients

- 파일: `_posts/trefethen/2026-09-15-trefethen-38-conjugate-gradients.md`
- 상태: 초안 완료 · 150자

```yaml
description: "Trefethen–Bau Lecture 38 outline: conjugate gradients for Hermitian positive definite systems as A-norm error minimization, with a planned C++ solver."
```

### 118. Trefethen 39 — Biorthogonalization Methods

- 파일: `_posts/trefethen/2026-09-15-trefethen-39-biorthogonalization-methods.md`
- 상태: 초안 완료 · 143자

```yaml
description: "Trefethen–Bau Lecture 39 outline: biorthogonal Krylov bases and bi-Lanczos recurrences for nonsymmetric problems, breakdown, and optional BiCG."
```

### 119. Trefethen 40 — Preconditioning

- 파일: `_posts/trefethen/2026-09-15-trefethen-40-preconditioning.md`
- 상태: 초안 완료 · 154자

```yaml
description: "Trefethen–Bau Lecture 40 outline: preconditioners applied as solves, left and right preconditioning, and a planned C++ preconditioned CG test with Jacobi."
```
