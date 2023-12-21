section .data
    msg1 db "Your name: "
    len1 equ $- msg1

    msg2 db "Hello "
    len2 equ $- msg2

    msg3 db "!! ", 0xa, 0xd
    len3 equ $- msg3

    msg4 db "Welcome, "
    len4 equ $- msg4

    msg5 db " to EHC", 0xa, 0xd
    len5 equ $- msg5

section .bss
    name resb 10

section .text
    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h         ;show msg "Your name:"

    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, 10
    int 80h         ;wait for input from keyboard

    ;delete newline character 
    mov edx, name
    sub eax, 0x1
    mov word[edx + eax], 0x0

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h         

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 10
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, len4
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 10
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, len5
    int 80h

    mov eax, 1
    int 80h
