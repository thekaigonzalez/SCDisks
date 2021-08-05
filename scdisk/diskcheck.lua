package.cpath = package.cpath .. ";./scdOS/?.dynlib"

local Pd = loadfile("./scdOS/SCDFS")()

local diskcheck = {}

function diskcheck:check(disk, node_amount)
    for i = 0, node_amount do
        Pd:fsroot_check()
    end
end

return diskcheck