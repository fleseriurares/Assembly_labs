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
;aici declaram date
n dd 10
format db "%d",0
.code

suma_impare macro nr
local nr_impar, suma
push EDX
push ECX
mov EDX,0
mov EAX,nr
mov edx, 2
div edx
mov edx,0
cmp EDX,0
jnz nr_impar
dec EAX ;facem numarul impar
mov ebx,Eax
mov ecx,ebx
;vom pastra suma in eax
mov EAX,0
nr_impar:
add EAX,ECX
sub ECX,2
cmp ECX,0
jg nr_impar
pop ecx
pop Edx
endm

citire MACRO nr
push ECX
mov ECX,nr
push offset nr
push offset format
call scanf
add esp,8
pop ecx
endm

afisare MACRO nr
push nr
push offset format
call printf
add esp,8
endm
start:
	
	citire n
	mov ECX,n
	suma_impare n
	afisare eax
	;terminarea programului
	push 0
	call exit
end start
