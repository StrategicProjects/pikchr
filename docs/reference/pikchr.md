# Convert Pikchr Code to SVG

This function converts a diagram description written in the Pikchr
language into an SVG (Scalable Vector Graphics) format. Pikchr is a
diagram language inspired by PIC, and this function allows you to easily
embed Pikchr diagrams as SVG images in your HTML or Markdown documents.

## Usage

``` r
pikchr(
  code,
  width = NULL,
  height = NULL,
  fontSize = "100%",
  fontFamily = "Jost",
  class = "pikchr",
  align = "none",
  css = NULL,
  margin = NULL,
  svgOnly = FALSE
)
```

## Arguments

- code:

  A character string containing the diagram code written in the Pikchr
  language.

- width:

  A character string representing the width of the rendered SVG. It
  accepts standard HTML values such as percentages ("75%"), pixels
  ("300px"), or "auto". Defaults to "75%".

- height:

  A character string representing the height of the rendered SVG. It
  accepts standard HTML values such as pixels ("300px") or "auto".
  Defaults to "auto".

- fontSize:

  A character string specifying the font size of the text within the
  SVG. It accepts standard HTML values such as percentages ("80%"),
  pixels, or keywords ("large"). Defaults to "80%".

- fontFamily:

  A character string specifying the font family for the text in the
  diagram. Common values include "inherit" (to use the page's default
  font), "Arial", "Times New Roman", etc. Defaults to "inherit".

- class:

  A character string specifying a CSS class to apply to the SVG. This
  can be used to style the SVG with external CSS rules. Defaults to
  "pikchr".

- align:

  A character string specifying the alignment of the SVG within its
  container. Options are "center" (default), "left", or "right". If set
  to "none", no alignment is applied.

- css:

  A character string containing extra CSS styles to apply directly to
  the SVG element. This allows additional customization beyond width,
  height, and font settings. If NULL, no extra styles are applied.

- margin:

  A character string specifying the margin around the SVG element,
  formatted like a CSS margin rule (e.g., "10px 0 10px 0"). Defaults to
  "10px 0 10px 0".

- svgOnly:

  Logical, whether to return only the raw SVG code (TRUE) or open the
  diagram in the Viewer window (FALSE, default).

## Value

A character string containing the SVG diagram code if svgOnly = TRUE.
Otherwise, the function opens the diagram in the Viewer window.

## Examples

``` r
if(interactive()) {
pikchr('
  arrow right 200% "Rmarkdown" "Source"
  box rad 10px "Rmarkdown" "(knitr)" fit
  arrow right 200% "HTML+SVG" "Output"
  arrow <-> down from last box.s
  box same "Pikchr" "(pikchr.c)" fit
  ')
  }
@import url(https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900);RmarkdownSourceRmarkdown(knitr)HTML+SVGOutputPikchr(pikchr.c)
```
