.model small
.data
m1 db 10,13,"Enter First String $"
m2 db 10,13,"Enter Second String $"
m3 db 10,13,"Concatenated String:: $"
	
s1 db 20 dup ('$')
s2 db 20 dup ('$')
s3 db 40 dup ('$')
nwline db 10,"$"

m4 db 10,13,"String are Equals $"
m5 db 10,13,"String are Not Equals $"

count db 1 dup(0)
len1 db ?
len2 db ?
.code
	public concat,comparison
	scall macro xx,yy
	lea dx,xx
	mov ah,yy
	int 21h
	endm

concat proc
	mov ax,@data
	mov ds,ax
	scall m1,09h
	scall s1,0Ah
	scall m2,09h
	scall s2,0Ah
	lea si,s1
	lea di,s3
	inc si
	mov cl,[si]
loop1:
	inc si
	mov al,[si]	
	mov [di],al
	inc di
	dec cl
	jnz loop1
	lea si,s2
	inc si
	mov cl,[si]

loop2:
	inc si
	mov al,[si]	
	mov [di],al
	inc di
	dec cl
	jnz loop2

mov al,24h
mov [di],al
scall nwline 09h
scall m3,09h
scall s3,09h
ret 
endp


comparison proc
scall m1,09h
scall s1,0Ah
scall m2,09h
scall s2,0Ah
	
lea si,s1
inc si
mov cl,[si]
mov len1,cl

lea di,s2
inc di
mov cl,[di]
mov len2,cl
mov ch,len1
cmp cl,ch
	
jne c1
inc si
inc di
c2:
	mov al,[di]
	mov dl,[di]
	cmp al,dl
jne c1
inc si
inc di
dec cl

jnz c2
scall m4,09h
jmp c3

c1:
 scall m5,09h

c3:
	ret 
	endp
end
	
