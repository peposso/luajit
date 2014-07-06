local ok, msg

ok, msg = load([[
  local i = 0
  while i < 10 do
    i = i + 1
  end
  assert(i == 10)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- while do ... end')

ok, msg = load([[
  local i = 0
  while i < 10:
    i = i + 1
  assert(i == 10)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- while:')

ok, msg = load([[
  local i = 0
  while i < 10:
    i = i + 1 end
  assert(i == 10)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- while: <nl> ... end')

ok, msg = load([[
  local i = 0
  while i < 10:
    i = i + 1
  end
  assert(i == 10)
  return 'ok'
]])
assert(ok == nil)
if ok == nil then print("ok -- while: <nl> ... <nl> end -- unexpected end") end

ok, msg = load([[
  local i = 0
  while i < 10:
    if true then
      i = i + 1
  end
  assert(i == 10)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- while: <nl> ... <nl> if ... end')

