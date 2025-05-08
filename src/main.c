#include <stdio.h>

extern void initialise_monitor_handles(void);

int main(void) {
    initialise_monitor_handles();
    printf("✅ Hello from QEMU via semihosting!\n");
    while (1); // Loop forever
}
