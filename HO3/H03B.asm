TITLE Larger of three numbers	    (HO3B.asm)

; Author: Sutinder S. Saini
; Date: 2/17/23



INCLUDE Irvine32.inc

.data
num1		  DWORD	?
num2		  DWORD	?
num3		  DWORD	?
enterThreeMsg	  BYTE	"Enter three numbers: ", 0
largerMsg	  BYTE	"Larger = ", 0

; Start 
; Print "Enter three numbers" 
; Input num1 
; Input num2 
; Input num3 
; IF num1 > num2 AND num1 > num3 
;   Print "Larger = ", num1 
; ELSE 
;   IF num2 > num3 
;     Print "Larger = ", num2 
;   ELSE 
;     Print "Larger = ", num3 
;   ENDIF 
; ENDIF 
; Stop 

.code
main	    PROC
    call    CLRSCR

    mov	    edx, OFFSET enterThreeMsg
    call    WriteString
    call    CRLF

    call    ReadDec
    mov	    num1, EAX

    call    ReadDec
    mov	    num2, EAX

    call    ReadDec
    mov	    num3, EAX


    mov	    eax, num1
    cmp	    eax, num2
    jg	    x

    cmp	    eax, num2
    jl	    else_1

x:
    cmp	    eax, num3
    jg	    y
    ret

y:
    mov	    edx, OFFSET largerMsg
    call    WriteString
    call    WriteDec
    ret

else_1:
    mov	    EAX, num2
    cmp	    EAX, num3
    jl	    else_2

    mov	    edx, OFFSET largerMsg
    call    WriteString
    call    WriteDec
    ret


else_2:
    mov	    edx, OFFSET largerMsg
    call    WriteString

    mov	    EAX, num3
    call    WriteDec

invoke  ExitProcess,0 ; stop


main	    ENDP
END main