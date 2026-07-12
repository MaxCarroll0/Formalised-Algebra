# Formalised Algebra

Working through Paolo Aluffi's *Algebra: Chapter 0* (2nd printing), formalising the statements and solved exercises in four languages in parallel: **Lean 4** (with mathlib), **Agda** (standard-library + agda-categories), **Isabelle/HOL**, and **F***.

## Layout

- `ChapterI/` … `ChapterIX/` mirror the book; each section is a directory (e.g. `ChapterI/S3Categories/`) holding the four formalisations side by side.
- `Foundations/` collects foundational material built up along the way.
- Each section is a literate document: `main.org` (prose, tikz-cd diagrams, Lean and F* src blocks that tangle to `.lean`/`.fst`), `*.lagda.tex` (literate Agda), and `.thy` typeset via Isabelle document preparation.

## Environment

Per-language Nix flakes, pinned by commit in `.envrc`:
[lean-flake](https://github.com/MaxCarroll0/lean-flake), [agda-flake](https://github.com/MaxCarroll0/agda-flake), [isabelle-flake](https://github.com/MaxCarroll0/isabelle-flake), [fstar-flake](https://github.com/MaxCarroll0/fstar-flake), [org-literate-flake](https://github.com/MaxCarroll0/org-literate-flake).

```sh
direnv allow          # first entry downloads the toolchains
lake exe cache get    # fetch mathlib binaries instead of building them
make typecheck        # tangle + all four proof checkers
make doc              # typecheck, then build the literate PDFs
```
