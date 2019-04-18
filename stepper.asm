org 00h
	up:
	mov p1,#01h
	acall delay
	mov p1,#04h
	acall delay
	sjmp up
	
	mov p1,#02h
	acall delay
	mov p1,#08h
	acall delay
	
	delay:
	mov r0,#0h
	mov r1,#0h
	
	back:
	djnz r1,back
	djnz r0,back
	ret
end
	