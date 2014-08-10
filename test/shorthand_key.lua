local ok, msg

_G.gvariable = {}

ok, msg = load([[
  local x, y, z = 10, 20, 30
  local t = {=x, =y, =z, =gvariable}
  if t.x == x and t.y == y and t.z == z and t.gvariable == gvariable then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok()..' -- shorthand for table key')

ok, msg = load([[
  local x, y, z = 10, 20, 30
  local z_ = function() return 'z'..'' end
  local t = {x, x=x, ['y']=y, [z_()]=z; gvariable=gvariable}
  if t[1] == x and t.x == x and t.y == y and t.z == z and t.gvariable == gvariable then
    return 'ok'
  end
  return 'bad'
]])
assert(ok, msg)
print(ok()..' -- table normal expr')

