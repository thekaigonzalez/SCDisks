---
--- Partition.lua
--- build-essential for filesystem managment
---

local part = {}


part.blocks = {}

part.inodes = {}

function part:get_block(p)
    if type(p) ~= "number" then error("part:get_block() - <\\\\1> is not number.") end
    return self.blocks[p]
end

function part:get_node(p)
    if type(p) ~= "number" then error("part:get_block() - <\\\\1> is not number.") end
    return self.inodes[p]
end

function part:shift(n)
    if type(n) ~= "number" then error("part:get_block() - <\\\\1> is not number.") end
    if n == 0 then return 1 end
    return n + 1;
end

function part:assert_block(n)
    if type(n) ~= "number" then error("part:get_block() - <\\\\1> is not number.") end
    return assert(self.blocks[n] ~= nil)
end

function part:assert_inode(n)
    if type(n) ~= "number" then error("part:get_block() - <\\\\1> is not number.") end
    return assert(self.inodes[n] ~= nil)
end

function part:add_node(n, v)
    self.inodes[n] = v -- Add an inode as <n> with value <v>, could be number, string, etc ...
end

function part:add_block(n, v)
    self.blocks[n] = v -- Add an inode as <n> with value <v>, could be number, string, etc ...
end
return part