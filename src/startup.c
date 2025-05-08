#include <stdint.h>

int main(void); // Forward declaration

void Reset_Handler(void) {
    main();
}

__attribute__((section(".isr_vector")))
void (* const vector_table[])(void) = {
    (void (*)(void)) 0x20001000,  // Initial SP
    Reset_Handler                 // Reset vector
};
