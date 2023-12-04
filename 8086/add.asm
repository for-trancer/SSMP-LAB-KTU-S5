data segment
	str1 db "enter the first number : $"
	str2 db "enter the second number : $"
	str3 db "sum : $"

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

	output macro var
		mov ah,02h
		mov dl,var
		int 21h
	endm

data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax

	display str1
	input bh
	input bl

	display str2
	input ch
	input cl

	mov al,bl
	mov ah,00h
	add al,cl
	aaa
	add ax,3030h
	mov bl,al
	mov al,ah
	mov ah,00h
	add al,bh
	add al,ch
	aaa
	add ax,3030h
	mov bh,al
	mov cl,ah

	display str3
	output cl
	output bh
	output bl

	mov ah,4ch
	int 21h

code ends
	end start
