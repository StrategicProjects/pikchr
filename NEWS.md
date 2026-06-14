# pikchr 1.1.1

## Bug fixes

- Fixed a memory leak in the C interface (`pikchr_c`): the SVG buffer returned by `pikchr()` was never freed, leaking on every diagram render.
- Guarded the C interface against a possible `NULL` return from `pikchr()` that could crash the R session.
- Fixed the `height` argument default in `pikchr()`, which never fell back to the SVG `viewBox` height and produced an empty `height:` CSS rule.
- Aligned the documented argument defaults of `pikchr()` (`width`, `height`, `fontSize`, `fontFamily`, `align`) with the actual function defaults.

## Other

- Regenerated the package logo with a geometrically regular hexagon (the previous SVG was horizontally squished) and fixed an invalid `<def>` element (now `<defs>`) in the logo source.

# pikchr 1.1.0

## New features

- **Quarto and RMarkdown improvements**: The knitr engine now supports `fig.cap` (figure captions with `<figure>`/`<figcaption>` in HTML), `fig.alt` (accessibility alt text via `aria-label`), and `fig.align` as standard knitr options.
- **Non-HTML output support**: Automatic PNG conversion for all non-HTML formats including DOCX, EPUB, and Typst (previously only LaTeX/PDF was supported).
- **DPI-aware PNG conversion**: The `dpi` chunk option (default 150) controls PNG resolution for non-HTML outputs.
- **Error detection**: Pikchr compilation errors now produce informative warnings with the error message, instead of silently embedding invalid markup.
- **Quarto cross-referencing**: Chunks with labels starting with `fig-` receive an HTML `id` attribute for Quarto cross-reference compatibility.

## Improvements

- Replaced `message()`, `warning()`, and `stop()` with `cli::cli_inform()`, `cli::cli_warn()`, and `cli::cli_abort()` for consistent and user-friendly messaging.
- Removed `dplyr`, `purrr`, and `rlang` from Imports, replaced with base R operations for a lighter dependency footprint.
- Replaced `tidyverse` in Suggests with specific packages (`rmarkdown`).
- Updated authors list.
- Removed compiled objects (`.o`, `.so`) from `src/`.
- Cleaned up commented-out code and removed duplicate engine registration.

# pikchr 1.0.3

## Bug fix

- Corrected automatic detection of LaTeX output: when knitting to PDF, the SVG diagram is now converted to a PNG image using the **`rsvg`** package, ensuring compatibility with LaTeX-based outputs.

# pikchr 1.0.2

## Bug fix

- Adjusted SVG attribute handling to prevent false "NAs introduced by coercion" warnings caused by unexpected coercion of non-numeric attributes.

# pikchr 1.0.1

* updated `pikchr` source code to version 1.0

# pikchr 1.0.0

* Added a `NEWS.md` file to track changes to the package.
* Embedded Google Fonts in SVG Files: Added functionality to embed Google Fonts directly into the generated SVG files, improving the portability and visual consistency of diagrams.
* Improved Processing in RMarkdown: Enhanced integration with RMarkdown for smoother and more efficient rendering of diagrams within documents.
