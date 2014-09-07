local ok, msg

local _ENV = {}

function _ENV.localcheck()
  local t = {}
  for i=1,100 do
    local name, value = debug.getlocal(2, i)
    if not name then break end
    t[name] = value
  end
  local ok = true
  local map = "abcdefghij"
  for i=1,10 do
    local c = string.sub(map,i,i)
    if t[c] ~= i then
      ok = false
      break
    end
  end
  return ok
end


ok, msg = load([[
  local _ENV = ...
  a = 1
  b, c = 2, 3
  d, e, f = 4, 5, 6
  g, h, i, j = 7, 8, 9, 10
  if _ENV.localcheck() then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok(_ENV)..' -- unknown var assign')

ok, msg = load([[
  local _ENV = ...
  local a, b, d, e, f  -- upvalues
  return (function()
    local g  -- locals
    a = 1
    b, c = 2, 3
    d, e, f = 4, 5, 6
    g, h, i, j = 7, 8, 9, 10
    local a, b = a, b
    local d, e, f = d, e, f
    if _ENV.localcheck() then
      return 'ok'
    end
    return 'bad'
  end)()
]])
assert(ok, msg)
print(ok(_ENV)..' -- unknown/known var assign')

