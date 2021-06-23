# serial_communication
Initially set the timer 1 in ode 2 and timer 0 in mode 1 to get the
delay of 0.33-1 msec
 Make the baud rate 9600 and set the SCON as 50H to receive the data
via serial ports which means that we are enabling REN
 Then start timer 1 and wait for receiving the data. If the received data
is 1 then move the TH0 and TL0 values into them as shown in the
below calculations.
 If the received value is not 1 then move to another subdomain for
example SWG_2 as below code.
 Then there start moving TH0 and TL0 as per calculation of 2kHz
frequency.
 If the received is not 2 also then move to another subdomain and
insert TH0 and TL0 values into them as per calculations.
 If we find that TF0 value reached 1 then come out of the loop and
compliment the bit value and continue the process again and
continue the wave form.
 Then after simulating give the value of 1,2 and 3 in UART window
and observe the time period of generated waves in logic analyser




Calculation:
Gate c/t M1 M0 Gate c/t M1 M0
0    0   1   0  0    0  0  1
TIMER 1 IN MODE 2 TIMER 0 IN MODE 1
Now to calculate the TH0 and TL0 for frequency of 1khz, 2khz and 3khz
Time delay calculations:

##Freq=1khz
Given frequency f = 1Khz
Total time period = 1m sec
Ton = Toff = 0.5msec
[ (FFFF-XXXX)+1] * 1.085 u sec = 0.5 msec
 XXXX = FE33H
 Hence we have to take TL0 = 33H
 TH0 = FEH
 
 
##Freq=2khz
 
Given frequency f = 2Khz
Total time period = 0.5m sec
Ton = Toff = 0.25msec
[ (FFFF-XXXX)+1] * 1.085 u sec = 0.25 msec
 XXXX=65306 in decimal
 XXXX = FF1AH
 Hence we have to take TL0 = 1AH
 TH0 = FFH


##Freq=3khz
Given frequency f = 3Khz
Total time period = 0.33m sec
Ton = Toff = 0.165msec
[ (FFFF-XXXX)+1] * 1.085 u sec = 0.165 msec
 XXXX=65382 in decimal
 XXXX = FF66H
 Hence we have to take TL0 = 66H
 TH0 = FFH
