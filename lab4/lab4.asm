section .data

    msg1 db "n = "
    len1 equ $- msg1

    msg2 db "Sum of "
    len2 equ $- msg2

    msg3 db " sequences is: "
    len3 equ $- msg3

    newLineMsg db 0xa, 0xd
    newLineLen equ $- newLineMsg

section .bss
    n resd 1
    sum resd 1

section .text
    global _start

_start:

;==================;
    mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 80h

    mov eax, 3
	mov ebx, 0
	mov ecx, n
	mov edx, 1
	int 80h

    mov edx, n
    sub eax, 1
    mov word[edx + eax], 0h

;==================;
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, n
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

;==========CAL==========;

    sub dword [n], '0'
    mov dword [sum], 0
    mov ecx, [n]

loop_add:
        
    add [sum], ecx  
    dec ecx         
    cmp ecx, 0   
    ja loop_add
    
    add byte [sum], '0'
;==================;
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, newLineMsg
    mov edx, newLineLen
    int 80h

;=======EXIT=======;
    mov edx, 1
	int 80h
