TITLE Sum of two hex digits	    (HO4.asm)

; Author: Sutinder S. Saini
; Date: 2/25/23

INCLUDE Irvine32.inc


; Start 
; Print "Enter first hex digit: " 
; Input hexDig1 
; Print "Enter second hex digit: " 
; Input hexDig2 
; hexSum = hexDig1 + hexDig2 
; Print "Hex sum = ", hexSum 
; Stop


.data
hex1Msg	    BYTE    "Enter first hex digit: ", 0
hex2Msg	    BYTE    "Enter second hex digit: ", 0
hexSumMsg   BYTE    "Hex sum = ", 0
hexDig1	    BYTE    ?
hexDig2	    BYTE    ?
hexSum	    BYTE    ?

.code
main	    PROC			    ; Start
	    
	    mov	    edx, OFFSET hex1Msg	    ; Print "Enter first hex digit: "
	    call    WriteString

	    call    ReadHex		    ; Input hexDig1
	    mov	    hexDig1, AL

	    mov	    edx, OFFSET hex2Msg	    ; Print "Enter second hex digit: "
	    call    WriteString

	    call    ReadHex		    ; Input hexDig2
	    mov	    hexDig2, AL


	    mov	    AL, hexDig1
	    add	    AL, hexDig2		    ; hexSum = hexDig1 + hexDig2

	    mov	    hexSum, AL

	    mov	    edx, OFFSET	hexSumMsg   ; Print "hexSum = ", hexSum
	    call    WriteString
	    movzx   EAX, hexSum		    
	    call    WriteHex

	    exit			    ; Stop

main	    ENDP
	    END	    main