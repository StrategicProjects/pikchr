# Validate Knitr Chunk Options for Pikchr Engine

Validates chunk options provided to the Pikchr engine. Numeric values
for logical options (\`eval\`, \`echo\`, \`warning\`) are converted to
\`TRUE\` with a warning.

## Usage

``` r
eng_pikchr_validate_options(options)
```

## Arguments

- options:

  A list of chunk options from knitr.

## Value

The validated options list.
