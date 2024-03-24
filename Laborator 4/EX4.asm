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
sir db 1, 1, 2, 2, 3, 3, 4
suma dw 0
sumasir dw 0
n db 4
.code
start:
mov ecx, 0
;pentru a gasi care numar lipseste vom presupune ca avem toate numerele de la 1 la n,iar din suma totala vom scadea suma elementelor noaste din sir
;suma sir=2*(1+2+3+..+n)=(1+n)*n
mov bl,n
inc n
mov al,n
mul bl
mov suma,ax
;pana aici am calculat suma pe care am fi avut-o daca nu  lipsea niciun numar
;vom pune in ecx 2*n-1, pentru loop
mov ax,2
mul bl
dec ax
;ax=s*n-1
mov cx,ax
mov esi, 0
mov eax,0
l1:
add al, [sir+esi]
inc esi
loop l1
sub suma,ax
mov ax,suma
;in eax vom avea numarul care lipseste
push 0
	call exit
end start