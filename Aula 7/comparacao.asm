segment .data
    LF equ 0xA ; Line Feed
    SYS_CALL equ 0x80 ; Envira as declaracoes para SO para ser executado
    NULL equ 0xD ; Final de String
    ; EAX
    SYS_EXIT equ 0x1 ; COdigo de chamada para finalizar o programa
    SYS_READ equ 0x3 ; Indicacao de operacao de leitura
    SYS_WRITE equ 0x4 ; Indicacao de operacao de escrita
    ; EBX
    VALUE_TO_RETURN_ON_EXIT equ 0x0 ; Indicaco de operacao realizada
    STD_IN equ 0x0 ; Entrada padrao
    STD_OUT equ 0x1 ; Saida Padrao

section .data
    x dd 140 ; declarao de variavel
    y dd 200

    xmaior db 'X e maior que Y', LF, NULL
    tam1 equ $- xmaior
    ymaior db 'Y e maior que X', LF, NULL
    tam2 equ $- ymaior

section .text
global _start
    _start:
        mov EAX, [x]
        mov EBX, [y]

        cmp EAX, EBX
        jge maior

        mov ECX, xmaior
        mov EDX, tam1
    
        jmp final
    
    maior:
        mov ECX, ymaior
        mov EDX, tam2
    
    final:
        mov EAX, SYS_WRITE
        mov EBX, STD_OUT
        int SYS_CALL

        mov EAX, SYS_EXIT
        mov EBX, VALUE_TO_RETURN_ON_EXIT
        int SYS_CALL
