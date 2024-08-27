TITLE Sum of five hex numbers	    (HO5A.asm)

; Author: Sutinder S. Saini
; Date: 3/9/23

INCLUDE Irvine32.inc

.data
msg	    BYTE "Enter five hex numbers: ", 0
hyphens	    BYTE "--------", 0
numCt	    BYTE  ?
hexNum	    DWORD ?
hexSum	    DWORD ?

.code
main	    PROC			    ; Start
	    
	    mov	    edx, OFFSET msg	    ; Print "Enter five numbers: "
	    call    WriteString
	    call    CRLF

	    mov	    numCt, 0

DO:					    ; Do

	    call    ReadHex		    ; Input hexNum
	    mov	    hexNum, EAX


	    add	    EAX, hexSum		    ; hexSum += hexNum
	    mov	    hexSum, EAX

	    inc	    numCt		    ; numCt++

	    cmp	    numCt, 5		    ; While numCt < 5
	    jl	    DO
	    jg	    END_DO

END_DO:
	    mov	    edx, OFFSET hyphens	    ; Print "--------" 
	    call    WriteString

	    call    CRLF

	    mov	    eax, hexSum		    ; Print hexSum 
	    call    WriteHex

	    call    CRLF
	    exit			    ; Stop
main	    ENDP
END	    main