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
# API: jsutils

```nim
import jsutils
```

## **proc** `&amp;`

Concats two JS strings together

```nim
proc `&`(x, y: cstring): cstring {.importcpp: "(# + #)".}
```

## **proc** `[]`

Slices a JS string

```nim
proc `[]`[T, U](s: cstring; x: HSlice[T, U]): cstring
```

## **proc** repeat

Returns string <tt class="docutils literal"><span class="pre">s</span></tt> concatenated <tt class="docutils literal"><span class="pre">n</span></tt> times.

```nim
proc repeat(s: cstring; n: Natural): cstring {.importcpp: "#.repeat(#)".}
```

## **proc** startsWith

<p>Returns true if <tt class="docutils literal"><span class="pre">s</span></tt> starts with string <tt class="docutils literal"><span class="pre">prefix</span></tt>.</p>
<p>If <tt class="docutils literal"><span class="pre">prefix == ""</span></tt> true is returned.</p>


```nim
proc startsWith(s, a: cstring): bool {.importcpp: "#.startsWith(#)".}
```

## **proc** endsWith

<p>Returns true if <tt class="docutils literal"><span class="pre">s</span></tt> ends with <tt class="docutils literal"><span class="pre">suffix</span></tt>.</p>
<p>If <tt class="docutils literal"><span class="pre">suffix == ""</span></tt> true is returned.</p>


```nim
proc endsWith(s: cstring; suffix: cstring): bool {.importcpp: "#.endsWith(#)".}
```

## **proc** find

<p>Searches for <tt class="docutils literal"><span class="pre">sub</span></tt> in <tt class="docutils literal"><span class="pre">s</span></tt> inside range <tt class="docutils literal"><span class="pre">start</span></tt>..`last` using preprocessed table <tt class="docutils literal"><span class="pre">a</span></tt>. If <tt class="docutils literal"><span class="pre">last</span></tt> is unspecified, it defaults to <tt class="docutils literal"><span class="pre">s.high</span></tt> (the last element).</p>
<p>Searching is case-sensitive. If <tt class="docutils literal"><span class="pre">sub</span></tt> is not in <tt class="docutils literal"><span class="pre">s</span></tt>, -1 is returned.</p>


```nim
proc find(s: cstring; a: cstring): int {.importcpp: "#.indexOf(#)".}
```

## **proc** contains

<p>Same as <tt class="docutils literal"><span class="pre">find(s, sub) >= 0</span></tt>.</p>
<p>See also:</p>

 * <a class="reference external" href="#find,string,string,Natural,int">find proc</a>



```nim
proc contains(s, sub: cstring): bool {.noSideEffect.}
```

## **proc** split

<p>Splits the string <tt class="docutils literal"><span class="pre">s</span></tt> into substrings using a single separator.</p>
<p>Substrings are separated by the character <tt class="docutils literal"><span class="pre">sep</span></tt>.</p>


```nim
proc split(s: cstring; a: cstring): seq[cstring] {.importcpp: "#.split(#)".}
```

## **proc** toLowerAscii

<p>Converts string <tt class="docutils literal"><span class="pre">s</span></tt> into lower case.</p>
<p>This works only for the letters <tt class="docutils literal"><span class="pre">A-Z</span></tt>. </p>


```nim
proc toLowerAscii(s: cstring): cstring {.importcpp: "#.toLowerCase()".}
```

## **proc** toUpperAscii

<p>Converts string <tt class="docutils literal"><span class="pre">s</span></tt> into upper case.</p>
<p>This works only for the letters <tt class="docutils literal"><span class="pre">A-Z</span></tt>.</p>


```nim
proc toUpperAscii(s: cstring): cstring {.importcpp: "#.toUpperCase()".}
```

## **proc** replace

Replaces <tt class="docutils literal"><span class="pre">sub</span></tt> in <tt class="docutils literal"><span class="pre">s</span></tt> by the string <tt class="docutils literal"><span class="pre">by</span></tt>.

```nim
proc replace(s, sub: cstring; by = cstring""): cstring {.importcpp: "#.replace(#, #)".}
```

## **proc** strip

Strips leading or trailing spaces 

```nim
proc strip(s: cstring): cstring {.importcpp: "#.trim()".}
```

## **proc** parseFloatJS

Parses a decimal floating point value contained in <tt class="docutils literal"><span class="pre">s</span></tt> Using JS's native float parsing function

```nim
proc parseFloatJS(s: cstring): float {.importcpp: "parseFloat(#)".}
```

