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
VAR dw 1024

.code
start:
	mov eax,0
	mov ebx,0
	mov ax,var
	;pentru a verifica daca variabila e putere a lui 2 vom scadea numarul cu 1 si vom efectua si logic pe biti
	mov bx,ax
	;salvam valoarea in bx
	dec bx
	and ax,bx
	;facem sau pe biti intre var si var-1 si salvam rezultatul in ax(0 doar daca e puter a lui 2)
	;apel functie exit
	push 0
	call exit
end start
