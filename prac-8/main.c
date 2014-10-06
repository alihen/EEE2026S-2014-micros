//HNDALA006 VCKSHA001
#include <stdint.h>

#define EVER ;;

// declaration (ie: function prototype) for find_min_max function should be placed here.
void find_min_max(int8_t *array, uint32_t length, int8_t *max_ptr, int8_t *min_ptr);
// declaration for delay function here (if you decide to use a function)
void basic_delay(uint32_t time);
//Alternative interrupt delay;
//void interrupt_delay(uint16_t prescaler, uint16_t arr);

int main(void) {
    // define and initialise an array of int8_t's called array
    int8_t array[] = {-4, 31, -51, 62, -45, 58, -99, 105, -6, 60, 37, 106, -106, -96, 97, 50, -116, -38, 38, -52, -64, -68, 75, 117, 111, 100, 116, 11, 46, -64, -82, -74, -3, 0, 44, 64, -6, 1, -119, 123};
    // define and initialise a int8_t called min
    int8_t min = array[0];
    // define and initialsie a int8_t called max
    int8_t max = array[0];

    // call find_min_max here, thereby getting the function to modify min and max to the correct values
    find_min_max(&array[0],sizeof(array), &max, &min);

    // initialise pins connected to LEDs
    *(uint32_t*)0x40021014 = 0x40000;
    *(uint32_t*)0x48000400 = 0x5555;

    //optional initialization for interrupt timer

    for(EVER) {
        // display max on the LEDs
        *(uint8_t*)0x48000414 = max;
        // delay for 1 s, possibly by calling delay function
        basic_delay(650000);
        // display min on the LEDs
        *(uint8_t*)0x48000414 = min;
        // delay for 1 s
        basic_delay(650000);
    }
    
    //Return exit status code
    return 0;
}

// define find_min_max here. Should take arguments as specified in prac sheet.
void find_min_max(int8_t *array, uint32_t length, int8_t *max_ptr, int8_t *min_ptr){

    // for each element in the array:
        // comare the value of the element to data pointed to by max_ptr
            // if greater: set data at max_ptr to be the value in the array
        // compare the value of the element to data pointed to by min_ptr
            // is smaller: set data at min_ptr to be the value in the array
     int i;
     for(i = 0; i < length; i++) { 
        if(array[i] < *min_ptr) {
            *min_ptr = array[i]; 
        }
        else if(array[i] > *max_ptr)  {
            *max_ptr = array[i]; 
        }
        }   
}

void basic_delay(uint32_t time){

    int k;
    for(k = 0; k < time; k++){
    }
 
}
