## Resubmission

This is a patch release (1.1.1) fixing bugs found during an internal audit:

- Fixed a memory leak in the C interface (the SVG buffer was never freed).
- Guarded the C interface against a possible NULL return that could crash R.
- Fixed the `height` argument default in `pikchr()`.
- Aligned documented argument defaults with the actual defaults.

## R CMD check results

0 errors | 0 warnings | 0 notes

## Downstream dependencies

There are currently no downstream dependencies for this package.
