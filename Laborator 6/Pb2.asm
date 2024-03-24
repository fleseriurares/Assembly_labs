.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern fopen: proc
extern fprintf: proc
extern fclose: proc
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data

msg db "Scrieti sirul",0
sir db 20 dup(0)
sir_intors db 20 dup(0)
format db "%s",0

nume_fisier db "fisier.dat",0
mod_ db "w",0


.code



start:
	
	;deschiderea fisierului:
	push offset mod_
	push offset nume_fisier
	call fopen
	push eax
	
	;citirea sirului
	push offset sir
	push offset format
	call scanf
	add esp, 8

	;aflam lungimea sirului
	mov ESI,0 ; folosim esi drept contor
	loop1:
	cmp sir[esi],0
	je done_loop1
	inc esi
	jmp loop1
	done_loop1:
	

	;scrierea sirului in ordine inversa in fisier:
	dec ESI ; sirul incepe de la 0 => ultimul caracter va fi la esi-1
	mov edi,0
	inversare:
	mov EBX,0
	mov BL,sir[esi]
	mov sir_intors[edi],bl
	dec esi
	inc edi
	cmp esi,0
	jl final
	jmp inversare
	final:
	
	;afisare:
	pop esi
	push offset sir_intors
	push offset format
	push esi
	call fprintf
	add esp,12
	
	;inchiderea fisierului
	PUSH esi
	call fclose
	
	push 0
	call exit
end start
