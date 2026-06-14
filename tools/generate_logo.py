#!/usr/bin/env python3
"""Generate a geometrically regular hexagon logo for the pikchr R package.

The previous man/figures/pikchrHex.svg had a horizontally squished hexagon
(width/height ratio ~0.73 instead of the regular 0.866) and used an invalid
<def> element instead of <defs>. This script rebuilds the same visual design
(filled hexagon + two concentric hexagonal rings of circles connected by
trimmed edges + two lens arcs + centered "Pikchr" text) using exact regular
pointy-top hexagon geometry.
"""
import math

S3 = math.sqrt(3) / 2.0          # cos(30) -> regular hexagon horizontal factor
R_OUT = 39.34155                 # outer circumradius (keeps original height)
R1 = 31.4736                     # outer ring (light green) circumradius
R2 = 23.605                      # inner ring (medium green) circumradius
CR = 1.44                        # small circle radius / edge trim length
PAD = 1.44                       # padding around the figure

# Center: top vertex sits PAD below the top edge; left vertex PAD from left edge.
CX = R_OUT * S3 + PAD
CY = R_OUT + PAD
VB_W = 2 * R_OUT * S3 + 2 * PAD
VB_H = 2 * R_OUT + 2 * PAD


def hexagon(R):
    """Pointy-top regular hexagon vertices (y grows downward), clockwise."""
    return [
        (CX,            CY - R),            # top
        (CX + R * S3,   CY - R / 2),        # upper-right
        (CX + R * S3,   CY + R / 2),        # lower-right
        (CX,            CY + R),            # bottom
        (CX - R * S3,   CY + R / 2),        # lower-left
        (CX - R * S3,   CY - R / 2),        # upper-left
    ]


def trim(p, q, d):
    """Point d units from p toward q."""
    vx, vy = q[0] - p[0], q[1] - p[1]
    n = math.hypot(vx, vy)
    return (p[0] + vx / n * d, p[1] + vy / n * d)


def f(v):
    return f"{v:.4f}".rstrip("0").rstrip(".")


COL_FILL = "rgb(39,174,96)"
COL_FILL_STROKE = "rgb(25,111,61)"
COL_R1 = "rgb(125,206,160)"
COL_R2 = "rgb(82,190,128)"

parts = []
parts.append(
    "<svg style='width:100%;height:auto;font-size:80%;font-family:MonteCarlo;"
    "margin:10px 0 10px 0;' xmlns='http://www.w3.org/2000/svg' class=\"pikchr\" "
    f"viewBox=\"0 0 {f(VB_W)} {f(VB_H)}\">"
    "<defs><style type=\"text/css\">"
    "@import url(https://fonts.googleapis.com/css2?family=MonteCarlo:wght@400);"
    "</style></defs>"
)

# Filled outer hexagon
hx = hexagon(R_OUT)
d = "M" + "L".join(f"{f(x)},{f(y)}" for x, y in hx) + "Z"
parts.append(
    f'<path d="{d}"  style="fill:{COL_FILL};stroke-width:{f(CR)};'
    f'stroke-linejoin:round;stroke:{COL_FILL_STROKE};" />'
)

# Centered text
parts.append(
    f'<text lengthAdjust="spacingAndGlyphs"  x="{f(CX)}" y="{f(CY)}" '
    'text-anchor="middle" fill="rgb(255,255,255)" font-size="80%" '
    'dominant-baseline="central">Pikchr</text>'
)


def ring(R, color):
    verts = hexagon(R)
    out = []
    for vx, vy in verts:
        out.append(
            f'<circle cx="{f(vx)}" cy="{f(vy)}" r="{f(CR)}"  '
            f'style="fill:none;stroke-width:0.9648;stroke:{color};" />'
        )
    for i in range(6):
        a, b = verts[i], verts[(i + 1) % 6]
        s = trim(a, b, CR)
        e = trim(b, a, CR)
        out.append(
            f'<path d="M{f(s[0])},{f(s[1])}L{f(e[0])},{f(e[1])}"  '
            f'style="fill:none;stroke-width:0.9648;stroke:{color};" />'
        )
    return out, verts


r1_parts, _ = ring(R1, COL_R1)
parts.extend(r1_parts)
r2_parts, r2v = ring(R2, COL_R2)
parts.extend(r2_parts)

# Two lens arcs on the inner ring (bulging beyond top/bottom vertices)
BULGE = 2.31
c_bottom = (CX, CY + R2 + BULGE)
c_top = (CX, CY - R2 - BULGE)
lr, ll = r2v[2], r2v[4]   # lower-right, lower-left
ur, ul = r2v[1], r2v[5]   # upper-right, upper-left
for (p, q, c) in ((lr, ll, c_bottom), (ur, ul, c_top)):
    s = trim(p, c, CR)
    e = trim(q, c, CR)
    parts.append(
        f'<path d="M{f(s[0])},{f(s[1])}Q{f(c[0])},{f(c[1])} {f(e[0])},{f(e[1])}"  '
        f'style="fill:none;stroke-width:0.9648;stroke:{COL_R2};" />'
    )

parts.append("</svg>")

with open("man/figures/pikchrHex.svg", "w") as fh:
    fh.write("\n".join(parts) + "\n")

print(f"viewBox 0 0 {f(VB_W)} {f(VB_H)}  ratio={VB_W/VB_H:.4f}")
print(f"hex width/height ratio = {(2*R_OUT*S3)/(2*R_OUT):.4f} (regular = 0.8660)")
