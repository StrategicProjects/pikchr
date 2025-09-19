
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pikchr <a href="https://github.com/StrategicProjects/pikchr"><img src="man/figures/logo.png" align="right" height="139" alt="pikchr website" /></a>

<!-- badges: start -->

![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/pikchr)  
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/grand-total/pikchr)
  ![](https://img.shields.io/badge/devel%20version-1.0.4-blue.svg)
<!-- badges: end -->

Welcome to the `pikchr` package website, an R interface for the **PIC
diagramming language**, powered by the parser from <https://pikchr.org>.
The `pikchr` package allows you to create diagrams directly within R,
combining simplicity and precision for efficient diagram generation.

With `pikchr`, you can produce complex diagrams for documentation,
presentations, articles, and more, all from your R environment. The
straightforward nature of the **PIC language**, paired with the power of
R, makes this package a valuable tool for those needing precise,
customizable visualizations in academic, technical, and scientific
projects. Discover how `pikchr` can enhance and streamline your
diagramming workflow!

\## Installation

You can install directly from CRAN or the development version of pikchr
from [GitHub](https://github.com/) with:

``` r
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

<svg style='width:75%;height:auto;font-size:75%;font-family:Flamenco;margin:10px 0 10px 0;' xmlns='http://www.w3.org/2000/svg'  class="pikchr" viewBox="0 0 409.075 177.12" data-pikchr-date="20250321215505"><def><style type="text/css">@import url(https://fonts.googleapis.com/css2?family=Flamenco:wght@300;400);</style></def>
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

<div class="container_pikchr inline-svg unnamed-chunk-5"
style="text-align:center;">

<svg style="width:50%;height:auto;font-size:14;font-family:Jost;margin:10px 0 10px 0;" xmlns="http://www.w3.org/2000/svg" class="pikchr inline-svg  unnamed-chunk-5" viewBox="0 0 409.075 177.12" data-pikchr-date="20250321215505">

<def><style type="text/css">@import
url(<https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900>);</style></def>
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

``` r
lgt = .2

define hex_up { 
    A:line right $1*(sqrt(3)/2) down $1/2 \
        then down $1 \
        then down $1/2 left $1*(sqrt(3)/2) \
        then up $1/2 left $1*(sqrt(3)/2) \
        then up $1 \
        then right $1*(sqrt(3)/2) up $1/2 \
        close color $3 fill $4
    text $2 at last .c color $5
}

define hex_dgr {
   P:(0,0)
   C1: circle rad .01 with .c at P.c thin color $2
   C2: circle rad .01 with .c at C1.c + ($1*(sqrt(3)/2), -$1/2) thin color $2
   C3: circle rad .01 with .c at C2.c + (0, -$1) thin  color $2
   C4: circle rad .01 with .c at C3.c + (-$1*(sqrt(3)/2), -$1/2) thin color $2
   C5: circle rad .01 with .c at C4.c + (-$1*(sqrt(3)/2), $1/2) thin color $2
   C6: circle rad .01 with .c at C5.c + (0, $1) thin color $2
   L1: line from C1.se to C2.nw thin color $2
   L2: line from C2.s to C3.n thin color $2
   L3: line from C3.sw to C4.ne thin color $2
   L4: line from C4.nw to C5.se thin color $2
   L5: line from C5.n to C6.s thin color $2
   L6: line from C6.ne to C1.sw thin color $2
   
}


H2: [hex_up(lgt ,  "Pikchr" small, 0x196F3D, 0x27AE60, white)]
H3: [hex_dgr(lgt*.8, 0x7DCEA0)] with .c at H2.c
H4: [hex_dgr(lgt*.6, 0x52BE80)] with .c at H2.c
```

<div class="container_pikchr inline-svg unnamed-chunk-6"
style="text-align:center;">

<svg style="width:25%;height:auto;font-size:50%;font-family:MonteCarlo;margin:10px 0 10px 0;" xmlns="http://www.w3.org/2000/svg" class="pikchr inline-svg  unnamed-chunk-6" viewBox="0 0 59.2474 61.92" data-pikchr-date="20250321215505">

<def><style type="text/css">@import
url(<https://fonts.googleapis.com/css2?family=MonteCarlo:wght@400>);</style></def>
<path d="M29.6237,2.16L54.5652,16.56L54.5652,45.36L29.6237,59.76L4.68215,45.36L4.68215,16.56L29.6237,2.16Z"  style="fill:rgb(39,174,96);stroke-width:2.16;stroke-linejoin:round;stroke:rgb(25,111,61);" />
<text lengthAdjust="spacingAndGlyphs"  x="29.6237" y="30.96" text-anchor="middle" fill="rgb(255,255,255)" font-size="80%" dominant-baseline="central">Pikchr</text>
<circle cx="29.6237" cy="7.92" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="49.5769" cy="19.44" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="49.5769" cy="42.48" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="29.6237" cy="54" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="9.67045" cy="42.48" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="9.67045" cy="19.44" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M30.6419,8.93823L48.5587,18.4218"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M49.5769,20.88L49.5769,41.04"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M48.5587,43.4982L30.6419,52.9818"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M28.6054,52.9818L10.6887,43.4982"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M9.67045,41.04L9.67045,20.88"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<path d="M10.6887,18.4218L28.6054,8.93823"  style="fill:none;stroke-width:1.4472;stroke:rgb(125,206,160);" />
<circle cx="29.6237" cy="13.68" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<circle cx="44.5886" cy="22.32" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<circle cx="44.5886" cy="39.6" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<circle cx="29.6237" cy="48.24" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<circle cx="14.6588" cy="39.6" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<circle cx="14.6588" cy="22.32" r="1.44"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M30.6419,14.6982L43.5704,21.3018"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M44.5886,23.76L44.5886,38.16"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M43.5704,40.6182L30.6419,47.2218"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M28.6054,47.2218L15.677,40.6182"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M14.6588,38.16L14.6588,23.76"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
<path d="M15.677,21.3018L28.6054,14.6982"  style="fill:none;stroke-width:1.4472;stroke:rgb(82,190,128);" />
</svg>

</div>
