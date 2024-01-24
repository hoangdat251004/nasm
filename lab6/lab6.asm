section	.data
    msg0 db "Enter 2 num:",0xa
    len0 equ $-msg0
    msg db 'The sum is:',0xa	
    len equ $-msg	

    newLine db 0xa, 0xd
    newLineLen equ $-newLine

    error_msg db 'Enter a positive integer', 0xa, 0xd
    len_error equ $-error_msg

section .bss
    num1 resb 32
    num2 resb 32
    sum resb 32

section	.text
    global _start        

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, msg0
    mov edx, len0
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 32
    int 80h

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 32
    int 80h

    xor ecx, ecx
    lenNum1:
        cmp byte [num1 + ecx], 0
        je  found1
        inc ecx
        jmp lenNum1
    found1:
        sub ecx, 1
        mov esi, ecx   

    xor ecx, ecx
    lenNum2:
        cmp byte [num2 + ecx], 0
        je  found2
        inc ecx
        jmp lenNum2

    found2:
        sub ecx, 1
        mov edi, ecx

    ; find length of sum
    ; still have exception if add 2 num with x digits to x + 1 digits
    cmp esi, edi
    jae lenSum
    mov esi, edi
    lenSum:
        mov ecx, esi       ; num of digits

    call check_input
    xor al, al

add_loop:  
    mov 	al, [num1 + esi - 1]
    adc 	al, [num2 + edi - 1]
    aaa
    pushf
    or 	al, 30h
    popf

    mov	[sum + ecx - 1], al
    dec edi
    dec esi
    loop add_loop

    mov	eax, 4            
    mov	ebx, 1            
    mov	ecx, msg        
    mov	edx, len       
    int	80h                 

    mov	eax, 4            
    mov	ebx, 1            
    mov	ecx, sum        
    mov	edx, 32       
    int	80h                 

    mov	eax, 4            
    mov	ebx, 1            
    mov	ecx, newLine        
    mov	edx, newLineLen    
    int	80h
    
    ; exit the program
    mov	eax, 1        
    int	80h


check_input:
    mov eax, esi
    mov ebx, edi
    mov al, [num1 + eax - 1]
    cmp al, '0'
    jl input_error
    cmp al, '9'
    jg input_error

    mov al, [num2 + ebx - 1]
    cmp al, '0'
    jl input_error
    cmp al, '9'
    jg input_error
    ret
input_error:
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, len_error
    int 80h
    jmp _start