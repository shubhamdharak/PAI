;addition of two nos
.model small
.stack 50h

.data
m1 db 10,13,"enter first no $"	;display statement with 10,13 as new line
m2 db 10,13,"enter second no $"
res db 10,13,"result is $"
c db ?
a db ?
b db ?

.code
mov ax,@data	;initialize data
mov ds,ax	

lea dx,m1	
mov ah,09h	;display string
int 21h

mov ah,01h	;function to get input from user
int 21h
mov a,al

lea dx,m2
mov ah,09h
int 21h

mov ah,01h
int 21h
mov b,al

mov al,a
mov bl,b

add al,bl
sub al,30h

lea dx,res
mov ah,09h
int 21h

mov ah,02h
mov dl,al	;display result
int 21h

mov ah,4ch
int 21h
end
