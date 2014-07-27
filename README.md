LuaJIT + some (python-like) syntax.
----------------------------------------

### alias def = function

    local def myfunc()
      -- do something
    end

### alias elif = elseif

    if i == 0 then
      -- do something
    elif i == 1 then
      -- do something
    end

### (while | for | if | function) indent-block ": [newline]"
    while i < 10:
      i = i + 1
    for i = 1, 10:
      print(i)
    for i, v in pairs(t):
      print(i, v)
    if i == 0:  -- comment
      func1()
    elif i == 1:
      func2()
    else:
      if j == 1:
        func3()
    local def test(a, b):
      return a + b
    
### (while | for | if | function) single-line-block ";"
    while i < 10; i = i + 1
    for i = 1, 10; print(i)
    for i, v in pairs(t); print(i, v)
    if i == 0;  func1()
    elif i == 1; func2()
    else; if j == 1; func3()
    local def test(a, b); return a + b


### TODO

* raise error at empty indent-block
* compound assignment operator
* continue
* for if
* arrow function syntax (lambda expr)
* table comprehension
* ternary operator
* nil coalescing operator
* string interpolation
* shorthand for same name key-var pair in table constructor
* import ... from ...
* existential operator
* auto local decl


README for LuaJIT 2.0.3
-----------------------

LuaJIT is a Just-In-Time (JIT) compiler for the Lua programming language.

Project Homepage: http://luajit.org/

LuaJIT is Copyright (C) 2005-2014 Mike Pall.
LuaJIT is free software, released under the MIT license.
See full Copyright Notice in the COPYRIGHT file or in luajit.h.

Documentation for LuaJIT is available in HTML format.
Please point your favorite browser to:

 doc/luajit.html
