TITLE Largest of five numbers	    (HO6.asm)

; Author: Sutinder S. Saini
; Date: 3/26/23

INCLUDE Irvine32.inc

.data

fib1	    DWORD	?
fib2	    DWORD	?
termCt	    DWORD	?
n	    DWORD	?

firstMsg    BYTE	"Enter the number of terms: ", 0

secondMsg1  BYTE	"First ", 0
secondMsg2  BYTE	" terms of Fibonacci series are: ", 0


.code
main	    PROC			    ; start

	    mov	    fib1, 1		    ; fib1 = 1
	    mov	    fib2, 0		    ; fib2 = 0
	    

	    mov	    edx, OFFSET firstMsg    ; print "Enter the number of terms: "
	    call    WriteString

	    call    ReadDec		    ; input n

	    mov	    termCt, eax		    ; termCt = n

	    call    CRLF

	    mov	    edx, OFFSET secondMsg1  ; print "First ", n, " terms of Fibonacci series are:"
	    call    WriteString

	    mov	    eax, termCt
	    call    WriteDec

	    mov	    edx, OFFSET secondMsg2
	    call    WriteString

	    call    CRLF
	    call    CRLF

	    jmp	    DOWHILE

DOWHILE:				    ; Do

	    mov	    ebx, fib1		    ; fib1 += fib2
	    mov	    edx, fib2

	    add	    ebx, edx
	    
	    mov	    eax, ebx		    ; print fib1
	    call    WriteDec

	    call    CRLF
	    

	    mov	    fib1, edx		    ; swap (fib1, fib2)
	    mov	    fib2, ebx
	    
	    dec	    termCt		    ; While --termCt > 0	
	    cmp	    termCt, 0

	    jl	    ENDDOWHILE
	    jg	    DOWHILE


ENDDOWHILE:
	    call    CRLF

	    exit			 ; stop
main	    ENDP

END	    main