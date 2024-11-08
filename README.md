---
title: "README"
output:
   html_document:
    keep_md: yes
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



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


```{=html}
<svg style='width:75%;height:auto;font-size:75%;font-family:Flamenco;margin:10px 0 10px 0;' xmlns='http://www.w3.org/2000/svg'  class="pikchr" viewBox="0 0 409.075 177.12"><def><style type="text/css">@import url(https://fonts.googleapis.com/css2?family=Flamenco:wght@300;400);</style></def>
<polygon points="146.16,27.36 134.64,31.68 134.64,23.04" style="fill:rgb(0,0,0)"/>
<path d="M2.16,27.36L140.4,27.36"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text lengthAdjust="spacingAndGlyphs"  x="74.16" y="15.66" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Rmarkdown</text>
<text x="74.16" y="39.06" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Source</text>
<path d="M161.16,52.56L243.595,52.56A15 15 0 0 0 258.595 37.56L258.595,17.16A15 15 0 0 0 243.595 2.16L161.16,2.16A15 15 0 0 0 146.16 17.16L146.16,37.56A15 15 0 0 0 161.16 52.56Z"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="202.378" y="17.28" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Rmarkdown</text>
<text x="202.378" y="37.44" text-anchor="middle" font-weight="bold" fill="rgb(0,0,0)" dominant-baseline="central">(knitr)</text>
<polygon points="402.595,27.36 391.075,31.68 391.075,23.04" style="fill:rgb(0,0,0)"/>
<path d="M258.595,27.36L396.835,27.36"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="330.595" y="15.66" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">HTML+SVG</text>
<text x="330.595" y="39.06" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Output</text>
<polygon points="202.378,52.56 206.698,64.08 198.058,64.08" style="fill:rgb(0,0,0)"/>
<polygon points="202.378,124.56 198.058,113.04 206.698,113.04" style="fill:rgb(0,0,0)"/>
<path d="M202.378,58.32L202.378,118.8"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<path d="M167.076,174.96L237.68,174.96A15 15 0 0 0 252.68 159.96L252.68,139.56A15 15 0 0 0 237.68 124.56L167.076,124.56A15 15 0 0 0 152.076 139.56L152.076,159.96A15 15 0 0 0 167.076 174.96Z"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="202.378" y="139.68" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Pikchr</text>
<text x="202.378" y="159.84" text-anchor="middle" font-weight="bold" fill="rgb(0,0,0)" dominant-baseline="central">(pikchr.c)</text>
</svg>

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


<div class = "container_pikchr inline-svg  unnamed-chunk-5" style="text-align:center;"><svg style='width:50%;height:auto;font-size:14;font-family:Jost;margin:10px 0 10px 0;' xmlns='http://www.w3.org/2000/svg'  class="pikchr inline-svg  unnamed-chunk-5" viewBox="0 0 409.075 177.12"><def><style type="text/css">@import url(https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900);</style></def>
<polygon points="146.16,27.36 134.64,31.68 134.64,23.04" style="fill:rgb(0,0,0)"/>
<path d="M2.16,27.36L140.4,27.36"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text lengthAdjust="spacingAndGlyphs"  x="74.16" y="15.66" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Rmarkdown</text>
<text x="74.16" y="39.06" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Source</text>
<path d="M161.16,52.56L243.595,52.56A15 15 0 0 0 258.595 37.56L258.595,17.16A15 15 0 0 0 243.595 2.16L161.16,2.16A15 15 0 0 0 146.16 17.16L146.16,37.56A15 15 0 0 0 161.16 52.56Z"  style="fill:rgb(238,150,75);stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="202.378" y="17.28" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Rmarkdown</text>
<text x="202.378" y="37.44" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">(knitr)</text>
<polygon points="402.595,27.36 391.075,31.68 391.075,23.04" style="fill:rgb(0,0,0)"/>
<path d="M258.595,27.36L396.835,27.36"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="330.595" y="15.66" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">HTML+SVG</text>
<text x="330.595" y="39.06" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Output</text>
<polygon points="202.378,52.56 206.698,64.08 198.058,64.08" style="fill:rgb(0,0,0)"/>
<polygon points="202.378,124.56 198.058,113.04 206.698,113.04" style="fill:rgb(0,0,0)"/>
<path d="M202.378,58.32L202.378,118.8"  style="fill:none;stroke-width:2.16;stroke:rgb(0,0,0);" />
<path d="M171.125,174.96L233.63,174.96A15 15 0 0 0 248.63 159.96L248.63,139.56A15 15 0 0 0 233.63 124.56L171.125,124.56A15 15 0 0 0 156.125 139.56L156.125,159.96A15 15 0 0 0 171.125 174.96Z"  style="fill:rgb(244,211,94);stroke-width:2.16;stroke:rgb(0,0,0);" />
<text x="202.378" y="139.68" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">Pikchr</text>
<text x="202.378" y="159.84" text-anchor="middle" fill="rgb(0,0,0)" dominant-baseline="central">(pikchr.c)</text>
</svg>
</div>

