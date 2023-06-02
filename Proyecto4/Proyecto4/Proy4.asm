;|----------------------------------------------------------------------|
;| Universidad del Valle de Guatemala                                   |
;| José Pablo Orellana - 21970 | Diego Alberto Leiva - 21752            | 
;| Proyecto 04 - Organización de Computadoras y Assembler               |
;|----------------------------------------------------------------------|
;| Acertijo Pastor: Consiste en el diseño de un juego de acertijos      |
;| en el que un pastor tiene que atravesar a la otra orilla de un       |
;| río con un lobo, una cabra y una lechuga. Dispone de una barca       |
;| en la que solo caben él y una de las otras tres cosas. Si el lobo    |
;| se queda solo con la cabra se la come, si la cabra se queda sola con | 
;| la lechuga se la come. ¿Cómo debe hacerlo?                           |
;|----------------------------------------------------------------------|


.386
.model flat, stdcall, c
.stack 4096

includelib libcmt.lib
includelib libvcruntime.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib

.model flat, C

printf proto c : vararg
scanf  proto c : vararg


.data

separator	BYTE	"|===================================================================================|", 0Ah, 0

space		BYTE	"|                                                                                   |", 0Ah, 0


title0		BYTE	"|                     _____ ______ _____ _______ _____     _  ____                  |", 0Ah, 0
title1		BYTE	"|               /\   / ____|  ____|  __ \__   __|_   _|   | |/ __ \                 |", 0Ah, 0
title2		BYTE	"|              /  \ | |    | |__  | |__) | | |    | |     | | |  | |                |", 0Ah, 0
title3		BYTE	"|             / /\ \| |    |  __| |  _  /  | |    | | _   | | |  | |                |", 0Ah, 0
title4		BYTE	"|            / ____ \ |____| |____| | \ \  | |   _| || |__| | |__| |                |", 0Ah, 0
title5		BYTE	"|           /_/    \_\_____|______|_|  \_\ |_|  |_____\____/ \____/                 |", 0Ah, 0


title6      BYTE    "|         _____  ______ _         _____         _____ _______ ____  _____           |", 0Ah, 0
title7      BYTE    "|        |  __ \|  ____| |       |  __ \ /\    / ____|__   __/ __ \|  __ \          |", 0Ah, 0
title8      BYTE    "|        | |  | | |__  | |       | |__) /  \  | (___    | | | |  | | |__) |         |", 0Ah, 0
title9      BYTE    "|        | |  | |  __| | |       |  ___/ /\ \  \___ \   | | | |  | |  _  /          |", 0Ah, 0
title10     BYTE    "|        | |__| | |____| |____   | |  / ____ \ ____) |  | | | |__| | | \ \          |", 0Ah, 0
title11     BYTE    "|        |_____/|______|______|  |_| /_/    \_\_____/   |_|  \____/|_|  \_\         |", 0Ah, 0


logo0		BYTE	"|           / \      _-'                  __  _                      _ _            |", 0Ah, 0
logo1		BYTE	"|         _/|  \-''- _ /               .-:'  `; `-._              .-( : )-.         |", 0Ah, 0
logo2		BYTE	"|    __-' { |          \              (_,           )            (   \'/   )        |", 0Ah, 0
logo3		BYTE	"|        /             \            ,'o''(           )>         ( `'.;;;.'` )       |", 0Ah, 0
logo4		BYTE	"|        /      ''o.  |o }         (__,-'            )         ( :-=;;;;;=-: )      |", 0Ah, 0
logo5		BYTE	"|        |            \ ;             (             )           (  .';;;'.  )       |", 0Ah, 0
logo6		BYTE	"|                      ',              `-'._.--._.-'             (`  /.\  `)        |", 0Ah, 0
logo7		BYTE	"|           \_         __\                |||  |||                '-(_:_)-'         |", 0Ah, 0
logo8		BYTE	"|             ''-_    \.//                                                          |", 0Ah, 0
logo9		BYTE	"|               / '-____'                                                           |", 0Ah, 0
logo10		BYTE	"|              /                                                                    |", 0Ah, 0


