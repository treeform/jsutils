## LocalStorage

when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

type
  LocalStorage* = object
var localStorage* {.importc.}: LocalStorage
proc getItem*(localStorage: LocalStorage, key: cstring): cstring {.importcpp.}
proc setItem*(localStorage: LocalStorage, key: cstring, value: cstring) {.importcpp.}
