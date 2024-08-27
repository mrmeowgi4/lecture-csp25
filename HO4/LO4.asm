TITLE Sum of two hex digits	    (LO4.asm)

; Author: Sutinder S. Saini
; Date: 2/25/23

INCLUDE Irvine32.inc

.data
firstMsg	BYTE	"Enter first hex digit: ", 0
secondMsg	BYTE	"Enter second hex digit: ", 0
hexDig1		BYTE	?
hexDig2		BYTE	?
hexSum		BYTE	?

hexSumMsg	BYTE    "Hex sum = ", 0

.code
main		PROC				;Start

		call	Clrscr

; Print "Enter first hex digit: "
; Input hexDig1
; Print "Enter second hex digit: "
; Input hexDig2
; hexSum = hexDig1 + hexDig2
; Print "Hex Sum =", hexSum

		mov	edx, OFFSET firstMsg	; Print "Enter first hex digit: "
		call    WriteString

		call    inHex			; Input hexDig1
		mov	hexDig1, AL

		mov	edx, OFFSET secondMsg	; Print "Enter second hex digit: "
		call    WriteString

		call    inHex			; Input hexDig2
		mov	hexDig2, AL


		mov	AL, hexDig1
		add	AL, hexDig2		; hexSum = hexDig1 + hexDig2

		mov	hexSum, AL

		mov	edx, OFFSET hexSumMsg   ; Print "hexSum = ", hexSum
		call    WriteString
		movzx   EAX, hexSum		    
		call    outHex

		call	CRLF
		exit				;Stop
main		ENDP

;*******************
; Input hex digit
; Input: none
; Output: hex digit returned in AL
;*******************

inHex		PROC				;Enter
		call	ReadHex
		ret				;Exit
inHex		ENDP

;*******************
; Print hex digit
; Input: value to print in AL register
; output: none
;*******************

outHex		PROC				;Enter
		call	WriteHex
		ret				;Exit
outHex		ENDP

		END	main