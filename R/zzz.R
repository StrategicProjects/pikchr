utils::globalVariables(c("google_fonts", "family"))
.onLoad <- function(libname, pkgname){
  options(knitr.svg.object = TRUE)
  knitr::knit_engines$set(pikchr = eng_pikchr)
}
