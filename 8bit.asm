org 00h
	mov r0,#40h
	mov r1,#03h
	clr a
	mov r6,a
again:	add a,@r0
	jnc next
	inc r6
	next:
	inc r0
	djnz r1,again
	mov r7,a
	end