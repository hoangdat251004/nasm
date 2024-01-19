section .data
    in_msg db "Input anything here: ", 0
    len_i_msg equ $-in_msg
    out_msg db "Your string entered: ", 0
    len_o_msg equ $-out_msg
    newline db 0xa, 0xd, 0
    no_lowcase db "Your string entered does not contain lower case.", 0xa, 0xd
    len_no_lowcase equ $-no_lowcase

section .bss
    input_str resb 32
    is_changed resb 1

section .text
    global _start

_start:
;========INPUT========;
    mov eax, 4
    mov ebx, 1
    mov ecx, in_msg
    mov edx, len_i_msg
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, input_str
    mov edx, 32
    int 0x80

    ; Initialize is_changed to 0
    mov byte [is_changed], 0

    ; convert to uppercase
    mov ecx, input_str
    xor edx, edx  ; use edx as index

convert_loop:
    mov al, [ecx + edx]
    cmp al, 0  
    je end_convert

    cmp al, 'a'
    jl skip_convert  
    cmp al, 'z'
    jg skip_convert
    
    sub al, 32 
    mov [ecx + edx], al
    mov byte [is_changed], 1
    inc edx
    jmp convert_loop

skip_convert:
    inc edx
    jmp convert_loop

end_convert:
    cmp byte [is_changed], 0
    jne output_strings
    
    ; Output if no lowercase is found
    mov eax, 4
    mov ebx, 1
    mov ecx, no_lowcase
    mov edx, len_no_lowcase
    int 0x80
    jmp end_program

output_strings:
    ; Output message "Your string entered: "
    mov eax, 4
    mov ebx, 1
    mov ecx, out_msg
    mov edx, len_o_msg
    int 0x80

    ; Output converted string
    mov eax, 4
    mov ebx, 1
    mov ecx, input_str
    mov edx, 32
    int 0x80

    ; Output newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

end_program:
    mov eax, 1
    int 0x80
