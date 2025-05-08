#include <stdio.h>
extern void initialise_monitor_handles(void);

int main(void) {
    initialise_monitor_handles();  // Required for semihosting printf

    printf("✅ Hello from QEMU / Renode\n");

    while (1);  // Stay alive
}
