#include <stdio.h>

// Needed to enable semihosting
extern void initialise_monitor_handles(void);

int main(void) {
    initialise_monitor_handles();  // Enable semihosting I/O
    printf("✅ Firmware started! Hello from QEMU\n");
    while (1); // Infinite loop
    return 0;
}
