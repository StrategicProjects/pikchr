# Register a Google Font in the document head

Adds a \`\<link\>\` tag to the HTML document head for the given font
URL. Each unique URL is registered only once per document, avoiding
redundant downloads when multiple pikchr chunks use the same font.

## Usage

``` r
register_font(font_url)
```

## Arguments

- font_url:

  Character URL of the Google Fonts CSS.

## Value

Invisible \`NULL\`.
