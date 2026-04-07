# Extract SVG intrinsic width from viewBox

Parses the \`viewBox\` attribute from an SVG string and returns the
width in user units (typically px at 72 dpi).

## Usage

``` r
extract_svg_width(svg_string)
```

## Arguments

- svg_string:

  Character string containing SVG markup.

## Value

Numeric width or \`NULL\` if not found.
