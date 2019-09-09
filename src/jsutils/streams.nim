## JS implementions of StringStream
import arraybuffers

when not defined(js):
  {.fatal: "This module can only be used in js mode".}

type
  StringStream = ref object
    buffer: ArrayBuffer
    view: DataView
    pos: int
    cap: int


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

proc grow(s: StringStream, minBytes=0) =
  ## Grows string stream cap by x2 for a minium of minBytes
  s.cap = max(minBytes, s.cap * 2)
  s.buffer = s.buffer.transfer(s.cap)
  s.view = newDataView(s.buffer)

proc write*(s: StringStream, x: string) =
  ## writes the string `x` to the the stream `s`. No length field or
  ## terminating zero is written.
  if s.pos + x.len > s.cap:
    s.grow(s.pos + x.len)
  for c in x:
    s.view.setUInt8(s.pos, uint8 ord(c))
    inc s.pos

proc write*(s: StringStream, args: varargs[string, `$`]) =
  ## writes one or more strings to the the stream. No length fields or
  ## terminating zeros are written.
  for str in args:
    s.write(str)

when isMainModule:

  var s = newStringStream("hi there")
  s.flush()
  s.close()
  echo s.atEnd()
  echo s.readAll()
  s.write(", how are you?")
  s.write("I", " ", "am", " ", "good.")
  echo s.readAll()



