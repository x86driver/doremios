ENTRY(_Reset) SECTIONS {
 . = 0x0;
 .text : {
 start.o
 *(.text)
 }
 .data : { *(.data) }
 .bss : { *(.bss) }
}

