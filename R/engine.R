#' Pikchr Code Engine for Knitr
#'
#' This function serves as a custom code engine for Knitr to render Pikchr diagrams as SVG or PNG images.
#' It processes Pikchr code embedded in R Markdown documents and outputs either HTML or LaTeX-compatible images.
#'
#' @param options A list of chunk options from Knitr. It includes the Pikchr code and various parameters
#'        controlling the size, appearance, and output format of the rendered image.
#'
#' @details
#' The `eng_pikchr` function allows you to use Pikchr code inside R Markdown documents, rendering it as an image.
#' It supports options like `width`, `height`, `font size`, `font family`, and CSS classes to customize the output.
#' The function automatically detects the output format (HTML or LaTeX) and generates the appropriate image.
#' 
#' If the output is LaTeX, the SVG is converted to PNG using the `rsvg_png()` function.
#' 
#' @section Chunk Options:
#' - `eval`: Whether to evaluate the Pikchr code (default `TRUE`).
#' - `echo`: Whether to display the code in the output document (default `TRUE`).
#' - `width`: Width of the rendered image (default `"80%"`).
#' - `height`: Height of the rendered image (default `"auto"`).
#' - `size`: Font size for the Pikchr diagram (default `"100%"`).
#' - `family`: Font family for the Pikchr diagram (default `"inherit"`).
#' - `css`: Additional CSS for customizing the Pikchr diagram.
#' - `class`: CSS class to apply to the diagram (default `"pikchr"`).
#' - `margin`: CSS margin around the image (default `"10px 0 10px 0"`).
#' - `lang`: Language for the Pikchr diagram (optional).
#'
#' @return This function returns an SVG (or PNG for LaTeX output) rendered by Pikchr.
#'
#' @examples
#' \dontrun{
#' # In an R Markdown chunk
#' ```{pikchr}
#' box "Hello, Pikchr!" 
#' arrow
#' circle
#' ```
#' }
#'
#' @seealso [knitr::knit_engines]
#' 
#' @import htmltools
#' @import utils
#' @import brio
#' @import rlang
#' @import knitr
#' @importFrom rsvg rsvg_png
#' @importFrom purrr map_lgl
#' @export
eng_pikchr = function(options) {
  options <- eng_pikchr_validate_options(options)
  if (!options$eval) return(engine_output(options, options$code, ''))
  echo <- options$echo
  width <- options$width
  height <- options$height
  size <- options$size
  family <- options$family
  css <- options$css
  class <- paste(options$class, options$label)
  margin <- options$margin
  lang <- options$lang
  code <- paste0(options$code, collapse = " \n")
  piksvg <- pikchr(code, 
                   width = ifelse(is.null(width), "80%", width),
                   height = ifelse(is.null(height), "auto", height),
                   fontSize = ifelse(is.null(size) | (size == "normalsize"), "100%", size),
                   fontFamily = ifelse(is.null(family), "inherit", family),
                   class = ifelse(is.null(class), "pikchr", paste("pikchr", class)),
                   css = css, #ifelse(is.null(css), "", css),
                   margin = ifelse(is.null(margin), "10px 0 10px 0", margin),
                   svgOnly = TRUE
  )
  
  
  if(!dir.exists("tmp")) dir.create("tmp")
  
  fig  <- tempfile(tmpdir =  "tmp", fileext = ".svg", pattern = "pik_tmp_")
  write_lines(piksvg, fig)
  
  if (knitr::is_latex_output() & (!knitr::is_html_output())) {
    png  <- tempfile(tmpdir = "tmp", fileext = ".png", pattern = "pik_tmp_")
    rsvg::rsvg_png(svg = fig, file = png)
    fig <- png
  }
  
  
  
  options$fig.num = 1L; options$fig.cur = 1L
  extra = run_hook_plot(fig, options)
  options$engine <- 'c'
  knitr::engine_output(options, options$code, '', extra)
}


#' Validate Knitr Chunk Options for Pikchr Engine
#'
#' This function validates the chunk options provided to the Pikchr engine in Knitr. 
#' It checks for unsupported numeric options and converts them to logical `TRUE` values.
#' A warning is issued if any unsupported numeric options are detected.
#'
#' @param options A list of options passed to the Pikchr engine from a Knitr code chunk. These options include directives such as `eval`, `echo`, and `warning`.
#'
#' @details
#' The `eng_pikchr_validate_options` function looks for specific options (e.g., `eval`, `echo`, `warning`) that should not be numeric. If any of these options are numeric, they are converted to logical `TRUE` and a warning is issued to the user.
#'
#' @return The validated options list, where unsupported numeric values are converted to `TRUE`.
#'
#' @examples
#' \dontrun{
#' # Create a sample list of chunk options
#' options <- list(eval = 1, echo = 0, warning = 2)
#'
#' # Validate options
#' validated_options <- eng_pikchr_validate_options(options)
#'
#' # Print the validated options
#' print(validated_options)
#' }
#' 
#' @keywords internal
eng_pikchr_validate_options <- function(options) {
  
  # warn about unsupported numeric options and convert to TRUE
  no_numeric <- c("eval", "echo", "warning")
  for (option in no_numeric) {
    if (is.numeric(options[[option]])) {
      fmt <- "numeric '%s' chunk option not supported by pikchr engine"
      msg <- sprintf(fmt, option)
      warning(msg, call. = FALSE)
      options[[option]] <- TRUE
    }
  }
  
  options
}


#' Run Plot Hook and Record Plot Filenames
#'
#' This function records the filenames of plot outputs (such as SVG or PNG files) in the Knitr environment 
#' and then runs the appropriate plot hook to display or save the plots.
#'
#' @param x A character string representing the path to the plot file.
#' @param options A list of options associated with the Knitr chunk, such as plot settings and output options.
#'
#' @details
#' The `run_hook_plot` function appends the plot file path to the internal Knitr option `plot_files`. 
#' It then retrieves the current plot hook defined in `knit_hooks` and calls it to handle the plot rendering or output. 
#' This function is particularly useful for handling plots generated from both R code and other outputs like HTML widgets.
#'
#' @return The result of calling the current Knitr plot hook with the specified plot file and options.
#'
#' @examples
#' \dontrun{
#' # Example usage within a Knitr chunk engine
#' plot_file <- "path/to/plot.svg"
#' chunk_options <- list(fig.width = 7, fig.height = 5)
#'
#' # Record the plot and run the plot hook
#' run_hook_plot(plot_file, chunk_options)
#' }
#' 
#' @keywords internal
run_hook_plot = function(x, options) {
  opts_knit$append(plot_files = x)
  hook = knit_hooks$get('plot')
  hook(x, options)
}