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

.code
start:
	;EAX = 7*EAX - 2*EBX - EBX/8
	;initializez pe eax si ebx cu valori oarecare
	mov eax, 2
	mov ebx, 12
	
	;pastrez valoarea 7 in edx, pentru inmultire
	mov edx, 7
	mul edx
	mov ecx,eax
	;ecx=eax*7 <- pastrez valoarea lui eax in ecx
	
	;pentru a 2-a operatie oun 2 in ebx
	mov eax, 2
	mul ebx
	
	sub ecx, eax
	;ecx=eax*7-2*ebx
	mov eax, ebx
	div ebx
	
	sub ecx, eax
	;ecx=eax*7-2*ebx-ebx/8
	
	;apel functie exit
	push 0
	call exit
end start
