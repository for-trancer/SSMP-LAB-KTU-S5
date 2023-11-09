data segment 
no db 0002h;
str1 db "even$"
str2 db "odd$"
data ends

code segment
assume cs:code,ds:data
start: 
	mov ax,data
	mov ds,ax
	mov ax,no
	test ax,1
	jz iseven
	mov ah,09h
	mov dx,offset str2
	int 21h
	mov ah,4ch
	int 21h
iseven:
	mov ah,09h
	mov dx,offset str1
	int 21h
	mov ah,4ch
	int 21h
code ends
end start
