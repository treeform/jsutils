when not defined(js):
  {.fatal: "This module can only be used in js mode".}

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

proc getBigInt64*(dataView: DataView, pos: int): int64 {.importcpp.}
proc getBigUint64*(dataView: DataView, pos: int): uint64 {.importcpp.}
proc getFloat32*(dataView: DataView, pos: int): float32 {.importcpp.}
proc getFloat64*(dataView: DataView, pos: int): float64 {.importcpp.}
proc getInt16*(dataView: DataView, pos: int): int16 {.importcpp.}
proc getInt32*(dataView: DataView, pos: int): int32 {.importcpp.}
proc getInt8*(dataView: DataView, pos: int): int8 {.importcpp.}
proc getUint16*(dataView: DataView, pos: int): uint16 {.importcpp.}
proc getUint32*(dataView: DataView, pos: int): uint32 {.importcpp.}
proc getUint8*(dataView: DataView, pos: int): uint8 {.importcpp.}

proc setBigInt64*(dataView: DataView, pos: int, value: int64) {.importcpp.}
proc setBigUint64*(dataView: DataView, pos: int, value: uint64) {.importcpp.}
proc setFloat32*(dataView: DataView, pos: int, value: float32) {.importcpp.}
proc setFloat64*(dataView: DataView, pos: int, value: float64) {.importcpp.}
proc setInt16*(dataView: DataView, pos: int, value: int16) {.importcpp.}
proc setInt32*(dataView: DataView, pos: int, value: int32) {.importcpp.}
proc setInt8*(dataView: DataView, pos: int, value: int8) {.importcpp.}
proc setUint16*(dataView: DataView, pos: int, value: uint16) {.importcpp.}
proc setUint32*(dataView: DataView, pos: int, value: uint32) {.importcpp.}
proc setUint8*(dataView: DataView, pos: int, value: uint8) {.importcpp.}

