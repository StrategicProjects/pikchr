# Run Plot Hook and Record Plot Filenames

Records the filename of a plot output in the knitr environment and runs
the current plot hook. Used internally for non-HTML outputs (LaTeX,
DOCX, etc.).

## Usage

``` r
run_hook_plot(x, options)
```

## Arguments

- x:

  Character path to the plot file.

- options:

  Knitr chunk options list.

## Value

The result of calling the knitr plot hook.
