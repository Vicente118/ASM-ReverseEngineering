#!/bin/zsh

if [ -z $1 ]; then
    	echo "Usage: ./asm64.sh <asm file>"
	exit
fi

if [ ! -e "$1.asm" ]; then
    	echo "Error, $1.asm not found"
	echo "Do not enter file extensions"
	exit
fi

/home/vdarras/homebrew/bin/yasm -Worphan-labels -g dwarf2 -f elf64 $1.asm -l $1.lst
ld -g -o $1 $1.o
