data segment 
msg1 db 0ah,0dh,"enter first number : $"
msg2 db 0ah,0dh,"enter second number : $"
msg3 db 0ah,0dh,"difference : $"
data ends

code segment
assume cs:code,ds:data
start: 
	mov ax,data
	mov ds,ax

	lea dx,msg1
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov bh,al
	mov ah,01h
	int 21h
	mov bl,al

	lea dx,msg2
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ch,al
	mov ah,01h
	int 21h
	mov cl,al

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

	lea dx,msg3
	mov ah,09h
	int 21h

	mov ah,02h
	mov dl,bh
	int 21h
	mov ah,02h
	mov dl,bl
	int 21h
	mov ah,4ch
	int 21h

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

	lea dx,msg3
	mov ah,09h
	int 21h

	mov ah,02h
	mov dl,bh
	int 21h
	mov ah,02h
	mov dl,bl
	int 21h
	mov ah,4ch
	int 21h
code ends
	end start
	
		