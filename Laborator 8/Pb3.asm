.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
format db "%f",0
format2 db "REZ = %lf",0
n dd 3.0
a dd 0.0
n_int dd 3
REZ DQ 0
.code
start:
	
	
	mov ecx,n
	mov n,ecx
	mov ecx,n_int
	FINIT
	et_loop:
	FLD n
	fsqrt
	FLD n
	fdiv
	fadd a
	fstp a
	fld1
	fld n
	fsubr
	fstp n
	loop et_loop
	
	fld a
	fstp REZ
	
	push dword ptr[REZ+4]
	push dword ptr[REZ]
	push offset format2
	call printf
	add esp,12
	
	;terminarea programului
	
	push 0
	call exit
end start
