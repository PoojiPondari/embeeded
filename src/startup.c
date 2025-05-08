#include <stdint.h>

// Linker-defined stack top symbol (optional)
extern uint32_t _estack;

// Forward declaration of main
int main(void);

// Simple Reset Handler
void Reset_Handler(void) {
    main();
}

// Vector table: stack pointer + Reset_Handler
__attribute__ ((section(".isr_vector")))
void (* const vector_table[])(void) = {
    (void (*)(void)) 0x20001000, // Initial stack pointer (valid RAM address)
    Reset_Handler                // Reset handler
};
