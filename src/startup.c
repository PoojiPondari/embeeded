#include <stdint.h>

extern int main(void);
void Reset_Handler(void) {
    main();
}

typedef void (*ISR_Handler)(void);

__attribute__((section(".isr_vector")))
const ISR_Handler vector_table[] = {
    (ISR_Handler)(uintptr_t)0x20001000,  // Initial Stack Pointer
    Reset_Handler                        // Reset Handler
};
