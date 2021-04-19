## JS WebSockets
## based on https://github.com/stisa/jswebsockets by Silvio MIT Copyright 2017

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

from dom import Event, EventTarget

type
  MessageEvent* = object of Event
    data*: cstring
    origin*: cstring

  CloseEvent*  = object of Event
    code*: Natural
    reason*: cstring
    wasClean*: bool

  ReadyState* = enum
    Connecting = 0
    Open = 1
    Closing = 2
    Closed = 3

  WebSocket* = ref object of EventTarget
    url*: cstring
    protocol*: cstring
    readyState*: ReadyState
    onopen*: proc (event: Event)
    onclose*: proc (event: CloseEvent)
    onmessage*: proc (event: MessageEvent)

proc newWebSocket*(url: cstring): WebSocket {.importcpp: "new WebSocket(#)".}
proc newWebSocket*(url: cstring, protocol: cstring): WebSocket {.importcpp: "new WebSocket(#,@)".}
proc newWebSocket*(url: cstring, protocols: seq[cstring]): WebSocket {.importcpp: "new WebSocket(#,@)".}
proc addEventListener*(et: EventTarget, ev: cstring, cb: proc (ev: MessageEvent | CloseEvent)) {.importcpp.}
proc send*(socket: WebSocket, data: cstring) {.importcpp.}
proc close*(socket: WebSocket) {.importcpp.}
