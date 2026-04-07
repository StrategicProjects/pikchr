#' Pikchr Code Engine for Knitr
#'
#' A custom knitr engine to render Pikchr diagrams as SVG (HTML output) or
#' PNG (LaTeX, DOCX, and other non-HTML formats). Works with both RMarkdown
#' and Quarto documents.
#'
#' @param options A list of chunk options from knitr.
#'
#' @details
#' The \code{eng_pikchr} function allows you to use Pikchr code inside
#' R Markdown and Quarto documents, rendering it as an image. It supports
#' options like \code{width}, \code{height}, \code{fontSize},
#' \code{fontFamily}, and CSS classes to customize the output.
#'
#' The engine automatically detects the output format.
#' For HTML-based outputs (html, revealjs, slidy, etc.) the SVG is embedded
#' inline. For non-HTML outputs (LaTeX/PDF, DOCX, EPUB, Typst, etc.) the SVG
#' is converted to PNG via \code{\link[rsvg]{rsvg_png}}.
#'
#' @section Chunk Options:
#' Standard knitr options:
#' \describe{
#'   \item{\code{eval}}{Whether to evaluate the Pikchr code (default \code{TRUE}).}
#'   \item{\code{echo}}{Whether to display the code in the output (default \code{TRUE}).}
#'   \item{\code{fig.cap}}{Figure caption (supported in both HTML and non-HTML output).}
#'   \item{\code{fig.alt}}{Alternative text for accessibility (HTML only).}
#'   \item{\code{fig.align}}{Figure alignment: \code{"left"}, \code{"right"}, \code{"center"}, or \code{"default"}.}
#'   \item{\code{out.width}}{Output width for non-HTML formats (e.g., \code{"80\%"}).}
#'   \item{\code{dpi}}{Resolution for PNG conversion in non-HTML output (default \code{150}).}
#' }
#'
#' Pikchr-specific options:
#' \describe{
#'   \item{\code{width}}{CSS width of the SVG (default from viewBox, e.g., \code{"80\%"}).}
#'   \item{\code{height}}{CSS height of the SVG (default \code{"auto"}).}
#'   \item{\code{fontSize}}{Font size for the diagram (default \code{"100\%"}).}
#'   \item{\code{fontFamily}}{Font family for the diagram (default \code{"Jost"}).}
#'   \item{\code{class}}{CSS class for the SVG element (default \code{"pikchr"}).}
#'   \item{\code{css}}{Additional inline CSS styles for the SVG.}
#'   \item{\code{margin}}{CSS margin around the SVG (default \code{"10px 0 10px 0"}).}
#' }
#'
#' @return Rendered output suitable for the target document format.
#' @seealso \code{\link{pikchr}}, \code{\link[knitr]{knit_engines}}
#'
#' @import htmltools
#' @import utils
#' @import brio
#' @import knitr
#' @importFrom rsvg rsvg_png
#' @keywords internal
eng_pikchr <- function(options) {
  options <- eng_pikchr_validate_options(options)
  if (!options$eval) return(knitr::engine_output(options, options$code, ""))

  echo   <- options$echo
  code   <- paste0(options$code, collapse = "\n")

  # Resolve pikchr-specific chunk options with defaults
  width      <- options$width
  height     <- options$height
  size       <- if (is.null(options$fontSize))  "100%"          else options$fontSize
  family     <- if (is.null(options$fontFamily)) "Jost"         else options$fontFamily
  align_raw  <- if (!is.null(options$align)) options$align else options$fig.align
  align      <- if (is.null(align_raw)) "center" else align_raw
  css        <- options$css
  cls        <- if (is.null(options$class)) "pikchr" else options$class
  class      <- paste("inline-svg", cls, options$label)
  margin     <- if (is.null(options$margin)) "10px 0 10px 0"   else options$margin
  fig_cap    <- options$fig.cap
  fig_alt    <- options$fig.alt
  dpi        <- if (is.null(options$dpi)) 150L else options$dpi

  if (size == "normalsize") size <- "100%"

  # Call pikchr to generate SVG
  piksvg <- pikchr(
    code,
    width      = width,
    height     = height,
    fontSize   = size,
    fontFamily = family,
    align      = if (is_raster_output()) "none" else align,
    class      = class,
    css        = css,
    margin     = margin,
    svgOnly    = TRUE
  )

  # Detect pikchr compilation errors
  piksvg_chr <- as.character(piksvg)
  if (!grepl("<svg", piksvg_chr, fixed = TRUE)) {
    error_msg <- gsub("<[^>]+>", "", piksvg_chr)
    error_msg <- trimws(error_msg)
    cli::cli_warn(c(
      "Pikchr compilation error in chunk {.val {options$label}}:",
      "x" = "{error_msg}"
    ))
    out_code <- if (echo) options$code else ""
    return(knitr::engine_output(options, out_code, error_msg))
  }

  # For HTML output: strip @import from SVG (pikchr() embeds it for standalone

  # use, but in documents --embed-resources would download fonts per-chunk).
  # Instead, register the font once in the document head.
  if (!is_raster_output()) {
    font_block <- regmatches(
      piksvg_chr,
      regexpr("<defs><style[^>]*>@import url\\([^)]+\\);</style></defs>", piksvg_chr)
    )
    if (length(font_block) == 1L && nzchar(font_block)) {
      # Remove font block from SVG
      piksvg_chr <- sub(font_block, "", piksvg_chr, fixed = TRUE)
      # Extract the URL and register font once via knitr
      font_url <- regmatches(
        font_block,
        regexpr("https://[^)]+", font_block)
      )
      if (length(font_url) == 1L) {
        register_font(font_url)
      }
    }
  }

  # Write SVG to temp file (needed for PNG conversion)
  svg_file <- tempfile(fileext = ".svg")
  brio::write_lines(piksvg_chr, svg_file)

  # Setup figure path options for knitr
  options$fig.num <- 1L
  options$fig.cur <- 1L
  options$engine  <- "r"

  if (is_raster_output()) {
    # Non-HTML output: convert SVG to PNG
    png_file <- sub("\\.svg$", ".png", svg_file)

    # Use dpi to control PNG quality; rsvg_png expects width in pixels
    svg_width <- extract_svg_width(piksvg_chr)
    png_width <- if (!is.null(svg_width)) round(svg_width * dpi / 72) else NULL
    rsvg::rsvg_png(svg_file, png_file, width = png_width)

    final_png <- knitr::fig_path(".png", options)
    dir.create(dirname(final_png), showWarnings = FALSE, recursive = TRUE)
    file.copy(png_file, final_png, overwrite = TRUE)

    # Apply out.width default if not set
    if (is.null(options$out.width)) {
      options$out.width <- if (is.null(options$width)) "100%" else options$width
    }

    result <- run_hook_plot(final_png, options)
  } else {
    # HTML output: embed SVG inline
    result <- piksvg_chr

    # Add alt text for accessibility
    if (!is.null(fig_alt) && nzchar(fig_alt)) {
      result <- sub("<svg ",
                    paste0('<svg role="img" aria-label="', htmltools::htmlEscape(fig_alt), '" '),
                    result, fixed = FALSE)
    }

    # Wrap in <figure> with caption if fig.cap is set
    if (!is.null(fig_cap) && nzchar(fig_cap)) {
      fig_id <- if (grepl("^fig-", options$label)) {
        paste0(' id="', htmltools::htmlEscape(options$label), '"')
      } else {
        ""
      }
      result <- paste0(
        '<figure', fig_id, '>\n',
        result, '\n',
        '<figcaption>', htmltools::htmlEscape(fig_cap), '</figcaption>\n',
        '</figure>'
      )
    }

    # Protect from pandoc processing
    result <- paste0('\n\n', result, '\n\n')
  }

  out_code <- if (echo) options$code else ""
  knitr::engine_output(options, out_code, "", result)
}