lose1       BYTE    "|          __     ______  _    _     _      ____   _____ ______         __          |", 0Ah, 0
lose2       BYTE    "|          \ \   / / __ \| |  | |   | |    / __ \ / ____|  ____|   _   / /          |", 0Ah, 0
lose3       BYTE    "|           \ \_/ / |  | | |  | |   | |   | |  | | (___ | |__     (_) | |           |", 0Ah, 0
lose4       BYTE    "|            \   /| |  | | |  | |   | |   | |  | |\___ \|  __|        | |           |", 0Ah, 0
lose5       BYTE    "|             | | | |__| | |__| |   | |___| |__| |____) | |____    _  | |           |", 0Ah, 0
lose6       BYTE    "|             |_|  \____/ \____/    |______\____/|_____/|______|  (_) | |           |", 0Ah, 0
lose7       BYTE    "|                                                                      \_\          |", 0Ah, 0


win1       BYTE    "|              __     ______  _    _   __          _______ _   _       __            |", 0Ah, 0
win2       BYTE    "|              \ \   / / __ \| |  | |  \ \        / /_   _| \ | |   _  \ \           |", 0Ah, 0
win3       BYTE    "|               \ \_/ / |  | | |  | |   \ \  /\  / /  | | |  \| |  (_)  | |          |", 0Ah, 0
win4       BYTE    "|                \   /| |  | | |  | |    \ \/  \/ /   | | | . ` |       | |          |", 0Ah, 0
win5       BYTE    "|                 | | | |__| | |__| |     \  /\  /   _| |_| |\  |   _   | |          |", 0Ah, 0
win6       BYTE    "|                 |_|  \____/ \____/       \/  \/   |_____|_| \_|  (_)  | |          |", 0Ah, 0
win7       BYTE    "|                                                                      /_/           |", 0Ah, 0
                                       

welcome		BYTE	"|               Bienvenido al acertijo del lobo la obeja y la lechuga               |", 0Ah, 0 

home        BYTE    "|                                  MENU PRINCIPAL                                   |", 0Ah, 0

select      BYTE    "                               Selecciona una opcion: ", 0

mainmenu1   BYTE    "|                              (1.) Iniciar el juego                                |", 0Ah, 0
mainmenu2   BYTE    "|                              (2.) Ver Instrucciones                               |", 0Ah, 0
mainmenu3   BYTE    "|                              (3.) Salir del juego                                 |", 0Ah, 0

finish      BYTE    "|                               EL JUEGO HA TERMINADO                               |", 0Ah, 0


instructions1	BYTE	"|                    Aqui podras ver las instrucciones del juego                    |", 0Ah, 0
instructions2	BYTE	"|  Un pastor tiene que atravesar a la otra orilla de un rio con un lobo, una oveja  |", 0Ah, 0
instructions3	BYTE	"|   y una lechuga Dispone de una barca en la que solo caben el y una de las otras   |", 0Ah, 0
instructions4	BYTE	"|  Si el lobo se queda solo con la cabra se la come, si la cabra se queda sola con  |", 0Ah, 0
instructions5	BYTE	"|                              la lechuga se la come.                               |", 0Ah, 0
instructions6	BYTE	"|                                COMO DEBE HACERLO?                                 |", 0Ah, 0
instructions7	BYTE	"|    A continuacion debera ingresar, cual sera el primer objeto en cruzar el rio    |", 0Ah, 0
wolfopt		    BYTE	"|                                     1) Lobo                                       |", 0Ah, 0
sheepopt		BYTE	"|                                     2) Oveja                                      |", 0Ah, 0
lettuceopt		BYTE	"|                                     3) Lechuga                                    |", 0Ah, 0
aloneopt        BYTE    "|                                     4) Regresar Solo                              |", 0Ah, 0


