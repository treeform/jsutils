## Convert to and from json with nulls and missing fileds
import streams


# proc notNil(x: SomeInteger|SomeFloat|string|bool|object|seq|enum): bool =
#   true

# proc notNil(x: ref object|cstring): bool =
#   x != nil

# proc toBin*(x: SomeInteger|SomeFloat|string|bool): JsonNode =
#   %x

# proc toBin*(x: cstring): JsonNode =
#   %($x)

# proc toBin*[T](x: openArray[T]): JsonNode =
#   result = newJArray()
#   for value in x:
#     result.add(value.toBin())

# proc toBin*(x: enum): JsonNode =
#   %($x)

# proc toBin*(x: object): JsonNode =
#   result = newJObject()
#   for name, value in x.fieldPairs:
#     if notNil(value):
#       result[name] = value.toBin()

# proc toBin*(x: ref object): JsonNode =
#   result = newJObject()
#   if not x.isNil:
#     for name, value in x[].fieldPairs:
#       if notNil(value):
#         result[name] = value.toBin()

# proc toBin*(x: JsonNode): JsonNode =
#   x

# proc notNilAndValid(root: JsonNode, kind: JsonNodeKind): bool =
#   (not root.isNil) and (root.kind == kind)

proc toBin*(s: Stream, x: string) =
  echo "write"
  # s.write(uint64 x.len)
  # s.write(x)

template toBin*(data: string): string =
  echo "here"
  # let s = newStringStream()
  # toBin(s, data)
  # s.setPosition(0)
  # return s.readAll()
  return ""

# proc fromBin*(root: JsonNode, x: var SomeInteger) =
#   if root.notNilAndValid(JInt):
#     x = type(x)(root.getInt())
#   if root.notNilAndValid(JFloat):
#     x = type(x)(root.getFloat())

# proc fromBin*(root: JsonNode, x: var SomeFloat) =
#   if root.notNilAndValid(JFloat):
#     x = type(x)(root.getFloat())
#   if root.notNilAndValid(JInt):
#     x = type(x)(root.getInt())

# proc fromBin*(root: JsonNode, x: var string) =
#   if root.notNilAndValid(JString):
#     x = root.getStr()

# proc fromBin*(root: JsonNode, x: var bool) =
#   if root.notNilAndValid(JBool):
#     x = root.getBool()

# proc fromBin*[T: enum](root: JsonNode, x: var T) =
#   if root.notNilAndValid(JString):
#     x = parseEnum[T](root.str)

# proc fromBin*[T](root: JsonNode, x: var seq[T]) =
#   if root.notNilAndValid(JArray):
#     x.newSeq(root.len)
#     for i, value in x.mpairs:
#       root[i].fromBin(value)

# proc fromBin*(root: JsonNode, x: var object) =
#   if root.notNilAndValid(JObject):
#     for name, value in x.fieldPairs:
#       root.getOrDefault(name).fromBin(value)

# proc fromBin*(root: JsonNode, x: var ref object) =
#   if root.notNilAndValid(JObject):
#     x = type(x)()
#     for name, value in x[].fieldPairs:
#       root.getOrDefault(name).fromBin(value)

# proc fromBin*(root: JsonNode, x: var JsonNode) =
#   x = root

# template fromBin*[T](json: JsonNode, _: typedesc[T]): T =
#   var result: T
#   json.fromBin(result)
#   result

when isMainModule:
#   # test basics

  echo "here?"
  var x = "hello world".toBin()

  # echo "hello world".toBin.fromBin(string)
  # echo 1234.toBin.fromBin(int)
  # echo 123.456.toBin.fromBin(float)
  # echo true.toBin.fromBin(bool)
  # echo @[1,2,3].toBin.fromBin(seq[int])

  # when not defined(js):
  #   # test supported integer sizes
  #   echo (123.uint8).toBin.fromBin(uint8)
  #   echo (-123.int8).toBin.fromBin(int8)
  #   echo (1234.uint16).toBin.fromBin(uint16)
  #   echo (-1234.int16).toBin.fromBin(int16)
  #   echo (12356.uint32).toBin.fromBin(uint32)
  #   echo (-12356.int32).toBin.fromBin(int32)

  # # test float sizes
  # echo (float32 123.678).toBin.fromBin(float32)
  # echo (float64 123.678).toBin.fromBin(float64)
  # echo parseJson("1").fromBin(float32)
  # echo parseJson("123").fromBin(float32)
  # echo parseJson("123.678901234567890").fromBin(float32)
  # echo parseJson("1").fromBin(float64)
  # echo parseJson("123").fromBin(float64)
  # echo parseJson("123.678901234567890").fromBin(float64)

  # # test enums
  # type Enumer = enum
  #   Left
  #   Right
  #   Top
  #   Bottom

  # let e = Top
  # echo e.toBin()
  # echo e.toBin().fromBin(Enumer)
  # echo parseJson(""" "Top" """).fromBin(Enumer)
  # echo parseJson(""" "top" """).fromBin(Enumer)
  # echo parseJson(""" "TOP" """).fromBin(Enumer)

  # # test regular objects
  # type Foo = object
  #   id: int
  #   name: string
  #   time: float
  #   active: bool

  # let foo = Foo(id: 32, name: "yes", time: 16.77, active: true)
  # echo foo.toBin()
  # echo parseJson("""
  #   {"id":32,"name":"yes","time":16.77,"active":true}
  # """).fromBin(Foo)

  # echo parseJson("""{"id":32,"name":"yes","active":true}""").fromBin(Foo)
  # echo parseJson("""{}""").fromBin(Foo)

  # # int works in case of float, and float in case of int
  # echo parseJson("""{"id":32.0,"time":1677}""").fromBin(Foo)

  # echo @[1,2,3].toBin()
  # echo parseJson("""[1,2,3]""").fromBin(seq[int])

  # type Bar = object
  #   id: int
  #   arr: seq[int]
  #   foo: Foo

  # var bar = Bar()
  # echo bar.toBin()
  # echo parseJson("""
  #   {
  #     "id": 123,
  #     "arr": [
  #       1,
  #       2,
  #       3
  #     ],
  #     "foo": {
  #       "id": 1,
  #       "name": "hi",
  #       "time": 12,
  #       "active": true
  #     }
  #   }
  # """).fromBin(Bar)

  # echo parseJson("""
  #   {
  #   }
  # """).fromBin(Bar)

  # echo parseJson("""
  #   {
  #     "extra": 123
  #   }
  # """).fromBin(Bar)


  # type
  #   Foo2 = ref object
  #     id: int
  #   Bar2 = object
  #     id: int
  #     foo: Foo2

  # var foo2: Foo2
  # echo foo2.toBin()

  # var bar2 = Bar2()
  # echo bar2.toBin()

  # bar2.id = 2
  # bar2.foo = Foo2(id:4)
  # echo bar2.toBin()

  # echo parseJson("""
  #   {
  #   }
  # """).fromBin(Bar2)

  # echo parseJson("""
  #   {
  #     "id": 123
  #   }
  # """).fromBin(Bar2)

  # bar2 = parseJson("""
  #   {
  #     "id": 123,
  #     "foo": {"id": 456}
  #   }
  # """).fromBin(Bar2)
  # echo bar2.foo.id

  # echo parseJson("""
  #   {
  #     "random": 123,
  #     "json": {"id": 456}
  #   }
  # """).toBin()

  # type
  #   Foo3 = ref object
  #     data: JsonNode

  # var foo3 = parseJson("""
  #   {
  #     "data": {"id": 456}
  #   }
  # """).fromBin(Foo3)
  # echo foo3.data