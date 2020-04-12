# /utils/*
The utils folder houses common utilities for use by anyone, simply put `*_script "@fsn_core/utils/<utility>` in your _resource manifest_

## sh_debug.lua
A small collection of debug helpers like `Debug.Print()` that only work when `fsn_debug` is set to true
## cl_utils.lua
A collection of FiveM specific utillites. See the file itself for more docs
## sh_fun.lua
The [Lua Fun](https://github.com/luafun/luafun) library exported to the global `luafun`
## sv_query.lua
A tool to simplify the building of MySQL queries, strings begone! (WIP!)