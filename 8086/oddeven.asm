data segment
	str1 db " is odd $"
	str2 db " is even $"
	str3 db "enter the number : $"

	display macro msg
		lea dx,msg
		mov ah,09h
		int 21h
	endm
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax

	display str3
	mov ah,01h
	int 21h
	mov ah,01h
	int 21h

	test al,1 ; perform the bitwise AND operation with 1 and checks the lsb
	jnz is_odd ; if lsb not zero it will be odd
	display str2 ; else it will be even 
	jmp exit

is_odd:
	display str1

exit:
	mov ah,4ch
	int 21h

code ends
	end start
