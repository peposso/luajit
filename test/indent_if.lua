local ok, msg

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0 then
    s = 'ok'
  elseif i == 1 then
    s = 'bad'
  end
  return s
]])
assert(ok, msg)
print(ok()..' -- if then ... end')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0:
    s = 'ok'
  return s
]])
assert(ok, msg)
print(ok()..' -- if : ...')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0:
    if type(i) == 'number':
      s = 'ok'
    else:
      s = 'bad'
  elseif i == 1:
    s = 'bad'
  return s
]])
assert(ok, msg)
print(ok()..' -- if : else ...')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0:
    s = 'ok'
    if i == 1:
      s = 'bad'
  else:
    s = 'bad'
  return s
]])
assert(ok, msg)
print(ok()..' -- if : else ...')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0; s = 'ok'
  return s
]])
assert(ok, msg)
print(ok()..' -- if ; ...')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0; if i == 1; elseif i==2; else; s = 'ok'
  return s
]])
assert(ok, msg)
print(ok()..' -- if ; else; ...')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0:
    s = 'ok' end
  return s
]])
assert(ok, msg)
print(ok()..' -- if : ... end')

ok, msg = load([[
  local i,s = 0,'bad'
  if i == 0; s = 'ok' end
  return s
]])
assert(ok, msg)
print(ok()..' -- if ; ... end')

ok, msg = load([[
  local s = 'bad'
  if true; if true:
    if true; if true:
      s = 'ok'
  return s
]])
assert(ok, msg)
print(ok()..' -- if ;:;: ...')


