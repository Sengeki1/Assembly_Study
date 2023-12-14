section .data
    txt_msg db 'Exemplo de Execucao de Assembly',0xA
    msg_length equ $- txt_msg

section .text

    global start
        start: 
            MOV EAX, 0x4 ; added the value to the register EAX
            MOV EBX, 0x1
            MOV ECX, txt_msg
            MOV EDX, msg_length
            int 0x80 ; System call (execute everything above)

            MOV EAX, 0x1
            MOV EBX, 0x0
            int 0x80