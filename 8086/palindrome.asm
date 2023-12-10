data segment
    msg1 db " enter the string :  $"   
    msg2 db " entered string : $"
    msg3 db " is palindrome!$"
    msg4 db " is not palindrome!$"
    
    str db 10 dup(?)

    display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
    endm

    input macro var
        mov ah,01h
        int 21h
        mov var,al
    endm

data ends
code segment
assume ds:data,cs:code
start:
    mov ax,data
    mov ds,ax

    display msg1
    mov si,0

read_input:
    input al
    cmp al,0dh
    je output
    mov [str+si],al
    inc si
    jmp read_input

output:
    mov [str+si],"$"
    display msg2
    display str

    dec si
    mov di,0

test_strings:
    mov al,[str+si]
    mov bl,[str+di]
    cmp al,bl
    jne not_palindrome 
    inc di
    dec si
    cmp si,0
    jg test_strings
    display msg3
    jmp exit

not_palindrome:
    display msg4

exit:
    mov ah,4ch
    int 21h

code ends
end start
