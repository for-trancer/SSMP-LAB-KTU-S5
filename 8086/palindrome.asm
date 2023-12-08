data segment
    rev db 20 dup(?)
    str1 db "Enter the string : $"
    msg1 db "is palindrome!$"
    msg2 db "not palindrome!$"

    display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
    endm
data ends

code segment
assume cs:code, ds:data
start:
    mov ax,data
    mov ds,ax

    mov si,offset rev
    mov bl,0

    display str1

read:
    mov ah,01h
    int 21h
    cmp al,0dh
    je check
    mov [si],al
    inc si
    jmp read

check:
    mov di,0
    dec si

palindrome:
    mov al,[si]
    mov bl,[rev+di]
    cmp al,bl
    jne not_palindrome 
    inc di
    dec si
    cmp si,0
    jg palindrome

    display msg1
    jmp exit

not_palindrome:
    display msg2

exit:
    mov ah,4ch
    int 21h

code ends
end start
