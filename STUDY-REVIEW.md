---
layout: page
title: "Study Review and Remaining Corrections"
permalink: /study/review/
math: true
toc: true
---

Review date: 2026-09-11. All 14 existing posts, archived fragments, and project/navigation documents were reviewed. Core proofs, assumptions, intermediate steps, and representative counterexamples were preserved, while repetitive explanations, duplicate roadmaps, and routine calculation examples were reduced. Mathematical claims needing revision were marked in place with `[Correction required]` or `[Suggested addition]`.

- Section/element classifications: A 350 · B 42 · C 23. [Complete decision table]({% link study-review/section-decisions.md %})
- Remaining corrections/additions: 61 — High 31, Medium 25, Low 5, including one archived fragment.
- New outlines: Folland Weeks 05–48 (44), Linear Algebra (20), and Saad (15). Definitions, proofs, derivations, and examples were left unwritten.
- [Complete study roadmap]({% link STUDY-ROADMAP.md %})

## Edits by post

| Post | A / B / C | Main action |
| --- | --- | --- |
| [2026-07-23-folland-measurable-structures]({% link _posts/measure-theory/2026-07-23-folland-measurable-structures.md %}) | 27 / 0 / 2 | Core structure preserved; correction/addition annotations: 0 items. |
| [2026-07-24-folland-measures-and-set-convergence]({% link _posts/measure-theory/2026-07-24-folland-measures-and-set-convergence.md %}) | 40 / 0 / 2 | Core structure preserved; correction/addition annotations: 0 items. |
| [2026-07-25-folland-caratheodory-extension]({% link _posts/measure-theory/2026-07-25-folland-caratheodory-extension.md %}) | 50 / 0 / 3 | Core structure preserved; correction/addition annotations: 1 item. |
| [2026-07-26-folland-constructing-lebesgue-measure]({% link _posts/measure-theory/2026-07-26-folland-constructing-lebesgue-measure.md %}) | 48 / 0 / 2 | Core structure preserved; correction/addition annotations: 0 items. |
| [2026-07-27-folland-product-measurable-spaces]({% link _posts/measure-theory/2026-07-27-folland-product-measurable-spaces.md %}) | 39 / 0 / 2 | Core structure preserved; correction/addition annotations: 0 items. |
| [2026-07-28-folland-cantor-set-and-completion]({% link _posts/measure-theory/2026-07-28-folland-cantor-set-and-completion.md %}) | 36 / 0 / 1 | Core structure preserved; correction/addition annotations: 0 items. |
| [2025-07-18-ieee754-errors-and-algorithms]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) | 8 / 2 / 3 | Core structure preserved; correction/addition annotations: 9 items. |
| [2026-01-10-epsilon-optimal-cost-scaling-mcmf]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) | 9 / 1 / 2 | Core structure preserved; correction/addition annotations: 7 items. |
| [2026-01-23-bertsimas-linear-optimization-ch1-1]({% link _posts/2026-01-23-bertsimas-linear-optimization-ch1-1.md %}) | 5 / 0 / 0 | Core structure preserved; correction/addition annotations: 1 item. |
| [2026-02-04-steepest-descent-spd-convergence]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) | 11 / 7 / 1 | Core structure preserved; correction/addition annotations: 18 items. |
| [2026-02-09-conjugate-gradient]({% link _posts/2026-02-09-conjugate-gradient.md %}) | 5 / 2 / 1 | Core structure preserved; correction/addition annotations: 7 items. |
| [2026-07-31-measure-theory-seminar-03]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) | 5 / 0 / 1 | Core structure preserved; correction/addition annotations: 4 items. |
| [2026-08-07-fatou-dct]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) | 9 / 7 / 2 | Core structure preserved; correction/addition annotations: 3 items. |
| [2026-08-14-Lp-space-and-inequalities-04]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) | 58 / 23 / 1 | Core structure preserved; correction/addition annotations: 10 items. |

## Study structure decisions

- The existing Folland notes reach Seminar 04. Because no edition was specified, the second edition (1999) was designated as the reference. Checking the author's own edition and printing remains a task in the [Folland index]({% link study/folland/index.md %}).
- Each Folland week was planned as a 2–3-hour presentation with prerequisites already prepared. Workload notes indicate where to split at linked part boundaries if proof preparation exceeds the allocation.
- Prerequisite theorems not confirmed in the existing records were linked to the [prerequisite checklist]({% link study/folland/prerequisite-checklist.md %}). They were neither assumed to have been studied nor rewritten.
- Basic linear algebra definitions for Saad belong in [Linear Algebra Review]({% link study/linear-algebra/index.md %}); [Saad 00]({% link _posts/saad/2026-09-11-saad-00-prerequisites.md %}) links to them as a checklist. The return sequence SVD existence → norms → low-rank approximation was also specified.
- Archived files were preserved byte for byte. Changes to active bodies were recorded with the date, previous preservation hash, and reason.

