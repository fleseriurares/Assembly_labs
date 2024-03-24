.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern fopen: proc
extern fprintf: proc
extern fscanf: proc
extern fclose: proc
extern fseek: proc
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

nume_fisier1 db "fisierpb4I.dat",0
nume_fisier2 db "fisierpb4II.dat",0
mod_ db "w",0
mod_2 db "r",0
.code
start:
	
	;deschiderea fisierului 1:
	push offset mod_2
	push offset nume_fisier1
	call fopen
	mov esi,eax
	
	
	
	push offset sir
	push offset format
	push eax
	call fscanf
	add esp, 12
	
	push offset sir
	push offset format
	call printf
	add esp,8
	
	mov ebx, 2
	mov eax, 0
	push esi
	push ebx
	push esi
	call fseek
	add esp,8
	mov ebx,eax
	push offset sir
	push offset format
	push ebx
	call fscanf
	add esp, 12

	push offset sir
	push offset format
	call printf
	add esp,8

	
	
	;deschiderea fisierului 2:
	push offset mod_
	push offset nume_fisier2
	call fopen
	add esp,8
	push eax 
	
	
	
	push 0
	call exit
end start
