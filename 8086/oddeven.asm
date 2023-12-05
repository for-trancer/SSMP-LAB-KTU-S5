data segment
	str1 db " is odd $"
	str2 db " is even $"
	str3 db "enter the number : $"

	display macro msg ; macro to display a msg
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

	display str3 ;
	mov ah,01h ; taking input 
	int 21h
	mov ah,01h ; taking another input , to make it to check between 0 - 99 , here only the last digit matters ,a number is even if its lsb is 0 
	int 21h

	test al,1 ; perform the bitwise AND operation b/w the number and 1 and checks the lsb
	jnz is_odd ; if lsb is not zero it will be odd then do the is_odd 
	display str2 ; else it will be even 
	jmp exit ; jumping to exit because here order of execution is top to bottom , if a no is even no need to run the odd code below

is_odd: ; 
	display str1

exit:
	mov ah,4ch
	int 21h

code ends
	end start
