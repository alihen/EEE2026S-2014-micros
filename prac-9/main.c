//HNDALA006 VCKSHA001

#include <stdint.h>
#include "stm32f0xx.h"

#define EVER ;;

// function prototype for variable_delay
void variable_delay(void) ;
void delay(uint32_t loop_time);

int main(void) {
    // enable clock for GPIOA
    RCC->AHBENR |= 1 << 17; 

    // configure GPIOA pull-ups
    GPIOA->PUPDR |= 0x5555 ;

    // set pin connected to **POT1** to be in analogue mode
    GPIOA->MODER |= GPIO_MODER_MODER6 ;
    GPIOA->MODER |= 0x28000000 ;

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
    while (ADC1->ISR != ADC_ISR_ADRDY ){

    }

    // set ADC channel for **POT1**
    ADC1->CHSELR |= ADC_CHSELR_CHSEL6 ; 

    // set rolutions/alignment if necessary. 10-bit res is advised.
     ADC1->CFGR1 |= 0xA ;

    for(EVER) {
        // check if SW3 held down. If so:
        if (GPIOA->IDR & 0b1000){
            // subtract 1 from value on LEDs
            
            GPIOB->ODR += 1 ;
        }
        // if not:
        else{
            // add 1 to the value on the LEDs
            GPIOB->ODR -= 1 ;
        }
        // delay
            variable_delay();
    }
    return 0;  // keep compiler happy. 
}

void variable_delay(void) {
    // check if SW2 is held down. If so:
    if (GPIOA->IDR & 0b0100){
        // set loop iterations to a fixed amount producing a delay of 0.5 s
        delay(325000);
        
    }
    // if not:
    else{
        // kick off conversion
        ADC1->CR |= ADC_CR_ADSTART ;
        // wait for conversion complete. This can be done using a WHILE loop which keeps looping while the EOC flag is 0.
        while (ADC1->ISR & !ADC_ISR_EOC){

        }
        // do some operation to the data available in the ADC_DR to scale it to the required timing
        delay(65000 + ((ADC1->DR) * 255 ));

    }
        

    // run a FOR loop, where the number of iterations is set by the value calculated above. 
}

void delay(uint32_t loop_time){
    int k;
        for(k = 0; k < loop_time; k++){
        }
}
