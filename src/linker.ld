MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K
  RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
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

  /* ✅ Explicitly export bss range to rdimon-crt0.o */
  .bss : {
    PROVIDE(__bss_start__ = .);
    *(.bss*)
    *(COMMON)
    PROVIDE(__bss_end__ = .);
  } > RAM

  .stack (NOLOAD) : {
    . = ALIGN(8);
    . = . + 0x1000;
  } > RAM

  . = ALIGN(4);
  PROVIDE(__end__ = .);
  PROVIDE(end = .);
}
