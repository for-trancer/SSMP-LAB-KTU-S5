data segment
list db 01h,02h,03h,04h,05h
msg db 'enter the number : $'
str db 'average : $'
str1 db ' . $'
display macro msg
	lea dx,msg
	mov ah,09h
	int 21h
endm
input macro var
	mov ah,01h
	int 21h
	sub al,30h
	mov var,al
endm
data ends

code segment
assume cs:code,ds:data
start:
	mov ax,data
	mov ds,ax

	display msg
	input bh
	display msg
	input bl
	display msg
	input cl

	mov ah,00h
	mov al,bh
	add al,bl
	adc al,cl
	mov ah,00h
	jc carry
	mov dh,03h
	div dh
	jmp last

carry:
	mov dh,0003h
	div dh

last:
	mov cl,ah
	display str
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	display str1
	mov al,cl
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	mov ah,4ch
	int 21h
code ends
end start
	

	