MEMORY
{
  FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 512K
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 64K
}

SECTIONS
{
  .text : {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > FLASH

  .data : {
    __data_start__ = .;
    *(.data*)
    __data_end__ = .;
  } > RAM AT > FLASH

  .bss : {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM

  .stack (NOLOAD) : {
    . = ALIGN(8);
    __stack_start__ = .;
    . = . + 0x1000;
    __stack_end__ = .;
  } > RAM

  __end__ = .;
  PROVIDE(end = .);
}
