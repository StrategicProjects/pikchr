# Pikchr User Manual

> **Disclaimer** The text of this manual was authored by D. Richard Hipp
> and is available on the official pikchr.org website. All links have
> been preserved to direct users to the original site for further
> reference. We extend our sincere gratitude to D. Richard Hipp for his
> outstanding work in adapting the original PIC language by Brian
> Kernighan into the modern pikchr tool, bringing new accessibility and
> utility to diagram generation.

## Introduction

This is a guide to generating diagrams using Pikchr, pronounced
“picture.” This guide is designed to teach you to use Pikchr in a more
accessible manner than you get by reading the [grammar
specification](https://pikchr.org/home/doc/trunk/doc/grammar.md). We
leave discussion of the scope and purpose of Pikchr to a [separate
document](https://pikchr.org/home/doc/trunk/doc/purpose.md).

For more details and other perspectives, see the following resources:

- [Step-by-step example of writing a Pikchr
  document](https://pikchr.org/home/doc/trunk/doc/teardown01.md)
- [The original Kernighan paper on
  PIC](https://pikchr.org/home/uv/pic.pdf)
- [Differences between PIC and
  Pikchr](https://pikchr.org/home/doc/trunk/doc/differences.md)
- [ESR’s documentation on GnuPIC](https://pikchr.org/home/uv/gpic.pdf)
- [DPIC documentation](https://pikchr.org/home/uv/dpic-doc.pdf)

## Running Pikchr Scripts 

The design goal of Pikchr is to enable embedded line diagrams in
Markdown or other simple markup languages. The details on how to embed
Pikchr in Markdown is [covered
separately](https://pikchr.org/home/doc/trunk/doc/usepikchr.md). For the
purpose of this tutorial, we will only write pure Pikchr scripts without
the surrounding markup. To experiment with Pikchr, visit the
[/pikchrshow](https://pikchr.org/home/pikchrshow) page on the website
hosting this document (preferably in a separate window). Type in the
following script and press the Preview button:

``` pikchr
     line; box "Hello," "World!"; arrow
```

If you do this right, the output should appear as:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjYwLjY0O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMyIgdmlld2JveD0iMCAwIDI2MC42NCA3Ni4zMiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDM4LjE2TDc0LjE2LDM4LjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48cGF0aCBkPSJNNzQuMTYsNzQuMTZMMTgyLjE2LDc0LjE2TDE4Mi4xNiwyLjE2TDc0LjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjEyOC4xNiIgeT0iMjguMDgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5IZWxsbyw8L3RleHQ+PHRleHQgeD0iMTI4LjE2IiB5PSI0OC4yNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPldvcmxkITwvdGV4dD48cG9seWdvbiBwb2ludHM9IjI1NC4xNiwzOC4xNiAyNDIuNjQsNDIuNDggMjQyLjY0LDMzLjg0IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTE4Mi4xNiwzOC4xNkwyNDguNCwzOC4xNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PC9zdmc+)

So there you go: you’ve created and rendered your first diagram using
Pikchr! You will do well to keep that /pikchrshow screen handy, in a
separate browser window, so that you can try out scripts as you proceed
through this tutorial.

## Viewing Pikchr Script Source Code For This Document 

For this particular document, you can click on any of the diagrams
rendered by Pikchr and the display will convert to showing you the
original Pikchr source text. Click again to go back to seeing the
rendered diagram.

The click-to-change-view behavior is a property of this one particular
document and is not a general capability of Pikchr. On other documents
containing Pikchr diagrams that are generated using Fossil you can use
Ctrl-click (Option-click on Macs) to toggle the view. That is, click on
the diagram while holding down the Ctrl key or the Option key. This is
not possible if you are on a tablet or phone, since you don’t have a
Ctrl or Option key to hold down there. Other systems might not implement
the view-swapping behavior at all. This is a platform-depending feature
that is one layer above Pikchr itself.

## About Pikchr Scripts 

Pikchr is designed to be simple. A Pikchr script is just a sequence of
Pikchr statements, separated by either new-lines or semicolons. The
“Hello, world!” example above used three statements, a “line”, a “box”,
and an “arrow”, each separated by semicolons.

Whitespace (other than newlines) and comments are ignored. Comments in
pikchr can be in the style of TCL, C, or C++. That is to say, comments
consist of a “`#`” or “`//`” and include all characters up to but not
including the next new-line, or all text in between “`/*`” and the first
following “`*/`”. The example script above could be rewritten with each
statement on a separate line, and with comments describing what each
statement is doing:

``` pikchr
    # The first component of the drawing is a line
    line
    // The second component is a box with text "Hello, World!"
    box "Hello," "World!"
    /* Finally an arrow */
    arrow
```

Remember that new-lines separate statements. If you have a long
statement that needs to be split into multiple lines, escape the newline
with a backslash character and the new-line will be treated as any other
space:

``` pikchr
    line
    box \
       "Hello," \
       "World!"
    arrow
```

So, a Pikchr script is just a list of statements, but what is a
statement?

## Pikchr Statements 

*Most* statements are descriptions of a single graphic object that
becomes part of the diagram. The first token of the statement is the
object class-name. The following classes are currently supported:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NTYyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNiIgdmlld2JveD0iMCAwIDU2Mi4zMiAzNzIuMjQiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI1Ni4xNiIgeT0iMzguMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5ib3g8L3RleHQ+PGNpcmNsZSBjeD0iMjAwLjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMjAwLjE2IiB5PSIzOC4xNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmNpcmNsZTwvdGV4dD48ZWxsaXBzZSBjeD0iMzQ0LjE2IiBjeT0iMzguMTYiIHJ4PSI1NCIgcnk9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9lbGxpcHNlPjx0ZXh0IHg9IjM0NC4xNiIgeT0iMzguMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5lbGxpcHNlPC90ZXh0PjxwYXRoIGQ9Ik00NTIuMTYsNzQuMTZMNTI0LjE2LDc0LjE2QTM2IDM2IDAgMCAwIDU2MC4xNiAzOC4xNkEzNiAzNiAwIDAgMCA1MjQuMTYgMi4xNkw0NTIuMTYsMi4xNkEzNiAzNiAwIDAgMCA0MTYuMTYgMzguMTZBMzYgMzYgMCAwIDAgNDUyLjE2IDc0LjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iNDg4LjE2IiB5PSIzOC4xNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPm92YWw8L3RleHQ+PHBhdGggZD0iTTIuMTYsMTI4LjE2TDIuMTYsMTc4LjU2QTU0IDEwLjggMCAwIDAgMTEwLjE2IDE3OC41NkwxMTAuMTYsMTI4LjE2QTU0IDEwLjggMCAwIDAgMi4xNiAxMjguMTZBNTQgMTAuOCAwIDAgMCAxMTAuMTYgMTI4LjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSI1Ni4xNiIgeT0iMTYxLjQ2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Y3lsaW5kZXI8L3RleHQ+PHBhdGggZD0iTTE2NC4xNiwyMDcuMzZMMjM2LjE2LDIwNy4zNkwyMzYuMTYsMTIwLjk2TDIxNC41Niw5OS4zNkwxNjQuMTYsOTkuMzZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48cGF0aCBkPSJNMjE0LjU2LDk5LjM2TDIxNC41NiwxMjAuOTZMMjM2LjE2LDEyMC45NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMjAwLjE2IiB5PSIxNTMuMzYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5maWxlPC90ZXh0PjxwYXRoIGQ9Ik0yNzIuMTYsMTUzLjM2TDM0NC4xNiwyMDcuMzZMNDE2LjE2LDE1My4zNkwzNDQuMTYsOTkuMzZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIzNDQuMTYiIHk9IjE1My4zNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmRpYW1vbmQ8L3RleHQ+PHBhdGggZD0iTTIuMTYsMjY4LjU2TDc0LjE2LDI2OC41NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMzguMTYiIHk9IjI1Ni44NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmxpbmU8L3RleHQ+PHBvbHlnb24gcG9pbnRzPSIyNTQuMTYsMjY4LjU2IDI0Mi42NCwyNzIuODggMjQyLjY0LDI2NC4yNCIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xODIuMTYsMjY4LjU2TDI0OC40LDI2OC41NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMjE4LjE2IiB5PSIyNTYuODYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5hcnJvdzwvdGV4dD48cGF0aCBkPSJNMzIwLjIwNywyNzkuODk5IEwgMzMxLjAwNywyNzkuODk5IFEgMzQxLjgwNywyNzkuODk5IDM1Mi42MDcsMjYxLjE5MiBRIDM2My40MDcsMjQyLjQ4NiAzNzUuNzIsMjc2LjMxNSBRIDM4OC4wMzMsMzEwLjE0NCAzOTcuODgzLDI4My4wODEgUSA0MDcuNzMzLDI1Ni4wMTggNDE4LjUzMywyNTYuMDE4IEwgNDI5LjMzMywyNTYuMDE4IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIzNjMuNDA3IiB5PSIyNDIuNDg2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+c3BsaW5lPC90ZXh0PjxjaXJjbGUgY3g9IjM4LjE2IiBjeT0iMzU0Ljk2IiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMzguMTYiIHk9IjMyOC41MDEiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5kb3Q8L3RleHQ+PHBhdGggZD0iTTE4Mi4xNiwzNTQuOTZRMjE4LjE2LDM1NC45NiAyMTguMTYsMzE4Ljk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIxODIuMTYiIHk9IjMxOC45NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmFyYzwvdGV4dD48dGV4dCB4PSIzNjkuMzYiIHk9IjM1NC45NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnRleHQ8L3RleHQ+PC9zdmc+)

A statement can be only the class-name and nothing else, but the
class-name is usually followed by one or more “attributes”. Attributes
are used to modify the appearance of the object, or to position the
object relative to prior objects.

So to revisit the [“Hello, World” demonstration script
above](#firstdemo), we see that that script contains three object
descriptions:

1.  A “line” object with no attributes (meaning that the line is shown
    with no changes to its default appearance).
2.  A “box” object with two string literal attributes. The string
    literal attributes cause the corresponding strings to be drawn
    inside the box.
3.  An “arrow” object with no attributes.

## Layout 

By default, objects are stacked beside each other from left to right.
The Pikchr layout engine keeps track of the “layout direction”, which
can be one of “right”, “down”, “left”, or “up”. The layout direction
defaults to “right”, but you can change it using a statement which
consists of just the name of the new direction. So, if we insert the
“down” statement in front of our test script, like this:

``` pikchr
    down
    line
    box  "Hello,"  "World!"
    arrow
```

Then the objects are stacked moving downward:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstOCIgdmlld2JveD0iMCAwIDExMi4zMiAyMjQuNjQiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNNTYuMTYsMi4xNkw1Ni4xNiw3NC4xNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTIuMTYsMTQ2LjE2TDExMC4xNiwxNDYuMTZMMTEwLjE2LDc0LjE2TDIuMTYsNzQuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjU2LjE2IiB5PSIxMDAuMDgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5IZWxsbyw8L3RleHQ+PHRleHQgeD0iNTYuMTYiIHk9IjEyMC4yNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPldvcmxkITwvdGV4dD48cG9seWdvbiBwb2ludHM9IjU2LjE2LDIxOC4xNiA1MS44NCwyMDYuNjQgNjAuNDgsMjA2LjY0IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTU2LjE2LDE0Ni4xNkw1Ni4xNiwyMTIuNCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PC9zdmc+)

Or, you can change the layout direction to “left”:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjYwLjY0O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstOSIgdmlld2JveD0iMCAwIDI2MC42NCA3Ni4zMiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yNTguNDgsMzguMTZMMTg2LjQ4LDM4LjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48cGF0aCBkPSJNNzguNDgsNzQuMTZMMTg2LjQ4LDc0LjE2TDE4Ni40OCwyLjE2TDc4LjQ4LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjEzMi40OCIgeT0iMjguMDgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5IZWxsbyw8L3RleHQ+PHRleHQgeD0iMTMyLjQ4IiB5PSI0OC4yNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPldvcmxkITwvdGV4dD48cG9seWdvbiBwb2ludHM9IjYuNDgsMzguMTYgMTgsMzMuODQgMTgsNDIuNDgiIHN0eWxlPSJmaWxsOnJnYigwLDAsMCkiPjwvcG9seWdvbj48cGF0aCBkPSJNNzguNDgsMzguMTZMMTIuMjQsMzguMTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjwvc3ZnPg==)

Or to “up”:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMTAiIHZpZXdib3g9IjAgMCAxMTIuMzIgMjI0LjY0IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTU2LjE2LDIyMi40OEw1Ni4xNiwxNTAuNDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxwYXRoIGQ9Ik0yLjE2LDE1MC40OEwxMTAuMTYsMTUwLjQ4TDExMC4xNiw3OC40OEwyLjE2LDc4LjQ4WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI1Ni4xNiIgeT0iMTA0LjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5IZWxsbyw8L3RleHQ+PHRleHQgeD0iNTYuMTYiIHk9IjEyNC41NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPldvcmxkITwvdGV4dD48cG9seWdvbiBwb2ludHM9IjU2LjE2LDYuNDggNjAuNDgsMTggNTEuODQsMTgiIHN0eWxlPSJmaWxsOnJnYigwLDAsMCkiPjwvcG9seWdvbj48cGF0aCBkPSJNNTYuMTYsNzguNDhMNTYuMTYsMTIuMjQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjwvc3ZnPg==)

It is common to stack line objects (lines, arrows, splines) against
block objects (boxes, circles, ovals, etc.), but this is not required.
You can stack a bunch of block objects together. For example:

``` pikchr
    box; circle; cylinder
```

Yields:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjkyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMTIiIHZpZXdib3g9IjAgMCAyOTIuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHBhdGggZD0iTTE4Mi4xNiwxMi45NkwxODIuMTYsNjMuMzZBNTQgMTAuOCAwIDAgMCAyOTAuMTYgNjMuMzZMMjkwLjE2LDEyLjk2QTU0IDEwLjggMCAwIDAgMTgyLjE2IDEyLjk2QTU0IDEwLjggMCAwIDAgMjkwLjE2IDEyLjk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48L3N2Zz4=)

More often, you want to put space in between the block objects. The
special “move” object exists for that purpose. Consider:

``` pikchr
    box; move; circle; move; cylinder
```

This script creates the same three block objects but with whitespace in
between them:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NDM2LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMTQiIHZpZXdib3g9IjAgMCA0MzYuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMjE4LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHBhdGggZD0iTTMyNi4xNiwxMi45NkwzMjYuMTYsNjMuMzZBNTQgMTAuOCAwIDAgMCA0MzQuMTYgNjMuMzZMNDM0LjE2LDEyLjk2QTU0IDEwLjggMCAwIDAgMzI2LjE2IDEyLjk2QTU0IDEwLjggMCAwIDAgNDM0LjE2IDEyLjk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48L3N2Zz4=)

Implementation note: a “move” is really just an invisible “`line`,”
which is why the following script generates the same output as the
previous. ([Try
it!](https://pikchr.org/home/pikchrshow?content=box;line%20invisible;circle;line%20invisible;cylinder))

``` pikchr
    box; line invisible; circle; line invisible; cylinder
```

## Controlling Layout Using Attributes 

The automatic stacking of objects is convenient in many cases, but most
diagrams will want some objects placed somewhere other than immediately
adjacent to their predecessor. For that reason, layout attributes are
provided that allow precise placement of objects.

To see how this works, consider the previous example of a box, circle,
and cylinder separated by some space. Suppose we want to draw an arrow
that goes downward out of the box, then right, then up into the
cylinder. The complete script might look something like this:

``` pikchr
    box; move; circle; move; cylinder
    arrow from first box.s \
          down 1cm \
          then right until even with first cylinder \
          then to first cylinder.s
```

This script results in the following diagram:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NDM2LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMTciIHZpZXdib3g9IjAgMCA0MzYuMzIgMTMzLjAxMyIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDc0LjE2TDExMC4xNiw3NC4xNkwxMTAuMTYsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48Y2lyY2xlIGN4PSIyMTguMTYiIGN5PSIzOC4xNiIgcj0iMzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48cGF0aCBkPSJNMzI2LjE2LDEyLjk2TDMyNi4xNiw2My4zNkE1NCAxMC44IDAgMCAwIDQzNC4xNiA2My4zNkw0MzQuMTYsMTIuOTZBNTQgMTAuOCAwIDAgMCAzMjYuMTYgMTIuOTZBNTQgMTAuOCAwIDAgMCA0MzQuMTYgMTIuOTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzgwLjE2LDc0LjE2IDM4NC40OCw4NS42OCAzNzUuODQsODUuNjgiIHN0eWxlPSJmaWxsOnJnYigwLDAsMCkiPjwvcG9seWdvbj48cGF0aCBkPSJNNTYuMTYsNzQuMTZMNTYuMTYsMTMwLjg1M0wzODAuMTYsMTMwLjg1M0wzODAuMTYsNzkuOTIiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48L3N2Zz4=)

That is indeed the image we want, but there are a lot of words on that
“arrow” statement! Don’t panic, though. It’s actually pretty simple.
We’ll take it apart and explain it piece by piece.

First note that the “arrow” statement is broken up into four separate
lines of text, with a “`\`” at the end of the first three lines to
prevent the subsequent new-line from prematurely closing the statement.
Splitting up the arrow into separate lines this way is purely for human
readability. If you are more comfortable putting the whole statement on
one line, that is fine too. Pikchr doesn’t care. Just be sure to
remember the backslashes if you do split lines!

The attributes on the “arrow” statement describe the path taken by the
arrow. The first attribute is “`from first box.s`”. This “from”
attribute specifies where the arrow starts. In this case, it starts at
the “s” (or “south”) anchor point of the “first box”. The “first box”
part is probably self explanatory. (You can also write it as “1st box”
instead of “first box”, and in fact legacy-PIC requires the use of “1st”
instead of “first”.) But what is the “.s” part?

Every block object has eight anchor points on its perimeter that are
named for compass points, like this:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NjA5Ljk4NDtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTE4IiB2aWV3Ym94PSIwIDAgNjA5Ljk4NCAxMTYuNjQiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMzcuMDY1Niw5NC4zMkwxNDUuMDY2LDk0LjMyTDE0NS4wNjYsMjIuMzJMMzcuMDY1NiwyMi4zMloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjM3LjA2NTYiIGN5PSIyMi4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjM3LjA2NTYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0iZW5kIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4ubnfCoDwvdGV4dD48Y2lyY2xlIGN4PSIzNy4wNjU2IiBjeT0iNTguMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMzcuMDY1NiIgeT0iNTguMzIiIHRleHQtYW5jaG9yPSJlbmQiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPi53wqA8L3RleHQ+PGNpcmNsZSBjeD0iMzcuMDY1NiIgY3k9Ijk0LjMyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjM3LjA2NTYiIHk9IjEwNC40IiB0ZXh0LWFuY2hvcj0iZW5kIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4uc3fCoDwvdGV4dD48Y2lyY2xlIGN4PSI5MS4wNjU2IiBjeT0iOTQuMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iOTEuMDY1NiIgeT0iMTA0LjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPi5zPC90ZXh0PjxjaXJjbGUgY3g9IjE0NS4wNjYiIGN5PSI5NC4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSIxNDUuMDY2IiB5PSIxMDQuNCIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj7CoC5zZTwvdGV4dD48Y2lyY2xlIGN4PSIxNDUuMDY2IiBjeT0iNTguMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMTQ1LjA2NiIgeT0iNTguMzIiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqAuZTwvdGV4dD48Y2lyY2xlIGN4PSIxNDUuMDY2IiBjeT0iMjIuMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMTQ1LjA2NiIgeT0iMTIuMjQiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqAubmU8L3RleHQ+PGNpcmNsZSBjeD0iOTEuMDY1NiIgY3k9IjIyLjMyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjkxLjA2NTYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4ubjwvdGV4dD48Y2lyY2xlIGN4PSI5MS4wNjU2IiBjeT0iNTguMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iOTEuMDY1NiIgeT0iNTguMzIiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqAuYzwvdGV4dD48Y2lyY2xlIGN4PSIzMDcuMDY2IiBjeT0iNTguMzIiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PGNpcmNsZSBjeD0iMjgxLjYxIiBjeT0iMzIuODY0MiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSIyODEuNjEiIHk9IjIyLjc4NDIiIHRleHQtYW5jaG9yPSJlbmQiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPi5ud8KgPC90ZXh0PjxjaXJjbGUgY3g9IjI3MS4wNjYiIGN5PSI1OC4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSIyNzEuMDY2IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+LnfCoDwvdGV4dD48Y2lyY2xlIGN4PSIyODEuNjEiIGN5PSI4My43NzU4IiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjI4MS42MSIgeT0iOTMuODU1OCIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+LnN3wqA8L3RleHQ+PGNpcmNsZSBjeD0iMzA3LjA2NiIgY3k9Ijk0LjMyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjMwNy4wNjYiIHk9IjEwNC40IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4uczwvdGV4dD48Y2lyY2xlIGN4PSIzMzIuNTIxIiBjeT0iODMuNzc1OCIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSIzMzIuNTIxIiB5PSI5My44NTU4IiB0ZXh0LWFuY2hvcj0ic3RhcnQiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPsKgLnNlPC90ZXh0PjxjaXJjbGUgY3g9IjM0My4wNjYiIGN5PSI1OC4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSIzNDMuMDY2IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj7CoC5lPC90ZXh0PjxjaXJjbGUgY3g9IjMzMi41MjEiIGN5PSIzMi44NjQyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjMzMi41MjEiIHk9IjIyLjc4NDIiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqAubmU8L3RleHQ+PGNpcmNsZSBjeD0iMzA3LjA2NiIgY3k9IjIyLjMyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjMwNy4wNjYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4ubjwvdGV4dD48Y2lyY2xlIGN4PSIzMDcuMDY2IiBjeT0iNTguMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iMzA3LjA2NiIgeT0iNTguMzIiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqAuYzwvdGV4dD48cGF0aCBkPSJNNDY5LjA2NiwzMy4xMkw0NjkuMDY2LDgzLjUyQTU0IDEwLjggMCAwIDAgNTc3LjA2NiA4My41Mkw1NzcuMDY2LDMzLjEyQTU0IDEwLjggMCAwIDAgNDY5LjA2NiAzMy4xMkE1NCAxMC44IDAgMCAwIDU3Ny4wNjYgMzMuMTIiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjQ2OS4wNjYiIGN5PSIzMy4xMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI0NjkuMDY2IiB5PSIyMy4wNCIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDI1NSwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Lm53wqA8L3RleHQ+PGNpcmNsZSBjeD0iNDY5LjA2NiIgY3k9IjU4LjMyIiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjQ2OS4wNjYiIHk9IjU4LjMyIiB0ZXh0LWFuY2hvcj0iZW5kIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4ud8KgPC90ZXh0PjxjaXJjbGUgY3g9IjQ2OS4wNjYiIGN5PSI4My41MiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI0NjkuMDY2IiB5PSI5My42IiB0ZXh0LWFuY2hvcj0iZW5kIiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj4uc3fCoDwvdGV4dD48Y2lyY2xlIGN4PSI1MjMuMDY2IiBjeT0iOTQuMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iNTIzLjA2NiIgeT0iMTA0LjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPi5zPC90ZXh0PjxjaXJjbGUgY3g9IjU3Ny4wNjYiIGN5PSI4My41MiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI1NzcuMDY2IiB5PSI5My42IiB0ZXh0LWFuY2hvcj0ic3RhcnQiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPsKgLnNlPC90ZXh0PjxjaXJjbGUgY3g9IjU3Ny4wNjYiIGN5PSI1OC4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI1NzcuMDY2IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj7CoC5lPC90ZXh0PjxjaXJjbGUgY3g9IjU3Ny4wNjYiIGN5PSIzMy4xMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI1NzcuMDY2IiB5PSIyMy4wNCIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj7CoC5uZTwvdGV4dD48Y2lyY2xlIGN4PSI1MjMuMDY2IiBjeT0iMjIuMzIiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHRleHQgeD0iNTIzLjA2NiIgeT0iMTIuMjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigyNTUsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPi5uPC90ZXh0PjxjaXJjbGUgY3g9IjUyMy4wNjYiIGN5PSI1OC4zMiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48dGV4dCB4PSI1MjMuMDY2IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMjU1LDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj7CoC5jPC90ZXh0Pjwvc3ZnPg==)

As you can see, there is also a ninth point in the middle called “.c”.
Every block object has these anchor points; you can refer to them when
positioning the object itself, or when positioning other objects
relative to the block object.

The next phrase on the “arrow” statement is “`down 1cm`”. As you might
guess, this phrase causes the arrow to move downward from its previous
position (its starting point) by 1 centimeter. This phrase highlights a
key enhancement of Pikchr over PIC, which did everything in inches only.
No units were allowed. Pikchr allows you to attach units to
measurements, as in this case where it is “1cm”. Internally, Pikchr
still keeps track of everything in inches for compatibility with PIC, so
the “1cm” token is really just an alternative spelling for the numeric
constant “0.39370078740157480316”, which is the inch-equivalent of 1
centimeter. Surely you agree that “1cm” is much easier to read and
write! Other units recognized by Pikchr are “px” for pixels, “pt” for
points, “pc” for picas, “mm” for millimeters, and of course “in” for
inches. Inches are assumed if no units are specified.

Back to our arrow: we have now established a path for the arrow down 1
centimeter from the “.s” anchor of the box. The next phrase is:
“`then right until even with first cylinder`”. You can perhaps guess
that this means that the arrow should continue to the right until it is
lined up below the first cylinder. You, the diagram designer, don’t know
(and don’t really want to know) how far apart the box and the cylinder
are, so you can’t tell it exactly how far to go. This phrase is a
convenient way of telling Pikchr to “make the line long enough”.

Note that the “`first cylinder`” part of the “until even with” phrase is
actually an abbreviation for “`first cylinder.c`” - the center of the
cylinder. This is what we want. You could also write
“`first cylinder.s`” if you want.

The “until even with” phrase is not found in the original version of
PIC. In that system, you would have to do some extra math to figure out
the distance for yourself, something like
“`then right (1st cylinder.s.x - 1st box.s.x)`”. We think the “until
even with” phrase is easier to use and understand.

The final phrase in the “arrow” statement is
“`then to first cylinder.s`”. This phrase tells the arrow to go from
wherever it is at the moment directly to the “.s” anchor of the
cylinder.

## The Advantage Of Relative Layout 

Notice that our sample diagram contains no coordinates and only one
hard-coded distance, the “down 1cm” bit in the “arrow” statement. The
script is written in such a way that the script-writer does not have to
do a lot of distance calculation. The layout compensates automatically.

For example, suppose you come back to this script later and decide you
need to insert an ellipse in between the circle and the cylinder. This
is easily accomplished:

``` pikchr
    box; move; circle; move; ellipse; move; cylinder
    arrow from first box.s \
          down 1cm \
          then right until even with first cylinder \
          then to first cylinder.s
```

We simply add the ellipse (and an extra “move”) on the first line. Even
though the coordinate positions of the objects have adjusted, the
description of the arrow that connects the box to the cylinder is not
based on coordinates or absolute distances, so it does not have to
change at all. Pikchr compensates automatically:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NjE2LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMjAiIHZpZXdib3g9IjAgMCA2MTYuMzIgMTMzLjAxMyIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDc0LjE2TDExMC4xNiw3NC4xNkwxMTAuMTYsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48Y2lyY2xlIGN4PSIyMTguMTYiIGN5PSIzOC4xNiIgcj0iMzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48ZWxsaXBzZSBjeD0iMzgwLjE2IiBjeT0iMzguMTYiIHJ4PSI1NCIgcnk9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9lbGxpcHNlPjxwYXRoIGQ9Ik01MDYuMTYsMTIuOTZMNTA2LjE2LDYzLjM2QTU0IDEwLjggMCAwIDAgNjE0LjE2IDYzLjM2TDYxNC4xNiwxMi45NkE1NCAxMC44IDAgMCAwIDUwNi4xNiAxMi45NkE1NCAxMC44IDAgMCAwIDYxNC4xNiAxMi45NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBvbHlnb24gcG9pbnRzPSI1NjAuMTYsNzQuMTYgNTY0LjQ4LDg1LjY4IDU1NS44NCw4NS42OCIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik01Ni4xNiw3NC4xNkw1Ni4xNiwxMzAuODUzTDU2MC4xNiwxMzAuODUzTDU2MC4xNiw3OS45MiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjwvc3ZnPg==)

Both PIC and Pikchr allow you to specify hard-coded coordinates and
distances when laying out your diagram, but you are encouraged to avoid
that approach. Instead, place each new object you create relative to the
position of prior objects. Pikchr provides many mechanisms for
specifying the location of each object in terms of the locations of its
predecessors. With a little study of the syntax options available to you
(and discussed further below) you will be generating complex diagrams
using Pikchr in no time.

## Single-Pass Design 

Both Pikchr and PIC operate on a single-pass design. Objects can refer
to other objects that occur before them in the script, but not to
objects that occur later in the script. Any computations that go into
placing an object occur as the object definition is parsed. As soon as
the newline or semicolon that terminates the object definition is
reached, the size, location, and characteristics of the object are fixed
and cannot subsequently be altered. (One exception: sub-objects that are
part of a `[]`-container (discussed later) are placed relative to the
origin of the container. Their shape and locations relative to each
other are fixed, but their final absolute position is not fixed until
the `[]`-container itself is fixed.)

The single-pass approach contributes to the conceptual simplicity of
Pikchr (and PIC). There is no “solver” that has to work through forward
and backward layout constraints to find a solution. This simplicity of
design helps to keep Pikchr scripts easy to write and easy to
understand.

## Labeling Objects 

The previous example used the phrases like “`first box`” and
“`first cylinder`” to refer to particular objects. There are many
variations on this naming scheme:

- “`previous`” ← the previous object regardless of its class
- “`last circle`” ← the most recently created circle object
- “`3rd last oval`” ← the antepenultimate oval object
- “`17th ellipse`” ← the seventeenth ellipse object
- …and so forth

These relative and ordinal references work, but they can be fragile. If
you go back later and insert a new object in the stream, you can mess up
the counting. Or, for that matter, you might just miscount.

In a complex diagram, it often works better to assign symbolic names to
objects, which we call “labels” in Pikchr. A label begins with a capital
letter followed by some number of regular ASCII letters, digits or
underscores, followed by a colon. This must come immediately before an
object, without an intervening newline. Afterwards, the object can be
referred to by that label.

Consider how this simplifies our previous example:

``` pikchr
    B1:  box; move;
         circle; move;
         ellipse; move;
    C1:  cylinder
         arrow from B1.s \
            down 1cm \
            then right until even with C1 \
            then to C1.s
```

By giving symbolic names to the box (B1) and cylinder (C1), the arrow
path description is simplified. Furthermore, if the ellipse gets changed
into another cylinder, the arrow still refers to the correct cylinder.

The indentation of the lines following each symbolic name above is
syntactically unimportant: it serves only to improve human readability.
Nevertheless, this is typical coding style for Pikchr and PIC before it.

## Layout Of Block Objects 

For lines (and arrows and splines), you have to specify a path that the
line follows, a path that might involve multiple bends and turns.
Defining the location of block objects is easier: you just provide a
single location to place the object. Ideally, you should place the
object relative to some other object, of course.

Let’s say you have a box and you want to position a circle 2 centimeters
to the right of that box. You simply use an “`at`” attribute on the
circle to tell it to position itself 2 cm to the right of the box:

``` pikchr
  B1: box
      circle at 2cm right of B1
```

The resulting diagram is:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjA3LjcwNjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTIzIiB2aWV3Ym94PSIwIDAgMjA3LjcwNiAxMjMuNjU5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsNzQuMTZMMTEwLjE2LDc0LjE2TDExMC4xNiwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjE2OS41NDYiIGN5PSIzOC4xNiIgcj0iMzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48cGF0aCBkPSJNNTYuMTYsODUuNDk4Nkw1Ni4xNiwxMjEuNDk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0xNjkuNTQ2LDg1LjQ5ODZMMTY5LjU0NiwxMjEuNDk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iNTYuMTYsMTEyLjQ5OSA2My44Nzg0LDEwOS42MDQgNjMuODc4NCwxMTUuMzkzIiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBvbHlnb24gcG9pbnRzPSIxNjkuNTQ2LDExMi40OTkgMTYxLjgyNywxMTUuMzkzIDE2MS44MjcsMTA5LjYwNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik02MC4wMTkyLDExMi40OTlMMTY1LjY4NywxMTIuNDk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMTEyLjg1MyIgeT0iMTAxLjMzMyIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDEyOCwxMjgsMTI4KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPjJjbTwvdGV4dD48L3N2Zz4=)

(We’ve added gray dimension lines purely for illustration. Click the
diagram [per the instructions above](#viewsrc) to see that they do not
change the example, only add to it.)

The circle is positioned so that its *center* is 2 centimeters to the
right of the *center* of the box. If what you really wanted is that the
left (or west) side of the circle is 2 cm to the right (or east) of the
box, then just say so:

``` pikchr
  B1: box
  C1: circle with .w at 2cm right of B1.e
```

Normally an “`at`” clause will set the center of an object, but if you
add a “`with`” prefix you can specify any other anchor point of the
object to be the reference for positioning. The Pikchr script above is
saying “make the C1.w point be 2 cm right of B1.e”. And we have:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6Mjk3LjcwNjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTI1IiB2aWV3Ym94PSIwIDAgMjk3LjcwNiAxMjMuNjU5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsNzQuMTZMMTEwLjE2LDc0LjE2TDExMC4xNiwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjI1OS41NDYiIGN5PSIzOC4xNiIgcj0iMzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48cGF0aCBkPSJNMTEwLjE2LDg1LjQ5ODZMMTEwLjE2LDEyMS40OTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTIyMy41NDYsODUuNDk4NkwyMjMuNTQ2LDEyMS40OTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBvbHlnb24gcG9pbnRzPSIxMTAuMTYsMTEyLjQ5OSAxMTcuODc4LDEwOS42MDQgMTE3Ljg3OCwxMTUuMzkzIiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBvbHlnb24gcG9pbnRzPSIyMjMuNTQ2LDExMi40OTkgMjE1LjgyNywxMTUuMzkzIDIxNS44MjcsMTA5LjYwNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xMTQuMDE5LDExMi40OTlMMjE5LjY4NywxMTIuNDk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMTY2Ljg1MyIgeT0iMTAxLjMzMyIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDEyOCwxMjgsMTI4KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPjJjbTwvdGV4dD48L3N2Zz4=)

That’s the whole story behind positioning block objects on a diagram.
You just add an attribute of the form:

> **with** *reference-point* **at** *position*

And Pikchr will place the specified reference-point of the object at
*position*. If you omit the “`with`” clause, the center of the object
(“`.c`”) is used as the *reference-point*. The power of Pikchr comes
from the fact that “*position*” can be a rather complex expression. The
previous example used a relatively simple *position* of
“`2cm right of B1.e`”. That was sufficient for our simple diagram. More
complex diagrams can have more complex *position* phrases.

### Automatic Layout Of Block Objects 

If you omit the “`at`” attribute from a block object, the object is
positioned as if you had used the following:

> `with .start at previous.end`

Except, the very first object in the script has no “previous” and so it
is positioned using:

> `with .c at (0,0)`

Let’s talk little more about the usual case:
“`with .start at previous.end`”. The “`previous`” keyword means the
previous object in the script. (You can also use the keyword “`last`”
for this purpose.) So we are positioning the current object relative to
the previous object. But what about the “.start” and “.end”?

Remember that every object has 8 anchor points whose names correspond to
compass directions: “.n”, “.ne”, “.e”, “.se”, “.s”, “.sw”, “.w”, and
“.nw”, plus the ninth anchor, the center point “.c”. Every object also
has “.start” and “.end” anchor points, but their position varies
depending on the layout direction that is current when the object is
created.

| Layout Direction | .start | .end |
|:-----------------|:-------|:-----|
| right            | .w     | .e   |
| down             | .n     | .s   |
| left             | .e     | .w   |
| up               | .s     | .n   |

Recall the earlier example that consisted of three objects stacked
together:

``` pikchr
    right; box; circle; cylinder
```

(I added a “`right`” at the beginning to make the layout direction
clear, but as “right” is the default layout direction, so it doesn’t
change anything.)

Armed with our new knowledge of how “`at`”-less block objects are
positioned, we can better understand what is going on. The box is the
first object. It gets positioned with its center at (0,0), which we can
show by putting a red dot at (0,0):

``` r
    right; box; circle; cylinder
    dot color red at (0,0)
```

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjkyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMjgiIHZpZXdib3g9IjAgMCAyOTIuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHBhdGggZD0iTTE4Mi4xNiwxMi45NkwxODIuMTYsNjMuMzZBNTQgMTAuOCAwIDAgMCAyOTAuMTYgNjMuMzZMMjkwLjE2LDEyLjk2QTU0IDEwLjggMCAwIDAgMTgyLjE2IDEyLjk2QTU0IDEwLjggMCAwIDAgMjkwLjE2IDEyLjk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48Y2lyY2xlIGN4PSI1Ni4xNiIgY3k9IjM4LjE2IiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjwvc3ZnPg==)

Because the layout direction is “right”, the start and end of the box
are the .w and .e anchor points. Prove this by putting more colored dots
at those points and rendering the result:

``` r
    right; box; circle; cylinder
    dot color green at 1st box.start
    dot color blue at 1st box.end
```

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6Mjk0LjQ4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMjkiIHZpZXdib3g9IjAgMCAyOTQuNDggNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNNC4zMiw3NC4xNkwxMTIuMzIsNzQuMTZMMTEyLjMyLDIuMTZMNC4zMiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ4LjMyIiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHBhdGggZD0iTTE4NC4zMiwxMi45NkwxODQuMzIsNjMuMzZBNTQgMTAuOCAwIDAgMCAyOTIuMzIgNjMuMzZMMjkyLjMyLDEyLjk2QTU0IDEwLjggMCAwIDAgMTg0LjMyIDEyLjk2QTU0IDEwLjggMCAwIDAgMjkyLjMyIDEyLjk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48Y2lyY2xlIGN4PSI0LjMyIiBjeT0iMzguMTYiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigwLDEyOCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMTI4LDApOyI+PC9jaXJjbGU+PGNpcmNsZSBjeD0iMTEyLjMyIiBjeT0iMzguMTYiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigwLDAsMjU1KTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwyNTUpOyI+PC9jaXJjbGU+PC9zdmc+)

Similarly, we can show that the .start and .end of the circle are its .w
and .e anchor points. (Add new color dots to prove this to yourself, if
you like.) And clearly, the .start of the circle is directly on top of
the .end of the box.

Now consider what happens if we change the layout direction after the
circle is created but before the cylinder is created:

``` pikchr
    right; box; circle; down; cylinder
```

This script works a little differently on Pikchr than it does on PIC.
The change in behavior is deliberate, because we feel that the Pikchr
approach is better. On PIC, the diagram above would be rendered like
this:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjM4LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzEiIHZpZXdib3g9IjAgMCAyMzguMzIgMTEyLjMyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsNzQuMTZMMTEwLjE2LDc0LjE2TDExMC4xNiwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjE0Ni4xNiIgY3k9IjM4LjE2IiByPSIzNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiPjwvY2lyY2xlPjxwYXRoIGQ9Ik0xMjguMTYsNDguOTZMMTI4LjE2LDk5LjM2QTU0IDEwLjggMCAwIDAgMjM2LjE2IDk5LjM2TDIzNi4xNiw0OC45NkE1NCAxMC44IDAgMCAwIDEyOC4xNiA0OC45NkE1NCAxMC44IDAgMCAwIDIzNi4xNiA0OC45NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PC9zdmc+)

But on Pikchr the placement of the cylinder is different:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjAyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzIiIHZpZXdib3g9IjAgMCAyMDIuMzIgMTQ4LjMyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsNzQuMTZMMTEwLjE2LDc0LjE2TDExMC4xNiwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxjaXJjbGUgY3g9IjE0Ni4xNiIgY3k9IjM4LjE2IiByPSIzNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiPjwvY2lyY2xlPjxwYXRoIGQ9Ik05Mi4xNiw4NC45Nkw5Mi4xNiwxMzUuMzZBNTQgMTAuOCAwIDAgMCAyMDAuMTYgMTM1LjM2TDIwMC4xNiw4NC45NkE1NCAxMC44IDAgMCAwIDkyLjE2IDg0Ljk2QTU0IDEwLjggMCAwIDAgMjAwLjE2IDg0Ljk2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48L3N2Zz4=)

Let’s take apart what is happening here. In both systems, after the
“circle” object has been parsed and positioned, the .end of the circle
is the same as .e, because the layout direction is “right”. If we omit
the “down” and “cylinder” and draw a dot at the “.end” of circle to show
where it is, we can see this:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTg2LjQ4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzMiIHZpZXdib3g9IjAgMCAxODYuNDggNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PGNpcmNsZSBjeD0iMTgyLjE2IiBjeT0iMzguMTYiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PC9zdmc+)

The next statement is “down”. The “down” statement changes the layout
direction to “down” in both systems. In legacy PIC the .end of the
circle remains at the .e anchor. Then when the “cylinder” is positioned,
its “.start” is at .n because the layout direction is now “down”, so the
.n point of the cylinder is aligned to the .e point of the circle.

Pikchr works like PIC with one important change: when the “down”
statement is evaluated, Pikchr also moves the “.end” of the previous
object to a new location that is appropriate for the new direction. In
other words, the down command moves the .end of the circle from .e to
.s. You can see this by setting a red dot at the .end of the circle
*after* the “down” command:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTg0LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzQiIHZpZXdib3g9IjAgMCAxODQuMzIgNzguNDgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iNzQuMTYiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PC9zdmc+)

Or, we can “`print`” the coordinates of the .end of the circle before
and after the “down” command to see that they shift:

before: 0.875 , 0\
after: 0.625 , -0.25\
![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTg0LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzUiIHZpZXdib3g9IjAgMCAxODQuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwxMTAuMTYsNzQuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PGNpcmNsZSBjeD0iMTQ2LjE2IiBjeT0iMzguMTYiIHI9IjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PC9zdmc+)

### Adjusting The Size Of Block Objects 

The size of every block object is controlled by three parameters:

- `width` (often abbreviated as `wid`)
- `height` (or `ht`)
- `radius` (or `rad`)

There is also a fourth convenience parameter:

- `diameter`

The `diameter` is always twice the radius. Setting the `diameter`
automatically changes the `radius` and setting the `radius`
automatically changes the `diameter`.

Usually the meanings of these parameters are obvious.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjA0LjY4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstMzYiIHZpZXdib3g9IjAgMCAyMDQuNjggMTM0LjA5OSIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik05MC4yMDAyLDc4LjQ4TDE5OC4yLDc4LjQ4TDE5OC4yLDYuNDhMOTAuMjAwMiw2LjQ4WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6My4yNDtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsNi40OEwyOC40NjE2LDYuNDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsNzguNDhMMjguNDYxNiw3OC40OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjM0Ljc2MTYiIHk9IjQyLjQ4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aGVpZ2h0PC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiw2LjQ4IDM3LjY1NiwxNC4xOTg0IDMxLjg2NzIsMTQuMTk4NCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0zNC43NjE2LDI3LjM2TDM0Ljc2MTYsMTAuMzM5MiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjM0Ljc2MTYsNzguNDggMzEuODY3Miw3MC43NjE2IDM3LjY1Niw3MC43NjE2IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsNTcuNkwzNC43NjE2LDc0LjYyMDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTkwLjIwMDIsODkuODE4Nkw5MC4yMDAyLDEyNS44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTE5OC4yLDg5LjgxODZMMTk4LjIsMTI1LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxNDQuMiIgeT0iMTE2LjgxOSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPndpZHRoPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iOTAuMjAwMiwxMTYuODE5IDk3LjkxODYsMTEzLjkyNCA5Ny45MTg2LDExOS43MTMiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMTE0LjgyNCwxMTYuODE5TDk0LjA1OTQsMTE2LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjE5OC4yLDExNi44MTkgMTkwLjQ4MiwxMTkuNzEzIDE5MC40ODIsMTEzLjkyNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xNzMuNTc2LDExNi44MTlMMTk0LjM0MSwxMTYuODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjwvc3ZnPg==)

The `radius` parameter, however, sometimes has non-obvious meanings. For
example, on a box, the `radius` determines the rounding of corners:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjgxLjgxMjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTM3IiB2aWV3Ym94PSIwIDAgMjgxLjgxMiAxMzQuMDk5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTExMS44LDc4LjQ4TDE3Ni42LDc4LjQ4QTIxLjYgMjEuNiAwIDAgMCAxOTguMiA1Ni44OEwxOTguMiwyOC4wOEEyMS42IDIxLjYgMCAwIDAgMTc2LjYgNi40OEwxMTEuOCw2LjQ4QTIxLjYgMjEuNiAwIDAgMCA5MC4yMDAyIDI4LjA4TDkwLjIwMDIsNTYuODhBMjEuNiAyMS42IDAgMCAwIDExMS44IDc4LjQ4WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6My4yNDtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsNi40OEwyOC40NjE2LDYuNDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsNzguNDhMMjguNDYxNiw3OC40OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjM0Ljc2MTYiIHk9IjQyLjQ4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aGVpZ2h0PC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiw2LjQ4IDM3LjY1NiwxNC4xOTg0IDMxLjg2NzIsMTQuMTk4NCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0zNC43NjE2LDI3LjM2TDM0Ljc2MTYsMTAuMzM5MiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjM0Ljc2MTYsNzguNDggMzEuODY3Miw3MC43NjE2IDM3LjY1Niw3MC43NjE2IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsNTcuNkwzNC43NjE2LDc0LjYyMDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTkwLjIwMDIsODkuODE4Nkw5MC4yMDAyLDEyNS44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTE5OC4yLDg5LjgxODZMMTk4LjIsMTI1LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxNDQuMiIgeT0iMTE2LjgxOSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPndpZHRoPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iOTAuMjAwMiwxMTYuODE5IDk3LjkxODYsMTEzLjkyNCA5Ny45MTg2LDExOS43MTMiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMTE0LjgyNCwxMTYuODE5TDk0LjA1OTQsMTE2LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjE5OC4yLDExNi44MTkgMTkwLjQ4MiwxMTkuNzEzIDE5MC40ODIsMTEzLjkyNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xNzMuNTc2LDExNi44MTlMMTk0LjM0MSwxMTYuODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0yMDkuNTM5LDc4LjQ4TDI1OS45MzksNzguNDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTIwOS41MzksNTYuODhMMjU5LjkzOSw1Ni44OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIyNDcuMzM5IiB5PSI2Ny42OCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnJhZGl1czwvdGV4dD48cG9seWdvbiBwb2ludHM9IjI0Ny4zMzksNzguNDggMjUwLjIzMyw4Ni4xOTg0IDI0NC40NDQsODYuMTk4NCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yNDcuMzM5LDgyLjMzOTJMMjQ3LjMzOSwxMDAuMDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBvbHlnb24gcG9pbnRzPSIyNDcuMzM5LDU2Ljg4IDI0NC40NDQsNDkuMTYxNiAyNTAuMjMzLDQ5LjE2MTYiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMjQ3LjMzOSw1My4wMjA4TDI0Ny4zMzksMzUuMjgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PC9zdmc+)

For a [cylinder
object](https://pikchr.org/home/doc/trunk/doc/cylinderobj.md) the
`radius` determines the thickness of the end caps:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjgxLjgxMjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTM4IiB2aWV3Ym94PSIwIDAgMjgxLjgxMiAxMzUuMTc5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTkwLjIwMDIsMjMuNzZMOTAuMjAwMiw2My4zNkE1NCAxNi4yIDAgMCAwIDE5OC4yIDYzLjM2TDE5OC4yLDIzLjc2QTU0IDE2LjIgMCAwIDAgOTAuMjAwMiAyMy43NkE1NCAxNi4yIDAgMCAwIDE5OC4yIDIzLjc2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDozLjI0O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48cGF0aCBkPSJNNzguODYxNiw3LjU2TDI4LjQ2MTYsNy41NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNNzguODYxNiw3OS41NkwyOC40NjE2LDc5LjU2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMzQuNzYxNiIgeT0iNDMuNTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5oZWlnaHQ8L3RleHQ+PHBvbHlnb24gcG9pbnRzPSIzNC43NjE2LDcuNTYgMzcuNjU2LDE1LjI3ODQgMzEuODY3MiwxNS4yNzg0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsMjguNDRMMzQuNzYxNiwxMS40MTkyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiw3OS41NiAzMS44NjcyLDcxLjg0MTYgMzcuNjU2LDcxLjg0MTYiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMzQuNzYxNiw1OC42OEwzNC43NjE2LDc1LjcwMDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTkwLjIwMDIsOTAuODk4Nkw5MC4yMDAyLDEyNi44OTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTE5OC4yLDkwLjg5ODZMMTk4LjIsMTI2Ljg5OSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxNDQuMiIgeT0iMTE3Ljg5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPndpZHRoPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iOTAuMjAwMiwxMTcuODk5IDk3LjkxODYsMTE1LjAwNCA5Ny45MTg2LDEyMC43OTMiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMTE0LjgyNCwxMTcuODk5TDk0LjA1OTQsMTE3Ljg5OSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjE5OC4yLDExNy44OTkgMTkwLjQ4MiwxMjAuNzkzIDE5MC40ODIsMTE1LjAwNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xNzMuNTc2LDExNy44OTlMMTk0LjM0MSwxMTcuODk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0yMDkuNTM5LDIzLjc2TDI1OS45MzksMjMuNzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTIwOS41MzksMzkuOTZMMjU5LjkzOSwzOS45NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIyNDcuMzM5IiB5PSIzMS44NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnJhZGl1czwvdGV4dD48cG9seWdvbiBwb2ludHM9IjI0Ny4zMzksMzkuOTYgMjUwLjIzMyw0Ny42Nzg0IDI0NC40NDQsNDcuNjc4NCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yNDcuMzM5LDQzLjgxOTJMMjQ3LjMzOSw2MS41NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjI0Ny4zMzksMjMuNzYgMjQ0LjQ0NCwxNi4wNDE2IDI1MC4yMzMsMTYuMDQxNiIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yNDcuMzM5LDE5LjkwMDhMMjQ3LjMzOSwyLjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjwvc3ZnPg==)

For a [file object](https://pikchr.org/home/doc/trunk/doc/fileobj.md)
the `radius` determines the size of the page fold-over in the
upper-right corner:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjQ1LjgxMjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTM5IiB2aWV3Ym94PSIwIDAgMjQ1LjgxMiAxODcuMzc5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTkwLjIwMDIsMTMxLjc2TDE2Mi4yLDEzMS43NkwxNjIuMiw0NS4zNkwxNDAuNiwyMy43Nkw5MC4yMDAyLDIzLjc2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6My4yNDtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTE0MC42LDIzLjc2TDE0MC42LDQ1LjM2TDE2Mi4yLDQ1LjM2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDozLjI0O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48cGF0aCBkPSJNNzguODYxNiwyMy43NkwyOC40NjE2LDIzLjc2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik03OC44NjE2LDEzMS43NkwyOC40NjE2LDEzMS43NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjM0Ljc2MTYiIHk9Ijc3Ljc2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aGVpZ2h0PC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiwyMy43NiAzNy42NTYsMzEuNDc4NCAzMS44NjcyLDMxLjQ3ODQiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMzQuNzYxNiw2Mi42NEwzNC43NjE2LDI3LjYxOTIiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBvbHlnb24gcG9pbnRzPSIzNC43NjE2LDEzMS43NiAzMS44NjcyLDEyNC4wNDIgMzcuNjU2LDEyNC4wNDIiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMzQuNzYxNiw5Mi44OEwzNC43NjE2LDEyNy45MDEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTkwLjIwMDIsMTQzLjA5OUw5MC4yMDAyLDE3OS4wOTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTE2Mi4yLDE0My4wOTlMMTYyLjIsMTc5LjA5OSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxMjYuMiIgeT0iMTcwLjA5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPndpZHRoPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iOTAuMjAwMiwxNzAuMDk5IDk2LjgyNDIsMTY3LjIwNCA5Ni44MjQyLDE3Mi45OTMiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNOTYuODI0MiwxNzAuMDk5TDkzLjUxMjIsMTcwLjA5OSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjE2Mi4yLDE3MC4wOTkgMTU1LjU3NiwxNzIuOTkzIDE1NS41NzYsMTY3LjIwNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xNTUuNTc2LDE3MC4wOTlMMTU4Ljg4OCwxNzAuMDk5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0xNzMuNTM5LDIzLjc2TDIyMy45MzksMjMuNzYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTE3My41MzksNDUuMzZMMjIzLjkzOSw0NS4zNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIyMTEuMzM5IiB5PSIzNC41NiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnJhZGl1czwvdGV4dD48cG9seWdvbiBwb2ludHM9IjIxMS4zMzksNDUuMzYgMjE0LjIzMyw1My4wNzg0IDIwOC40NDQsNTMuMDc4NCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yMTEuMzM5LDQ5LjIxOTJMMjExLjMzOSw2Ni45NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjIxMS4zMzksMjMuNzYgMjA4LjQ0NCwxNi4wNDE2IDIxNC4yMzMsMTYuMDQxNiIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yMTEuMzM5LDE5LjkwMDhMMjExLjMzOSwyLjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjwvc3ZnPg==)

For a [circle
object](https://pikchr.org/home/doc/trunk/doc/circleobj.md), the width,
height, and diameter are always the same, and the radius is always half
the diameter. Changing any parameter automatically adjusts the other
three.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjczLjA1MTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTQwIiB2aWV3Ym94PSIwIDAgMjczLjA1MSAxNjEuOTE5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PGNpcmNsZSBjeD0iMTMzLjQiIGN5PSI2My4xMDA1IiByPSI0My4yIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDozLjI0O3N0cm9rZTpyZ2IoMCwwLDApOyI+PC9jaXJjbGU+PHBhdGggZD0iTTc4Ljg2MTYsMTkuOTAwNUwyOC40NjE2LDE5LjkwMDUiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsMTA2LjMwMUwyOC40NjE2LDEwNi4zMDEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSIzNC43NjE2IiB5PSI2My4xMDA1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aGVpZ2h0PC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiwxOS45MDA1IDM3LjY1NiwyNy42MTg5IDMxLjg2NzIsMjcuNjE4OSIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0zNC43NjE2LDQ3Ljk4MDVMMzQuNzYxNiwyMy43NTk3IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiwxMDYuMzAxIDMxLjg2NzIsOTguNTgyMSAzNy42NTYsOTguNTgyMSIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0zNC43NjE2LDc4LjIyMDVMMzQuNzYxNiwxMDIuNDQxIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik05MC4yMDAyLDExNy42MzlMOTAuMjAwMiwxNTMuNjM5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0xNzYuNiwxMTcuNjM5TDE3Ni42LDE1My42MzkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHRleHQgeD0iMTMzLjQiIHk9IjE0NC42MzkiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj53aWR0aDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjkwLjIwMDIsMTQ0LjYzOSA5Ny45MTg2LDE0MS43NDUgOTcuOTE4NiwxNDcuNTM0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTEwNC4wMjQsMTQ0LjYzOUw5NC4wNTk0LDE0NC42MzkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBvbHlnb24gcG9pbnRzPSIxNzYuNiwxNDQuNjM5IDE2OC44ODIsMTQ3LjUzNCAxNjguODgyLDE0MS43NDUiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMTYyLjc3NiwxNDQuNjM5TDE3Mi43NDEsMTQ0LjYzOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNMTg3LjkzOSwxMDYuMzAxTDIzOC4zMzksMTA2LjMwMSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNMTg3LjkzOSw2My4xMDA1TDIzOC4zMzksNjMuMTAwNSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIyMjUuNzM5IiB5PSI4NC43MDA1IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+cmFkaXVzPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMjI1LjczOSwxMDYuMzAxIDIyOC42MzMsMTE0LjAxOSAyMjIuODQ0LDExNC4wMTkiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMjI1LjczOSwxMTAuMTZMMjI1LjczOSwxMjcuOTAxIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMjI1LjczOSw2My4xMDA1IDIyMi44NDQsNTUuMzgyMSAyMjguNjMzLDU1LjM4MjEiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMjI1LjczOSw1OS4yNDEzTDIyNS43MzksNDEuNTAwNSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjEwMi44NTMsOTMuNjQ3NSAxMDYuMjY0LDg2LjE0MzEgMTEwLjM1OCw5MC4yMzY0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBvbHlnb24gcG9pbnRzPSIxNjMuOTQ3LDMyLjU1MzUgMTYwLjUzNiw0MC4wNTc5IDE1Ni40NDMsMzUuOTY0NiIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xMDUuNTgyLDkwLjkxODdMMTYxLjIxOCwzNS4yODI0IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik0xNjMuOTQ3LDMyLjU1MzVMMTc5LjIyMSwxNy4yOEwxOTAuMDIxLDE3LjI4IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxOTAuMDIxIiB5PSIxNy4yOCIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+wqBkaWFtZXRlcjwvdGV4dD48L3N2Zz4=)

Even though they are curvy objects, the `radius` (and hence `diameter`)
has no effect on
[ellipse](https://pikchr.org/home/doc/trunk/doc/ellipseobj.md) and
[oval](https://pikchr.org/home/doc/trunk/doc/ovalobj.md) objects. The
size of those objects is determined purely by their width and height:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjA0LjY4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNDEiIHZpZXdib3g9IjAgMCAyMDQuNjggMTM0LjA5OSIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxlbGxpcHNlIGN4PSIxNDQuMiIgY3k9IjQyLjQ4IiByeD0iNTQiIHJ5PSIzNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6My4yNDtzdHJva2U6cmdiKDAsMCwwKTsiPjwvZWxsaXBzZT48cGF0aCBkPSJNNzguODYxNiw2LjQ4TDI4LjQ2MTYsNi40OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNNzguODYxNiw3OC40OEwyOC40NjE2LDc4LjQ4IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMzQuNzYxNiIgeT0iNDIuNDgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5oZWlnaHQ8L3RleHQ+PHBvbHlnb24gcG9pbnRzPSIzNC43NjE2LDYuNDggMzcuNjU2LDE0LjE5ODQgMzEuODY3MiwxNC4xOTg0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsMjcuMzZMMzQuNzYxNiwxMC4zMzkyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiw3OC40OCAzMS44NjcyLDcwLjc2MTYgMzcuNjU2LDcwLjc2MTYiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMzQuNzYxNiw1Ny42TDM0Ljc2MTYsNzQuNjIwOCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNOTAuMjAwMiw4OS44MTg2TDkwLjIwMDIsMTI1LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNMTk4LjIsODkuODE4NkwxOTguMiwxMjUuODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IHg9IjE0NC4yIiB5PSIxMTYuODE5IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+d2lkdGg8L3RleHQ+PHBvbHlnb24gcG9pbnRzPSI5MC4yMDAyLDExNi44MTkgOTcuOTE4NiwxMTMuOTI0IDk3LjkxODYsMTE5LjcxMyIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xMTQuODI0LDExNi44MTlMOTQuMDU5NCwxMTYuODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMTk4LjIsMTE2LjgxOSAxOTAuNDgyLDExOS43MTMgMTkwLjQ4MiwxMTMuOTI0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTE3My41NzYsMTE2LjgxOUwxOTQuMzQxLDExNi44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PC9zdmc+)

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NDkyLjY4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNDIiIHZpZXdib3g9IjAgMCA0OTIuNjggMjA0LjA4MyIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0xMjYuMiwxMTQuNDhMMTk4LjIsMTE0LjQ4QTM2IDM2IDAgMCAwIDIzNC4yIDc4LjQ4QTM2IDM2IDAgMCAwIDE5OC4yIDQyLjQ4TDEyNi4yLDQyLjQ4QTM2IDM2IDAgMCAwIDkwLjIwMDIgNzguNDhBMzYgMzYgMCAwIDAgMTI2LjIgMTE0LjQ4WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6My4yNDtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTc4Ljg2MTYsNDIuNDhMMjguNDYxNiw0Mi40OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cGF0aCBkPSJNNzguODYxNiwxMTQuNDhMMjguNDYxNiwxMTQuNDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSIzNC43NjE2IiB5PSI3OC40OCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmhlaWdodDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjM0Ljc2MTYsNDIuNDggMzcuNjU2LDUwLjE5ODQgMzEuODY3Miw1MC4xOTg0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsNjMuMzZMMzQuNzYxNiw0Ni4zMzkyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzQuNzYxNiwxMTQuNDggMzEuODY3MiwxMDYuNzYyIDM3LjY1NiwxMDYuNzYyIiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM0Ljc2MTYsOTMuNkwzNC43NjE2LDExMC42MjEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTkwLjIwMDIsMTI1LjgxOUw5MC4yMDAyLDE2MS44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTIzNC4yLDEyNS44MTlMMjM0LjIsMTYxLjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIxNjIuMiIgeT0iMTUyLjgxOSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPndpZHRoPC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iOTAuMjAwMiwxNTIuODE5IDk3LjkxODYsMTQ5LjkyNCA5Ny45MTg2LDE1NS43MTMiIHN0eWxlPSJmaWxsOnJnYigxMjgsMTI4LDEyOCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMTMyLjgyNCwxNTIuODE5TDk0LjA1OTQsMTUyLjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48cG9seWdvbiBwb2ludHM9IjIzNC4yLDE1Mi44MTkgMjI2LjQ4MiwxNTUuNzEzIDIyNi40ODIsMTQ5LjkyNCIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xOTEuNTc2LDE1Mi44MTlMMjMwLjM0MSwxNTIuODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik00NTAuMiwxNTAuNDhBMzYgMzYgMCAwIDAgNDg2LjIgMTE0LjQ4TDQ4Ni4yLDQyLjQ4QTM2IDM2IDAgMCAwIDQ1MC4yIDYuNDhBMzYgMzYgMCAwIDAgNDE0LjIgNDIuNDhMNDE0LjIsMTE0LjQ4QTM2IDM2IDAgMCAwIDQ1MC4yIDE1MC40OFoiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjMuMjQ7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxwYXRoIGQ9Ik00MDIuODYyLDYuNDhMMzUyLjQ2Miw2LjQ4IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik00MDIuODYyLDE1MC40OEwzNTIuNDYyLDE1MC40OCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSIzNTguNzYyIiB5PSI3OC40OCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmhlaWdodDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjM1OC43NjIsNi40OCAzNjEuNjU2LDE0LjE5ODQgMzU1Ljg2NywxNC4xOTg0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTM1OC43NjIsNjMuMzZMMzU4Ljc2MiwxMC4zMzkyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iMzU4Ljc2MiwxNTAuNDggMzU1Ljg2NywxNDIuNzYyIDM2MS42NTYsMTQyLjc2MiIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0zNTguNzYyLDkzLjZMMzU4Ljc2MiwxNDYuNjIxIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwYXRoIGQ9Ik00MTQuMiwxNjEuODE5TDQxNC4yLDE5Ny44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PHBhdGggZD0iTTQ4Ni4yLDE2MS44MTlMNDg2LjIsMTk3LjgxOSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6MS40NDcyO3N0cm9rZTpyZ2IoMTI4LDEyOCwxMjgpOyIgLz48dGV4dCB4PSI0NTAuMiIgeT0iMTg4LjgxOSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZm9udC1zaXplPSI4MCUiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj53aWR0aDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjQxNC4yLDE4OC44MTkgNDIxLjkxOSwxODUuOTI0IDQyMS45MTksMTkxLjcxMyIgc3R5bGU9ImZpbGw6cmdiKDEyOCwxMjgsMTI4KSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik00MjUuNTQ3LDE4OC44MTlMNDE4LjA1OSwxODguODE5IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjxwb2x5Z29uIHBvaW50cz0iNDg2LjIsMTg4LjgxOSA0NzguNDgyLDE5MS43MTMgNDc4LjQ4MiwxODUuOTI0IiBzdHlsZT0iZmlsbDpyZ2IoMTI4LDEyOCwxMjgpIj48L3BvbHlnb24+PHBhdGggZD0iTTQ3NC44NTMsMTg4LjgxOUw0ODIuMzQxLDE4OC44MTkiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjEuNDQ3MjtzdHJva2U6cmdiKDEyOCwxMjgsMTI4KTsiIC8+PC9zdmc+)

Notice that with an oval object, the semicircular end-cap is always on
the narrow end of the object. In the default configuration where the
height is less than the width, the semicircular end-caps are on the left
and right, but if the width and height are modified so that the width is
less than the height, then semicircles appear on the top and bottom
instead.

Although a `diamond` can in principle be rounded, same as Pikchr allows
with a `box`, the current implementation does not respond to the radius
parameter:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzY0LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNDMiIHZpZXdib3g9IjAgMCAzNjQuMzIgMTY2LjMyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsODMuMTZMNzQuMTYsMTY0LjE2TDE0Ni4xNiw4My4xNkw3NC4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI3NC4xNiIgeT0iNzMuMDgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5TaGFycDwvdGV4dD48dGV4dCB4PSI3NC4xNiIgeT0iOTMuMjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5kaWFtb25kPC90ZXh0PjxwYXRoIGQ9Ik0yMTguMTYsODMuMTZMMjkwLjE2LDE2NC4xNkwzNjIuMTYsODMuMTZMMjkwLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIyOTAuMTYiIHk9IjYzIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+4oCcUm91bmRlZOKAnTwvdGV4dD48dGV4dCB4PSIyOTAuMTYiIHk9IjgzLjE2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+ZGlhbW9uZD88L3RleHQ+PHRleHQgeD0iMjkwLjE2IiB5PSIxMDMuMzIiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5Tb3JyeTvCoG5vLjwvdGV4dD48L3N2Zz4=)

#### Default Sizes 

Block objects have default sizes, which are determined by variables. For
example, the width of a box is initialized with the value of the
`boxwid` variable, which defaults to `0.75in`.

It is common for Pikchr scripts to change these default at or near the
beginning of a script in order to adjust the default sizes of objects
defined within that script.

#### Setting Sizes Using Attributes 

Use the “`width`” (or “`wid`”) attribute to change the width of an
object. The argument to this attribute can be an expression — such as
“`1cm`” or “`0.75*boxwid`” — or it can be a percentage of the prior
value, such as “`75%`”. This also works for “`height`”, “`radius`”, and
“`diameter`”.

#### Automatic Sizing To Fit Text Annotations 

If a block object contains text annotations, the “`fit`” attribute
causes the width and height to be adjusted so that the object neatly
encloses that text. The “`fit`” attribute only considers text that is
previously defined for the object, or in other words text annotations
that occur to the left of the “`fit`” keyword. The width and height can
be adjusted further after the “`fit`” keyword, for example to provide a
larger margin around the text. Click on the following script to see the
difference that the “`width 125%`” at the end of the second box
definition makes.

``` pikchr
    down
    box "Auto-fit text annotation" "as is" fit
    move 50%
    box "Auto-fix text annotation" "with 125% width" fit width 125%
```

If at the end of a block object definition, either the width or height
of the object is less than or equal to zero, then that dimension is
increased so as to enclose all text annotations on the object. Thus, for
example, you can make all of the boxes in your diagram auto-fit around
their text annotations by prefacing your script with something like:

``` pikchr
    boxwid = 0; boxht = 0;
    box "Hello";
    move
    box "A longer label" "with multiple lines" "of label text"
```

For all of these auto-fit features, Pikchr needs to know the dimensions
of the text annotations after rendering. Unfortunately, that information
is not readily available, as Pikchr runs long before the generated SVG
reaches the web-browser in which it will be displayed. Hence, Pikchr has
to guess at the text size. Usually it does a good job of this, but it
can be a little off, especially for unusual (read: “non-ASCII”)
characters or if the CSS for the rendering environment sets a
non-standard font face or font size. To compensate, the “`charwid`” and
“`charht`” variables can be adjusted or extra spaces can be added at the
beginning or end of text strings.

These auto-fit features are a new innovation for Pikchr and are not
available in other PIC family interpreters, as far as we are aware.

### Attributes For Stroke Width And Drawing Colors 

Various attributes can be added to both block and line objects to
influence how the objects are drawn.

- `thickness` *dimension*
- `thick`
- `thin`
- `invisible` (or `invis`)
- `color` *color*
- `fill` *color*

The “`thickness`”, “`thick`”, “`thin`”, and “`invisible`” attributes
control the stroke width of the lines that construct an object. The
default stroke width for all objects is determined by the “`thickness`”
variable, which defaults to “`0.015in`”. The “`thick`” and “`thin`”
attributes increase or decrease the stroke width by fixed percentages.
These attributes can be repeated to make the stroke width ever thicker
or thinner, up to the limit of the object’s dimensions where the stroke
fills the entire object. The “`invisble`” attribute simply sets the
stroke width to 0.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6Njg2LjA3NDtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTQ2IiB2aWV3Ym94PSIwIDAgNjg2LjA3NCAzNC41NiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDMyLjRMNzMuMTIzMiwzMi40TDczLjEyMzIsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjM3LjY0MTYiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+bm9ybWFsPC90ZXh0PjxwYXRoIGQ9Ik0xNDUuMTIzLDMyLjRMMTg5LjkzNiwzMi40TDE4OS45MzYsMi4xNkwxNDUuMTIzLDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjE2Ny41MyIgeT0iMTcuMjgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj50aGluPC90ZXh0PjxwYXRoIGQ9Ik0yNjEuOTM2LDMyLjRMMzE1LjUwNCwzMi40TDMxNS41MDQsMi4xNkwyNjEuOTM2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDozLjI0O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIyODguNzIiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+dGhpY2s8L3RleHQ+PHBhdGggZD0iTTM4Ny41MDQsMzIuNEw1MzUuNTM2LDMyLjRMNTM1LjUzNiwyLjE2TDM4Ny41MDQsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjcuMjk7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjQ2MS41MiIgeT0iMTcuMjgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj50aGlja8KgdGhpY2vCoHRoaWNrPC90ZXh0Pjx0ZXh0IHg9IjY0OC42MDUiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aW52aXNpYmxlPC90ZXh0Pjwvc3ZnPg==)

Notice that “invisible” refers only to the object outline, not to the
whole object. You therefore cancel the “invisible” attribute with
“solid”, not “visible”:

``` r
   boxwid = 0
   boxht = 0
   box "fully visible"
   box invisible color gray "outline invisible"
   box same solid "outline visible again" fit
```

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NDM5Ljc3NjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTQ3IiB2aWV3Ym94PSIwIDAgNDM5Ljc3NiAzNC41NiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDMyLjRMMTEwLjMzMywzMi40TDExMC4zMzMsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjU2LjI0NjQiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+ZnVsbHnCoHZpc2libGU8L3RleHQ+PHRleHQgeD0iMTgzLjI1NCIgeT0iMTcuMjgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigxMjgsMTI4LDEyOCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5vdXRsaW5lwqBpbnZpc2libGU8L3RleHQ+PHBhdGggZD0iTTI1Ni4xNzYsMzIuNEw0MzcuNjE2LDMyLjRMNDM3LjYxNiwyLjE2TDI1Ni4xNzYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigxMjgsMTI4LDEyOCk7IiAvPjx0ZXh0IHg9IjM0Ni44OTYiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMTI4LDEyOCwxMjgpIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+b3V0bGluZcKgdmlzaWJsZcKgYWdhaW48L3RleHQ+PC9zdmc+)

The “`color`” and “`fill`” attributes change the foreground and
background colors of an object. Colors can be expressed using any of
[the 148 standard CSS color
names](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value)
such as “Bisque” or “AliceBlue” or “LightGray”. Color names are not case
sensitive, so “bisque”, “BISQUE”, and “Bisque” all mean the same thing.
Color names can also be expressed as an integer which is interpreted as
a 24-bit RGB value. It is convenient to express numeric color values
using hexadecimal notation. “Bisque” is the same as “0xffe4c4”, which is
the same as “16770244”.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzY3LjU0NjtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTQ4IiB2aWV3Ym94PSIwIDAgMzY3LjU0NiA1NC43MiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDUyLjU2TDE1OC4yNTYsNTIuNTZMMTU4LjI1NiwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOnJnYigyNTUsMjI4LDE5Nik7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYig5NSwxNTgsMTYwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI4MC4yMDgiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoOTUsMTU4LDE2MCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5Db2xvcjrCoENhZGV0Qmx1ZTwvdGV4dD48dGV4dCB4PSI4MC4yMDgiIHk9IjM3LjQ0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoOTUsMTU4LDE2MCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5GaWxsOsKgQmlzcXVlPC90ZXh0PjxwYXRoIGQ9Ik0yNTUuNDU2LDUyLjU2TDM0MC4xODYsNTIuNTZBMjUuMiAyNS4yIDAgMCAwIDM2NS4zODYgMjcuMzZBMjUuMiAyNS4yIDAgMCAwIDM0MC4xODYgMi4xNkwyNTUuNDU2LDIuMTZBMjUuMiAyNS4yIDAgMCAwIDIzMC4yNTYgMjcuMzZBMjUuMiAyNS4yIDAgMCAwIDI1NS40NTYgNTIuNTZaIiBzdHlsZT0iZmlsbDpyZ2IoNjUsMTA1LDIyNSk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMjU1LDI1NSk7IiAvPjx0ZXh0IHg9IjI5Ny44MjEiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMjU1LDI1NSwyNTUpIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Q29sb3I6wqBXaGl0ZTwvdGV4dD48dGV4dCB4PSIyOTcuODIxIiB5PSIzNy40NCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDI1NSwyNTUsMjU1KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPkZpbGw6wqBSb3lhbEJsdWU8L3RleHQ+PC9zdmc+)

Setting the “`fill`” to a negative number, to “None”, or to “Off” makes
the background transparent. That is the default.

The default foreground color is black.

#### Filled Polygons 

The “`fill`” attribute does not affect the rendering of lines unless the
route of the line is terminated by the “`close`” attribute. The
“`close`” keyword converts the line into a polygon:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTc0LjM5OTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTQ5IiB2aWV3Ym94PSIwIDAgMTc0LjM5OSAxNTEuNjEzIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTg3LjE5OTQsMi4xNkwxNzIuMjM5LDE0OS40NTNMMi4xNiwxNDkuNDUzWiIgc3R5bGU9ImZpbGw6cmdiKDAsOTYsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZTpyZ2IoMjU1LDI1NSwyNTUpOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9Ijg3LjE5OTQiIHk9Ijg3LjUwNjMiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigyNTUsMjU1LDI1NSkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5ncmVlbjwvdGV4dD48dGV4dCB4PSI4Ny4xOTk0IiB5PSIxMDcuNjY2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMjU1LDI1NSwyNTUpIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+dHJpYW5nbGU8L3RleHQ+PC9zdmc+)

Polygons are not required to have a fill color. With the default fill of
“none,” you can use the “`close`” keyword to convert a polygon into a
line and leave the background transparent, but using “`fill` *color*”
together with “`close`” is a common idiom.

### Text Annotations 

Every object can have up to five lines of text annotation. Each
annotation is a string literal attribute on the object definition. By
default, the annotations are displayed around the center of the object,
from top to bottom, in the order that they appear in the input script.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzYwLjExNTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTUwIiB2aWV3Ym94PSIwIDAgMzYwLjExNSA3NC44OCIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDcyLjcyTDEzNy42MzUsNzIuNzJMMTM3LjYzNSwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iNjkuODk3NiIgeT0iMTcuMjgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5ib3jCoGNvbnRhaW5pbmc8L3RleHQ+PHRleHQgeD0iNjkuODk3NiIgeT0iMzcuNDQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj50aHJlZcKgbGluZXM8L3RleHQ+PHRleHQgeD0iNjkuODk3NiIgeT0iNTcuNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPm9mwqB0ZXh0PC90ZXh0Pjxwb2x5Z29uIHBvaW50cz0iMzUzLjYzNSwzNy40NCAzNDIuMTE1LDQxLjc2IDM0Mi4xMTUsMzMuMTIiIHN0eWxlPSJmaWxsOnJnYigwLDAsMCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMjA5LjYzNSwzNy40NEwzNDcuODc1LDM3LjQ0IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCB4PSIyODEuNjM1IiB5PSIyNS43NCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPkxhYmVsZWQ8L3RleHQ+PHRleHQgeD0iMjgxLjYzNSIgeT0iNDkuMTQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5saW5lPC90ZXh0Pjwvc3ZnPg==)

### Text Attributes 

The layout and font style of the annotations can be modified using
keywords that appear after each string literal. The following modifiers
are supported:

- **above**
- **aligned**
- **below**
- **big**
- **bold**
- **mono**
- **monospace**
- **center**
- **italic**
- **ljust**
- **rjust**
- **small**

#### Position Text Above Or Below The Center Of The Object 

The “`above`” and “`below`” keywords control the location of the text
above or below the center point of the object with which the text is
associated. If there is just one text on the object and the “`above`”
and “`below`” keywords are omitted, the text is placed directly over the
center of the object. This causes the text to appear in the middle of
lines:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTEiIHZpZXdib3g9IjAgMCAxMTIuMzIgMjQuNDgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwxMi4yNEwxMTAuMTYsMTIuMjQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iNTYuMTYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+b27CoHRoZcKgbGluZTwvdGV4dD48L3N2Zz4=)

So, if there is just a single text label on a line, you probably want to
include either the “`above`” or “`below`” keyword.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjIwLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTIiIHZpZXdib3g9IjAgMCAyMjAuMzIgNDcuODgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwyMy45NEw3NC4xNiwyMy45NCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSIzOC4xNiIgeT0iMTIuMjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5hYm92ZTwvdGV4dD48cGF0aCBkPSJNMTQ2LjE2LDIzLjk0TDIxOC4xNiwyMy45NCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMTgyLjE2IiB5PSIzNS42NCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmJlbG93PC90ZXh0Pjwvc3ZnPg==)

If there are two texts on the object, they straddle the center point
above and below, even without the use of the “`above`” and “`below`”
keywords:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjIwLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTMiIHZpZXdib3g9IjAgMCAyMjAuMzIgNDcuODgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwyMy45NEwyMTguMTYsMjMuOTQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMTEwLjE2IiB5PSIxMi4yNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnRleHTCoHdpdGhvdXTCoOKAnGFib3Zl4oCdPC90ZXh0Pjx0ZXh0IHg9IjExMC4xNiIgeT0iMzUuNjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj50ZXh0wqB3aXRob3V0wqDigJxiZWxvd+KAnTwvdGV4dD48L3N2Zz4=)

The “`above`” and “`below`” attributes do not stack or accumulate. Each
“`above`” or “`below`” overrides any previous “`above`” or “`below`” for
the same text.

If there are multiple texts and all are marked “`above`” or “`below`”,
then all are placed above or below the center point, in order of
appearance.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzY0LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTQiIHZpZXdib3g9IjAgMCAzNjQuMzIgODguMiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDQ0LjFMMTQ2LjE2LDQ0LjEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iNzQuMTYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Zmlyc3TCoGFib3ZlPC90ZXh0Pjx0ZXh0IHg9Ijc0LjE2IiB5PSIzMi40IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+c2Vjb25kwqBhYm92ZTwvdGV4dD48cGF0aCBkPSJNMjE4LjE2LDQ0LjFMMzYyLjE2LDQ0LjEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjI5MC4xNiIgeT0iNTUuOCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmZpcnN0wqBiZWxvdzwvdGV4dD48dGV4dCB4PSIyOTAuMTYiIHk9Ijc1Ljk2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+c2Vjb25kwqBiZWxvdzwvdGV4dD48L3N2Zz4=)

#### Justify Text Left Or Right 

As the “`above`” and “`below`” keywords control up and down positioning
of the text, so the “`ljust`” and “`rjust`” keywords control left and
right positioning.

For a line, the “`ljust`” means that the left side of the text is flush
against the center point of the line, and “`rjust`” means that the right
side of the text is flush against the center point of the line. (In the
following diagram, the red dot is at the center of the line.)

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTQ4LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTUiIHZpZXdib3g9IjAgMCAxNDguMzIgNDcuODgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwyMy45NEwxNDYuMTYsMjMuOTQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iNzQuMTYiIHk9IjEyLjI0IiB0ZXh0LWFuY2hvcj0ic3RhcnQiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5sanVzdDwvdGV4dD48dGV4dCB4PSI3NC4xNiIgeT0iMzUuNjQiIHRleHQtYW5jaG9yPSJlbmQiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5yanVzdDwvdGV4dD48Y2lyY2xlIGN4PSI3NC4xNiIgY3k9IjIzLjk0IiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMjU1LDAsMCk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigyNTUsMCwwKTsiPjwvY2lyY2xlPjwvc3ZnPg==)

For a block object, “`ljust`” shifts the text to be left justified
against the left edge of the block (with a small margin) and “`rjust`”
puts the text against the right side of the object (with the same
margin).

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzcwLjMxO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTYiIHZpZXdib3g9IjAgMCAzNzAuMzEgNzQuODgiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3Mi43MkwxNDkuMTU1LDcyLjcyTDE0OS4xNTUsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjUuNTgiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ic3RhcnQiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5sanVzdDwvdGV4dD48dGV4dCB4PSI1LjU4IiB5PSIzNy40NCIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+bG9uZ2VywqBsaW5lPC90ZXh0Pjx0ZXh0IHg9IjUuNTgiIHk9IjU3LjYiIHRleHQtYW5jaG9yPSJzdGFydCIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmV2ZW7CoGxvbmdlcsKgbGluZTwvdGV4dD48cGF0aCBkPSJNMjIxLjE1NSw3Mi43MkwzNjguMTUsNzIuNzJMMzY4LjE1LDIuMTZMMjIxLjE1NSwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMzY0LjczIiB5PSIxNy4yOCIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnJqdXN0PC90ZXh0Pjx0ZXh0IHg9IjM2NC43MyIgeT0iMzcuNDQiIHRleHQtYW5jaG9yPSJlbmQiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5sb25nZXLCoGxpbmU8L3RleHQ+PHRleHQgeD0iMzY0LjczIiB5PSI1Ny42IiB0ZXh0LWFuY2hvcj0iZW5kIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+ZXZlbsKgbG9uZ2VywqBsaW5lPC90ZXh0Pjwvc3ZnPg==)

The behavior of “`ljust`” and “`rjust`” for block objects in Pikchr
differs from legacy PIC. In PIC, text is always justified around the
center point, as in lines, but this means there is no easy way to left
justify multiple lines of text within a “box” or “file”, so the behavior
was changed for Pikchr.

Pikchr allows five separate text objects inside another object by
combining “`ljust`”, “`rjust`”, and the default text centering:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzI4LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNTciIHZpZXdib3g9IjAgMCAzMjguMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiw3NC4xNkwzMjYuMTYsNzQuMTZMMzI2LjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI1LjU4IiB5PSIxOCIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+YWJvdmUtbGp1c3Q8L3RleHQ+PHRleHQgeD0iMzIyLjc0IiB5PSIxOCIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmFib3ZlLXJqdXN0PC90ZXh0Pjx0ZXh0IHg9IjE2NC4xNiIgeT0iMzguMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5jZW50ZXJlZDwvdGV4dD48dGV4dCB4PSI1LjU4IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9InN0YXJ0IiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+YmVsb3ctbGp1c3Q8L3RleHQ+PHRleHQgeD0iMzIyLjc0IiB5PSI1OC4zMiIgdGV4dC1hbmNob3I9ImVuZCIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmJlbG93LXJqdXN0PC90ZXh0Pjwvc3ZnPg==)

#### Text Attribute “center” 

The “`center`” attribute cancels all prior “`above`”, “`below`”,
“`ljust`”, and “`rjust`” attributes for the current text object.

#### Bold And Italic Font Styles 

The “`bold`” and “`italic`” attributes cause the text object to use a
bold or italic font. Fonts can be both bold and italic at the same time:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTA4LjU5OTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTU4IiB2aWV3Ym94PSIwIDAgMTA4LjU5OSA3NC44OCIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDcyLjcyTDEwNi40MzksNzIuNzJMMTA2LjQzOSwyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iNTQuMjk5NSIgeT0iMTcuMjgiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtd2VpZ2h0PSJib2xkIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Ym9sZDwvdGV4dD48dGV4dCB4PSI1NC4yOTk1IiB5PSIzNy40NCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZm9udC1zdHlsZT0iaXRhbGljIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+aXRhbGljPC90ZXh0Pjx0ZXh0IHg9IjU0LjI5OTUiIHk9IjU3LjYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZm9udC13ZWlnaHQ9ImJvbGQiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5ib2xkLWl0YWxpYzwvdGV4dD48L3N2Zz4=)

#### Monospace Font Family 

The “`mono`” or “`monospace`” attributes cause the text object to use a
monospace font.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTAwLjg1ODtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTU5IiB2aWV3Ym94PSIwIDAgMTAwLjg1OCAzNC41NiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDMyLjRMOTguNjk3NiwzMi40TDk4LjY5NzYsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjUwLjQyODgiIHk9IjE3LjI4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LWZhbWlseT0ibW9ub3NwYWNlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+bW9ub3NwYWNlPC90ZXh0Pjwvc3ZnPg==)

#### Aligned Text 

The “`aligned`” attribute causes text associated with a straight line to
be rotated to align with that line:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTk0Ljc4O2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNjAiIHZpZXdib3g9IjAgMCAxOTQuNzggMTIwLjk2IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBvbHlnb24gcG9pbnRzPSI1Ni4xNiw4LjEyMDc2IDU0LjE0MTIsMjAuMjU3NCA0Ni42NTg4LDE1LjkzNzQiIHN0eWxlPSJmaWxsOnJnYigwLDAsMCkiPjwvcG9seWdvbj48cGF0aCBkPSJNMi4xNiwxMDEuNjUyTDUzLjI4LDEzLjEwOTEiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMjkuMTYiIHk9IjQzLjE4NjEiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIHRyYW5zZm9ybT0icm90YXRlKC02MCAyOS4xNiw1NC44ODYxKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmFsaWduZWQ8L3RleHQ+PHBvbHlnb24gcG9pbnRzPSIxMzEuNjA3LDExNC40OCAxMjUuMzUyLDEwMy44ODUgMTMzLjg2MSwxMDIuMzg1IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTExMi44NTMsOC4xMjA3NkwxMzAuNjA3LDEwOC44MDgiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjEyMi4yMyIgeT0iNDkuNjAwNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgdHJhbnNmb3JtPSJyb3RhdGUoODAgMTIyLjIzLDYxLjMwMDQpIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+YWxpZ25lZDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjE4OC4zLDYuNDggMTkyLjYyLDE4IDE4My45OCwxOCIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xODguMywxMTQuNDhMMTg4LjMsMTIuMjQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjE4OC4zIiB5PSI0OC43OCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgdHJhbnNmb3JtPSJyb3RhdGUoLTkwIDE4OC4zLDYwLjQ4KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmFsaWduZWQ8L3RleHQ+PC9zdmc+)

To display rotated text not associated with a line, attach the text to a
line that is marked “`invisible`”

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NTguMzI7aGVpZ2h0Ojtmb250LXNpemU6MTAwJTtmb250LWZhbWlseTpKb3N0O21hcmdpbjoxMHB4IDAgMTBweCAwOyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBjbGFzcz0iaW5saW5lLXN2ZyBwaWtjaHIgdW5uYW1lZC1jaHVuay02MSIgdmlld2JveD0iMCAwIDU4LjMyIDE0OC4zMiIgZGF0YS1waWtjaHItZGF0ZT0iMjAyNTAzMjEyMTU1MDUiPjxwYXRoIGQ9Ik0yLjE2LDE0Ni4xNkw1Ni4xNiwxNDYuMTZMNTYuMTYsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjI5LjE2IiB5PSI3NC4xNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgdHJhbnNmb3JtPSJyb3RhdGUoLTkwIDI5LjE2LDc0LjE2KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnJvdGF0ZWTCoHRleHQ8L3RleHQ+PC9zdmc+)

Note that the direction of aligned text is the same as the direction of
the line itself, so if you draw a line from right to left, the aligned
text will appear upside down:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTkyLjA2MTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTYyIiB2aWV3Ym94PSIwIDAgMTkyLjA2MSA2Ny4zMzY5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PGNpcmNsZSBjeD0iMjUuMTY0NSIgY3k9IjI1LjE2NDUiIHI9IjIzLjAwNDUiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjI1LjE2NDUiIHk9IjI1LjE2NDUiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5DMTwvdGV4dD48Y2lyY2xlIGN4PSIxNjYuODk3IiBjeT0iNDIuMTcyNCIgcj0iMjMuMDA0NSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjE2Ni44OTciIHk9IjQyLjE3MjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5DMDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjQ4LjAwNTEsMjcuOTA1NCA1OS45NTc4LDI0Ljk4ODcgNTguOTI4NCwzMy41NjcyIiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTE0NC4wNTYsMzkuNDMxNUw1My43MjQxLDI4LjU5MTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9Ijk2LjAzMDYiIHk9IjIxLjk2ODQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIHRyYW5zZm9ybT0icm90YXRlKC0xNzMuMTU3MjI2NiA5Ni4wMzA2LDMzLjY2ODQpIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+YWxpZ25lZDwvdGV4dD48L3N2Zz4=)

If you need aligned text on an arrow that goes from right to left, and
you do not want the text to be rendered upside-down, draw the arrow from
left to right and include the “`<-`” attribute so that the arrowhead is
at the beginning rather than at the end:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTkyLjA2MTtoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTYzIiB2aWV3Ym94PSIwIDAgMTkyLjA2MSA2Ny4zMzY5IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PGNpcmNsZSBjeD0iMjUuMTY0NSIgY3k9IjI1LjE2NDUiIHI9IjIzLjAwNDUiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7Ij48L2NpcmNsZT48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjI1LjE2NDUiIHk9IjI1LjE2NDUiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5DMTwvdGV4dD48Y2lyY2xlIGN4PSIxNjYuODk3IiBjeT0iNDIuMTcyNCIgcj0iMjMuMDA0NSIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiPjwvY2lyY2xlPjx0ZXh0IHg9IjE2Ni44OTciIHk9IjQyLjE3MjQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5DMDwvdGV4dD48cG9seWdvbiBwb2ludHM9IjQ4LjAwNTEsMjcuOTA1NCA1OS45NTc4LDI0Ljk4ODcgNTguOTI4NCwzMy41NjcyIiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTUzLjcyNDEsMjguNTkxNkwxNDQuMDU2LDM5LjQzMTUiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9Ijk2LjAzMDYiIHk9IjIxLjk2ODQiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIHRyYW5zZm9ybT0icm90YXRlKDYuODQyNzczNDEzIDk2LjAzMDYsMzMuNjY4NCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5hbGlnbmVkPC90ZXh0Pjwvc3ZnPg==)

#### Adjusting The Font Size 

The “`big`” and “`small`” attributes cause the text to be a little
larger or a little smaller, respectively. Two “`big`” attributes cause
the text to be larger still; similarly, two “`small`” attributes make it
smaller-than-small. Text size does not increase or decrease beyond two
“`big`” or “`small`” keywords.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNjQiIHZpZXdib3g9IjAgMCAxMTIuMzIgMTQ4LjMyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTIuMTYsMTQ2LjE2TDExMC4xNiwxNDYuMTZMMTEwLjE2LDIuMTZMMi4xNiwyLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI1Ni4xNiIgeT0iNDEuNTAwOCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZm9udC1zaXplPSI2NCUiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5zbWFsbMKgc21hbGw8L3RleHQ+PHRleHQgeD0iNTYuMTYiIHk9IjU2LjAxNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZm9udC1zaXplPSI4MCUiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5zbWFsbDwvdGV4dD48dGV4dCB4PSI1Ni4xNiIgeT0iNzQuMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZvbnQtc3R5bGU9Iml0YWxpYyIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPihub3JtYWwpPC90ZXh0Pjx0ZXh0IHg9IjU2LjE2IiB5PSI5Ni44NCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZm9udC1zaXplPSIxMjUlIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+YmlnPC90ZXh0Pjx0ZXh0IHg9IjU2LjE2IiB5PSIxMjUuMTkiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGZvbnQtc2l6ZT0iMTU2LjI1JSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmJpZ8KgYmlnPC90ZXh0Pjwvc3ZnPg==)

A “`big`” keyword cancels any prior “`small`” keywords on the same text,
and a “`small`” keyword cancels any prior “`big`” keywords.

### Text Is Positioned Around The Center Of The Object 

The anchor point for text annotations is usually the center of the
bounding box for the whole object. This is intuitive for block objects
and straight lines. But for multi-segment lines, the text might not be
near the line itself. For example, in the following four-segment arrow,
the red box is the bounding box and the red dot shows the center of the
bounding box. The text label is aligned relative to the center of the
bounding box, which is not close to any part of the actual line.

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjI0LjA3MztoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTY1IiB2aWV3Ym94PSIwIDAgMjI0LjA3MyAxNTAuMzcyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PGNpcmNsZSBjeD0iMTA5Ljg3NyIgY3k9IjczLjAyNjEiIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHBvbHlnb24gcG9pbnRzPSIyMTcuNTkzLDE0My44OTIgMjA5LjMwNCwxMzQuODAxIDIxNy4zMjYsMTMxLjU5MiIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yLjE2LDg3LjE5OTRMODcuMTk5NCwyLjE2TDE0My44OTIsMzAuNTA2NUwxNjAuOSwyLjE2TDIxNS40NTQsMTM4LjU0NCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMTA5Ljg3NyIgeT0iNzMuMDI2MSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnRleHQ8L3RleHQ+PHBhdGggZD0iTTIuMTYsMTQzLjg5MkwyMTcuNTkzLDE0My44OTJMMjE3LjU5MywyLjE2TDIuMTYsMi4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjAuOTY5NjI0O3N0cm9rZTpyZ2IoMjU1LDAsMCk7IiAvPjwvc3ZnPg==)

If you need to position text beside one specific segment of a
multi-segment line, consider creating a separate “`invis`” line over top
of that line segment and attaching the text to the “invis” line instead.
Here is the same arrow as before, but with the text attached to a
separate “invis” line that overlays the second segment of the arrow:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MjI0LjA3MztoZWlnaHQ6O2ZvbnQtc2l6ZToxMDAlO2ZvbnQtZmFtaWx5Okpvc3Q7bWFyZ2luOjEwcHggMCAxMHB4IDA7IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGNsYXNzPSJpbmxpbmUtc3ZnIHBpa2NociB1bm5hbWVkLWNodW5rLTY2IiB2aWV3Ym94PSIwIDAgMjI0LjA3MyAxNjEuNDk1IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PGNpcmNsZSBjeD0iMTA5Ljg3NyIgY3k9Ijg0LjE0ODciIHI9IjIuMTYiIHN0eWxlPSJmaWxsOnJnYigyNTUsMCwwKTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDI1NSwwLDApOyI+PC9jaXJjbGU+PHBvbHlnb24gcG9pbnRzPSIyMTcuNTkzLDE1NS4wMTUgMjA5LjMwNCwxNDUuOTIzIDIxNy4zMjYsMTQyLjcxNCIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0yLjE2LDk4LjMyMkw4Ny4xOTk0LDEzLjI4MjZMMTQzLjg5Miw0MS42MjkxTDE2MC45LDEzLjI4MjZMMjE1LjQ1NCwxNDkuNjY3IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTIuMTYsMTU1LjAxNUwyMTcuNTkzLDE1NS4wMTVMMjE3LjU5MywxMy4yODI2TDIuMTYsMTMuMjgyNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjAuOTY5NjI0O3N0cm9rZTpyZ2IoMjU1LDAsMCk7IiAvPjx0ZXh0IGxlbmd0aGFkanVzdD0ic3BhY2luZ0FuZEdseXBocyIgeD0iMTE1LjU0NiIgeT0iMzcuNTM1OCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgdHJhbnNmb3JtPSJyb3RhdGUoMjYuNTY1MDUxMTggMTE1LjU0NiwyNy40NTU4KSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnRleHQ8L3RleHQ+PC9zdmc+)

The anchor point for text is *usually* the center of the object, but in
some cases, the anchor point might be fudged a little. This happens, for
example for cylinder objects:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNjciIHZpZXdib3g9IjAgMCAxMTIuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwxNS4xMkwyLjE2LDYxLjJBNTQgMTIuOTYgMCAwIDAgMTEwLjE2IDYxLjJMMTEwLjE2LDE1LjEyQTU0IDEyLjk2IDAgMCAwIDIuMTYgMTUuMTJBNTQgMTIuOTYgMCAwIDAgMTEwLjE2IDE1LjEyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjU2LjE2IiB5PSIzNy44IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+dGV4dMKgaW7CoGE8L3RleHQ+PHRleHQgeD0iNTYuMTYiIHk9IjU3Ljk2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+Y3lsaW5kZXI8L3RleHQ+PGNpcmNsZSBjeD0iNTYuMTYiIGN5PSIzOC4xNiIgcj0iMi4xNiIgc3R5bGU9ImZpbGw6cmdiKDI1NSwwLDApO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMjU1LDAsMCk7Ij48L2NpcmNsZT48Y2lyY2xlIGN4PSI1Ni4xNiIgY3k9IjQ3Ljg4IiByPSIyLjE2IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDI1NSk7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMjU1KTsiPjwvY2lyY2xlPjwvc3ZnPg==)

The red dot is on the center of the cylinder and the blue dot shows the
anchor point for the text. The text is a little lower for cylinders
because that looks better. With out this adjustment of the text center
point, the cylinder text would look goofy:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MTEyLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNjgiIHZpZXdib3g9IjAgMCAxMTIuMzIgNzYuMzIiIGRhdGEtcGlrY2hyLWRhdGU9IjIwMjUwMzIxMjE1NTA1Ij48cGF0aCBkPSJNMi4xNiwxNS4xMkwyLjE2LDYxLjJBNTQgMTIuOTYgMCAwIDAgMTEwLjE2IDYxLjJMMTEwLjE2LDE1LjEyQTU0IDEyLjk2IDAgMCAwIDIuMTYgMTUuMTJBNTQgMTIuOTYgMCAwIDAgMTEwLjE2IDE1LjEyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoyLjE2O3N0cm9rZTpyZ2IoMCwwLDApOyIgLz48dGV4dCBsZW5ndGhhZGp1c3Q9InNwYWNpbmdBbmRHbHlwaHMiIHg9IjU2LjE2IiB5PSIyOC4wOCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPnRleHTCoGluwqBhPC90ZXh0Pjx0ZXh0IHg9IjU2LjE2IiB5PSI0OC4yNCIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPmN5bGluZGVyPC90ZXh0Pjwvc3ZnPg==)

## Containers

A “container” is a list of one or more objects contained within
“`[`…`]`”. A container is a collection of one or more objects that looks
like a single object to the remainder of the script.

For example:

``` pikchr
    A: [
      oval "Hello"
      arrow
      box "World" radius 4px
    ]
    Border: box thin width A.width+0.5in height A.height+0.5in at A.center
```

The “A” container is composed of an oval, and arrow, and a box with
rounded corners. But to the subsequent “Border” box, the “A” container
appears to be a single object. The Border box can reference the overall
width and height and the center point of the A container in order to
size and position itself to enclose the container with a 0.25in border:

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6NDAwLjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNzAiIHZpZXdib3g9IjAgMCA0MDAuMzIgMTQ4LjMyIiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTc0LjE2LDExMC4xNkwxNDYuMTYsMTEwLjE2QTM2IDM2IDAgMCAwIDE4Mi4xNiA3NC4xNkEzNiAzNiAwIDAgMCAxNDYuMTYgMzguMTZMNzQuMTYsMzguMTZBMzYgMzYgMCAwIDAgMzguMTYgNzQuMTZBMzYgMzYgMCAwIDAgNzQuMTYgMTEwLjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSIxMTAuMTYiIHk9Ijc0LjE2IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmaWxsPSJyZ2IoMCwwLDApIiBkb21pbmFudC1iYXNlbGluZT0iY2VudHJhbCI+SGVsbG88L3RleHQ+PHBvbHlnb24gcG9pbnRzPSIyNTQuMTYsNzQuMTYgMjQyLjY0LDc4LjQ4IDI0Mi42NCw2OS44NCIgc3R5bGU9ImZpbGw6cmdiKDAsMCwwKSI+PC9wb2x5Z29uPjxwYXRoIGQ9Ik0xODIuMTYsNzQuMTZMMjQ4LjQsNzQuMTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjxwYXRoIGQ9Ik0yNjAuMTYsMTEwLjE2TDM1Ni4xNiwxMTAuMTZBNiA2IDAgMCAwIDM2Mi4xNiAxMDQuMTZMMzYyLjE2LDQ0LjE2QTYgNiAwIDAgMCAzNTYuMTYgMzguMTZMMjYwLjE2LDM4LjE2QTYgNiAwIDAgMCAyNTQuMTYgNDQuMTZMMjU0LjE2LDEwNC4xNkE2IDYgMCAwIDAgMjYwLjE2IDExMC4xNloiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlLXdpZHRoOjIuMTY7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjx0ZXh0IHg9IjMwOC4xNiIgeT0iNzQuMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5Xb3JsZDwvdGV4dD48cGF0aCBkPSJNMi4xNiwxNDYuMTZMMzk4LjE2LDE0Ni4xNkwzOTguMTYsMi4xNkwyLjE2LDIuMTZaIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZS13aWR0aDoxLjQ0NzI7c3Ryb2tlOnJnYigwLDAsMCk7IiAvPjwvc3ZnPg==)

A container is mostly useful for adding a border around a collection of
objects, as shown above, or adding a caption to a diagram. The following
diagram shows what a caption might look like. (Click to see the Pikchr
source text.)

![](data:image/svg+xml;base64,PHN2ZyBzdHlsZT0id2lkdGg6MzI4LjMyO2hlaWdodDo7Zm9udC1zaXplOjEwMCU7Zm9udC1mYW1pbHk6Sm9zdDttYXJnaW46MTBweCAwIDEwcHggMDsiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgY2xhc3M9ImlubGluZS1zdmcgcGlrY2hyIHVubmFtZWQtY2h1bmstNzEiIHZpZXdib3g9IjAgMCAzMjguMzIgMTIwLjk2IiBkYXRhLXBpa2Noci1kYXRlPSIyMDI1MDMyMTIxNTUwNSI+PHBhdGggZD0iTTM4LjE2LDc0LjE2TDExMC4xNiw3NC4xNkEzNiAzNiAwIDAgMCAxNDYuMTYgMzguMTZBMzYgMzYgMCAwIDAgMTEwLjE2IDIuMTZMMzguMTYsMi4xNkEzNiAzNiAwIDAgMCAyLjE2IDM4LjE2QTM2IDM2IDAgMCAwIDM4LjE2IDc0LjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgbGVuZ3RoYWRqdXN0PSJzcGFjaW5nQW5kR2x5cGhzIiB4PSI3NC4xNiIgeT0iMzguMTYiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5IZWxsbzwvdGV4dD48cG9seWdvbiBwb2ludHM9IjIxOC4xNiwzOC4xNiAyMDYuNjQsNDIuNDggMjA2LjY0LDMzLjg0IiBzdHlsZT0iZmlsbDpyZ2IoMCwwLDApIj48L3BvbHlnb24+PHBhdGggZD0iTTE0Ni4xNiwzOC4xNkwyMTIuNCwzOC4xNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHBhdGggZD0iTTIyNC4xNiw3NC4xNkwzMjAuMTYsNzQuMTZBNiA2IDAgMCAwIDMyNi4xNiA2OC4xNkwzMjYuMTYsOC4xNkE2IDYgMCAwIDAgMzIwLjE2IDIuMTZMMjI0LjE2LDIuMTZBNiA2IDAgMCAwIDIxOC4xNiA4LjE2TDIxOC4xNiw2OC4xNkE2IDYgMCAwIDAgMjI0LjE2IDc0LjE2WiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2Utd2lkdGg6Mi4xNjtzdHJva2U6cmdiKDAsMCwwKTsiIC8+PHRleHQgeD0iMjcyLjE2IiB5PSIzOC4xNiIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZmlsbD0icmdiKDAsMCwwKSIgZG9taW5hbnQtYmFzZWxpbmU9ImNlbnRyYWwiPldvcmxkPC90ZXh0Pjx0ZXh0IHg9IjE2NC4xNiIgeT0iMTAzLjY4IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBmb250LXN0eWxlPSJpdGFsaWMiIGZpbGw9InJnYigwLDAsMCkiIGRvbWluYW50LWJhc2VsaW5lPSJjZW50cmFsIj5EaWFncmFtwqBDYXB0aW9uPC90ZXh0Pjwvc3ZnPg==)

In legacy PIC, layout direction changes (the “up”, “down”, “left”, and
“right” commands) and variable definitions within a container only
affect subsequent statements within the same container. Once the
container closes, the prior direction and variable values are restored.
Pikchr does not work this way. In Pikchr, layout direction changes and
variable definitions that occur within a container continue to be in
effect after the container.

## Object Stacking Order

Objects are normally drawn in the order in which they are defined. Thus
objects that are toward the end of the script that overlap with objects
near the beginning will appear to be on top.

Sometimes it is desirable for a later object to appear to be behind an
early object. This is useful, for example, when using a box to form a
colored background for a group of prior objects. The [“`behind`”
attribute](https://pikchr.org/home/doc/trunk/doc/behind.md) with a
argument that is the label for any prior object can be added to cause
the object that holds the behind attribute to be drawn before the object
that the behind attribute references.

## Summary And Conclusion

Though based on the decades-old PIC language, Pikchr itself is a
relatively new system. However, it has already proven itself to be
amazingly useful for helping to illustrate concepts in technical
documentation written using Markdown.
