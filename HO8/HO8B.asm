TITLE reverse string   (ho8B.asm)

; Author: Sutinder S. Saini
; Date: 4/21/23

INCLUDE Irvine32.inc

.data
msg	    BYTE    "Enter a string", 13, 10, 0
strg	    BYTE    21 DUP(?)
i	    DWORD   ?
copyStrg    BYTE    SIZEOF strg DUP(?)
j	    DWORD   ?

.code
main	    PROC    ; Start
	    
	    mov	    edx, OFFSET msg		     ; Print "Enter a string"
	    call    WriteString

	    mov	    ECX, SIZEOF strg
	    mov	    EDX, OFFSET strg

	    call    ReadString			    ; Input strg

	    mov	    i, EAX			    ; i = Size(strg)
	    mov	    j, 0			    ; j = 0

	    mov	    copyStrg[EAX], 0		    ; copyStrg[i] = 0
	    
	    mov	   EDX, i
	    mov	   ECX, j
BEGINWHILE:
	    cmp	    EDX, 0			    ; WHILE i > 0			    
	    je	    ENDWHILE

	    dec	   EDX				    ; i--

	    mov	   AL, strg[ECX]		    ; copyStrg[j] = strg[i]
	    mov	   copyStrg[EDX], AL
	    
	    inc	   ECX				    ; j++
	    
	    jg	    BEGINWHILE
ENDWHILE:					    ; ENDWHILE
    call    CRLF
    mov	    EDX, OFFSET copyStrg		    ; Print copyStrg
    call    WriteString
	    
	    exit
main	    ENDP
END	    main