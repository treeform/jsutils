## JS Strings makes cstring have simmilar methods to normal nim string when in js mode.
## If you are doing with a ton of JS string data, JS strings might be faster

when not defined(js):
  {.fatal: "This module can only be used in js mode".}

proc `&`*(x, y: cstring): cstring =
  asm """
  return `x` + `y`;
  """

proc `[]`*[T, U](s: cstring; x: HSlice[T, U]): cstring =
  let l = x.a
  var h: int
  when U is BackwardsIndex:
    h = s.len - int(x.b) + 1
  else:
    h = x.b + 1
  if h > s.len:
    raise newException(IndexError, "index out of bounds []")
  asm """
  return `s`.slice(`l`, `h`);
  """


proc startsWith*(s, a: cstring): bool =
  asm """
  return `s`.startsWith(`a`);
  """


proc contains*(arr: seq[string], s: cstring): bool =
  for a in arr:
    if a == s:
      return true
  return false


proc contains*(s: cstring, a: cstring): bool =
  asm """
  return `s`.indexOf(`a`) != -1;
  """


proc split*(s: cstring, a: cstring): seq[cstring] =
  asm """
  return `s`.split(`a`)
  """


when isMainModule:
  let
    a = cstring "hello "
    b = cstring "world!"

  echo a & b
  echo a[0]
  echo (a & b)[2..10]

  echo "hello world!"[2..10]