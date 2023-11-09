data segment
list db 1,2,3,4,5
msg db 'Enter The Number To Search : $'
str1 db ' is found!$'
str2 db ' is not found!$'
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
	
	display msg
	mov ah,01h
	int 21h
	sub al,30h
	mov cl,al
	mov si,0

search_loop:
	mov al,[list+si]
	cmp al,cl
	je is_found
	inc si
	cmp si,5
	jl search_loop
not_found:
	display str2
	mov ah,4ch
	int 21h
is_found:
	display str1
	mov ah,4ch
	int 21h
code ends
end start
	

	