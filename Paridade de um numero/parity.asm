%include 'lib.inc'

section .data ; secção para declarar variaveis

section .bss ; secção para reserver 

section .text
    global _start
    _start:
        mov EAX, 0x1 ; sys_exit (return)
        mov EBX, 0x0 ; argumento
        int 0x80 ; interrupção 