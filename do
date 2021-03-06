#! /bin/bash
arm-none-eabi-as -mthumb -mcpu=cortex-m3 code.S -o code.o
arm-none-eabi-ld code.o -T./linkerScript.ld -o main.elf
arm-none-eabi-gdb --init-eval-command="target extended-remote :4242" main.elf
