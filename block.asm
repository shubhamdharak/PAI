org 00h
	mov r0,#30h
	mov DPTR,#0200h;mov r1,#40h
	mov r2,#03h
	mov A,#00h
	back:
	mov A,@r0
	movx @DPTR, A
	inc r0
	inc DPTR;inc r1
	djnz r2,back
	end