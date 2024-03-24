.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
UNGHI DD 0.523599
REZ DQ 0
format	DB "REZ = %lf", 0
.code
start:
	FINIT
	FLD UNGHI
	FPTAN
	FDIV ST(0), st(1)
	FLD ST(0)
	FMUL
	FLD1
	FADD
	FLD1
	FDIV ST(0),ST(1)
	FSQRT
	FSTP REZ
	push dword ptr [REZ+4]
	push dword ptr [REZ]
	push offset format
	call printf
	add esp, 12
	
	;terminarea programului
	push 0
	call exit
end start
