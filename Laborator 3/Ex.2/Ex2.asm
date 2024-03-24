.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
NUM1 DW 10 
NUM2 DW 5
REZ DW 0
;2. S˘a se scrie un program in limbaj de asamblare care genereaz˘a un ˆıntreg reprezentabil
;pe cuvˆant s, i ˆıl pune in locat, ia de memorie rez dup˘a formula:
;rez = AX*num1 + num2*(AX + BX)

;rez, num1 s, i num2 sunt valori reprezentate pe cuvˆant, aflate ˆın memorie.
.code
start:
	;initializam pe eax si ebx cu 0
	mov eax, 0
	mov ebx, 0
	;in al si bl punem niste valori oarecare
	mov ax, 2
	mov bx, 4
	
	;pastram valoarea lui ax pe stiva
	push ax
	mul num1
	add rez, ax
	;rez=AX*num1
	
	pop ax
	add ax,bx
	;(ax+bx)
	mul num2
	add rez, ax
	;rez=ax*num1_num2*(ax+bx)
	
	;apel functie exit
	push 0
	call exit
end start
