target remote localhost:1234
load
set $sp = 0x20001000
set $pc = 0x08000ec1
break main
continue
