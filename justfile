tangle:
    tangle-org

typecheck: tangle
    typecheck-lean
    typecheck-agda
    typecheck-isabelle
    typecheck-fstar

doc: typecheck
    doc-agda
    doc-isabelle
    doc-org

clean:
    rm -rf .lake/build _build
    find . -type d -name latex -not -path './.lake/*' -exec rm -rf {} +
    find . -type d -name output -not -path './.lake/*' -exec rm -rf {} +
    find . -type f \( -name 'main.tex' -o -name '*.aux' -o -name '*.fdb_latexmk' -o -name '*.fls' -o -name '*.log' -o -name '*.out' -o -name '*.toc' -o -name '*.agdai' \) -delete
