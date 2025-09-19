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
