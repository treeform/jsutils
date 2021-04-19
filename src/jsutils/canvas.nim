when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

import dom

type
  DOMMatrix* = ref object
    a*: float
    b*: float
    c*: float
    d*: float
    e*: float
    f*: float

  Canvas* = ref object of dom.Element
    width*: int
    height*: int

  TextMetrics* = ref object
    width*: float

  Context2d* = ref object
    # width of the viewport
    width*: int
    # height of the viewport
    height*: int
    # Parent HTML Canvis node
    canvas*: dom.Element
    # current transformation matrix
    currentTransform*: DOMMatrix
    # current text direction used to draw text
    direction*: cstring
    # color, gradient, pattern used inside shapes
    fillStyle*: cstring
    # filter effects such as blurring and grayscaling
    filter*: cstring
    # text style to use when drawing text
    font*: cstring
    # alpha (transparency) value that is applied to shapes
    globalAlpha*: float
    # type of compositing operation to apply when drawing new shapes
    globalCompositeOperation*: cstring
    # determines whether scaled images are smoothed
    imageSmoothingEnabled*: bool
    # the quality of image smoothing
    imageSmoothingQuality*: cstring
    # the shape used to draw the end points of lines
    lineCap*: cstring
    # the line dash offset, or "phase."
    lineDashOffset*: float
    # determines the shape used to join two line segments where they meet
    lineJoin*: cstring
    # the thickness of lines
    lineWidth*: float
    # the miter limit ratio
    miterLimit*: float
    # the amount of blur applied to shadows
    shadowBlur*: float
    # the color of shadows
    shadowColor*: cstring
    # the distance that shadows will be offset horizontally
    shadowOffsetX*: float
    # the distance that shadows will be offset vertically
    shadowOffsetY*: float
    # the color, gradient, or pattern to use for the outlines around shapes
    strokeStyle*: cstring
    # specifies the current text alignment used when drawing text
    textAlign*: cstring
    # the current text baseline used when drawing text
    textBaseline*: cstring

proc getContext2d*(c: Canvas): Context2d =
  {.emit: "`result` = `c`.getContext('2d');".}

proc arc*(c: Context2d, x, y, radius, startAngle, endAngle: float, anticlockwise=false) {.importcpp.}
proc arcTo*(c: Context2d, x1, y1, x2, y2, radius: float) {.importcpp.}
proc beginPath*(c: Context2d) {.importcpp.}
proc bezierCurveTo*(c: Context2d, cp1x, cp1y, cp2x, cp2y, x, y: float) {.importcpp.}
proc clearRect*(c: Context2d, x, y, width, height: float) {.importcpp.}
proc clip*(c: Context2d) {.importcpp.}
proc closePath*(c: Context2d) {.importcpp.}
proc fill*(c: Context2d) {.importcpp.}
proc fillRect*(ctx: Context2d, x, y, w, h: float) {.importcpp.}
proc fillText*(ctx: Context2d, text: cstring, x, y: float) {.importcpp.}
proc fillText*(ctx: Context2d, text: cstring, x, y, maxWidth: float) {.importcpp.}
proc lineTo*(ctx: Context2d, x, y: float) {.importcpp.}
proc moveTo*(ctx: Context2d, x, y: float) {.importcpp.}
proc stroke*(c: Context2d) {.importcpp.}
proc strokeText*(c: Context2d, txt: cstring, x, y: float) {.importcpp.}
proc rect*(ctx: Context2d, x, y, w, h: float) {.importcpp.}
proc clip*(c: Context2d, fillRule: cstring) {.importcpp.}
proc scale*(ctx: Context2d, x, y: float) {.importcpp.}
proc translate*(ctx: Context2d, x, y: float) {.importcpp.}
proc save*(c: Context2d) {.importcpp.}
proc restore*(c: Context2d) {.importcpp.}
proc measureText*(c: Context2d, text: cstring): TextMetrics {.importcpp.}
