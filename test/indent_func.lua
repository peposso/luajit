local ok, msg

ok, msg = load([[
  local function test()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- local function() ... end')

ok, msg = load([[
  local test = function()
    return 'ok'
  end
  return test()
]])
assert(ok, msg)
print(ok()..' -- = function() ... end')


ok, msg = load([[
  local function test():
    return 'ok'
  return test()
]])
assert(ok, msg)
print(ok()..' -- local function(): ...')

ok, msg = load([[
  local test = function():
    return 'ok'
  return test()
]])
assert(ok, msg)
print(ok()..' -- = function(): ...')


ok, msg = load([[
  local function test(); return 'ok'
  return test()
]])
assert(ok, msg)
print(ok()..' -- local function(); ...')

ok, msg = load([[
  local test = function(); return 'ok'
  return test()
]])
assert(ok, msg)
print(ok()..' -- = function(); ...')


