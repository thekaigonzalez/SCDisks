local Tsession = loadfile('./scdOS/scdDiskCheck.dynlib')()

local setup = {}
setup.up = false
local warn = function (c)
    print("warning: " .. c)
end

function setup:main(C)
    if C == 0x01 then
        print("login successful on ttys000")
    elseif C == 0x02 then
        error("0x02 (fail) called: exit")
    elseif C == 0x03 then
        warn("up stream (0x03) called. some features may be unavailable or disabled.")
        setup.up = true
    end
    Tsession:init(setup.up)
end

return setup