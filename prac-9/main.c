//STDNUM001 STDNUM002

#include <stdint.h>
#include "stm32f0xx.h"

#define EVER ;;

// function prototype for variable_delay

int main(void) {
    // enable clock for GPIOA
    // configure GPIOA pull-ups
    // set pin connected to **POT1** to be in analogue mode

    // enable clock for GPIOB
    // set GPIOB[0-7] as outputs

    // enable clock for ADC
    // enable ADC
    // wait for ADC ready
    // set ADC channel for **POT1**
    // set rolutions/alignment if necessary. 10-bit res is advised.

    for(EVER) {
        // check if SW3 held down. If so:
            // subtract 1 from value on LEDs
        // if not:
            // add 1 to the value on the LEDs

        // delay
    }
    return 0;  // keep compiler happy. 
}

void variable_delay(void) {
    // check if SW2 is held down. If so:
        // kick off conversion
        // wait for conversion complete. This can be done using a WHILE loop which keeps looping while the EOC flag is 0.
        // do some operation to the data available in the ADC_DR to scale it to the required timing
    // if not:
        // set loop iterations to a fixed amount producing a delay of 0.5 s

    // run a FOR loop, where the number of iterations is set by the value calculated above. 
}
