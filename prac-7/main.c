//HNDALA006 VCKSHA001
// bring in the library file which provides definitions for our
// uint32_t, int8_t, etc types. I know I haven't explained this yet...
#include <stdint.h>

void main(void) {
    // provide clock to the GPIOB peripheral.
    *(uint32_t*)0x40021014 = 0x40000;

    // set PB0 - PB7 to output mode
    *(uint32_t*)0x48000400 = 0x5555;

    // write pattern 0xAA to GPIOB_ODR
    *(uint8_t*)0x48000414 = 0xAA;

	// cause the program to hang in an infinite loop here.
    // In other words: do not let main return.
	for(;;) {  
	}   

    

}
