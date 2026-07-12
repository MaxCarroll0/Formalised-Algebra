# TODO

## Proof-audit reports

A `report` command (eventually an `apps.report` in each language flake, orchestrated here) scanning every section and reporting incompleteness and non-constructivity per file:

- **Lean**: `sorry`/`admit` occurrences; `#print axioms` per declaration to flag `Classical.choice`, `propext`, `sorryAx`.
- **Agda**: unfilled holes (`?`, `{! !}`); `postulate` blocks; whether each module is `--safe` and `--without-K` clean.
- **Isabelle**: `sorry`/`oops`; `axiomatization` uses.
- **F***: `admit ()`, `assume`, `admit_smt_queries`.

## Tree-sitter parsers

For the report tool and richer editor support: evaluate existing grammars (tree-sitter-lean, tree-sitter-agda, tree-sitter-fstar; Isabelle lacks a maintained one) versus extending them; prefer each prover's own query facilities (`#print axioms`, `agda --interaction`) for ground truth and tree-sitter for cheap cross-language scanning.

## Later

- CI: GitHub Action running `make typecheck` + the report on push.
- Per-chapter progress table generated from the report output.
- Isabelle jEdit emacs keymap refinements as annoyances surface.
