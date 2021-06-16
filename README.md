# Console-Func-Lib
A simple library designed to be an extension of the Roblox log service

# fetch funcs
## fetchPrints

fetchPrints will return the content, timestamp, and an Enum value for all the prints within the game at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchPrints()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```
All timestamps will be returned in the normal Lua format, requiring you to format it as you see fit. For documentation on how to do this, you can find it here: [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)

## fetchWarns

fetchWarns will return the content, timestamp, and an Enum value for all the warnings within the game at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchWarns()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```
Same as before, all timestamps will be returned in the normal Lua format, for further info on how to format that, check the [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)

## fetchErrors

fetchErrors will return the content, timestamp, and an Enum value for all the warnings within the game at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchErrors()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```
Same as the other two fetch funcs, timestamps for returned values are in the normal Lua format and will require formating, if you need to know how to do this check the [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)
