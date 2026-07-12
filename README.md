# Formalised Algebra

Working through Paolo Aluffi's *Algebra: Chapter 0* (2nd printing), formalising the statements and solved exercises in four languages in parallel: **Lean 4** (with mathlib), **Agda** (standard-library + agda-categories), **Isabelle/HOL**, and **F***.

## Layout

- `ChapterI/` … `ChapterIX/` mirror the book; each section directory (e.g. `ChapterI/S3Categories/`) has `Lean/ Agda/ Isabelle/ FStar/` subfolders, each holding `Content.*` (definitions written while reading) and `Exercises.*` (the book's exercises, worked using only Content).
- `Foundations/` collects foundational material built up along the way, in the same language split.
- Each section is a literate document: `main.org` (prose, tikz-cd diagrams; its Lean and F* src blocks tangle to the Content files), `Agda/Content.lagda.tex` (literate Agda), and `Isabelle/Content.thy` typeset via Isabelle document preparation (one session per section).

## Environment

Per-language Nix flakes, pinned by commit in `.envrc`:
[lean-flake](https://github.com/MaxCarroll0/lean-flake), [agda-flake](https://github.com/MaxCarroll0/agda-flake), [isabelle-flake](https://github.com/MaxCarroll0/isabelle-flake), [fstar-flake](https://github.com/MaxCarroll0/fstar-flake), [org-literate-flake](https://github.com/MaxCarroll0/org-literate-flake).

```sh
direnv allow          # first entry downloads the toolchains
lake exe cache get    # fetch mathlib binaries instead of building them
make typecheck        # tangle + all four proof checkers
make doc              # typecheck, then build the literate PDFs
```
