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

s1 db "oare"
lung_sir dd ($-s1)
s2 db "cineoare2"
lung_sir2 dd($-s2)
ct db 0
saux db 0
.code
start:
	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,lung_sir2
	mov esi,0
	;Vom folosi l2 pentru contorizarea literelor consecutive comune(prin ebx)
	;Daca ebx=lung_sir inseamnca ca sir se gaseste in sir2 => vom afla doar adresa
	;l1 este folosit pentru a reseta registrii corespunzatori de fiecare data cand trebuie sa reluam procesul de a gasi litere identice(il reluam atunci cand gasim 2 diferite)
	l1:
	mov ebx,0
	mov edi,0
	l2:
	dec edx
	cmp edx,-1 ; daca am ajuns la finalul sirului si nu s-a gasit subsirul -> facem jump la eticheta0(fals) si EAX = -1
	je eticheta0
	;al va fi o litera din s1, care va fi comparata cu una din s2(ah)
	mov al,[s1+edi]
	mov ah,[s2+esi]
	inc edi
	inc esi
	cmp al,ah
	jne l1
	inc ebx
	cmp ebx,lung_sir
	jne l2 ;in cazul in care contorul nu e egal cu numarul de litere din s1 se va relua procesul
	;daca sun egale vom calcula adresa de unde gasim subsirul in sir
	sub esi,edi
	mov edi,esi
	lea esi, s2
	add esi,edi
	mov eax, esi
	jmp eticheta1 ; sarim la eticheta 1(adevarat) pentru a evita "eticheta0"(cazul nefavorabil)
	eticheta0:
	mov eax,-1
	eticheta1:
	;apel functie exit
	push 0
	call exit
end start

