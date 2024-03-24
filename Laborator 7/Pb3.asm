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
;aici declaram date
;functie dw "printf",0
format db "%d", 13,10,0
.code

apel0 macro functie
call functie
endm

apel1 macro functie, n1
push n1
call functie
add esp,4
endm

apel2 macro functie, n1, n2
push offset n2
push offset n1
call functie
add esp,8
endm

apel3 macro functie, n1, n2, n3
push n3
push n2
push offset n1
call functie
add esp,12
endm
start:
mov eax,25
	apel2 printf, format, eax
	;terminarea programului
	push 0
	call exit
end start
