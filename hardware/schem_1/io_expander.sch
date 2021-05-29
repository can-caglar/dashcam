EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_Expansion:MCP23017_SO U8
U 1 1 60ABCEFB
P 2500 2375
F 0 "U8" H 2025 3500 50  0000 C CNN
F 1 "MCP23017_SO" H 2050 3400 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 2700 1375 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf" H 2700 1275 50  0001 L CNN
	1    2500 2375
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1675 1425 1675
Text HLabel 1425 1575 0    50   BiDi ~ 0
SDA_IOE
Text HLabel 1425 1675 0    50   Input ~ 0
SCK_IOE
NoConn ~ 1800 2175
NoConn ~ 1800 2275
Wire Wire Line
	1800 1575 1425 1575
$Comp
L power:+3.3V #PWR044
U 1 1 60AC2D0A
P 1400 2225
F 0 "#PWR044" H 1400 2075 50  0001 C CNN
F 1 "+3.3V" H 1415 2398 50  0000 C CNN
F 2 "" H 1400 2225 50  0001 C CNN
F 3 "" H 1400 2225 50  0001 C CNN
	1    1400 2225
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R24
U 1 1 60AC481D
P 1400 2325
F 0 "R24" H 1459 2371 50  0000 L CNN
F 1 "2k2" H 1459 2280 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1400 2325 50  0001 C CNN
F 3 "~" H 1400 2325 50  0001 C CNN
	1    1400 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2475 1400 2475
Wire Wire Line
	1400 2475 1400 2425
$Comp
L power:GND #PWR049
U 1 1 60AC5327
P 2500 3475
F 0 "#PWR049" H 2500 3225 50  0001 C CNN
F 1 "GND" H 2505 3302 50  0000 C CNN
F 2 "" H 2500 3475 50  0001 C CNN
F 3 "" H 2500 3475 50  0001 C CNN
	1    2500 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR047
U 1 1 60AC5832
P 1500 3225
F 0 "#PWR047" H 1500 2975 50  0001 C CNN
F 1 "GND" H 1505 3052 50  0000 C CNN
F 2 "" H 1500 3225 50  0001 C CNN
F 3 "" H 1500 3225 50  0001 C CNN
	1    1500 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2975 1500 2975
Wire Wire Line
	1500 2975 1500 3075
Wire Wire Line
	1800 3075 1500 3075
Connection ~ 1500 3075
Wire Wire Line
	1500 3075 1500 3175
Wire Wire Line
	1800 3175 1500 3175
Connection ~ 1500 3175
Wire Wire Line
	1475 3175 1500 3175
Wire Wire Line
	1500 3175 1500 3225
Text Notes 1125 4075 0    50   ~ 0
Max current out of Vss pin = 150mA\nMax output sunk/sourced by any output pin = 25mA
Wire Wire Line
	3200 3175 3600 3175
Wire Wire Line
	3200 2975 3600 2975
Wire Wire Line
	3200 3075 3600 3075
Text Label 3300 3175 0    50   ~ 0
BTN_OK
Text Label 3300 3075 0    50   ~ 0
BTN_UP
Text Label 3300 2975 0    50   ~ 0
BTN_DOWN
Wire Wire Line
	9350 1850 8950 1850
Wire Wire Line
	9750 1850 10050 1850
$Comp
L Switch:SW_Push SW5
U 1 1 60B51C32
P 9575 2250
F 0 "SW5" H 9575 2535 50  0000 C CNN
F 1 "UP" H 9575 2444 50  0000 C CNN
F 2 "Digikey:Switch_Tactile_SMD_6x6mm_PTS645" H 9575 2450 50  0001 C CNN
F 3 "~" H 9575 2450 50  0001 C CNN
	1    9575 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9375 2250 8975 2250
Wire Wire Line
	9775 2250 10050 2250
$Comp
L Switch:SW_Push SW6
U 1 1 60B52A31
P 9575 2650
F 0 "SW6" H 9575 2935 50  0000 C CNN
F 1 "OK" H 9575 2844 50  0000 C CNN
F 2 "Digikey:Switch_Tactile_SMD_6x6mm_PTS645" H 9575 2850 50  0001 C CNN
F 3 "~" H 9575 2850 50  0001 C CNN
	1    9575 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9375 2650 8975 2650
Wire Wire Line
	9775 2650 10050 2650
Text Label 8950 1850 0    50   ~ 0
BTN_DOWN
Text Label 8975 2250 0    50   ~ 0
BTN_UP
Text Label 8975 2650 0    50   ~ 0
BTN_OK
$Comp
L power:GND #PWR046
U 1 1 60B547CE
P 10050 2775
F 0 "#PWR046" H 10050 2525 50  0001 C CNN
F 1 "GND" H 10055 2602 50  0000 C CNN
F 2 "" H 10050 2775 50  0001 C CNN
F 3 "" H 10050 2775 50  0001 C CNN
	1    10050 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1850 10050 2250
