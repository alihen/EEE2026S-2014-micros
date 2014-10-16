//HNDALA006

/* Notes: static works for ints, gives a function "memory"
 * call all global varibables volatile
 * volatile  uint32_t  foobar;
 *
 *
 *
 *
 *
 */

#include <stdint.h>
#include "stm32f0xx.h"

#define EVER ;;
typedef enum { false, true } bool;


void delay(uint32_t loop_time);
void enable_leds();
void enable_buttons();
void enable_pot0();
void enable_pot1();
void enable_adc1();
void enable_pot0_channel();
void enable_pot1_channel();
void setup_tim6(uint32_t prescaler, uint32_t arr);
void sw0_held();
void sw1_held();
void sw2_held();
void sw3_held();
void sw0_pressed();
void sw1_pressed();
void sw2_pressed();
void sw3_pressed();

int main(void) {
    enable_buttons();
    enable_leds();
    enable_pot1();
    enable_adc1();
    //setup_tim6(999,4000); // 2 Hz 

    // set rolutions/alignment if necessary. current 10-bit
     ADC1->CFGR1 |= 0x8 ;
      
    for(EVER) {
        sw0_held();
        sw1_held();
    }
    return 0;  // keep compiler happy. 
}
/*
 * BUTTON HOLDS
 */
void sw0_held(){
   if ((GPIOA->IDR & (1 << 0)) == 0){
            
    } 
}

void sw1_held(){
    if ((GPIOA->IDR & (1 << 1)) == 0){
 
     }
}

void sw2_held(){
    if ((GPIOA->IDR & (1 << 2)) == 0){
       
     }
}

void sw3_held(){
    if ((GPIOA->IDR & (1 << 3)) == 0){
       
     }
}

/*
 * BUTTON PRESSES
 * Note: Copy this code into the main block!!!
 */

void sw0_pressed(){
     bool current_state ;
     bool previous_state  = (GPIOA->IDR & (1 << 0));
    //for ever
        current_state = (GPIOA->IDR & (1 << 0));
        if (!current_state && previous_state){
            //magic sauce goes here
            GPIOB->ODR += 1;

        }
        previous_state = current_state ;
        delay(13250);
        
};

void sw1_pressed(){
    bool current_state ;
    bool previous_state  = (GPIOA->IDR & (1 << 1));
        current_state = (GPIOA->IDR & (1 << 1));
        if (!current_state && previous_state){
            //magic sauce goes here
            
        }
        previous_state = current_state ;
        delay(13250);
};

void sw2_pressed(){
    bool current_state ;
    bool previous_state  = (GPIOA->IDR & (1 << 2));
        current_state = (GPIOA->IDR & (1 << 2));
        if (!current_state && previous_state){
            //magic sauce goes here
            
        }
        previous_state = current_state ;
        delay(13250);
};

void sw3_pressed(){
    bool current_state ;
    bool previous_state  = (GPIOA->IDR & (1 << 3));
        current_state = (GPIOA->IDR & (1 << 3));
        if (!current_state && previous_state){
            //magic sauce goes here
            
        }
        previous_state = current_state ;
        delay(13250);
};

/*
 * BUTTON RELEASES
 */



/*
 * TIM6 INTERRUPT HANDLER
 */
 void TIM6_DAC_IRQHandler(){
    TIM6->SR &= ~(1 << 0);
    //do what you need to do in interrupt, keep it short and sweet, use global variables
    
 }

/*
 * DELAYS 
 */
void delay(uint32_t loop_time){
    int k;
        for(k = 0; k < loop_time; k++){
        }
}

/*
 * ENABLING
 */ 
void enable_leds(){
    // enable clock for GPIOB
    RCC->AHBENR |= 1 << 18; 

    // set GPIOB[0-7] as outputs
    GPIOB->MODER = 0x5555;
    GPIOB->ODR = 0x00;
}

void enable_buttons(){
    // enable clock for GPIOA
    RCC->AHBENR |= 1 << 17;  //maybe try 17<<17

    // configure GPIOA pull-ups
    GPIOA->PUPDR |= 0x5555 ;

    //configure GPIOA (push buttons) to input
    GPIOA->MODER |= 0x28000000 ;
}

void enable_pot0(){
    GPIOA->MODER |= GPIO_MODER_MODER5 ;

   
}

void enable_pot1(){
    // set pin connected to **POT1** to be in analogue mode
    GPIOA->MODER |= GPIO_MODER_MODER6 ;
}

void enable_adc1(){
    // enable clock for ADC
    RCC->APB2ENR |= 9 << 9 ;   

    // enable ADC
    ADC1->CR = ADC_CR_ADEN ;

    // wait for ADC ready
    while (ADC1->ISR != ADC_ISR_ADRDY ){

    }

    enable_pot1_channel();
    //do either or! don't enable both  channels at the same time!
   //enable_pot0_channel();
}

void enable_pot0_channel(){
        // set ADC channel for **POT0**
    ADC1->CHSELR |= ADC_CHSELR_CHSEL5 ; 
}

void enable_pot1_channel(){
        // set ADC channel for **POT1**
    ADC1->CHSELR |= ADC_CHSELR_CHSEL6 ; 
}

void setup_tim6(uint32_t prescaler, uint32_t arr){
    // enable clock to TIM6
    RCC->APB1ENR |= 1 << 4; 
    TIM6->PSC = prescaler ; //prescaler-1
    TIM6->ARR = arr ; // f = 8Mhz / (prescaler * arr)
    //e.g f = 8Mhz / (1000 * 4000) = 2Hz
    TIM6->DIER |= 1 << 0 ; // set UIE: update interrupt enable on overflow
    TIM6->CR1 |= 1 << 0  ; // set CEN: start counter counting

    NVIC->ISER[0] |= 1 << 17 ;//unmask TIM6_DAC IRQ;

}