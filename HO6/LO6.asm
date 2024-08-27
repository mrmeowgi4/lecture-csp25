TITLE Largest of five numbers	    (HO6.asm)

; Author: Sutinder S. Saini
; Date: 3/26/23

INCLUDE Irvine32.inc

CR EQU 13
LF EQU 10

.data
inNumMsg	BYTE	"Enter five numbers:", CR, LF, LF, 0
largeMsg	BYTE	"Largest = ", 0
num		DWORD	?
largeNum	DWORD	?
numCt		BYTE	?



.code
main		PROC				;Start
		LEA	edx, inNumMsg	 ; Print "Enter five numbers: "
		call    WriteString

		call    CRLF

		call    inNum		 ; Input num
		call	CRLF

		mov	largeNum, EAX	 ; largeNum = num

		mov	numCt, 1		 ; numCt = 1

WHILE_START:				 ; While numCt < 5
IF_START:
		call    inNum		 ; Input num
		call	CRLF

		mov	num, EAX	    
		cmp	EAX, largeNum	 ; If num > largeNum
		jle	END_IF	    
				    
		mov	largeNum, EAX	 ; largeNum = num

END_IF:					 ; EndIf

		inc	numCt		 ; numCt++

		cmp	numCt, 5		 ; While numCt < 5
		jl	WHILE_START

END_WHILE:				 ; EndWhile
		call    CRLF
	    
		mov	EDX, OFFSET largeMsg	; Print "Largest = ", largeNum
		call	WriteString

		mov	EAX, largeNum
		call    outNum
		
		call	CRLF
		exit			;Stop
main		ENDP

;******************************************
; Input a number
; Input: none
; Output: number returned in EAX
;*****************************************

; EBX will be used to create number and then moved to EAX
; ECX will be used for dig

inNum		PROC				; Enter

		mov	EBX, 0			; num = 0
		call	ReadChar		; input char

inNum1:		cmp	AL, CR			; While Char <> CR
		je	inNum2
		call	WriteChar
		
		movzx	ECX, AL			; dig = Cv2Bin (char)
		sub	CL, '0'			

		mov	EAX, EBX		; num = num * 10 + dig
		mov	EBX, 10
		mul	EBX
		add	EAX, ECX
		mov	EBX, EAX
		call	ReadChar		; input char
		jmp	inNum1
inNum2:
		mov	EAX, EBX

		ret				; Exit
inNum		ENDP

;*****************************************
; Print number
; Input: value to print in EAX
; Output: none
;*****************************************

; ECX is used for digCt
; EDX is used for dig

outNum		PROC				;Enter
		
		mov	ECX, 0			; digCt = 0

outNum1:					; Repeat

		mov	EBX, 10			; dig = Num MOD 10
		mov	EDX, 0			; Num = Num / 10

		div	EBX

		push	EDX			; push dig

		inc	ECX			; digCt++

		cmp	EAX, 0			; UNTIL Num <= 0
		jnle	outNum

outNum2:	cmp	ECX, 0			; WHILE digCt > 0
		jng	outNum3

		pop	EDX			; pop dig 

		mov	AL, DL			; print dig
		add	AL, '0'

		call	WriteChar

		dec	ECX			; digCt--

		
		jmp	outNum2

outNum3:	; ENDWHILE

		ret				;Exit
outNum		ENDP

END	main
