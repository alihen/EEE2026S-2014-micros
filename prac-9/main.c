//HNDALA006 VCKSHA001

#include <stdint.h>
#include "stm32f0xx.h"

#define EVER ;;

// function prototype for variable_delay
void variable_delay(void) ;

int main(void) {
    // enable clock for GPIOA
    RCC->AHBENR |= 1 << 17; 

    // configure GPIOA pull-ups
    GPIOA->PUPDR = 0x5555;

    // set pin connected to **POT1** to be in analogue mode
    GPIOA->MODER = 0x28000C00;

    // enable clock for GPIOB
    RCC->AHBENR |= 1 << 18; 

    // set GPIOB[0-7] as outputs
    GPIOB->MODER = 0x5555;
    GPIOB->ODR = 0x00;

    // enable clock for ADC
    RCC->APB2ENR |= 9 << 9 ;   

    // enable ADC
    ADC1->CR = ADC_CR_ADEN ;
     
    // wait for ADC ready


    // set ADC channel for **POT1**
    // set rolutions/alignment if necessary. 10-bit res is advised.

    for(EVER) {
        // check if SW3 held down. If so:
            // subtract 1 from value on LEDs
           // GPIOB->ODR -= 1 ;
        // if not:
            // add 1 to the value on the LEDs
            GPIOB->ODR += 1 ;

        // delay
            variable_delay();
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
        int k;
        for(k = 0; k < 325000; k++){
        }

    // run a FOR loop, where the number of iterations is set by the value calculated above. 
}
