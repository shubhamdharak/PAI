; string operation
Title string operation

accept macro
mov ah,01h
int 21h
endm

display1 macro var
lea dx,var
mov ah,09h
int 21h
endm

.model small
.stack 100h
.data

menu	db 10,13, "Menu::"
	db 10,13, "1.enter the string"
	db 10,13, "2.reverse the string"
	db 10,13, "3.check the pallindrome"
	db 10,13, "4.exit"
	db 10,13, "enter your choice::$"

m1 db 10,13, "enter the string$"
m2 db 10,13, "reverse the string$"
m3 db 10,13, "length of string$"
m4 db 10,13, "string is pallindrome$"
m5 db 10,13, "string is not pallindrome$"
m6 db 10,13, "invalid entry$"

str1 db 25,?,25 dup('$')
str2 db 25,?,25 dup('$')
len db ?

.code
start:
mov ax,@data
mov ds,ax
 
menu1:
	display1 menu  ;display menu
	accept 
	mov bl,al
	
case1:
	cmp bl,"1"
	jne case2
	display1 m1
	lea dx,str1
	mov ah,0ah
	int 21h
	mov cl,[str1+1]
	mov bl,cl
	display1 m3
	call display_len
	jmp menu1
case2:
	cmp bl,"2"
	jne case3
	display1 m1
	lea dx,str1
	mov ah,0Ah
	int 21h
	lea si,str1
	lea di,str2
	mov al,[si]
	mov [di],al
	inc si
	dec di
	mov al,[si]
	mov [di],al
	inc si
	dec di
	mov cl,str1+1
	mov ch,00
	add si,cx
	dec si
	a1:
		mov al,[si]
		mov [di],al
		inc di
		dec cl
		jnz c1



case3:
	cmp bl,"3"
	jne case4
	display1 m1
	lea dx,str1
	mov ah,0ah
	int 21h
	lea si,str1
	mov cl,[str1+1]
	mov ch,00h
	mov len,cl
	inc si
	add si,cx
	lea di,str1
	add di,0002h
	mov cl,len
	
	pallin:
		mov al,[si]
		mov ah,[di]
		inc di
		dec si
		cmp al,ah
		jne notpallin
		notpallin:
			display1 m5
			jmp menu1
		dec cl
		jnz pallin
	display1 m4


case4:
	cmp bl,"4"
	je exit

case5:
	display1 m6
	jmp menu1
exit:
	mov ah,4ch
	int 21h

display_len proc
mov bl,al
and al,0f0h
mov cl,04
rol al,cl
cmp al,09h
jbe c1
add al,07h

c1:
add al,30h
mov dl,bl
mov ah,02h
int 21h

mov bl,al
and ah,0fh
cmp al,09h
jbe c2

c2:
add al,30h
mov dl,al
mov ah,02h
int 21h
mov bl,al
and al,0fh
cmp al,09h
jbe c3


c3:
add al,30h
mov dl,bl
mov ah,02h
int 21h

ret
endp

mov al,4ch
int 21h

end
