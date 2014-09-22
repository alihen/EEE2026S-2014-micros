main.elf: main.o stm32f051_startup.o stm32f051_linker_script.ld
	arm-none-eabi-ld -T stm32f051_linker_script.ld -o main.elf main.o stm32f051_startup.o 

main.o: main.s
	arm-none-eabi-as -g -o main.o main.s

stm32f051_startup.o: stm32f051_startup.s
	arm-none-eabi-as -g -o stm32f051_startup.o stm32f051_startup.s


main.s: main.c
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m0 -g -S -o main.s main.c
	
clean:
	rm -vf main.o main.elf main.s main.lst