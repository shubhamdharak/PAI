disp macro small
lea dx,small
mov ah,09h
int 21h
endm
accept macro
mov ah,01h
int 21h
sub al,30h
endm

 .model small
.stack 100h
.data
m1 db"enter count:$"
m2 db 10,13,"enter  the number:$"
m3 db 10,13,"Result:$"
array db 10 dup(0)
cnt db ?
m4 db"$"
res db ?

.code
start:
mov ax,@data
mov ds,ax
disp m1
accept
mov cl, al
mov cnt, al
lea si,array
mov ax ,0000h
l1:disp m2
accept
mov [si],al
inc si
dec cl
jnz l1
mov cl,cnt
mov ax,0000h
lea si,array
l2:add al, [si]
inc si
dec cl
jnz l2
disp m3
mov ch,02h
mov cl,04h
mov bl,al
l3: rol bl ,cl
mov dl, bl
and dl,0fh
cmp dl,09h
jbe l4
add dl,07h
l4 : add dl,30h
mov ah,02h
int 21h
dec ch
jnz l3
mov ah,4ch
int 21h
end start


