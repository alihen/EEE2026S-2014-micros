main.elf: main.o stm32f051_startup.o
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m0 -nostartfiles -T stm32f051_linker_script.ld -o main.elf main.o stm32f051_startup.o

main.o: main.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o main.o main.s

main.s: main.c
	arm-none-eabi-gcc -I ./Libraries/ -Wall -mthumb -mcpu=cortex-m0 -g -S -o main.s main.c

stm32f051_startup.o: stm32f051_startup.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o stm32f051_startup.o stm32f051_startup.s
