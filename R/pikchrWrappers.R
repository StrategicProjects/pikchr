#' Convert Pikchr Code to SVG
#'
#' This function converts a diagram description written in the Pikchr language into an SVG (Scalable Vector Graphics) format.
#' Pikchr is a diagram language inspired by PIC, and this function allows you to easily embed Pikchr diagrams as SVG images in your HTML or Markdown documents.
#'
#' @param code A character string containing the diagram code written in the Pikchr language.
#' @param width A character string representing the width of the rendered SVG. It accepts standard HTML values such as percentages ("75\%"), pixels ("300px"), or "auto". Defaults to "75\%".
#' @param height A character string representing the height of the rendered SVG. It accepts standard HTML values such as pixels ("300px") or "auto". Defaults to "auto".
#' @param fontSize A character string specifying the font size of the text within the SVG. It accepts standard HTML values such as percentages ("80\%"), pixels, or keywords ("large"). Defaults to "80\%".
#' @param fontFamily A character string specifying the font family for the text in the diagram. Common values include "inherit" (to use the page's default font), "Arial", "Times New Roman", etc. Defaults to "inherit".
#' @param class A character string specifying a CSS class to apply to the SVG. This can be used to style the SVG with external CSS rules. Defaults to "pikchr".
#' @param align A character string specifying the alignment of the SVG within its container. Options are "center" (default), "left", or "right". If set to "none", no alignment is applied.
#' @param css A character string containing extra CSS styles to apply directly to the SVG element. This allows additional customization beyond width, height, and font settings. If NULL, no extra styles are applied.
#' @param margin A character string specifying the margin around the SVG element, formatted like a CSS margin rule (e.g., "10px 0 10px 0"). Defaults to "10px 0 10px 0".
#' @param svgOnly Logical, whether to return only the raw SVG code (TRUE) or open the diagram in the Viewer window (FALSE, default).
#'
#' @return A character string containing the SVG diagram code if svgOnly = TRUE. Otherwise, the function opens the diagram in the Viewer window.
#' @examples
#' if(interactive()) {
#' pikchr('
#'   arrow right 200% "Rmarkdown" "Source"
#'   box rad 10px "Rmarkdown" "(knitr)" fit
#'   arrow right 200% "HTML+SVG" "Output"
#'   arrow <-> down from last box.s
#'   box same "Pikchr" "(pikchr.c)" fit
#'   ')
#'   }
#' @useDynLib pikchr 
#' @import htmltools
#' @import utils
#' @import stringr
#' @import rsvg
#' @import dplyr
#' @importFrom stringr str_replace
#' @importFrom htmltools HTML tags browsable
#' @export 
pikchr <- function(code, 
                   width = NULL, 
                   height = NULL, 
                   fontSize = "100%",
                   fontFamily = 'Jost',
                   class = "pikchr",
                   align = "none",
                   css = NULL,
                   margin = NULL,
                   svgOnly = FALSE) {
  code_clean <- stringr::str_replace_all(code, "\\\\*\\s*\\n\\s*then", " then")
  
  result <- .Call("pikchr_c", code_clean, class)
  
  if (is.null(margin)) {
    margin = "10px 0 10px 0"
  }
  
  viewbox <- stringr::str_extract(result, "(?<=(viewBox=\")).*(?=(\">))")
  bbox <- as.numeric(stringr::str_split(viewbox, "\\s", simplify = TRUE))
  bbox_height <- bbox[4] - bbox[2]
  bbox_width <-  bbox[3] - bbox[1]
  
  if (is.null(width)) width <- bbox_width
  if (is.null(width)) width <- bbox_height
  
  styles  = paste0("style='width:", width, 
                   ";height:", height, 
                   ";font-size:", fontSize,
                   ";font-family:", fontFamily,
                   ";margin:", margin, ";")
  if (!is.null(css)) {
    styles  = paste0(styles, css, "'") 
  } else {
    styles  = paste0(styles, "'") 
  }
  
  result <- stringr::str_remove(result, pattern = "style='font-size:initial;'") 
  result <- stringr::str_replace(result, pattern = "<svg",
                                 replacement = paste0("<svg ", styles)) 
  result <- stringr::str_replace(result, pattern = "<text",
                                 replacement = "<text lengthAdjust=\"spacingAndGlyphs\" ") 
  
  if (align != "none"){
    result <- paste0("<div class = \"container_", class, "\" style=\"text-align:", align, ';">', result, "</div>")
  }
  
  #data("google_fonts", package =  "pikchr")
  font_styles <- google_fonts %>% dplyr::filter(family == fontFamily) %>% dplyr::pull	(styles)
  if (length(font_styles) == 1L) {
    result <- stringr::str_replace(result, pattern = "(<svg.*?>)",
                                   replacement = paste0("\\1", '<def><style type="text/css">@import url(https://fonts.googleapis.com/css2?family=', stringr::str_replace_all(fontFamily, "\\s", "+"), font_styles, ');</style></def>'))
  } else {
    if (fontFamily != "inherit") message("Google font not founded, check the spelling. Using inherit.")
  }

  if (!svgOnly) {
    return(htmltools::browsable(htmltools::tags$html(htmltools::HTML(result))))
  } else
    return(htmltools::HTML(result))
}


#' Google Font List
#'
#' List of fonts and its stytles on google fonts site.
#' Report ...
#'
#' @format ## `google_fonts`
#' A data frame with 1,718 rows and 2 columns:
#' \describe{
#'   \item{family}{Font family names}
#'   \item{styles}{Font styles}
#' }
#' @source <https://fonts.google.com>
"google_fonts"


## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "4.1.0")  utils::globalVariables(c("."))
