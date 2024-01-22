%include 'lib.inc'

section .data
    titulo db LF,'+-----------------------+', LF, '+---- Calculadora ----+', LF, '+-----------------------+', LF, NULL
    obterValor1 db 'Numeo1: ', LF, NULL
    obterValor2 db 'Numero2: ', LF,NULL
    op0 db LF, '0 - Sair do Programa', LF, NULL
    qqTecla db LF, '> Ou pressione qualquer tecla para sair do programa', LF, NULL
    op1 db LF, '1 - Adicionar', NULL
    op2 db LF, '2 - Subtrair', NULL
    op3 db LF, '3 - Multiplicar', NULL
    op4 db LF, '4 - Dividir', NULL
    op5 db LF, LF, '> Pressione 1 - Para voltar ao menu principal e Realizar novas operacoes', NULL

    msgIntroNum db LF, 'Estroduza os numeros: ', LF, NULL
    msgOp db LF, 'Escolha a operacao a realizar: ', NULL
    msgOpAlt db LF, 'O que mais pretendes fazer?', LF, NULL
    msgError db LF, 'Valor da Opcao invalida', NULL
    p1 db LF, 'Proesso de Adicao', NULL
    p2 db LF, 'Processo de Subtracao', NULL
    p3 db LF, 'Processo de Multiplicacao', NULL
    p4 db LF, 'Processo de Divisao', NULL

    msgFim db LF, 'Terminei!!!', LF, NULL

section .bss
    operacao1 RESB 1
    operacao2 RESB 1
    valor1 RESB 1
    valor2 RESB 1

section .text

global _start
    _start:

        mov ECX, titulo
        call mostrarSaida

        comecar:
            mov ECX, op1
            call mostrarSaida
            mov ECX, op2
            call mostrarSaida
            mov ECX, op3
            call mostrarSaida
            mov ECX, op4
            call mostrarSaida

            mov ECX, msgOp
            call mostrarSaida

            mov ECX, valor1
            call mostrarEntradaNumero

            mov ECX, valor1
            call mostrarSaidaNumero

        mov EAX, SYS_EXIT
        mov EBX, RETURN_VALUE
        int SYS_CALL


