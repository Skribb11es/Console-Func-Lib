local logFuncs = {} -- table of functions
local ls = game:GetService("LogService") -- the roblox log service
local occurrenceOutput = true -- if set to true will output the amount of logs that were returned

logFuncs.fetchPrints = function() -- returns print content and its timestamp
    local currentLogs = ls:GetLogHistory()
    local printTable = {}
    for i,v in pairs(currentLogs) do
        if v["messageType"] == Enum.MessageType.MessageOutput then
            table.insert(printTable, v) -- adds the print to the return table
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(printTable) .. " occurrence's")
    end
    return printTable -- returns the table
end

logFuncs.fetchWarns = function() -- returns warning content and its timestamp
    local currentLogs = ls:GetLogHistory()
    local warnTable = {}
    for i,v in pairs(currentLogs) do
        if v["messageType"] == Enum.MessageType.MessageWarning then
            table.insert(warnTable, v) -- adds the warning to the return table
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(warnTable) .. " occurrence's")
    end
    return warnTable -- returns the table
end

logFuncs.fetchErrors = function() -- returns error content and its timestamp
    local currentLogs = ls:GetLogHistory()
    local errorTable = {}
    for i,v in pairs(currentLogs) do
        if v["messageType"] == Enum.MessageType.MessageError then
            table.insert(errorTable, v) -- adds the error to the return table
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(errorTable) .. " occurrence(s)")
    end
    return errorTable -- returns the table
end

logFuncs.findPrints = function(str) -- returns print content and its timestamp if the substring is found
    local printTable = {}
    local prints = logFuncs.fetchPrints()
    for i,v in pairs(prints) do
        if string.find(v["message"], str) then -- finds the substring within the print
            table.insert(printTable, v) -- adds the occurrence to the table 
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(printTable) .. " occurrence(s) of " .. str) -- outputs the times that the string was found
    end
    return(printTable) -- returns the table
end

logFuncs.findWarns = function(str) -- returns warning content and its timestamp if the substring is found
    local warnTable = {}
    local warns = logFuncs.fetchWarns()
    for i,v in pairs(prints) do
        if string.find(v["message"], str) then -- finds the substring within the warning
            table.insert(warnTable, v) -- adds the occurrence to the table 
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(warnTable) .. " occurrence(s) of " .. str) -- outputs the times that the string was found
    end
    return(warnTable) -- returns the table
end

logFuncs.findErrors = function(str) -- returns error content and its timestamp if the substring is found
    local errorTable = {}
    local errors = logFuncs.fetchErrors()
    for i,v in pairs(prints) do
        if string.find(v["message"], str) then -- finds the substring within the error
            table.insert(errorTable, v)  -- adds the occurrence to the table 
        end
    end
    if occurrenceOutput then
        rconsoleprint("\nFound " .. table.getn(errorTable) .. " occurrence(s) of " .. str) -- outputs the times that the string was found
    end
    return(errorTable)  -- returns the table
end

logFuncs.hookOutput = function(func) -- fired every time somthing is output to the ingame console or the synapse x internal console
    game.ScriptContext.ErrorDetailed:Connect(function(message) -- fires each time an error is directed to the synapse internal console
        func({["message"]=message, ["type"]="SynapseError"}) -- calls the specafied function with SynapseError and content of the error
    end)
    ls.MessageOut:Connect(function(message, messageType) -- fired each time an output is made to the roblox developer console
        func({["message"]=message, ["type"]=messageType}) -- calls the specafied function with the output type and content of the output
    end)    
end

return logFuncs
