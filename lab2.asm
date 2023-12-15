section .data
    msg1 db "Input: ", 0xa, 0xd
    len1 equ $- msg1

    msg2 db "Nhap vao chieu dai va chieu rong: ", 0xa, 0xd
    len2 equ $- msg2

    msg3 db "!Output: ", 0xa, 0xd
    len3 equ $- msg3

    msg4 db "Dien tich cua hinh chu nhat: "
    len4 equ $- msg4

    msg5 db "Chu vi cua hinh chu nhat: "
    len5 equ $- msg5

    newLineMsg db 0xa, 0xd
    newLineLen equ $- newLineMsg

section .bss
    num1 resb 10
    num2 resb 10
    resA resd 5
    resP resd 5

section .text
    global _start

_start:

;=======INPUT=======;

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 10
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 10
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

;==========CALCULATING==========;

;----------ACREAGE----------;	
    mov al, [num1]
    sub	al, '0'

    mov bl, [num2]
    sub bl, '0'
    mul bl
    add al, '0'

    mov [resA], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, len4
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resA
    mov edx, 1
    int 80h

;---------NEWLINE------------;

    mov eax, 4
    mov ebx, 1
    mov ecx, newLineMsg
    mov edx, newLineLen
    int 80h

;---------PERIMETER----------;
    mov eax, [num1]
    sub eax, '0'

    mov ebx, [num2]
    sub ebx, '0'

    add eax, ebx
    add eax, '0'
    mov [resP], eax
    
    ;----;
    mov al, [resP]
    sub al, '0'

    mov bl, '2'
    sub bl, '0'
    mul bl
    add al, '0'

    mov [resP], al

    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, len5
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, resP
    mov edx, 1
    int 80h

;---------NEWLINE------------;

    mov eax, 4
    mov ebx, 1
    mov ecx, newLineMsg
    mov edx, newLineLen
    int 80h

;==========EXIT==========;
    mov eax, 1
    int 80h
