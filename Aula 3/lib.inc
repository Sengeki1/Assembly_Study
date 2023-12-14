; Make our own libraries
    QL equ 0xA ; Line Feed (Quebra de Linha)
    NULL equ 0xD ; Carrieage return (Terminar msg com valor nulo)
    SYS_CALL equ 0x80 ; System call (Interruption)

    ; EAX
    SYS_READ equ 0x3
    SYS_WRITE equ 0x4
    SYS_EXIT equ 0x1

    ; EBX
    SDT_OUTPUT equ 0x1
    SDT_INPUT equ 0x0
    RETURN_VALUE equ 0x0