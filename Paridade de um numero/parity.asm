%include 'lib.inc'

section .data ; secção para declarar variaveis
    ask_for_number db "Introduza um numero: ", NULL
    present_result_odd db QL, "O numero é impar.", QL, NULL
    present_result_even db QL, "O numero é par.", QL, NULL

section .bss ; secção para reserver
    numero RESB 1 ; Reservando 1 byte na memoria para esta variavel

section .text
    global _start
    _start:
        ; Mostrar Mensagem
        mov ECX, ask_for_number
        call mostrarSaida

        ; Receber Input
        mov ECX, numero
        call receberEntrada

        mov AX, [numero]
        sub AX, '0' ;  Converte o caractere ASCII para o valor numerico
        and AX, 1 ; 0001 (compara o ultimo bit sendo que se retornar AX 0 é par e se for 1 é impar

        jz even
        mov ECX, present_result_odd
        call mostrarSaida
        jmp exit
    
    even:
        mov ECX, present_result_even
        call mostrarSaida

    exit:
        mov EAX, SYS_EXIT ; sys_exit (return)
        mov EBX, RETURN_VALUE ; argumento
        int SYS_CALL ; interrupção 