segment .data
QL equ 0xA ; Nova Linha
NULL equ 0xD ; Marcar fim da linha
SYS_CALL equ 0x80 ; Chamada de Sistema (Interupção)

; Registrador EAX
SYS_READ equ 0x3
SYS_WRITE equ 0x4
SYS_EXIT equ 0x1

; Registrador EBX
SDT_OUTPUT equ 0x1
SDT_INPUT equ 0x0
RETURN_VALUE equ 0x0

segment .text

mostrarSaida:
    call tamString
    mov EAX, SYS_WRITE
    mov EBX, SDT_OUTPUT
    int SYS_CALL
    ret

receberEntrada:
    mov EAX, SYS_READ
    mov EBX, SDT_INPUT
    mov EDX, 0xA ; Set the number of bytes to read (0xA or 10 in hexadecimal) into the EDX register
    int SYS_CALL
    ret

tamString:
    mov EDX, ECX

proxChar:
    cmp byte[EDX], NULL
    jz terminado
    inc EDX
    jmp proxChar

terminado:
    sub EDX, ECX
    ret
