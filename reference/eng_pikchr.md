# Pikchr Code Engine for Knitr

A custom knitr engine to render Pikchr diagrams as SVG (HTML output) or
PNG (LaTeX, DOCX, and other non-HTML formats). Works with both RMarkdown
and Quarto documents.

## Usage

``` r
eng_pikchr(options)
```

## Arguments

- options:

  A list of chunk options from knitr.

## Value

Rendered output suitable for the target document format.

## Details

The `eng_pikchr` function allows you to use Pikchr code inside R
Markdown and Quarto documents, rendering it as an image. It supports
options like `width`, `height`, `fontSize`, `fontFamily`, and CSS
classes to customize the output.

The engine automatically detects the output format. For HTML-based
outputs (html, revealjs, slidy, etc.) the SVG is embedded inline. For
non-HTML outputs (LaTeX/PDF, DOCX, EPUB, Typst, etc.) the SVG is
converted to PNG via
[`rsvg_png`](https://docs.ropensci.org/rsvg/reference/rsvg.html).

## Chunk Options

Standard knitr options:

- `eval`:

  Whether to evaluate the Pikchr code (default `TRUE`).

- `echo`:

  Whether to display the code in the output (default `TRUE`).

- `fig.cap`:

  Figure caption (supported in both HTML and non-HTML output).

- `fig.alt`:

  Alternative text for accessibility (HTML only).

- `fig.align`:

  Figure alignment: `"left"`, `"right"`, `"center"`, or `"default"`.

- `out.width`:

  Output width for non-HTML formats (e.g., `"80%"`).

- `dpi`:

  Resolution for PNG conversion in non-HTML output (default `150`).

Pikchr-specific options:

- `width`:

  CSS width of the SVG (default from viewBox, e.g., `"80%"`).

- `height`:

  CSS height of the SVG (default `"auto"`).

- `fontSize`:

  Font size for the diagram (default `"100%"`).

- `fontFamily`:

  Font family for the diagram (default `"Jost"`).

- `class`:

  CSS class for the SVG element (default `"pikchr"`).

- `css`:

  Additional inline CSS styles for the SVG.

- `margin`:

  CSS margin around the SVG (default `"10px 0 10px 0"`).

## See also

[`pikchr`](https://monitoramento.sepe.pe.gov.br/pikchr/reference/pikchr.md),
[`knit_engines`](https://rdrr.io/pkg/knitr/man/knit_engines.html)
