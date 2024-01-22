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