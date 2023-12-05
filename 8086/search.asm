data segment
list db 1,2,3,4, ; array list
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
	mov ah,01h ; taking input number to search for
	int 21h
	sub al,30h ; converting it to normal form from ascii format
	mov cl,al ; moving it to cl for comparison
	mov si,0 ; si -> index 0

search_loop:
	mov al,[list+si] ; moving data from the list with si'th index to al (first element is at si=0 and second is at si=1...)
	cmp al,cl ; comparing the data with out input number
	je is_found ; je -> jump equal 
	inc si
	cmp si,5 ; comparing the index that it has traversed all the element in the array 
	jl search_loop ; if not repeat the process
not_found: ; this part will be executed after traversing the array and we got no matching data
	display str2
	jmp exit ; we dont want to display the is found part if it is not found so jumping
is_found:
	display str1
exit:mov ah,4ch
	int 21h
code ends
end start
	

	
