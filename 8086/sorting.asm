data segment
str1 db "initial list : $"
str2 db "sorted list : $"
sb db " $" ; to seperate the the data with space
list db 9,1,8,2,7

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

	display str1 ; to display msg1

	mov si,0 ; pointing to first list item

list_before_sort: ; to display the list before sort
	mov al,[list+si] ; here si indicates the index
	add al,30h ; to convert the number to ascii for displaying output
	mov dl,al 
	mov ah,02h ; interrupt to display the data
	int 21h
	lea dx,sb ; to display space between each list item
	mov ah,09h
	int 21h
	inc si
	cmp si,5 
	jl list_before_sort

	mov cx,1 ; increment it after each out_loop

out_loop: ; used to repeat the inner loop 5 five times for each execution of this loop
	mov si,0 ; point to first index

in_loop:
	mov al,[list+si]
	mov dl,[list+si+1]
	cmp al,dl ; if al > dl carry will not be generated
	jc counter ; if carry is generated dl have value < al
	xchg [list+si],dl ; exchanging the values
	xchg [list+si+1],al

counter: 
	inc si
	cmp si,4
	jl in_loop

	inc cx ; comes out of in_loop and checks for the value of cx
	cmp cx,5 ; if cx is 5 the outer loop will be executed 5 times sorting every number
	jle out_loop ; if cx<=5

	display str2

	mov si,0

list_after_sort: ; same as list_before_sort it is used to display the list after sorting
	mov al,[list+si]
	add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	lea dx,sb
	mov ah,09h
	int 21h
	inc si
	cmp si,5
	jl list_after_sort

	mov ah,4ch
	int 21h

code ends
	end start
