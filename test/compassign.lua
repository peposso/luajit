local ok, msg

ok, msg = load([[
  local s = "test1"
  local function func()
    return "test2", "disposedvalue"
  end
  s ..= func()
  s ..= "test3"
  if s == "test1test2test3" then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok()..' -- localvar ..=')

_G.gs = 'test1'
function _G.gfunc()
  return "test2", "disposedvalue"
end

ok, msg = load([[
  gs ..= gfunc()
  gs ..= "test3"
  if gs == "test1test2test3" then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok()..' -- globalvar ..=')

ok, msg = load([[
  local t = {s='test1'}
  t.s ..= "test2"
  t.s ..= "test3"
  if t.s == "test1test2test3" then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok()..' -- table.index ..=')

ok, msg = load([[
  local s ..= 'bad'
  return s
]])
assert(ok==nil, msg)
print("ok"..' -- bad syntax: local v ..= ')

ok, msg = load([[
  local i = 7
  i += 3
  return i == 10 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- +=')

ok, msg = load([[
  local i = 14
  i -= 4
  return i == 10 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- -=')

ok, msg = load([[
  local i = 2
  i *= 5
  return i == 10 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- *=')

ok, msg = load([[
  local i = 20
  i /= 2
  return i == 10 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- /=')

ok, msg = load([[
  local i = 820
  i %= 90
  return i == 10 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- %=')

ok, msg = load([[
  local i = 2
  i ^= 8
  return i == 256 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- ^=')


ok, msg = load([[
  local b = true
  b and= 123
  return b == 123 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- and=')

ok, msg = load([[
  local b = false
  b or= 123
  return b == 123 and 'ok' or 'bad'
]])
assert(ok, msg)
print(ok()..' -- or=')

