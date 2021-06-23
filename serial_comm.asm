ORG 0000H
MOV TMOD,#21H ;TIMER 1 MODE2 AND TIMER 0 MODE 1FOR WAVE
MOV TH1,#-3 ;BAUD RATE 9600
MOV SCON,#50H ;8-BIT 1 STOP,REN ENABLED
CLR P2.1 ;SQUARE WAVE PORT
MOV P0,#0
SETB TR1 ;START TIMER 1
HERE:JNB RI,HERE
MOV A,SBUF ;SAVE RECEIVED DATA TO A
MOV P0,A
CJNE A,#"1",SWG_2 ;JUMP IF A NOT EQUAL TO 1
MOV TL0,#33H
MOV TH0,#0FEH
SETB TR0
LOOP_1:JNB TF0,LOOP_1 ; wait till TF0 becomes 1
CPL P2.1 ;compliment the p2.1 value
CLR TR0
CLR TF0
SWG_2:CJNE A,#"2",SWG_3 ;JUMP IF A NOT EQUAL TO 2
MOV TL0,#1AH
MOV TH0,#0FFH
SETB TR0
LOOP_2:JNB TF0,LOOP_2  ;wait till TF0 becomes 1
CPL P2.1 ;compliment the p2.1 value
CLR TR0
CLR TF0
SWG_3:CJNE A,#"3",SWG_4 ;JUMP IF A NOT EQUAL TO 3
MOV TL0,#66H
MOV TH0,#0FFH
SETB TR0
LOOP_3:JNB TF0,LOOP_3 ; wait till TF0 becomes 1
CPL P2.1 ;compliment the p2.1 value
CLR TR0
CLR TF0
SJMP HERE
SWG_4:
SJMP HERE
END
