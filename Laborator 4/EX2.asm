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
ANGAJAT struct
nume DB 20 dup(1)
salariu DW 0
ANGAJAT ends

nrAngajati DW 4
angajati ANGAJAT {"georgescu", 100}, {"pop", 100},{"popescu", 300}, {"ionescu", 450}
suma DW 0
.code
start:
;intitializam cu 0 eax
;folosim variabila suma pt a aduna salariile
;facem adunarea de 4 ori
mov eax,0
lea esi,angajati
add esi, 20
mov ax,[esi]
add suma, ax
add esi,2


add esi, 20
mov ax,[esi]
add suma, ax
add esi,2



add esi, 20
mov ax,[esi]
add suma, ax
add esi,2


add esi, 20
mov ax,[esi]
add suma, ax
mov ax,suma
;am mutat suma in ax
push 0
	call exit
end start