message12		BYTE	"|                   Ingresa el numero 1 para iniciar con el juego:                  |", 0
errormsg1		BYTE	"|                        Ingresaste un número que no es valido                      |", 0Ah, 0
errormsg2		BYTE	"|                      El objeto no esta disponible de este lado                    |", 0Ah, 0
pru     		BYTE	"                                       Prueba                                        ", 0Ah, 0
izwolf       	BYTE	"|                              Lobo esta del lado Izquierdo                         |", 0Ah, 0
derwolf      	BYTE	"|                               Lobo esta del lado Derecho                          |", 0Ah, 0
izsheep     	BYTE	"|                              Oveja esta del lado Izquierdo                        |", 0Ah, 0
dersheep     	BYTE	"|                               Oveja esta del lado Derecho                         |", 0Ah, 0
izlettuce    	BYTE	"|                             Lechuga esta del lado Izquierdo                       |", 0Ah, 0
derlettuce     	BYTE	"|                              Lechuga esta del lado Derecho                        |", 0Ah, 0
izpastor    	BYTE	"|                              Pastor esta del lado Izquierdo                       |", 0Ah, 0
derpastor     	BYTE	"|                               Pastor esta del lado Derecho                        |", 0Ah, 0
state        	BYTE	"|                            El estado actual de los objetos es                     |", 0Ah, 0
leftoption      BYTE    "|                  Los objetos que puedes mover a la derecha son:                   |", 0Ah, 0
rightoption     BYTE    "|                   Los objetos que puedes llevar de regreso son:                   |", 0Ah, 0



dato1   db "%d", 0
Inicio1 dd 0
movida dd 0

wolf    DWORD   0 ;lado del lobo
sheep   DWORD   0 ;lado de la oveja
lettuce DWORD   0 ;lado de la lechuga
pastor  DWORD   0 ;lado del pastop

game    DWORD   2 ;ya ganamos?


.code

public main
main proc

    invoke printf, addr separator
    invoke printf, addr space
    invoke printf, addr title0
    invoke printf, addr title1
    invoke printf, addr title2
    invoke printf, addr title3
    invoke printf, addr title4
    invoke printf, addr title5
    invoke printf, addr space
    invoke printf, addr title6
    invoke printf, addr title7
    invoke printf, addr title8
    invoke printf, addr title9
    invoke printf, addr title10
    invoke printf, addr title11
    invoke printf, addr space
    invoke printf, addr separator
    invoke printf, addr space
    invoke printf, addr logo0
    invoke printf, addr logo1
    invoke printf, addr logo2
    invoke printf, addr logo3
    invoke printf, addr logo4
    invoke printf, addr logo5
    invoke printf, addr logo6
    invoke printf, addr logo7
    invoke printf, addr logo8
    invoke printf, addr logo9
    invoke printf, addr logo10
    invoke printf, addr space
    invoke printf, addr separator
    invoke printf, addr space
    invoke printf, addr welcome
    invoke printf, addr space
    invoke printf, addr separator
    invoke printf, addr space
    invoke printf, addr home
    invoke printf, addr space
    invoke printf, addr mainmenu1
    invoke printf, addr mainmenu2
    invoke printf, addr mainmenu3
    invoke printf, addr space
    invoke printf, addr separator

    call inRangeStart
    mov Inicio1, eax

	.IF Inicio1 == 1 
		;Programar Juego
    continue:
        call wherePastor
        .IF game == 2
            jmp continue
        .ENDIF
            

	.ELSEIF Inicio1 == 2 
		;Instrucciones
        invoke printf, addr separator
        invoke printf, addr space
        invoke printf, addr instructions1
        invoke printf, addr space
        invoke printf, addr instructions2
        invoke printf, addr instructions3
        invoke printf, addr instructions4
        invoke printf, addr instructions5
        invoke printf, addr instructions6
        invoke printf, addr instructions7
        invoke printf, addr space
        invoke printf, addr separator
        ;pedir cualquier cosa aca
        jmp continue



	.ELSEIF Inicio1 == 3   
		;Salir
        invoke printf, addr separator
        invoke printf, addr finish
        invoke printf, addr separator

    .ELSE
        invoke printf, addr space
        invoke printf, addr separator
        invoke printf, addr errormsg1
        invoke printf, addr separator
        

	.ENDIF


    

main endp

;------------------------------------------------------------
;                         SUB RUTINAS
;------------------------------------------------------------

dummy proc
    ret
dummy endp

dummy2 proc
    ret
dummy2 endp

;-----------------------------------------------------------------------------------------------------------------------

loser proc                      ;Creador: Pablo Orellana Muestra mensaje de derrota
    invoke printf, addr space
    invoke printf, addr separator
    invoke printf, addr lose1
    invoke printf, addr lose2
    invoke printf, addr lose3
    invoke printf, addr lose4
    invoke printf, addr lose5
    invoke printf, addr lose6
    invoke printf, addr lose7
    invoke printf, addr separator
     
    ret
