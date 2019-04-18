org 00h
mov a,#38h
acall comm
acall delay

mov a,#0eh
acall comm
acall delay

mov a,#01h
acall comm
acall delay

mov a,#06h
acall comm
acall delay

mov a,#'c'
acall data1
acall delay

mov a,#'s'
acall data1
acall delay

mov a,#'k'
acall data1
acall delay

comm:
mov p0,a
clr p2.2
clr p2.1
setb p2.0
clr p2.0

data1:
	mov p0,a
	setb p2.2
	clr p2.1
	setb p2.0
	clr p2.0
	ret
	
delay:
		mov r1,#255
		arg2: mov r2,#255
		arg1:djnz r2,arg1
		djnz r1,arg2
		ret
		end
	

