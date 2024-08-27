TITLE Calculate how many years have passed (HO5B.asm)

; Author: Sutinder S. Saini
; Date: 2/25/23

INCLUDE Irvine32.inc

.data
msg		    BYTE "Enter a year: ", 0
yearsHavePassedMsg  BYTE " years have passed", 0
yearsPassed	    DWORD ?
currentYear	    DWORD 2023
year		    DWORD ?

.code
main	    PROC			    ; Start
	    mov	    edx, OFFSET msg	    ; "Enter a year: "
	    call    WriteString

	    call    ReadInt		    ; Input year
	    mov	    year, EAX

	    cmp	    year, 0
	    jg	    WHILE_LOOP		    ; While year != 0

	    jle	    ENDWHILE		    ; EndWhile
    
WHILE_LOOP:
	    mov	    EAX, currentYear
	    sub	    EAX, year
	    mov	    yearsPassed, EAX
	    
	    mov	    eax, yearsPassed
	    call    WriteDec

	    mov	    edx, OFFSET yearsHavePassedMsg
	    call    WriteString
	    call    CRLF

	    mov	    edx, OFFSET msg	    ; "Enter a year: "
	    call    WriteString

	    call    ReadInt		    ; Input year
	    mov	    year, EAX

	    cmp	    year, 0
	    jg	    WHILE_LOOP		    ; While year != 0
	    
	    jle	    ENDWHILE

ENDWHILE:				    ; ENDWHILE
	    exit

main	    ENDP
	    END	    main
