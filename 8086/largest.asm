data segment
list db 1,5,7,9,3 ; initial array
msg db ' is largest!$'
display macro msg ; used to display a msg
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
	
	mov si,0 ; pointing to index 0 here element 1
	mov al,[list+si] ; moving that 1 to al [list+si] here si denotes the index,if we want second element change si to 1
	mov cl,al ; moving the element to cl for future comparison
	inc si

search_loop: ; loop to traverse the list
	mov al,[list+si] ; to move the element in index si to al
	cmp al,cl ; comparing both the values in cl and al
	jg is_largest ; jump if the value if greater than that of cl
counter:
	inc si ; incrementing the si , index++
	cmp si,5 ; comparing if we reach the final value , here index = 4 
	jl search_loop ; if no go to search loop and repeat
	jge main_prgrm ; this code execute after traversing all index , inorder to not to change the value in cl it is redirected into main_prgrm

is_largest:
	mov cl,al ; swap the values
	jmp counter ; go to counter to check next number

main_prgrm:
	mov al,cl ; moving the largest number cl to al
	add al,30h ; to display as output,it must be converted to ascii , if 6 needs to displayed its value should be 36
	mov dl,al ; moving the cl into dl inorder to display 
	mov ah,02h ; 02h is used to display the ascii character
	int 21h
	display msg
	mov ah,4ch
	int 21h

code ends
end start
	

	
