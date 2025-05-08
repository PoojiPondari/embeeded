MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 256K   /* Slightly reduced */
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 32K    /* Reduced */
}

SECTIONS
{
  .isr_vector : {
    KEEP(*(.isr_vector))
  } > FLASH

  .text : {
    *(.text*)
    *(.rodata*)
  } > FLASH

  .data : {
    *(.data*)
  } > RAM AT > FLASH

  .bss : {
    PROVIDE(__bss_start__ = .);
    *(.bss*)
    *(COMMON)
    PROVIDE(__bss_end__ = .);
  } > RAM

  .stack (NOLOAD) : {
    . = ALIGN(8);
    . = . + 0x800; /* Smaller stack: 2KB */
  } > RAM

  PROVIDE(__end__ = .);
  PROVIDE(end = .);
}
