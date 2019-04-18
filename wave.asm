	org 00h
		clr p1.0
		ljmp main
		org 001bh
			CPL p1.0
			RETI
			org 0020h
				main:
				mov TMOD,#10h
				mov TH1,#0ffh
				mov TL1,#1Ah
				mov IE,#88h
				setb TR1
				here:
				jmp here
				end
				