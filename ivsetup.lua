package.cpath = package.cpath .. ";lib/?.so"
package.path = package.path .. ";lib/?.lua"

local argparse = require 'argparse'

local parser = argparse("ivsetup", "Setup the terminal session live from in your bash or ZSH terminal!")

local args = parser:parse()

local stack = dofile("./scdOS/scdDiskTerminal.dynlib")

stack:init()