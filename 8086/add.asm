data segment 
msg1 db 0ah,0dh,"enter first number : $"
msg2 db 0ah,0dh,"enter second number : $"
msg3 db 0ah,0dh,"sum : $"
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
	mov cl,ah
	mov bh,al
	lea dx,msg3
	mov ah,09h
	int 21h
	mov dl,cl
	mov ah,02h
	int 21h
	mov dl,bh
	mov ah,02h
	int 21h
	mov dl,bl
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
code ends
	end start