## Validation

- Source validator: checked 14 posts, 14 body revisions, 13 legacy URLs, 10 archive checksums, and the existing snapshot.
- Production build and HTMLProofer: passed for 200 HTML files and 998 internal links.
- `/preview` rendering smoke checks: code highlighting, math configuration, bibliography, and base-URL assertions passed; 201 HTML files and 1,009 internal links passed validation.
- Confirmed preservation of existing front matter and 12 code blocks. Incorporated 29 numerical-review preservation/diagnostic checks and two independent reviews.
- Checked new outlines for prerequisite cycles, missing topics, and inadvertently supplied definitions/proofs. Corrected the headings, dependencies, and chapter mappings where issues were found.
- Inspected the roadmap, operator-norm heading, and review report in a browser. Moved two SD equation tags outside aligned environments to restore equation rendering.
- A relative-glob compatibility shim was used only for local validation because Ruby absolute globs failed in the Windows sandbox. The shim was not added to the repository or CI.
- Mathematical errors and incomplete proofs remain as revision tasks below. These checks did not execute and certify every existing numerical program.

## Sources used in the review

- [Princeton MAT425 Lecture Notes, Definition 2.73](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT425_spring_2025/MAT425_Lecture_Notes.pdf)
- [V. Sverak, PDE course notes, Lecture 42](https://www-users.cse.umn.edu/~sverak/course-notes.pdf)
- [Saad, Iterative Methods for Sparse Linear Systems (2nd ed.)](https://www-users.cse.umn.edu/~saad/IterMethBook_2ndEd.pdf) — §5.3.1 / Theorem 5.9, §6.7, §6.11.3 / Theorem 6.29: checked the hypotheses for SD energy contraction and CG orthogonality/polynomial bounds.
- [Goldberg, What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html) — reviewed number formats, cancellation, the rounding model, and Kahan summation.
- [Ogita–Rump–Oishi, Accurate Sum and Dot Product](https://www.tuhh.de/ti3/paper/rump/OgRuOi05.pdf) — checked the distinction between TwoSum/error-free transformations and compensated summation.
- [Goldberg–Tarjan, Finding Minimum-Cost Circulations by Successive Approximation](https://www.cs.princeton.edu/research/techreps/634) — verified the authors, title, and direct reference for the cost-scaling paper.
- [Goldberg–Tardos–Tarjan, Network Flow Algorithms](https://www.cs.cornell.edu/~eva/Network.Flow.Algorithms.pdf) — §§3.2–3.4, Theorem 3.2.1: checked integral costs, epsilon-optimal circulations, and the exact-optimality threshold.
- [Wiley publisher catalogue — edition and chapter order](https://www.wiley-vch.de/en?isbn=9780471317166&option=com_eshop&view=product)
- [Gerald B. Folland author errata — printing distinction](https://sites.math.washington.edu/~folland/)
- G. B. Folland, *Real Analysis: Modern Techniques and Their Applications*, 2nd ed., Wiley, 1999, Contents pp. xiii–xiv (chapter order corroborated by the publisher catalogue above)

## Remaining corrections

The author will carry out the revisions and write the proofs listed below. Empty outlines were not counted as errors; only issues in existing claims and additions needed for reconstruction were recorded.

### 01. High — false sufficient condition

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Absorption
- Issue type: false sufficient condition
- Current issue: The text claims that $|x-y|>2^{52}$ alone causes the smaller term to disappear.
- Required revision: Specify the signs and representability of $x,y$, and reformulate the condition using ulps and rounding intervals. Check a counterexample where the current inequality holds but the sum changes.
- Priority: High

### 02. High — formula / code mismatch

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Loss of significance
- Issue type: formula / code mismatch
- Current issue: The two displayed formulas are not equal, and $f_2$ in the code below uses a plus sign in the denominator.
- Required revision: Correct the denominator sign by comparing the text with the code, and verify the admissible domain and the key intermediate rationalization step.
- Priority: High

### 03. High — algorithm identity / incomplete code / error bound

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Kahan Two Sum
- Issue type: algorithm identity / incomplete code / error bound
- Current issue: The heading confuses TwoSum with Kahan compensated summation. The function below has invalid Python type annotations and no return statement. The claim $O(n\epsilon)$ does not identify the error being bounded.
- Required revision: Check the algorithm name and output contract, and correct the annotations and return statement. Compare the error statement with the source, including rounding assumptions, unit roundoff, input magnitudes, and cancellation.
- Priority: High

### 04. High — incorrect compensation update / syntax

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Neumaier
- Issue type: incorrect compensation update / syntax
- Current issue: The magnitude comparison uses total instead of the partial sum $t$, and the correction in the first branch subtracts $x\_ele$. The type annotations are also invalid Python syntax.
- Required revision: Compare the formula with Neumaier's original magnitude condition and correction signs. Test both branches, severe cancellation, and exactly representable small-integer sums, and specify the norm, scale, and assumptions of the error claim.
- Priority: High

### 05. High — bit weights / range / special values / exactness

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 3 Superaccumulator
- Issue type: bit weights / range / special values / exactness
- Current issue: Subnormal bit weights are shifted by one position, and the default bin exponent range truncates the lower binary64 positions. Infinity is returned immediately without checking its sign or a later NaN.
- Required revision: Verify the bit-to-exponent mapping for normal and subnormal numbers and the full exponent range required. Design integer accumulation, carry propagation, final rounding, the ±infinity/NaN policy, and the return contract, then check boundary values.
- Priority: High

### 06. High — incorrect objective / missing constraints

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 1 Problem Definition
- Issue type: incorrect objective / missing constraints
- Current issue: The source, sink, and feasible-flow conditions are missing, and the sum of flows over all edges is used as the maximum-flow objective. $w_{ev}$ is also undefined.
- Required revision: Specify $s,t$, capacity bounds, and flow conservation at internal vertices. Define flow value using net source outflow, then state the order of maximizing that value and minimizing cost, with consistent cost indices.
- Priority: High

### 07. High — inconsistent notation / missing invariant

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 2 Epsilon-Optimality and Cost Scaling
- Issue type: inconsistent notation / missing invariant
- Current issue: $c_e$ denotes both capacity and cost, and the meaning of $\varepsilon ps$ is unclear. The residual graph, reverse-arc costs, potentials, and admissible arcs are undefined.
- Required revision: Separate capacity, cost, potential, and epsilon notation, and define the residual network and reduced-cost convention. Recheck initialization, admissibility, reverse arcs, and the relabel formula under that convention.
- Priority: High

### 08. High — inconsistent reduced-cost sign

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3.2 Relabel
- Issue type: inconsistent reduced-cost sign
- Current issue: This maximum-based update is inconsistent with the reduced-cost convention in §2.2.
- Required revision: Derive relabeling by substituting the chosen reduced-cost formula into the epsilon-optimality inequality. Check that at least one admissible outgoing arc is created and specify what happens when no residual outgoing arc exists.
- Priority: High

### 09. High — missing theorem / termination hypothesis

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3.3 Exact optimality and termination
- Issue type: missing theorem / termination hypothesis
- Current issue: The explanation of why decreasing epsilon gives an exact optimum and the termination threshold are missing.
- Required revision: Check the theorem connecting integer costs, residual-cycle lengths, and the epsilon bound. State the $\varepsilon<1/|V|$ criterion or a termination condition appropriate to cost rescaling, including zero excess at termination.
- Priority: High

### 10. High — nontermination / invalid reduction / cost reconstruction

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 4 Pseudo Code
- Issue type: nontermination / invalid reduction / cost reconstruction
- Current issue: When integer eps is 1, `eps = (eps+1)/2` leaves it at 1, so the loop never terminates. The arbitrary positive cost/capacity of the added arc `(t,s)` and the final `cap == 0 and u<v` aggregation are also unjustified.
- Required revision: Apply a correct epsilon schedule and cost-scaling threshold. Either fix the maximum-flow value first or justify a circulation reduction. Design flow and cost reconstruction using original arc IDs, original capacities, and residual capacities, and check the range of magic constants and possible overflow.
- Priority: High

### 11. High — ambiguous circulation reduction

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 6 Bipartite Matching
- Issue type: ambiguous circulation reduction
- Current issue: `cost = lower than min-cost` is undefined, so the matching objective represented by the added arc is unclear.
- Required revision: State the desired cardinality priority and validate the model using the same capacity/cost conditions as the reduction chosen in §4.
- Priority: High

### 12. High — missing quantifier restriction

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Positive definite
- Issue type: missing quantifier restriction
- Current issue: The quantifier in the definition of positive definiteness omits $x\ne0$.
- Required revision: Specify the domain of real square matrices and revise the definition to quantify over nonzero vectors.
- Priority: High

### 13. High — wrong field hypothesis / reversed similarity

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Spectral Theorem / basis change
- Issue type: wrong field hypothesis / reversed similarity
- Current issue: The real/complex field assumptions are missing, and the diagonalization formula has the wrong orientation for a matrix $Q$ whose columns are eigenvectors. Transpose is also used in the complex case.
- Required revision: Distinguish this note's real SPD case from the complex normal case, and verify the direction of the basis change from $AQ=Q\Lambda$. Specify conjugate transpose and unitarity in the complex case.
- Priority: High

### 14. High — false equality / unspecified norm

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.a Operator norm bound
- Issue type: false equality / unspecified norm
- Current issue: The norm of a matrix-vector product is written as equal to the product of the operator norm and vector norm.
- Required revision: Specify the vector 2-norm and induced matrix 2-norm, and replace the first equality with the operator-norm inequality. Check the prerequisite result relating a symmetric matrix's norm to its eigenvalues.
- Priority: High

### 15. High — false sufficient condition

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.a Constant step-size condition
- Issue type: false sufficient condition
- Current issue: $0<\alpha<1/\lambda_{\min}$ does not guarantee (1).
- Required revision: Make the convergence hypotheses consistent with (1), derived immediately above. Distinguish a guarantee for every initial error from exceptions restricted to particular eigenspaces.
- Priority: High

### 16. High — wrong dummy variable / missing derivation / zero denominator

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Exact line search
- Issue type: wrong dummy variable / missing derivation / zero denominator
- Current issue: The right-hand side of $\phi(\tau)$ contains no $\tau$, and the minimizer claim lacks both a derivation and the assumption $r_k\ne0$.
- Required revision: Distinguish the line-search parameter from its optimizer and verify the one-variable derivative and positive second derivative. Separate termination at zero residual and specify the vector argument of the Rayleigh quotient.
- Priority: High

### 17. High — missing squares / missing nonzero case

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Energy-error ratio / moments
- Issue type: missing squares / missing nonzero case
- Current issue: Unlike (2), the final ratio omits the square on the norm. Neither $p_i$ nor the error ratio is defined at $e_k=0$. The original mixture of $y$, $y_k$, and $y_{k,i}$ was standardized above to the $i$th coordinate of $y=Q^\top e_k$.
- Required revision: Make the square in this expression consistent with (2), and state that division is performed only before the solution is reached.
- Priority: High

### 18. High — algebraic coefficient / implication direction / zero coordinates

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Kantorovich-type inequality
- Issue type: algebraic coefficient / implication direction / zero coordinates
- Current issue: The numerator in the squared line is $4(mM)^2$, inconsistent with $4mM$ in the next line. Equivalence is used where an inequality is weakened, and $b_i/a_i$ is undefined when $y_i=0$. The original repeated substitution also omitted $|y_i|$ from $b_i$ and some indices on $\lambda$ in the sum. The indices above were made consistent with the earlier definitions.
- Required revision: Verify the coefficient in the squaring step and correct the implication where AM–GM is used. Justify the coordinatewise inequality without dividing by zero coordinates.
- Priority: High

### 19. High — missing endpoint / bound versus observed count

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 Contraction endpoint / speed of convergence
- Issue type: missing endpoint / bound versus observed count
- Current issue: When $\kappa=1$, $q=0$, so neither the positivity claim nor the formula for $d$ applies as written. A worst-case error bound is treated as an approximation to the actual loop count.
- Required revision: Separate $\kappa=1$ and the case where the initial iterate is already the solution. For $\kappa>1$, interpret (4) as a sufficient iteration count for a prescribed energy-norm tolerance, and state the integer ceiling and exact-arithmetic assumption.
- Priority: High

### 20. High — unjustified componentwise decrease

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Zig-zag / spectral interpretation
- Issue type: unjustified componentwise decrease
- Current issue: Equations (5) and (6) alone do not imply that the component associated with the largest eigenvalue decreases at every iteration.
- Required revision: Verify why exact line search gives (5), and analyze the sign and magnitude of the multiplier in (6). Distinguish total energy decrease, oscillation, and componentwise changes.
- Priority: High

### 21. High — convergence-rate confusion

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Motivation / convergence terminology
- Issue type: convergence-rate confusion
- Current issue: The improved square-root dependence on the condition number is called quadratic convergence.
- Required revision: Compare the condition-number dependence of iteration counts in the SD and CG energy-norm error bounds, and correct the phrase quadratic convergence. State the exact-arithmetic assumption separately.
- Priority: High

### 22. High — invalid implication / geometric confusion

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Residual orthogonality / projection
- Issue type: invalid implication / geometric confusion
- Current issue: Pairwise orthogonality of all residuals is inferred from orthogonality of adjacent residuals. The object being projected and the inner product used are also unclear.
- Required revision: Use the CG recurrence to prove residual orthogonality separately from $A$-conjugacy of search directions. Connect the affine Krylov space, $A$-norm error minimization, and the residual Galerkin condition, and reassess the scope of the claim that zig-zagging disappears.
- Priority: High

### 23. High — missing theorem / proof chain / imprecise bound

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 4 Correctness
- Issue type: missing theorem / proof chain / imprecise bound
- Current issue: The name Chebyshev polynomials and a single ratio replace a correctness argument. The bound omits its norm, iteration exponent, constant, and hypotheses.
- Required revision: Add proof headings and TODOs in the order SPD/exact arithmetic, nonzero search directions, $A$-conjugacy, Krylov characterization, minimization, and finite termination. Then write precise statements of the polynomial error bound and Chebyshev estimate.
- Priority: High

### 24. High — incomplete definition / missing hypothesis / malformed TeX

- Location: [2026-07-25-folland-caratheodory-extension.md]({% link _posts/measure-theory/2026-07-25-folland-caratheodory-extension.md %}) — 2.2 Definition of a Premeasure
- Issue type: incomplete definition / missing hypothesis / malformed TeX
- Current issue: The second axiom is incomplete, so it does not define a premeasure. The original malformed TeX was preserved as code, with a [Correction required] marker at this location.
- Required revision: The author should complete the quantifier over all pairwise disjoint sequences, the requirements that the sets and their union belong to the algebra, and the countable-additivity identity.
- Priority: High

### 25. High — proof gap / hypothesis / notation

- Location: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Monotone Convergence Theorem
- Issue type: proof gap / hypothesis / notation
- Current issue: The definition of $L^+$ and the proof of MCT are missing, so the theorem cannot be reconstructed from this note alone.
- Required revision: Specify the domain, codomain, and measurability in $L^+$, and complete the lower-bound proof using simple functions and $0<c<1$. Check the union of the increasing sets and the step $c\uparrow1$.
- Priority: High

### 26. High — proof gap / hypothesis / notation

- Location: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Statement
- Issue type: proof gap / hypothesis / notation
- Current issue: Measurability of the limit $f$ and the scalar field of the functions are unspecified.
- Required revision: Either assume that $f$ is measurable or choose a measurable representative. State that the theorem is real-valued; to include a complex-valued version, add the reduction to real and imaginary parts. Handle almost-everywhere conditions outside a common null set.
- Priority: High

### 27. High — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — The Space $L^p$
- Issue type: proof gap / hypothesis / notation
- Current issue: The quotient definition taking $\mathcal L^p$ to $L^p$ and the definition of $L^\infty$ are missing.
- Required revision: Specify the equivalence relation, quotient $L^p$, and independence of representatives. Supply the essential-supremum quantifier, $L^\infty$, and its norm. Also fix the scalar field for the complex-valued version used in §9.
- Priority: High

### 28. High — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Normalization / Proof Using Young — TODO
- Issue type: proof gap / hypothesis / notation
- Current issue: The exponent range and zero-norm case are not specified, and the proof after normalization is missing.
- Required revision: State $1\le p,q\le\infty$ and the convention $1/\infty=0$, and separate the zero-norm case. Complete the normalized Young-inequality integration for $1<p<\infty$ and the endpoint proofs separately.
- Priority: High

### 29. High — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Statement
- Issue type: proof gap / hypothesis / notation
- Current issue: Membership assumptions on $f,g$ are omitted, and $f+g\in L^p$ is not established before applying Hölder.
- Required revision: State $f,g\in L^p(X)$ and establish finiteness first through a preliminary integrability estimate or truncation. Separate the zero-norm case and the endpoints $p=1,\infty$.
- Priority: High

### 30. High — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof: $L^p$ Convergence / Original Sequence — TODO
- Issue type: proof gap / hypothesis / notation
- Current issue: The claims $g\in L^p$, measurable extension and membership of $f$, and norm convergence remain TODOs. The proof for $p=\infty$ is not separated.
- Required revision: For $1\le p<\infty$, complete the limit argument for $g_m^p$ and the summable-tail estimate, and define $f$ on the exceptional measurable null set. Then write the triangle estimate returning to the original sequence. For $p=\infty$, give a separate uniform Cauchy argument outside a common null set.
- Priority: High

### 31. High — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Weak Derivatives / Sobolev Preview
- Issue type: proof gap / hypothesis / notation
- Current issue: Conditions on $\Omega$, the quantifier on $i$, and the meaning of $D_i$ are missing.
- Required revision: Specify that $\Omega\subset\mathbb R^n$ is open, quantify over all $i=1,\ldots,n$, and identify distributional/weak derivatives. Keep this location as a preview and develop the actual definition and proof in the later §9.3 study.
- Priority: High

### 32. Medium — missing cases / format scope

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 1.1–1.2 IEEE 754 representation
- Issue type: missing cases / format scope
- Current issue: The expression applies only to normal numbers but is presented as a representation of every IEEE 754 value. The text also fails to distinguish language type names float/double from IEEE formats.
- Required revision: State the scope as binary32/binary64, then distinguish the normal exponent range, subnormal numbers, zero, and special values. Distinguish fraction bits from significand precision in the table.
- Priority: Medium

### 33. Medium — missing domain / ambiguous notation

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.1 Error definitions
- Issue type: missing domain / ambiguous notation
- Current issue: Relative error does not exclude $x=0$, and machine epsilon in the heading is undefined.
- Required revision: State the roles of the exact and rounded values, require $x\ne0$, specify the rounding mode, and define the machine-epsilon/unit-roundoff convention.
- Priority: Medium

### 34. Medium — conceptual distinction

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Error taxonomy
- Issue type: conceptual distinction
- Current issue: Truncation error is restricted to cutting off decimal digits, and the distinction between computation error and rounding error is unclear.
- Required revision: Distinguish approximation/truncation, representation/rounding, and error amplification due to conditioning. Complete the discussion of overflow and underflow.
- Priority: Medium

### 35. Medium — pedagogical gap

- Location: [2025-07-18-ieee754-errors-and-algorithms.md]({% link _posts/2025-07-18-ieee754-errors-and-algorithms.md %}) — 2.2 Decimal experiment
- Issue type: pedagogical gap
- Current issue: The 50-digit Decimal experiment could be read as a direct IEEE binary64 experiment, and the cause of cancellation is not explained.
- Required revision: Distinguish Decimal precision from binary64 precision, and identify where rounding errors in the square roots become relatively large after subtraction.
- Priority: Medium

### 36. Medium — algorithm classification / missing invariant

- Location: [2026-01-10-epsilon-optimal-cost-scaling-mcmf.md]({% link _posts/2026-01-10-epsilon-optimal-cost-scaling-mcmf.md %}) — 3 Push-Relabel Algorithm
- Issue type: algorithm classification / missing invariant
- Current issue: Push-relabel and cost scaling are described only as heuristics, omitting the invariants and termination argument of the exact algorithm.
- Required revision: Specify the cost-scaling variant in use and explain the roles of pseudoflow, excess, capacity feasibility, epsilon-optimality, and phase termination.
- Priority: Medium

### 37. Medium — ambiguous notation / wrong definition label

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Rayleigh quotient / smoothness / condition number
- Issue type: ambiguous notation / wrong definition label
- Current issue: $Ray(A)$ omits vector dependence and $x\ne0$. The Lipschitz condition applies to the gradient rather than $f$ itself. The norm and nonsingularity assumptions for the condition number are also missing.
- Required revision: Distinguish the matrix and vector arguments of the Rayleigh quotient, and state the domain, quantifiers, and constant for a Lipschitz gradient. Specify the induced 2-norm and invertibility for the condition number.
- Priority: Medium

### 38. Medium — pedagogical gap

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 2 Iterative update / line search
- Issue type: pedagogical gap
- Current issue: The general search direction $p_k$ is mixed with the residual $r_k$ defined later.
- Required revision: Connect the fact that the SD residual is the negative gradient with the requirement to stop before line search when the exact solution is reached.
- Priority: Medium

### 39. Medium — residual-error confusion / missing cost assumptions

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 3 Residual stopping / cost comparison
- Issue type: residual-error confusion / missing cost assumptions
- Current issue: The terminology shifts from relative residual to relative error, and the advantage over direct methods is explained only as avoiding $O(n^3)$ work.
- Required revision: Label the stopping criterion as a relative residual and explain its relation to forward error, including a zero initial residual. State the dense/sparse model and iteration count when comparing costs.
- Priority: Medium

### 40. Medium — ambiguous basis / missing nonzero vector

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Rayleigh quotient coordinates
- Issue type: ambiguous basis / missing nonzero vector
- Current issue: It is unspecified whether $x_i$ is an original coordinate or an eigenbasis coordinate.
- Required revision: State that it is a coordinate of $Q^\top x$, and connect it to the nonzero-vector assumption and the corrected diagonalization in §2.
- Priority: Medium

### 41. Medium — pedagogical gap

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4.b Kantorovich proof idea
- Issue type: pedagogical gap
- Current issue: The long inequality does not reveal why $a_i,b_i$ were chosen.
- Required revision: Explain in your own words the comparison of three spectral moments, the conversion of the spectral interval into a coordinatewise inequality, and the role of AM–GM.
- Priority: Medium

### 42. Medium — function-output mismatch / experiment interpretation

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 MATLAB validation experiment
- Issue type: function-output mismatch / experiment interpretation
- Current issue: The call requests two outputs, `[~, i]`, but the function signature returns only `x`.
- Required revision: Make the return values and call consistent, and record the random seed, arithmetic environment, and actual stopping criterion. Account for reference-solution error and residual drift when checking whether the tolerance was attained.
- Priority: Medium

### 43. Medium — bound versus equality / complexity parameters

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Conditioning and cost
- Issue type: bound versus equality / complexity parameters
- Current issue: A worst-case contraction bound is presented as the actual reduction, and dependence on $\kappa$ and tolerance is treated as constant when the total complexity is called $O(n^2)$.
- Required revision: Distinguish a guaranteed reduction bound from the observed reduction, and separate per-iteration and total costs. State whether tolerance is fixed and distinguish dense costs from sparse costs involving $\operatorname{nnz}(A)$.
- Priority: Medium

### 44. Medium — pedagogical gap

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 5 Connection to CG
- Issue type: pedagogical gap
- Current issue: The comparison of two convergence ratios suggests that the CG bound directly replaces the one-step contraction factor for SD.
- Required revision: Connect CG's Krylov minimization to its polynomial error bound in the next note, and compare the norms, constants, and iteration dependence of the bounds.
- Priority: Medium

### 45. Medium — undefined map / basis identification

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 1 Cyclic subspace
- Issue type: undefined map / basis identification
- Current issue: $T$ is undefined, and the matrix $A$ is applied directly to an abstract vector $\alpha$.
- Required revision: Specify $T:V\to V$, the field, the chosen basis, and its relationship to $A$. Identify the Cayley–Hamilton/minimal-polynomial result that limits how far the span must extend.
- Priority: Medium

### 46. Medium — pedagogical gap

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 2 Prerequisite
- Issue type: pedagogical gap
- Current issue: SPD and the $A$-inner product are essential assumptions of the code but are absent from the prerequisite list.
- Required revision: Link SPD matrices, the $A$-inner product, $A$-conjugate directions, and the residual/error relationship as prerequisites.
- Priority: Medium

### 47. Medium — pedagogical gap

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 3 Algorithm & Code
- Issue type: pedagogical gap
- Current issue: The distinction between the recursively updated residual and periodically recomputed true residual, the fixed iteration cap, and the termination status of the returned solution are unexplained.
- Required revision: Distinguish exact-arithmetic orthogonality from loss of orthogonality in finite precision, and check the relative-residual criterion, zero initial residual, and convergence status.
- Priority: Medium

### 48. Medium — pedagogical gap

- Location: [2026-02-09-conjugate-gradient.md]({% link _posts/2026-02-09-conjugate-gradient.md %}) — 5 Preconditioning direction
- Issue type: pedagogical gap
- Current issue: The phrase “modify A” does not establish equivalence to the original linear system or the symmetry and positive definiteness required by CG.
- Required revision: Connect the preconditioner assumptions to the transformed unknown/system and a formulation that preserves SPD structure.
- Priority: Medium

### 49. Medium — pedagogical / dependency

- Location: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.1
- Issue type: pedagogical / dependency
- Current issue: There is no explanation of why checking only a generating collection is sufficient.
- Required revision: Prove that the collection of sets with measurable preimages is a $\sigma$-algebra, and explain the motivation for this criterion.
- Priority: Medium

### 50. Medium — pedagogical / dependency

- Location: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.13
- Issue type: pedagogical / dependency
- Current issue: The definition of a simple-function integral and the extended-integral conventions are omitted.
- Required revision: Supply the integral definition via the canonical representation, independence of representation, the convention $0\cdot\infty=0$, and the connection to continuity from below of the measure.
- Priority: Medium

### 51. Medium — proof gap / hypothesis / notation

- Location: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Why Domination Is Necessary
- Issue type: proof gap / hypothesis / notation
- Current issue: The heading suggests that domination is necessary for interchanging a limit and an integral.
- Required revision: Change the heading to “Pointwise Convergence Alone Is Insufficient” and verify that no common integrable dominator exists.
- Priority: Medium

### 52. Medium — pedagogical / dependency

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof / Equality Case — TODO
- Issue type: pedagogical / dependency
- Current issue: Only the statement is present; the proof and equality condition are missing.
- Required revision: Supply the key convexity or calculus argument and the equality condition.
- Priority: Medium

### 53. Medium — pedagogical / dependency

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof Using Hölder — TODO
- Issue type: pedagogical / dependency
- Current issue: There is no proof connecting the norm estimate to the finite-measure assumption.
- Required revision: Identify the two functions and conjugate exponents used in Hölder, treat $q=\infty$, and link the infinite-measure counterexample in §7.
- Priority: Medium

### 54. Medium — proof gap / hypothesis / notation

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Power Functions Near Infinity
- Issue type: proof gap / hypothesis / notation
- Current issue: The two power-function criteria omit the finite range of $p$, the range of $\alpha$, and the measure.
- Required revision: Specify Lebesgue measure, $1\le p<\infty$, and $\alpha\in\mathbb R$, and check $p=\infty$ separately through essential boundedness.
- Priority: Medium

### 55. Medium — pedagogical / dependency

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Proof: $L^p$ Convergence / Original Sequence — TODO
- Issue type: pedagogical / dependency
- Current issue: The purpose of selecting the subsequence is not explained.
- Required revision: State the proof idea in your own words: summable norm increments → almost-everywhere absolute convergence → norm convergence.
- Priority: Medium

### 56. Medium — pedagogical / dependency

- Location: [2026-08-14-Lp-space-and-inequalities-04.md]({% link _posts/seminar/2026-08-14-Lp-space-and-inequalities-04.md %}) — Hilbert Spaces / Banach vs. Hilbert
- Issue type: pedagogical / dependency
- Current issue: It is unclear where well-definedness of the inner product is established and where the real-valued convention of §2 is extended.
- Required revision: State $f,g\in L^2$, integrability by Cauchy–Schwarz, independence of representatives, the complex scalar field, and the convention for the linear slot.
- Priority: Medium

### 57. Low — pedagogical gap

- Location: [2026-01-23-bertsimas-linear-optimization-ch1-1.md]({% link _posts/2026-01-23-bertsimas-linear-optimization-ch1-1.md %}) — Canonical Form
- Issue type: pedagogical gap
- Current issue: Matrix/vector dimensions, the scalar field, and the convention for the name canonical form are missing.
- Required revision: Specify the domains and dimensions of $A,b,c,x$, the componentwise meaning of the inequalities, and the textbook's name for this form.
- Priority: Low

### 58. Low — pedagogical gap

- Location: [2026-02-04-steepest-descent-spd-convergence.md]({% link _posts/2026-02-04-steepest-descent-spd-convergence.md %}) — 4 Existence and uniqueness
- Issue type: pedagogical gap
- Current issue: The passage from the quadratic lower bound to coercivity including the linear term, and the conditions for attaining the minimum, are compressed.
- Required revision: State $b\in\mathbb R^n$ and $c\in\mathbb R$, compare the growth of the linear term, and identify where continuity and finite dimensionality are used.
- Priority: Low

### 59. Low — pedagogical / dependency

- Location: [2026-07-31-measure-theory-seminar-03.md]({% link _posts/seminar/2026-07-31-measure-theory-seminar-03.md %}) — Proposition 2.3
- Issue type: pedagogical / dependency
- Current issue: The codomain $\sigma$-algebra and the dependency on Proposition 2.1 are implicit.
- Required revision: Specify the Borel $\sigma$-algebra on $\mathbb R$ and verify generation by each family.
- Priority: Low

### 60. Low — pedagogical / dependency

- Location: [2026-08-07-fatou-dct.md]({% link _posts/seminar/2026-08-07-fatou-dct.md %}) — Statement
- Issue type: pedagogical / dependency
- Current issue: The common measure space and the notation $L^+$ are omitted.
- Required revision: Specify $(X,\mathcal M,\mu)$, the extended-valued codomain of $L^+$, and the integral notation at the beginning of the note.
- Priority: Low

### 61. Low — missing hypothesis / ambiguous notation (archived fragment)

- Location: [01-weak-derivatives.md](https://github.com/jinhojeon123/jinhojeon123.github.io/blob/main/archive/legacy/_posts/sobolev-foundations/01-weak-derivatives.md) — the only displayed equation
- Issue type: missing hypothesis / ambiguous notation (archived fragment)
- Current issue: The final integral is asserted to be finite without assumptions, and the support is not typeset as the integration domain. There is no prose beyond the equation.
- Required revision: Preserve the archived original. If it is restored as an active note, the author should specify an open domain, local integrability, smooth compactly supported test functions, and the support notation.
- Priority: Low
