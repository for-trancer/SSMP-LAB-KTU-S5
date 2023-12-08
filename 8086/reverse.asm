data segment
    rev db 20 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
    mov ax,data
    mov ds,ax

    mov si,offset rev
    mov bl,0

read:
    mov ah,01h
    int 21h
    cmp al,0dh
    je reverse
    mov [si],al
    inc si
    inc bl
    jmp read

reverse:
    mov cl,bl

display:
    dec si
    mov dx,[si]
    mov ah,02h
    int 21h
    loop display

    mov ah,4ch
    int 21h

code ends
end start
