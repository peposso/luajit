local ok, msg

ok, msg = load([[
  local j = 0
  for i = 1, 10 do
    j = j + i
  end
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for do ... end')

ok, msg = load([[
  local t = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
  local j = 0
  for k, v in pairs(t) do
    j = j + v
  end
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for do ... end')


ok, msg = load([[
  local j = 0
  for i = 1, 10:
    j = j + i
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for : ... end')

ok, msg = load([[
  local t = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
  local j = 0
  for k, v in pairs(t):
    j = j + v
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for : ... end')


ok, msg = load([[
  local j = 0
  for i = 1, 10; j = j + i
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for : ... end')


ok, msg = load([[
  local t = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
  local j = 0
  for k, v in pairs(t); j = j + v
  assert(j == 55)
  return 'ok'
]])
assert(ok, msg)
print(ok()..' -- for : ... end')