loser endp 

;-----------------------------------------------------------------------------------------------------------------------

winer proc                      ;Creador: Pablo Orellana Muestra mensaje de victoria
    invoke printf, addr space
    invoke printf, addr separator
    invoke printf, addr win1
    invoke printf, addr win2
    invoke printf, addr win3
    invoke printf, addr win4
    invoke printf, addr win5
    invoke printf, addr win6
    invoke printf, addr win7
    invoke printf, addr separator
    ret
winer endp

;-----------------------------------------------------------------------------------------------------------------------

inRangeStart proc                   ;Creador: Diego Leiva Valida si un numero esta entre 1,2 o 3 y sino lo vuleve a pedir
    asknum:                         ; Define la etiqueta "asknum" (inicio del bucle)
    sub esp, 4                      ; Reduce la pila en 4 bytes para alojar el valor ingresado.
    push offset select              ; Empuja la dirección del mensaje "select" a la pila para printf.
    call printf                     ; Llama a la función printf para imprimir el mensaje de solicitud.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando la dirección del mensaje y el valor anterior.

    lea eax, [ebp - 4]              ; Carga la dirección de la variable local en eax.
    push eax                        ; Empuja la dirección de la variable local a la pila para scanf.
    push offset dato1               ; Empuja la dirección del formato de entrada a la pila para scanf.
    call scanf                      ; Llama a la función scanf para leer el valor de entrada.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando las direcciones de la pila.

    mov eax, [ebp - 4]              ; Mueve el valor de entrada a eax.
    mov Inicio1, eax                ; Guarda el valor de entrada en Inicio1.

    mov eax, Inicio1                ; Carga el valor de Inicio1 en eax.
    cmp eax, 1                      ; Compara el valor de eax con 1.
    je valid                        ; Si eax es igual a 1, salta a la etiqueta "valid".
    cmp eax, 2                      ; Si no, compara el valor de eax con 2.
    je valid                        ; Si eax es igual a 2, salta a la etiqueta "valid".
    cmp eax, 3                      ; Si no, compara el valor de eax con 3.
    je valid                        ; Si eax es igual a 3, salta a la etiqueta "valid".

    invoke printf, addr errormsg1   ; Si no es igual a ninguno, imprime el mensaje de error.
    jmp asknum                      ; Y luego salta a "asknum" para pedir otro valor.

    valid:                          ; Define la etiqueta "valid" (salto si el valor de entrada es válido).
    mov Inicio1, eax                ; Guarda el valor de entrada en Inicio1.
    ret                             ; Regresa al código que llamó a esta subrutina.

inRangeStart endp

;-----------------------------------------------------------------------------------------------------------------------

actualstate proc                        ; Creador: Pablo Orellana Mostrar estado actual del juego
    invoke printf, addr separator
    invoke printf, addr space
    invoke printf, addr state
    
    mov eax, 0
    cmp sheep, eax
    je lefts
    jne rights

    lefts:
        invoke printf, addr space
        invoke printf, addr izsheep
        jmp compw
    rights:
        invoke printf, addr space
        invoke printf, addr dersheep
        jmp compw

    compw:
        mov eax, 0
        cmp wolf, eax
        je leftw
        jne rightw

        leftw:
            
            invoke printf, addr izwolf
            jmp compl
        rightw:
            
            invoke printf, addr derwolf
            jmp compl

    compl:
        mov eax, 0
        cmp lettuce, eax
        je leftl
        jne rightl
    
        leftl:
            
            invoke printf, addr izlettuce
            jmp compp
        rightl:
            
            invoke printf, addr derlettuce
            jmp compp

    compp:
        mov eax, 0
        cmp pastor, eax
        je leftp
        jne rightp

        leftp:
            
            invoke printf, addr izpastor
            invoke printf, addr separator
            jmp endl
        rightp:
            
            invoke printf, addr derpastor
            invoke printf, addr separator
            jmp endl

    endl:
    ret
actualstate endp

;-----------------------------------------------------------------------------------------------------------------------

