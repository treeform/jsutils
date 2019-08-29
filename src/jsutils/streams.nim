## JS implementions of StringStream
import dom, jsffi

when not defined(js):
  {.fatal: "This module can only be used in js mode".}

type

  ArrayBuffer {.importc.} = ref object
  DataView {.importc.} = ref object

  StringStream = ref object
    buffer: ArrayBuffer
    view: DataView
    pos: int
    cap: int

proc newArrayBuffer(bytes: int): ArrayBuffer =
  {.emit: "`result` = new ArrayBuffer(`bytes`)".}

proc newDataView(buffer: ArrayBuffer): DataView =
  {.emit: "`result` = new DataView(`buffer`)".}

proc len(buffer: ArrayBuffer): int =
  {.emit: "`result` = `buffer`.byteLength".}


proc getBigInt64(dataView: DataView, pos: int): int64 {.importcpp.}
proc getBigUint64(dataView: DataView, pos: int): uint64 {.importcpp.}
proc getFloat32(dataView: DataView, pos: int): float32 {.importcpp.}
proc getFloat64(dataView: DataView, pos: int): float64 {.importcpp.}
proc getInt16(dataView: DataView, pos: int): int16 {.importcpp.}
proc getInt32(dataView: DataView, pos: int): int32 {.importcpp.}
proc getInt8(dataView: DataView, pos: int): int8 {.importcpp.}
proc getUint16(dataView: DataView, pos: int): uint16 {.importcpp.}
proc getUint32(dataView: DataView, pos: int): uint32 {.importcpp.}
proc getUint8(dataView: DataView, pos: int): uint8 {.importcpp.}

proc setBigInt64(dataView: DataView, pos: int, value: int64) {.importcpp.}
proc setBigUint64(dataView: DataView, pos: int, value: uint64) {.importcpp.}
proc setFloat32(dataView: DataView, pos: int, value: float32) {.importcpp.}
proc setFloat64(dataView: DataView, pos: int, value: float64) {.importcpp.}
proc setInt16(dataView: DataView, pos: int, value: int16) {.importcpp.}
proc setInt32(dataView: DataView, pos: int, value: int32) {.importcpp.}
proc setInt8(dataView: DataView, pos: int, value: int8) {.importcpp.}
proc setUint16(dataView: DataView, pos: int, value: uint16) {.importcpp.}
proc setUint32(dataView: DataView, pos: int, value: uint32) {.importcpp.}
proc setUint8(dataView: DataView, pos: int, value: uint8) {.importcpp.}


proc newStringStream(data=""): StringStream =
  result = StringStream()
  #{.emit: "`result.buffer` = new ArrayBuffer(`data.len`)".}
  #{.emit: "`result.view` = new DataView(`result.buffer`)".}
  result.buffer = newArrayBuffer(data.len)
  result.cap = data.len
  result.view = newDataView(result.buffer)
  for i, c in data:
    result.view.setUInt8(i, uint8 ord(c))

proc flush*(s: StringStream) =
  ## flushes the buffers that the stream `s` might use.
  discard

proc close*(s: StringStream) =
  ## closes the stream `s`.
  discard

proc atEnd*(s: StringStream): bool =
  ## checks if more data can be read from `f`. Returns true if all data has
  ## been read.
  s.pos == s.buffer.len

proc setPosition*(s: StringStream, pos: int) =
  ## sets the position `pos` of the stream `s`.
  s.pos = pos

proc getPosition*(s: StringStream): int =
  ## retrieves the current position in the stream `s`.
  s.pos

proc readData*(s: StringStream, buffer: pointer, bufLen: int): int {.error: "not defined for JS backend"} =
  ## low level proc that reads data into an untyped `buffer` of `bufLen` size.
  discard

proc readAll*(s: StringStream): string =
  ## Reads all available data.
  s.pos = 0
  while not s.atEnd():
    result.add char(s.view.getUint8(s.pos))
    inc s.pos

proc gorw(s: StringStream) =


proc write*(s: StringStream, x: string) =
  ## writes the string `x` to the the stream `s`. No length field or
  ## terminating zero is written.
  for c in x:
    if s.pos > s.cap: s.grow()
    s.view.setUInt8(s.pos, uint8 ord(c))
    inc s.pos

proc write*(s: StringStream, args: varargs[string, `$`]) =
  ## writes one or more strings to the the stream. No length fields or
  ## terminating zeros are written.
  for str in args: s.write(str)

when isMainModule:

  var s = newStringStream("hi there")
  s.flush()
  s.close()
  echo s.atEnd()
  echo s.readAll()
  s.write(", how are you?")
  s.write("I", " ", "am", " ", "good.")



