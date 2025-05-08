#include <stdio.h>

// Semihosting requires this syscall stub
extern void initialise_monitor_handles(void);

int main(void) {
    initialise_monitor_handles(); // Enable semihosting
    printf("🔆 Blinky firmware started!\n");

    while (1) {
        printf("Toggling LED...\n");
        for (volatile int i = 0; i < 100000; i++);
    }

    return 0;
}
