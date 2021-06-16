# Console-Func-Lib
A simple library designed to be an extension of the Roblox log service

# Fetch Funcs

All timestamps will be returned in the normal Lua format, requiring you to format it as you see fit. For documentation on how to do this, you can find it here: [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)

## fetchPrints

fetchPrints will return the content, timestamp, and an Enum value for all the prints within the Roblox console at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchPrints()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```

## fetchWarns

fetchWarns will return the content, timestamp, and an Enum value for all the warnings within the Roblox console at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchWarns()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```

## fetchErrors

fetchErrors will return the content, timestamp, and an Enum value for all the errors within the Roblox console at the time of execution. All of this information will be stored in a table for each print, and a collection of all the tables stored within a primary table. An example of how to process this information is found below. Unfortunately, this does not work for errors that are output in the Synapse X internal UI.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

for i,v in pairs(logFuncs.fetchErrors()) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```

# Find Funcs

All timestamps will be returned in the normal Lua format, requiring you to format it as you see fit. For documentation on how to do this, you can find it here: [Roblox OS Docs](https://developer.roblox.com/en-us/api-reference/lua-docs/os)

## findPrints

Similar to the fetchPrints function, but instead of returning all the prints in the console, it will instead only return prints that contain the specified substring.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

print("Hello World!")

for i,v in pairs(lf.findPrints("Hello")) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```

## findWarns

Similar to the fetchWarns function, but instead of returning all the warnings in the console, it will instead only return warnings that contain the specified substring.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

warn("Hello World!")

for i,v in pairs(lf.findWarns("Hello")) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```

## findErrors

Similar to the fetchWarns function, but instead of returning all the warnings in the console, it will instead only return warnings that contain the specified substring.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

error("Hello World!")

for i,v in pairs(lf.findErrors("Hello")) do
    print(v["message"])
    print(v["timestamp"])
    print(tostring(v["messageType"]))
end
```
Unfortunately, this does not work for errors that are output in the Synapse X internal UI.

# Hook Funcs

This does not have any relation with the hookfunc() or hookfunction() functions within the Synapse X environment

## hookOutput

Effectively works as a hook function for all outputs at once, and will process the function each time that something is output to either the internal Synapse X UI or the Roblox developer console.
```lua
local logFuncs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Skribb11es/Console-Func-Lib/main/main.lua"))()

function returnOutput(table)
    if table["type"] == "SynapseError" then -- Called if the error is output to the Synapse X console
        print(table["message"]) -- Outputs the content of the error
    else -- If the type of the output is not "SynapseError" then it was output to the internal console and will have an Enum value as the "type" that will allow you to sort them accordingly.
        print(table["message"]) -- Outputs the content of the error
    end
end

lf.hookOutput(returnOutput)```
