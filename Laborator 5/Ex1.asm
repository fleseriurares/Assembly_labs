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
sir dw 10, 21,3, 14, 2, 22, 11
lgsir dd ($-sir)/2
min dw 0
max dw 0 
	
.code
start:
	mov eax,0
	mov ax, 0 ; ax-minim
	mov edx,0
	mov dx,0; dx-maxim
	mov ecx, lgsir
	mov esi,0
	
	;salvam prima valoare din sir in ax,dx
	mov ax, sir[esi]
	mov dx, sir[esi]
	;construim loop-ul
	et_loop:
	cmp ax, sir[esi*2]
	jl cmp_max
	mov ax,sir[esi*2]
	cmp_max:
	cmp dx,sir[esi*2]
	jg	urmator
	mov dx,sir[esi*2]
	urmator:
	inc esi
	loop et_loop
	
	mov min, ax
	mov max, dx
	;apel functie exit
	push 0
	call exit
end start

