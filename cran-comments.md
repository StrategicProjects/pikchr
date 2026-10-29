## Patch release 1.1.2

This release updates the bundled 'pikchr' C source to the current upstream
check-in (a7f1c35bc0, 2026-04-03). The only code change is an upstream bug fix
for nested macro calls whose pass-through arguments are split across lines with
a trailing backslash, which previously failed with a syntax error. There are no
changes to the R API.

## R CMD check results

0 errors | 0 warnings | 0 notes

Checked locally with `R CMD check --as-cran` on macOS (R 4.6.0). The previous
release (1.1.1) is OK on all CRAN flavors.

## Downstream dependencies

There are currently no downstream dependencies for this package.