wherePastor proc                                ;Creador Diego Leiva Evalua en que lado se encuentra el pastor, le pide que cosa quiere mover y evalua si gano o perdio el juego
    .IF pastor == 0 
		;el pastor esta en la izquierda
        call actualstate
        call leftOptions
        call questionleft
        call movidasleft
        call winlose
        .IF game == 0
            jmp endl
        .ENDIF
        .IF game == 1
            jmp endl
        .ENDIF
    .ENDIF
    
	.IF pastor == 1
        ;el pastor esta en la derecha
        call actualstate
        call rightOptions
        call questionright
        call movidasright
        call winlose
        .IF game == 0
            jmp endl
        .ENDIF
        .IF game == 1
            jmp endl
        .ENDIF
	.ENDIF


    endl:
      ret
wherePastor endp

;-----------------------------------------------------------------------------------------------------------------------

leftOptions proc                         ;Creador: Diego Leiva Muestra al usuario lo que puede mover de izquierda a derecha
    invoke printf, addr leftoption
    invoke printf, addr space

    .IF  wolf == 0
        invoke printf, addr wolfopt
    .ENDIF
    
    .IF sheep == 0
        invoke printf, addr sheepopt
    .ENDIF

    .IF  lettuce == 0
        invoke printf, addr lettuceopt
    .ENDIF
    
    ret
leftOptions endp

;-----------------------------------------------------------------------------------------------------------------------

rightOptions proc                        ;Creador: Diego Leiva Muestra al usuario lo que puede mover de derecha a izquierda
    invoke printf, addr rightoption
    invoke printf, addr space

    .IF  wolf == 1
        invoke printf, addr wolfopt
    .ENDIF
    
    .IF sheep == 1
        invoke printf, addr sheepopt
    .ENDIF

    .IF  lettuce == 1
        invoke printf, addr lettuceopt
    .ENDIF

    invoke printf, addr aloneopt
    
    ret
rightOptions endp

;-----------------------------------------------------------------------------------------------------------------------

questionleft proc                   ;Creador   Pablo Orellana Pide al jugador que objeto mover de izquierda a derecha e indica si la opcion es valida o no
    askopt:

    sub esp, 4                      ; Reduce la pila en 4 bytes para alojar el valor ingresado.
    push offset select              ; Empuja la dirección del mensaje "select" a la pila para printf.
    call printf                     ; Llama a la función printf para imprimir el mensaje de solicitud.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando la dirección del mensaje y el valor anterior.

    lea eax, [ebp - 4]              ; Carga la dirección de la variable local en eax.
    push eax                        ; Empuja la dirección de la variable local a la pila para scanf.
    push offset dato1               ; Empuja la dirección del formato de entrada a la pila para scanf.
    call scanf                      ; Llama a la función scanf para leer el valor de entrada.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando las direcciones de la pila.

    mov eax, [ebp - 4]              ; Mueve el valor de entrada a eax.
    mov movida, eax                 ; Guarda el valor de entrada en Inicio1.

    mov eax, movida                 ; Carga el valor de Inicio1 en eax.
    cmp eax, 1                      ; Compara el valor de eax con 1.
    je wolfs                        ; Si eax es igual a 1, salta a la etiqueta "valid".
    cmp eax, 2                      ; Si no, compara el valor de eax con 2.
    je sheeps                       ; Si eax es igual a 2, salta a la etiqueta "valid".
    cmp eax, 3                      ; Si no, compara el valor de eax con 3.
    je lettuces

    sheeps:
    .IF sheep == 1
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    wolfs:
    .IF wolf == 1
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    lettuces:
    .IF lettuce == 1
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    invoke printf, addr errormsg1   ; Si no es igual a ninguno, imprime el mensaje de error.
    jmp askopt                      ; Y luego salta a "asknum" para pedir otro valor.

    valid:                          ; Define la etiqueta "valid" (salto si el valor de entrada es válido).
    mov movida, eax                ; Guarda el valor de entrada en Inicio1.
    ret                             ; Regresa al código que llamó a esta subrutina.

    ret
questionleft endp

;-----------------------------------------------------------------------------------------------------------------------

