TITLE	   Uppercase first letter     (ho8C.asm)

; Author: Sutinder S. Saini
; Date: 4/21/23

INCLUDE Irvine32.inc
INCLUDE MO7.txt

.data
msg	    BYTE    "Enter a string", 13, 10, 0
strg	    BYTE    21 DUP(?)
i	    DWORD   ?
j	    DWORD   ?

.code
main	    PROC				    ; Start
	    
	    mov	    edx, OFFSET msg		    ; Print "Enter a string"
	    call    WriteString

	    mov	    ECX, SIZEOF strg
	    mov	    EDX, OFFSET strg

	    call    ReadString			    ; Input strg
	    mov	    i, EAX			    ; i = Size(strg)

	    mov	    j, 0			    ; j = 0
	    mov	    EDX, j			    
BEGINWHILE:
	    cmp	    EDX, EAX			    ; While j < 1	    
	    jge	    ENDWHILE


WhileIsWSpace:					    ; While isWSpace(strg{j])
	    isWSpace	strg[EDX]
	    jnz		EndWhileIsWSpace
	    inc		EDX			    ; j++
	    jmp		WhileIsWSpace
EndWhileIsWSpace:				    ; Endwhile

IfIsLower:					    ; If islower (strg[j])
	    islower	strg[EDX]
	    jnz		EndIfIsLower		    
	    toupper	strg[EDX]		    ; toupper(strg[j])
	    inc		EDX			    ; j++
EndIfIsLower:

BigWhileCondition:				    ; While j < i and !isWSpace(strg[j])
	    cmp		EDX, EAX
	    jge		EndBigWhileCondition

	    isWSpace	strg[EDX]
	    jz		EndBigWhileCondition

	    inc		EDX			    ; j++

	    jmp		BigWhileCondition

EndBigWhileCondition:
	    jmp	    BEGINWHILE

ENDWHILE:					    ; ENDWHILE

    mov	    EDX, OFFSET strg			    ; Print strg
    call    WriteString
	    
	    exit				    ; Stop
main	    ENDP
END	    main