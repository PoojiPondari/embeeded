#include <stdio.h>
extern void initialise_monitor_handles(void);

int main(void) {
    initialise_monitor_handles();
    printf("✅ Hello from QEMU!\n");

    // ❗ Never return! Avoid _exit()
    while (1);  // Loop forever
}
