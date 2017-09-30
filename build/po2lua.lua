local inMsgId, inMsgStr, msgIdChunks, msgStrChunks
local startMsgIdBlock, startMsgStrBlock, endPreviousBlock
local messages

function startMsgIdBlock()
    endPreviousBlock()
    inMsgId = true
    msgIdChunks = {}
end

function startMsgStrBlock()
    endPreviousBlock()
    inMsgStr = true
    msgStrChunks = {}
end

function endPreviousBlock(output)
    if(inMsgId) then
        inMsgId = false
    elseif(inMsgStr) then
        inMsgStr = false
        local msgId = table.concat(msgIdChunks, "")
        local msgStr = table.concat(msgStrChunks, "")
        if(msgId ~= "" and msgStr ~= "") then
            output:write("settext(\"", msgId, "\", \"", msgStr, "\")", "\n")
        end
    end
end

for file in io.popen([[dir /b]]):lines() do
    local lang = file:match("(.-)%.po$")
    if(lang) then
        local output = io.open("../src/i18n/" .. lang .. ".lua", "w+")
        output:write("-- this file is automatically generated. DO NOT EDIT IT DIRECTLY!", "\n")
        output:write("local settext = LibStub(\"LibGetText\")(\"AwesomeGuildStore\").settext", "\n")
        for line in io.lines(file) do
            if(not line:match("^#.-")) then
                if(line:match("^msgid (.-)")) then
                    startMsgIdBlock()
                elseif(line:match("^msgstr (.-)")) then
                    startMsgStrBlock()
                elseif(line == "") then
                    endPreviousBlock(output)
                end
                if(inMsgId) then
                    msgIdChunks[#msgIdChunks + 1] = line:match("\"(.-)\"")
                elseif(inMsgStr) then
                    msgStrChunks[#msgStrChunks + 1] = line:match("\"(.-)\"")
                end
            end
        end
    end
end
