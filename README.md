# JS Utils

Common things one needs when using nim with JS.

## Strings

Common operations you might want to perform on JS strings. They are much faster to work with then normal nim strings when compiled to JS.

## JSON

Serilise and deserilize JSON that is missing fields and handles nils. Which is very commong for JS to have.

You will not get these json errors:
* `Error: unhandled exception: key not found` - default value is used
* `SIGSEGV: Illegal storage access. (Attempt to read from nil?)` - nils are handled as default values.
* `TypeError: Cannot read property 'kind' of null` - nils are handled as default values.
* Will read `float` as `int` and `int` as `float` when needed.

Note: this module can also be used in c mode.


## ArrayBuffers and DataView

Methods include:
* `newArrayBuffer`, `newDataView`, `len`, `transfer`
* `get/setBigInt64`
* `get/setBigUint64`
* `get/setFloat32`
* `get/setFloat64`
* `get/setInt16`
* `get/setInt32`
* `get/setInt8`
* `get/setUint16`
* `get/setUint32`
* `get/setUint8`

## Streams

Read and write binary file formats in nim using streams that have exact same API as the build int Streams that don't work with JS very well. Some methods are not copied because they would require pointers which JS does not support.