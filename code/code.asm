.include "/sdcard/latex/assembly/m328Pdef.inc"
ldi r17, 0b11100011 
out DDRD,r17 
ldi r17,0b11111111 
out PORTD,r17
ldi r16,0b00000001
out DDRB,r16            
start:                  
        in r17,PIND           
        ldi r24,0b00000100
        mov r18,r17
        and r18,r24
        ldi r25,0b00000010
        loopx:  lsr r18
        dec r25
        brne    loopx
        .DEF C = r18
        mov r19,r17
        ldi r24,0b00001000
        and r19,r24
        ldi r25,0b00000011
        loopy:  lsr r19
        dec r25 
        brne loopy
        .DEF B = r19
        ldi r24,0b00010000
        mov r20,r17
        and r20,r24
         ldi r25,0b00000100
        loopz:  lsr r20
        dec r25
        brne    loopz
        .DEF A = r20
        ldi r21,0x00
        ldi r22,0x00
        ldi r23,0x00
        .DEF T1 = r21
        .DEF T2 = r22
        .DEF T3 = r23
        mov T1,B     
        mov T2,A
        mov T3,C
        com T1
        and T1,T3  
        or T1,T2   
        out PORTB,T1
        rjmp start
