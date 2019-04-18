.model small
.data
menu db 10,13,"*******MENU*******"
	 db 10,13,"1.Concatination"
	 db 10,13,"2.Comparison"
	 db 10,13,"3.Exit"
	 db 10,13,"*****************"
	 db 10,13,"Enter Your Choice:: $"
.code
extrn concat : Far
extrn comparison : Far

mov ax,@data
mov ds,ax

main:
	lea dx,menu
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h

cmp al,'1'
	je case1
cmp al,'2'
	je case2
jmp exit

case1:	call concat
	jmp main
case2: call comparison
	jmp main
exit:
	mov ah,4ch
	int 21h
end
	

		
