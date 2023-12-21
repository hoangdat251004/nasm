STDIN		equ 0
STDOUT		equ 1
SYS_EXIT	equ 1
SYS_READ	equ 3
SYS_WRITE	equ 4

section .data
    
    msg0 db "Enter a number: "
    len0 equ $- msg0

    e_msg db "This is even number!!", 0xa, 0xd
    len1 equ $- e_msg

    o_msg db "This is odd number!!", 0xa, 0xd
    len2 equ $- o_msg

section .bss
    num resb 1

section .text
    global _start

_start:

;=========INPUT=========;
    mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg0
	mov edx, len0
	int 80h

    mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num
	mov edx, 1
	int 80h

;=======CHECK_ODD_EVEN=======;

    mov al, [num]
    AND al, 1h
    jz evenNumber

    mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, o_msg
	mov edx, len2
	int 80h

    jmp exit


evenNumber:

    mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, e_msg
	mov edx, len1
	int 80h


;=========EXIT=========;
exit:
    mov eax, SYS_EXIT
    int 80h