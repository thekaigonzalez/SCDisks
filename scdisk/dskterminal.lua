local groot = loadfile("./scdOS/SCDFS.dynlib")()
package.cpath = package.cpath .. ";./lib/?.so"
require('filesystem')
local CLoad = loadfile("./scdOS/scdLoader.dynlib")
local diskterminal = {}

--- FreeKSD
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function OneTimeSplit(string)
    local tblt = {}
    local lns = split(string, " ")
    i = 0
    -- works!

    for _,V in ipairs(lns) do
        tblt[i] = V;
        i = i + 1
    end
    return tblt
end

--- End FreeKSD


function diskterminal:init(IS_UPSTREAM)
    if IS_UPSTREAM then
        print("diskterminal-init: some features may be unavailable due to upstream initialization.")
    end
    local check = groot:fsroot_check();

    if check == 0x01 then
        os.execute("clear")
        print("login successful on ttys000")
        while true do
            local command = readline("bash1.0$")
            local carg = OneTimeSplit(command)
            local file = loadfile("./scdOS/scdsh/" .. carg[0])()
            file:main(carg)

        end
    else
        os.execute("clear")
        print("failed login on ttys000")
    end
end

return diskterminal