Connection ~ 10050 2650
Wire Wire Line
	10050 2650 10050 2775
Connection ~ 10050 2250
Wire Wire Line
	10050 2250 10050 2650
NoConn ~ 3200 2275
NoConn ~ 3200 2175
NoConn ~ 3200 2075
NoConn ~ 3200 1975
NoConn ~ 3200 1875
NoConn ~ 3200 1775
NoConn ~ 3200 1675
NoConn ~ 3200 1575
Text Label 3300 2875 0    50   ~ 0
Vusb_detect
Text Label 6850 2000 0    50   ~ 0
Vusb_detect
Text HLabel 6225 1450 1    50   Input ~ 0
Vusb
$Comp
L Device:R_Small R22
U 1 1 60B9473A
P 6225 1800
F 0 "R22" H 6284 1846 50  0000 L CNN
F 1 "100k" H 6284 1755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6225 1800 50  0001 C CNN
F 3 "~" H 6225 1800 50  0001 C CNN
	1    6225 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R23
U 1 1 60B94B75
P 6225 2300
F 0 "R23" H 6284 2346 50  0000 L CNN
F 1 "150k" H 6284 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6225 2300 50  0001 C CNN
F 3 "~" H 6225 2300 50  0001 C CNN
	1    6225 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR045
U 1 1 60B95CB4
P 6225 2500
F 0 "#PWR045" H 6225 2250 50  0001 C CNN
F 1 "GND" H 6230 2327 50  0000 C CNN
F 2 "" H 6225 2500 50  0001 C CNN
F 3 "" H 6225 2500 50  0001 C CNN
	1    6225 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6225 2400 6225 2500
Wire Wire Line
	6225 2200 6225 2000
Connection ~ 6225 2000
Wire Wire Line
	6225 2000 6225 1900
Wire Wire Line
	6225 1700 6225 1450
Text Notes 9375 925  0    79   ~ 0
Buttons
Text Notes 2000 950  0    79   ~ 0
GPIO Expander
Text Notes 6250 975  0    79   ~ 0
USB detection
Text Notes 6050 3500 0    50   ~ 0
Input high voltage = 0.25*Vdd + 0.8\nLow voltage = 0.15Vdd\n\nSo, 0.25*3.3 + 0.8 = 1.625V.\nFor logic 1:\n3.3V > In voltage > 1.625V 
Wire Wire Line
	6225 2000 6850 2000
Text Notes 8900 3225 0    50   ~ 0
If a pin configured as input and pullup pin is set,\nit is pulled up with a 100k resistor
$Comp
L Device:LED D4
U 1 1 60BD0C4A
P 4100 3125
F 0 "D4" V 4139 3007 50  0000 R CNN
F 1 "LED" V 4048 3007 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 4100 3125 50  0001 C CNN
F 3 "~" H 4100 3125 50  0001 C CNN
	1    4100 3125
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R25
U 1 1 60BD35C8
P 4100 2875
F 0 "R25" H 4159 2921 50  0000 L CNN
F 1 "220" H 4159 2830 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4100 2875 50  0001 C CNN
F 3 "~" H 4100 2875 50  0001 C CNN
	1    4100 2875
	1    0    0    -1  
$EndComp
Text Label 3300 2775 0    50   ~ 0
LED_RECORDING
Wire Wire Line
	3200 2775 4100 2775
$Comp
L power:GND #PWR048
U 1 1 60BD8CE9
P 4100 3350
F 0 "#PWR048" H 4100 3100 50  0001 C CNN
F 1 "GND" H 4105 3177 50  0000 C CNN
F 2 "" H 4100 3350 50  0001 C CNN
F 3 "" H 4100 3350 50  0001 C CNN
	1    4100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3275 4100 3350
Text Notes 3700 3725 0    50   ~ 0
Want roughly 10mA through
NoConn ~ 3200 2475
NoConn ~ 3200 2575
Wire Wire Line
	3200 2875 3625 2875
NoConn ~ 3200 2675
$Comp
L power:+3.3V #PWR0103
U 1 1 60D81EFD
P 2500 1275
F 0 "#PWR0103" H 2500 1125 50  0001 C CNN
F 1 "+3.3V" H 2515 1448 50  0000 C CNN
F 2 "" H 2500 1275 50  0001 C CNN
F 3 "" H 2500 1275 50  0001 C CNN
	1    2500 1275
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 60B50DAA
P 9550 1850
F 0 "SW4" H 9550 2135 50  0000 C CNN
F 1 "DOWN" H 9550 2044 50  0000 C CNN
F 2 "Digikey:Switch_Tactile_SMD_6x6mm_PTS645" H 9550 2050 50  0001 C CNN
F 3 "~" H 9550 2050 50  0001 C CNN
	1    9550 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