questionright proc                  ;Creador   Pablo Orellana Pide al jugador que objeto mover de derecha a izquierda e indica si la opcion es valida o no
    askopt:

    sub esp, 4                      ; Reduce la pila en 4 bytes para alojar el valor ingresado.
    push offset select              ; Empuja la dirección del mensaje "select" a la pila para printf.
    call printf                     ; Llama a la función printf para imprimir el mensaje de solicitud.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando la dirección del mensaje y el valor anterior.

    lea eax, [ebp - 4]              ; Carga la dirección de la variable local en eax.
    push eax                        ; Empuja la dirección de la variable local a la pila para scanf.
    push offset dato1               ; Empuja la dirección del formato de entrada a la pila para scanf.
    call scanf                      ; Llama a la función scanf para leer el valor de entrada.
    add esp, 8                      ; Aumenta la pila en 8 bytes, limpiando las direcciones de la pila.

    mov eax, [ebp - 4]              ; Mueve el valor de entrada a eax.
    mov movida, eax                 ; Guarda el valor de entrada en Inicio1.

    mov eax, movida                 ; Carga el valor de Inicio1 en eax.
    cmp eax, 1                      ; Compara el valor de eax con 1.
    je wolfs                        ; Si eax es igual a 1, salta a la etiqueta "valid".
    cmp eax, 2                      ; Si no, compara el valor de eax con 2.
    je sheeps                       ; Si eax es igual a 2, salta a la etiqueta "valid".
    cmp eax, 3                      ; Si no, compara el valor de eax con 3.
    je lettuces
    cmp eax, 4                      ; Si no, compara el valor de eax con 3.
    je valid


    sheeps:
    .IF sheep == 0
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    wolfs:
    .IF wolf == 0
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    lettuces:
    .IF lettuce == 0
        invoke printf, addr errormsg2
        jmp askopt
    .ELSE
        jmp valid
    .ENDIF

    invoke printf, addr errormsg1   ; Si no es igual a ninguno, imprime el mensaje de error.
    jmp askopt                      ; Y luego salta a "asknum" para pedir otro valor.

    valid:                          ; Define la etiqueta "valid" (salto si el valor de entrada es válido).
    mov movida, eax                ; Guarda el valor de entrada en Inicio1.
    ret                             ; Regresa al código que llamó a esta subrutina.

questionright endp

;-----------------------------------------------------------------------------------------------------------------------

winlose proc                    ;Creador Diego Leiva Subrutina que berifica si el jugador gano o perdio luego de hacer su movimiento
                        
    .IF sheep == 0              ;si oveja y lobo juntos en izquierda y pastor en derecha
        .IF wolf == 0 
            .IF pastor == 1
                mov game, 0
                call loser
            .ENDIF
        .ENDIF
    .ENDIF

    .IF sheep == 1              ;si oveja y lobo juntos en derecha y pastor en izquierda
        .IF wolf == 1 
            .IF pastor == 0
                mov game, 0
                call loser
            .ENDIF
        .ENDIF
    .ENDIF

    .IF sheep == 0              ;si oveja y lechuga juntos en izquierda y pastor en derecha
        .IF lettuce == 0 
            .IF pastor == 1
                mov game, 0
                call loser
            .ENDIF
        .ENDIF
    .ENDIF

    .IF sheep == 1              ;si oveja y lechuga juntos en derecha y pastor en izquierda
        .IF lettuce == 1 
            .IF pastor == 0
                mov game, 0
                call loser
            .ENDIF
        .ENDIF
    .ENDIF

    .IF sheep == 1              ;si los 3 objetos estan en la derecha se gana
        .IF wolf == 1
            .IF lettuce == 1
                mov game, 1
                call winer
            .ENDIF
        .ENDIF 
    .ENDIF
    
    ret
winlose endp

;-----------------------------------------------------------------------------------------------------------------------

movidasleft proc            ;Creador Diego Leiva Movida del pastor con objeto a la derecha
    .IF movida == 1
        mov wolf, 1
    .ENDIF
    .IF movida == 2
        mov sheep, 1
    .ENDIF
    .IF movida == 3
        mov lettuce, 1
    .ENDIF
    mov pastor, 1
    ret
movidasleft endp

;-----------------------------------------------------------------------------------------------------------------------

movidasright proc           ;Creador Diego Leiva Movida del pastor con o sin objeto a la izquierda
    .IF movida == 1
        mov wolf, 0
    .ENDIF
    .IF movida == 2
        mov sheep, 0
    .ENDIF
    .IF movida == 3
        mov lettuce, 0
    .ENDIF
    mov pastor, 0
    ret
movidasright endp



end
