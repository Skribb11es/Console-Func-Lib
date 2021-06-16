# Console-Func-Lib
A simple library designed to be an extension of the Roblox log service

# Usage
## fetchPrints

fetchPrints will return the content, timestamp, and an Enum value for all the prints within the game at the time of execution. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchPrints()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```
All timestamps will be returned in the normal Lua format, requiring you to format it as you see fit. For documentation on how to do this, you can find it here: [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)
