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
UNU_TREI DD 0.3333333
CINCI DD 5.0
REZ DQ 0
format	DB "REZ1 = %lf",13,10, 0
format2	DB "REZ2 = %lf", 0
.code
start:
	;rad^3(2)
	FINIT
	FLD UNU_TREI
	F2XM1
	FLD1
	FADD
	FSTP REZ
	
	;afisare 2
	push dword ptr[REZ+4]
	push dword ptr[REZ]
	push offset format
	call printf
	add ESP,12
	;rad^3(5)
	
	FINIT
	FLD UNU_TREI
	FLD CINCI
	FYL2X
	F2XM1
	FLD1
	FADD
	FSTP REZ
	
	;afisare 2
	push dword ptr[REZ+4]
	push dword ptr[REZ]
	push offset format2
	call printf
	add esp,12
	
	
	;terminarea programului
	push 0
	call exit
end start
