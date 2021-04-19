when not defined(js) and not defined(Nimdoc):
  {.error: "This module only works on the JavaScript platform".}

type
  ArrayBuffer* {.importc.} = ref object
  DataView* {.importc.} = ref object

proc newArrayBuffer*(bytes: int): ArrayBuffer =
  {.emit: "`result` = new ArrayBuffer(`bytes`)".}

proc newDataView*(buffer: ArrayBuffer): DataView =
  {.emit: "`result` = new DataView(`buffer`)".}

proc len*(buffer: ArrayBuffer): int =
  {.emit: "`result` = `buffer`.byteLength".}

proc transfer*(buffer: ArrayBuffer, bytes: int): ArrayBuffer =
  result = newArrayBuffer(bytes)
  {.emit: "new Uint8Array(`result`).set(`buffer`)".}

proc getBigInt64*(dataView: DataView, pos: int, littleEndian = false): int64 {.importcpp.}
proc getBigUint64*(dataView: DataView, pos: int, littleEndian = false): uint64 {.importcpp.}
proc getFloat32*(dataView: DataView, pos: int, littleEndian = false): float32 {.importcpp.}
proc getFloat64*(dataView: DataView, pos: int, littleEndian = false): float64 {.importcpp.}
proc getInt16*(dataView: DataView, pos: int, littleEndian = false): int16 {.importcpp.}
proc getInt32*(dataView: DataView, pos: int, littleEndian = false): int32 {.importcpp.}
proc getInt8*(dataView: DataView, pos: int, littleEndian = false): int8 {.importcpp.}
proc getUint16*(dataView: DataView, pos: int, littleEndian = false): uint16 {.importcpp.}
proc getUint32*(dataView: DataView, pos: int, littleEndian = false): uint32 {.importcpp.}
proc getUint8*(dataView: DataView, pos: int, littleEndian = false): uint8 {.importcpp.}

proc setBigInt64*(dataView: DataView, pos: int, value: int64, littleEndian = false) {.importcpp.}
proc setBigUint64*(dataView: DataView, pos: int, value: uint64, littleEndian = false) {.importcpp.}
proc setFloat32*(dataView: DataView, pos: int, value: float32, littleEndian = false) {.importcpp.}
proc setFloat64*(dataView: DataView, pos: int, value: float64, littleEndian = false) {.importcpp.}
proc setInt16*(dataView: DataView, pos: int, value: int16, littleEndian = false) {.importcpp.}
proc setInt32*(dataView: DataView, pos: int, value: int32, littleEndian = false) {.importcpp.}
proc setInt8*(dataView: DataView, pos: int, value: int8, littleEndian = false) {.importcpp.}
proc setUint16*(dataView: DataView, pos: int, value: uint16, littleEndian = false) {.importcpp.}
proc setUint32*(dataView: DataView, pos: int, value: uint32, littleEndian = false) {.importcpp.}
proc setUint8*(dataView: DataView, pos: int, value: uint8, littleEndian = false) {.importcpp.}
