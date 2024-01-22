segment .data
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

section .data 
    msg1 db "Entre com um numero: ", QL, NULL
    tam_msg1 equ $- msg1

    msg2 db "Entre com segundo numero: ", QL, NULL
    tam_msg2 equ $- msg2

    msg3 db "Entre com terceiro numero: ", QL, NULL
    tam_msg3 equ $- msg3

    msg4 db "Resultado: ", QL, NULL
    tam_msg4 equ $- msg4

section .bss 
    numero1 RESB 2
    numero2 RESB 2
    numero3 RESB 2
    resultado1 RESB 2
    resultado2 RESB 2
section .text

global _start
    _start:
        mov EAX, SYS_WRITE
        mov EBX, SDT_OUTPUT
        mov ECX, msg1
        mov EDX, tam_msg1
        int SYS_CALL

        mov EAX, SYS_READ
        mov EBX, SDT_INPUT
        mov ECX, numero1
        mov EDX, 0xA
        int SYS_CALL

        mov EAX, SYS_WRITE
        mov EBX, SDT_OUTPUT
        mov ECX, msg2
        mov EDX, tam_msg2
        int SYS_CALL

        mov EAX, SYS_READ
        mov EBX, SDT_INPUT
        mov ECX, numero2
        mov EDX, 0xA
        int SYS_CALL

        mov EAX, SYS_WRITE
        mov EBX, SDT_OUTPUT
        mov ECX, msg3
        mov EDX, tam_msg3
        int SYS_CALL

        mov EAX, SYS_READ
        mov EBX, SDT_INPUT
        mov ECX, numero3
        mov EDX, 0xA
        int SYS_CALL

        ; Multiplicacao
        mov AL, [numero1]
        sub AL, '0'

        mov BL, [numero2]
        sub BL, '0'
        mul BL

        add AL, '0'
        mov [resultado1], AL

        mov AL, [numero3]
        sub AL, '0'

        mov BL, [resultado1]
        sub BL, '0'
        mul BL

        add AL, '0'
        mov [resultado2], AL

        mov EAX, SYS_WRITE
        mov EBX, SDT_OUTPUT
        mov ECX, msg4
        mov EDX, tam_msg4
        int SYS_CALL


        mov EAX, SYS_WRITE
        mov EBX, SDT_OUTPUT
        mov ECX, resultado2
        mov EDX, 0xA
        int SYS_CALL

        ;terminar programa
        mov EAX, SYS_EXIT
        mov EBX, RETURN_VALUE
        int SYS_CALL

        







