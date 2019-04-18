org 00h
clr p1.0
ljmp main
org 001BH
CPL p1.0
RETI

org 0020H
	main:
	mov TMOD,#10H
	mov TR1,#0ffH
	mov TL1,#1AH
	mov IE,#88H
	setb TR1
	
	here:jmp here
	end
