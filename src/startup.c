void Reset_Handler(void);

__attribute__((section(".isr_vector")))
void (* const vector_table[])(void) = {
    (void (*)(void)) 0x20001000,  // Initial SP
    Reset_Handler                 // Reset vector
};

void Reset_Handler(void) {
    extern int main(void);
    main();
}
