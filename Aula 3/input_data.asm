%include 'lib.inc'

section .data ; section to declare variables
    ask_for db "Introduza o seu nome: ", QL, NULL
    ask_for_length equ $- ask_for
    present_result db "O nome inserido foi: "
    present_result_length equ $- present_result

section .bss
    nome RESB 1 ; Reserve 1 byte to contain the entry of the user

section .text
    global _start
    _start:
        ; Display Message to the user
        mov eax, SYS_WRITE
        mov ebx, SDT_OUTPUT
        mov ecx, ask_for
        mov edx, ask_for_length
        int SYS_CALL

        ; Ask for information to the user
        mov eax, SYS_READ
        mov ebx, SDT_INPUT
        mov ecx, nome
        mov edx, 0xA
        int SYS_CALL

        mov eax, SYS_WRITE
        mov ebx, SDT_OUTPUT
        mov ecx, present_result
        mov edx, present_result_length
        int SYS_CALL

        mov eax, SYS_WRITE
        mov ebx, SDT_OUTPUT
        mov ecx, nome
        mov edx, 0xA
        int SYS_CALL

        ; End Program
        mov EAX, SYS_EXIT
        mov EBX, RETURN_VALUE
        int SYS_CALL
