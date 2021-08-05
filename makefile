all: sources


directories:
	mkdir scdOS


sources: scdisk.partition scdisk.diskcheck scdisk.dskterminal scdisk.setup scdisk.fsroot scdisk.filesystemlib lib.argparse scdisk.preloader scdisk.commands


scdisk.filesystemlib:
	gcc ./lib/filesystem.c -shared -fPIC -lreadline -llua5.4 -o ./lib/filesystem.so

lib.argparse:
	wget https://raw.githubusercontent.com/mpeterv/argparse/master/src/argparse.lua -O ./lib/argparse.lua


scdisk.partition:
	luac -o ./scdOS/scdPartition.dynlib ./scdisk/partition.lua

scdisk.dskterminal:
	luac -o ./scdOS/scdDiskTerminal.dynlib ./scdisk/dskterminal.lua

scdisk.setup:
	luac -o ./scdOS/scdSetupOS.dynlib ./scdisk/setup.lua

scdisk.diskcheck:
	luac -o ./scdOS/scdDiskCheck.dynlib ./scdisk/diskcheck.lua

scdisk.fsroot:
	luac -o ./scdOS/SCDFS.dynlib ./scdisk/fsroot.lua

scdisk.preloader:
	luac -o ./scdOS/scdLoader.dynlib ./scdisk/CLoader.lua

scdisk.commands:
	luac -o ./scdOS/scdsh/hello ./scdisk/builtins/hello.lua