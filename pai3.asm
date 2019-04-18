;perform operation on string

disp macro msg	;macro to display msg
	mov ah,09h
	lea dx,msg
	int 21h
endm

.model small
.stack 100h
.data
	str1 db 25, ? ,25 dup('$')	;
	str2 db 25, ? ,25 dup('$')	;
	msg1 db 10,13,'===MENU=== $' 
	msg2 db 10,13,'1.accept $'
	msg3 db 10,13,'2.length $'
	msg4 db 10,13,'3.reverse $'
	msg5 db 10,13,'4.pallindrome $'
	msg6 db 10,13,'5.exit $'
	msg7 db 10,13,'enter your choice $'
	msg8 db 10,13,'wrong choice $'
	msg9 db 10,13,'enter the string $'
	msg10 db 10,13,'string is $'
	msg11 db 10,13,'length is  $'
	msg12 db 10,13,'the string is pallindrome $'
	msg13 db 10,13,'the string is not pallindrome $'
	
.code
	mov ax,@data
	mov ds,ax
	
menu:
	disp msg1				
	disp msg2
	disp msg3
	disp msg4
	disp msg5
	disp msg6
	
	disp msg7
	mov ah,01h	;accept choice 
	int 21h
	
	mov bl,al
	
	cmp bl,31h	;jump to accept 
	je acc
	
	cmp bl,32h	;jump to length 
	je len
			
	cmp bl,33h	;jump to reverse
	je rev
	
	cmp bl,34h	;jump to pallindrome
	je pal
	
	cmp bl,35h	;
	je exit
	
	disp msg8
	jmp menu
	
acc:
	call accept	;to call procedure	
	jmp menu	
	
len:
	call leng
	jmp menu
	
rev:	
	call reverse
	jmp menu
	
pal:	
	call pall
	jmp menu	

exit:
	mov ah,4ch
	int 21h
	
accept proc near
	disp msg9
	mov ah,0ah
	lea dx,str1
	int 21h
	ret
accept endp	

leng proc near
	disp msg11
	mov dl,str1+1
	add dl,30h
	mov ah,02h	;display length
	int 21h
	ret
leng endp

reverse proc near
	disp msg10
	xor ch,ch
			
	mov cl,str1+1
	
	sub cl,01h
	lea si,str1+2
	lea di,str1+2
	
	rep movsb
	
	mov cl,str1+1
	
	lea di,str2+2
	
loop1:
	mov dx,[si]
	mov [di],dx
	mov ah,02h
	int 21h

	dec cl
	dec si
	inc di
	cmp cl,00h
	jnz loop1
	ret
reverse endp

pall proc near
	disp msg10
	lea dx,str1+2
	
	call reverse
	
	lea di,str2+2
	lea si,str1+2
	
	mov cl,str1+1
	
loop2:	
	mov al,byte ptr[si]
	mov bl,byte ptr[di]
	dec cl
	
	cmp cl,00h
	je loopx	
	cmp al,bl
	
	je loop3
	
loopx:
	cmp cl,00h
	je loop4	
	disp msg13
	
	jmp loop5
	
loop4:
	disp msg12
		
loop5:
	ret
	
loop3:
	inc si
	inc di
	jmp loop2
			
pall endp 
			
end	
