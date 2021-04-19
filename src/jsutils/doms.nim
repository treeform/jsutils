## Various dom related functions.

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

import dom

proc addFavicon*(href: string, kind = "image/png") =
  var css = document.createElement("link")
  css.setAttribute("href", href)
  css.setAttribute("rel", "shortcut icon")
  css.setAttribute("type", kind)
  document.head.appendChild(css)

proc addStyleSheet*(href: string) =
  var css = document.createElement("link")
  css.setAttribute("href", href)
  css.setAttribute("rel", "stylesheet")
  document.head.appendChild(css)

proc addScript*(src: string) =
  var js = document.createElement("script")
  js.setAttribute("src", src)
  js.setAttribute("type", "text/javascript")
  document.head.appendChild(js)
