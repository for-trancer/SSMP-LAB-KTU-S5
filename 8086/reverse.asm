data segment
    ; we declare a byte array called 'rev' to store the reversed string
    rev db 20 dup(?)
data ends

code segment
assume cs:code, ds:data
start:
    ; initialize the data segment
    mov ax,data
    mov ds,ax

    ; initialize the pointers and counter
    mov si,offset rev
    mov bl,0

read:
    ; read a character from the keyboard
    mov ah,01h
    int 21h

    ; check if the character is a carriage return (CR), which means the end of the string or an enter key is pressed
    cmp al,0dh
    je reverse

    ; if it's not CR, store the character in the 'rev' array
    mov [si],al
    inc si
    inc bl
    jmp read

reverse:
    ; store the length of the string in the CL register
    mov cl,bl

display:
    ; decrement the SI pointer to point to the previous character
    dec si

    ; load the character at the current SI position into the DX register
    mov dx,[si]

    ; print the character using the INT 21h function
    mov ah,02h
    int 21h

    ; repeat the process for the entire string (until CL reaches 0)
    loop display

    ; exit the program
    mov ah,4ch
    int 21h

code ends
end start
