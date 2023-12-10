data segment
    ; data for message 1
    msg1 db " enter the string : $"  
    
    ; data for message 2
    msg2 db " entered string : $"
    
    ; data for message 3
    msg3 db " is palindrome!$"
    
    ; data for message 4
    msg4 db " is not palindrome!$"
    
    ; variable for storing the string
    str db 10 dup(?)

    ; macro for displaying messages
    display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
    endm

    ; macro for taking input from user
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

    ; display message to enter the string
    display msg1
    mov si,0

read_input:
    ; read input character
    input al
    
    ; check if the input character is carriage return,if an enter key is pressed after giving input
    cmp al,0dh
    je output
    
    ; store the input character in the string variable at index si
    mov [str+si],al
    
    ; increment the index
    inc si
    
    ; read the next input character
    jmp read_input

output:
    ; terminate the string with "$" , add it to the string end
    mov [str+si],"$"
    
    ; display message to show the entered string
    display msg2
    display str

    ; set index for reverse string , si points to the last letter and di to the first letter
    dec si ; decrementing si cause we dont want to compare the $ that we added to end of string
    mov di,0

test_strings:
    ; compare each character with its reverse character
    mov al,[str+si]
    mov bl,[str+di]
    cmp al,bl
    jne not_palindrome 
    
    ; if the character is equal, check the next character
    inc di
    dec si
    cmp si,0
    jg test_strings
    
    ; if all characters are equal, it is a palindrome
    display msg3
    jmp exit

not_palindrome:
    ; if any character is not equal to its reverse character, it is not a palindrome
    display msg4

exit:
    mov ah,4ch
    int 21h

code ends
end start
