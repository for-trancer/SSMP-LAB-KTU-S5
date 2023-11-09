data segment
list db 9,1,8,7,2
msg db ' is smallest!$'
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
	
	mov si,0
	mov al,[list+si]
	mov cl,al
	inc si

search_loop:
	mov al,[list+si]
	cmp al,cl
	jle is_smallest
counter:
	inc si
	cmp si,5
	jl search_loop
	jge main_prgrm

is_smallest:
	mov cl,al
	jmp counter

main_prgrm:
	mov al,cl
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	display msg
	mov ah,4ch
	int 21h

code ends
end start
	

	