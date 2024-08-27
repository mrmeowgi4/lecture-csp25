TITLE	   Capitalize all    (ho8C.asm)

; Author: Sutinder S. Saini
; Date: 4/21/23

INCLUDE Irvine32.inc
INCLUDE MO7.txt

.data
msg	    BYTE    "Enter a string", 13, 10, 0
strg	    BYTE    21 DUP(?)
i	    DWORD   ?

.code
main	    PROC    ; Start
	    
	    mov	    edx, OFFSET msg		     ; Print "Enter a string"
	    call    WriteString

	    mov	    ECX, SIZEOF strg
	    mov	    EDX, OFFSET strg

	    call    ReadString			    ; Input strg
	    mov	    i, EAX			    ; i = Size(strg)
	    

BEGINWHILE:
	    cmp	    EAX, 0			    ; WHILE i > 0			    
	    jle	    ENDWHILE

	    dec	   EAX				    ; i--

	    islower strg[EAX]
	    jz	    _IF
	    jnz	    _ENDIF

_IF:						    ; If islower(strg[i])
	    toupper strg[EAX]			    ; strg[i] = toupper(strg[i])
	    jmp	    _ENDIF

_ENDIF:						    ; Endif

	    cmp	    EAX, 0  
	    jg	    BEGINWHILE

ENDWHILE:					    ; ENDWHILE

    mov	    EDX, OFFSET strg			    ; Print strg
    call    WriteString
	    
	    exit
main	    ENDP
END	    main