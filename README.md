# pikchr

<!-- badges: start -->
![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/pikchr) &nbsp; 
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/grand-total/pikchr) &nbsp; 
![](https://img.shields.io/badge/devel%20version-1.0.0-blue.svg)
<!-- badges: end -->


Welcome to the `pikchr` package website, an R interface for the **PIC diagramming language**, powered by the parser from <https://pikchr.org>. The `pikchr` package allows you to create diagrams directly within R, combining simplicity and precision for efficient diagram generation.

With `pikchr`, you can produce complex diagrams for documentation, presentations, articles, and more, all from your R environment. The straightforward nature of the **PIC language**, paired with the power of R, makes this package a valuable tool for those needing precise, customizable visualizations in academic, technical, and scientific projects. Discover how `pikchr` can enhance and streamline your diagramming workflow!

## Installation

You can install directly from CRAN or the development version of pikchr from [GitHub](https://github.com/) with:

```r
# install.packages("pak")
pak::pak("StrategicProjects/pikchr")
```


``` r
library(pikchr)

pikchr('
/*
basic example code
*/
arrow right 200% "Rmarkdown" "Source" # teste
box rad 10px "Rmarkdown" "(knitr)" bold  fit
arrow right 200% "HTML+SVG" "Output" 
arrow <-> down from last box.s
box same "Pikchr" "(pikchr.c)" bold fit
',
width = "75%", 
height = "auto",
fontSize = '75%',
fontFamily = "Flamenco")
```


You can also use the `{pikchr}` engine in a `Rmarkdown` document.


```` default
```{pikchr}
#| width: 50%
#| height: auto
#| align: center
#| fontSize: 14
#| fontFamily: Jost
/*
basic example code in a markdown chunk.
*/
arrow right 200% "Rmarkdown" "Source" # teste
box rad 10px "Rmarkdown" "(knitr)"  fit fill 0xEE964B
arrow right 200% "HTML+SVG" "Output" 
arrow <-> down from last box.s
box same "Pikchr" "(pikchr.c)" fit fill 0xF4D35E
```
````