#' Check if current output requires raster (PNG) images
#'
#' Returns `TRUE` for LaTeX/PDF, DOCX, EPUB, Typst, and any non-HTML format.
#' Returns `FALSE` for all HTML-based outputs (HTML, Revealjs, Slidy, etc.).
#'
#' @return Logical scalar.
#' @keywords internal
is_raster_output <- function() {
  !knitr::is_html_output()
}


# Environment to track fonts already registered in the current document
.pikchr_fonts <- new.env(parent = emptyenv())
.pikchr_fonts$loaded <- character(0)


#' Register a Google Font in the document head
#'
#' Adds a `<link>` tag to the HTML document head for the given font URL.
#' Each unique URL is registered only once per document, avoiding redundant
#' downloads when multiple pikchr chunks use the same font.
#'
#' @param font_url Character URL of the Google Fonts CSS.
#' @return Invisible `NULL`.
#' @keywords internal
register_font <- function(font_url) {
  if (font_url %in% .pikchr_fonts$loaded) return(invisible(NULL))
  .pikchr_fonts$loaded <- c(.pikchr_fonts$loaded, font_url)
  dep <- htmltools::htmlDependency(
    name    = paste0("pikchr-font-", digest_simple(font_url)),
    version = "1.0",
    src     = c(href = ""),
    head    = paste0('<link href="', font_url, '" rel="stylesheet">')
  )
  knitr::knit_meta_add(list(dep))
  invisible(NULL)
}


