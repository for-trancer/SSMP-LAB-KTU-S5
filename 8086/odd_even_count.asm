data segment
    ; List of numbers
    list db 2,5,7,8,10,13,15

    ; Strings for displaying the number of odd and even numbers
    str1 db " number of odd numbers : $"
    str2 db " number of even numbers : $"

    ; Display macro to display a string
    display macro msg 
        lea dx,msg
        mov ah,09h
        int 21h
    endm

    ; Output macro to display a value as ASCII
    output macro var
        mov al,var
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
    endm

data ends

code segment
assume cs:code,ds:data
start:
    mov ax,data
    mov ds,ax

    ; Initialize variables for counting odd and even numbers
    mov bl,0
    mov cl,0
    mov si,0

search_loop:
    ; Load the current number from the list
    mov al,[list+si]

    ; Check if the number is odd
    test al,1
    jnz is_odd

    ; If the number is even, increment the count
    inc cl

    ; Jump to the next number
    jmp counter

is_odd: 
    ; If the number is odd, increment the count
    inc bl

counter:
    ; Move to the next number in the list
    inc si

    ; Check if we've finished counting all the numbers
    cmp si,7
    jl search_loop

    ; Display the number of odd numbers
    display str1
    output bl

    ; Display the number of even numbers
    display str2
    output cl
    
    ; Terminate the program
    mov ah,4ch
    int 21h

code ends
end start
