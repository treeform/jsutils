import jsutils

# create an ArrayBuffer with a size in bytes
var buffer = newArrayBuffer(16)

# Create a couple of views
var
  view1 = newDataView(buffer)
view1.setInt8(12, 42) # put 42 in slot 12
view1.setUint16(2, 0xFFAA, littleEndian = true) # put 0xFFAA in slot 2