#' Simple string hash for font dedup
#' @param x Character string.
#' @return Character hash.
#' @keywords internal
digest_simple <- function(x) {
  # Use first 8 chars of md5-like hash via chartr
  val <- sum(utf8ToInt(x) * seq_along(utf8ToInt(x)))
  sprintf("%08x", as.integer(val %% .Machine$integer.max))
}


#' Extract SVG intrinsic width from viewBox
#'
#' Parses the `viewBox` attribute from an SVG string and returns the width
#' in user units (typically px at 72 dpi).
#'
#' @param svg_string Character string containing SVG markup.
#' @return Numeric width or `NULL` if not found.
#' @keywords internal
extract_svg_width <- function(svg_string) {
  vb <- regmatches(svg_string, regexpr('viewBox="[^"]*"', svg_string))
  if (length(vb) == 0L) return(NULL)
  vb_vals <- gsub('viewBox="|"', "", vb)
  parts <- as.numeric(strsplit(trimws(vb_vals), "\\s+")[[1]])
  if (length(parts) >= 4L && !anyNA(parts)) parts[3] - parts[1] else NULL
}


#' Validate Knitr Chunk Options for Pikchr Engine
#'
#' Validates chunk options provided to the Pikchr engine. Numeric values for
#' logical options (`eval`, `echo`, `warning`) are converted to `TRUE` with a
#' warning.
#'
#' @param options A list of chunk options from knitr.
#' @return The validated options list.
#' @keywords internal
eng_pikchr_validate_options <- function(options) {
  no_numeric <- c("eval", "echo", "warning")
  for (option in no_numeric) {
    if (is.numeric(options[[option]])) {
      cli::cli_warn("Numeric {.arg {option}} chunk option not supported by pikchr engine.")
      options[[option]] <- TRUE
    }
  }
  options
}


#' Run Plot Hook and Record Plot Filenames
#'
#' Records the filename of a plot output in the knitr environment and runs the
#' current plot hook. Used internally for non-HTML outputs (LaTeX, DOCX, etc.).
#'
#' @param x Character path to the plot file.
#' @param options Knitr chunk options list.
#' @return The result of calling the knitr plot hook.
#' @keywords internal
run_hook_plot <- function(x, options) {
  if (!file.exists(x)) {
    cli::cli_abort("File not found: {.file {x}}")
  }

  opts_knit$append(plot_files = x)
  hook <- knit_hooks$get("plot")

  if (is.null(hook)) {
    cli::cli_abort("No plot hook defined in {.pkg knitr}.")
  }

  if (!is.null(options$align) && is.null(options$fig.align)) {
    options$fig.align <- options$align
  }

  tryCatch(
    hook(x, options),
    error = function(e) {
      cli::cli_abort("Error running plot hook: {e$message}")
    }
  )
}

