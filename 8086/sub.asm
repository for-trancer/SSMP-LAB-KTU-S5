data segment 
	msg1 db 0ah,0dh,"enter first number : $"
	msg2 db 0ah,0dh,"enter second number : $"
	msg3 db 0ah,0dh,"difference : $"

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
		mov dl,var
		mov ah,02h
		int 21h
	endm

data ends

code segment
assume cs:code,ds:data
start: 
	mov ax,data
	mov ds,ax

	display msg1
	input bh
	input bl

	display msg2
	input ch
	input cl

	cmp cx,bx
	jnc normal
	clc

	mov ah,00h
	mov al,bl
	sub al,cl
	mov cl,ah
	add al,30h
	mov bl,al
	mov ah,00h
	mov al,bh
	sub al,ch
	aas
	add al,cl
	add al,30h
	mov bh,al
	jmp exit

normal:
	mov ah,00h
	mov al,cl
	sub al,bl
	aas
	add al,30h
	mov bl,al
	mov al,ch
	sub al,bh
	aas
	add al,30h
	mov bh,al

exit:
	display msg3
	output bh
	output bl
	mov ah,4ch
	int 21h

code ends
end start
	
		
