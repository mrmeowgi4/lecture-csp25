TITLE	   Copy a string    (ho8.asm)

; Author: Sutinder S. Saini
; Date: 4/21/23

INCLUDE Irvine32.inc

.data
msg	    BYTE    "Enter a string", 13, 10, 0
strg	    BYTE    21 DUP(?)
i	    DWORD   ?
copyStrg    BYTE    SIZEOF strg DUP(?)

.code
main	    PROC    ; Start
	    
	    mov	    edx, OFFSET msg		     ; Print "Enter a string"
	    call    WriteString

	    mov	    ECX, SIZEOF strg
	    mov	    EDX, OFFSET strg

	    call    ReadString			    ; Input strg
	    mov	    i, EAX			    ; i = Size(strg)

	    mov	    copyStrg[EAX], 0		    ; copyStrg[i] = 0
	    
	    mov	   EDX, i

BEGINWHILE:
	    cmp	    EDX, 0			    ; WHILE i > 0			    
	    je	    ENDWHILE

	    dec	   EDX				    ; i--
	    mov	   AL, strg[EDX]		    ; copyStrg[i] = strg[i]
	    mov	   copyStrg[EDX], AL

	    jg	    BEGINWHILE
ENDWHILE:					    ; ENDWHILE
    call    CRLF
    mov	    EDX, OFFSET copyStrg		    ; Print copyStrg
    call    WriteString
	    
	    exit
main	    ENDP
END	    main