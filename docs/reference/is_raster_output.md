# Check if current output requires raster (PNG) images

Returns \`TRUE\` for LaTeX/PDF, DOCX, EPUB, Typst, and any non-HTML
format. Returns \`FALSE\` for all HTML-based outputs (HTML, Revealjs,
Slidy, etc.).

## Usage

``` r
is_raster_output()
```

## Value

Logical scalar.
