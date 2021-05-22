EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5650 910  0    197  ~ 39
Power
$Comp
L power:GND #PWR?
U 1 1 6169C537
P 5600 3650
AR Path="/6169C537" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C537" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 5600 3400 50  0001 C CNN
F 1 "GND" H 5605 3477 50  0000 C CNN
F 2 "" H 5600 3650 50  0001 C CNN
F 3 "" H 5600 3650 50  0001 C CNN
	1    5600 3650
	1    0    0    -1  
$EndComp
Text Notes 825  1925 0    50   ~ 0
Supercapacitor charged from USB input. \nAssume 5V input, Vr = 4.8V due to drop across Schottky diode.\nCurrent through 24R resistor at 4.8V = 200mA (300mA spare for rest of circuit).\nCapacitance = 0.47F\nt = CV/I\n\nTime to keep circuit alive:\nLDO = 0.3V dropout worst case at 500mA, so regulates until 3.3+0.3 =  3.6V\nCurrent required by circuit is roughly 250mA, assume 300mA in this calculation for 'worst case'.\nVoltage provided to LDO = 4.6V max (due to second Schottky)\ndV = 4.6-3.6 = 1V\nt = (1 * 0.47) / 0.3\nt = 1.57 seconds to safely shut down circuit.
Connection ~ 4825 3175
$Comp
L Device:C_Small C?
U 1 1 6169C52B
P 4450 3450
AR Path="/6169C52B" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C52B" Ref="C12"  Part="1" 
F 0 "C12" H 4542 3496 50  0000 L CNN
F 1 "1uF" H 4275 3100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4450 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6169C522
P 4450 3550
AR Path="/6169C522" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C522" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 4450 3300 50  0001 C CNN
F 1 "GND" H 4455 3377 50  0000 C CNN
F 2 "" H 4450 3550 50  0001 C CNN
F 3 "" H 4450 3550 50  0001 C CNN
	1    4450 3550
	1    0    0    -1  
$EndComp
Connection ~ 4025 3175
Wire Wire Line
	3425 3175 4025 3175
Connection ~ 3425 3925
Wire Wire Line
	3425 3825 3425 3925
Wire Wire Line
	3425 3600 3425 3625
$Comp
L Device:R_Small R?
U 1 1 6169C511
P 3425 3725
AR Path="/6169C511" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C511" Ref="R18"  Part="1" 
F 0 "R18" H 3225 3700 50  0000 L CNN
F 1 "CRCW251224R0JNEG" H 3100 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_2512_6332Metric" H 3425 3725 50  0001 C CNN
F 3 "~" H 3425 3725 50  0001 C CNN
	1    3425 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 3925 3425 4000
Wire Wire Line
	3425 3925 4025 3925
Connection ~ 3425 3175
$Comp
L Device:D_Schottky D?
U 1 1 6169C508
P 3425 3450
AR Path="/6169C508" Ref="D?"  Part="1" 
AR Path="/616783E5/6169C508" Ref="D2"  Part="1" 
F 0 "D2" V 3450 3550 50  0000 C CNN
F 1 "PMEG2005EGWX" V 3550 3475 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 3425 3450 50  0001 C CNN
F 3 "~" H 3425 3450 50  0001 C CNN
	1    3425 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 6169C502
P 4025 3425
AR Path="/6169C502" Ref="D?"  Part="1" 
AR Path="/616783E5/6169C502" Ref="D1"  Part="1" 
F 0 "D1" V 4050 3525 50  0000 C CNN
F 1 "PMEG2005EGWX" V 4150 3450 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 4025 3425 50  0001 C CNN
F 3 "~" H 4025 3425 50  0001 C CNN
	1    4025 3425
	0    1    1    0   
$EndComp
$Comp
L Device:CP C?
U 1 1 6169C4FC
P 3425 4150
AR Path="/6169C4FC" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4FC" Ref="C13"  Part="1" 
F 0 "C13" H 3543 4196 50  0000 L CNN
F 1 "FGH0H105ZF" H 3543 4105 50  0000 L CNN
F 2 "kicad_lib:CP_Radial_FGH0H105ZF‎" H 3463 4000 50  0001 C CNN
F 3 "~" H 3425 4150 50  0001 C CNN
	1    3425 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6169C4F6
P 3425 4300
AR Path="/6169C4F6" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4F6" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 3425 4050 50  0001 C CNN
F 1 "GND" H 3430 4127 50  0000 C CNN
F 2 "" H 3425 4300 50  0001 C CNN
F 3 "" H 3425 4300 50  0001 C CNN
	1    3425 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4025 3925 4025 3575
Wire Wire Line
	4025 3275 4025 3175
Wire Wire Line
	3425 3300 3425 3175
Text Notes 2175 5150 0    50   ~ 0
5V in from USB, drop to 3V3 for ESP32. Then to 2.8V and 1.2V for camera. \nWhen USB is disconnected, supercapacitor provides power for device to safely shut down.
Wire Wire Line
	4025 3175 4450 3175
Wire Wire Line
	4450 3350 4450 3175
Connection ~ 4450 3175
Wire Wire Line
	4450 3175 4825 3175
Wire Wire Line
	5525 3175 5575 3175
Text HLabel 3300 3050 1    50   Output ~ 0
Vusb
Wire Wire Line
	3300 3050 3300 3175
Wire Wire Line
	3300 3175 3425 3175
Connection ~ 3300 3175
$Comp
L power:GND #PWR?
U 1 1 60AE69C1
P 3000 3450
AR Path="/60AE69C1" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/60AE69C1" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 3000 3200 50  0001 C CNN
F 1 "GND" H 3005 3277 50  0000 C CNN
F 2 "" H 3000 3450 50  0001 C CNN
F 3 "" H 3000 3450 50  0001 C CNN
	1    3000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3175 3000 3250
$Comp
L Device:C_Small C?
U 1 1 60AE495E
P 3000 3350
AR Path="/60AE495E" Ref="C?"  Part="1" 
AR Path="/616783E5/60AE495E" Ref="C9"  Part="1" 
F 0 "C9" H 2975 4125 50  0000 L CNN
F 1 "1uF ceramic" H 2725 3000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3000 3350 50  0001 C CNN
F 3 "~" H 3000 3350 50  0001 C CNN
	1    3000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2175 3375 2175 3475
$Comp
L Connector:USB_B_Mini J?
U 1 1 6169C4D8
P 1825 3375
AR Path="/6169C4D8" Ref="J?"  Part="1" 
AR Path="/616783E5/6169C4D8" Ref="J3"  Part="1" 
F 0 "J3" H 1882 3842 50  0000 C CNN
F 1 "USB_B_Mini" H 1882 3751 50  0000 C CNN
F 2 "Digikey:USB_Mini_B_Female_UJ2-MBH-1-SMT-TR" H 1975 3325 50  0001 C CNN
F 3 "~" H 1975 3325 50  0001 C CNN
	1    1825 3375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2125 3375 2175 3375
Wire Wire Line
	2175 3475 2125 3475
Wire Wire Line
	1725 3825 1725 3775
Wire Wire Line
	1825 3775 1825 3825
Connection ~ 1825 3825
Wire Wire Line
	1825 3825 1725 3825
$Comp
L power:GND #PWR?
U 1 1 6169C4E5
P 1825 3875
AR Path="/6169C4E5" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4E5" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 1825 3625 50  0001 C CNN
F 1 "GND" H 1830 3702 50  0000 C CNN
F 2 "" H 1825 3875 50  0001 C CNN
F 3 "" H 1825 3875 50  0001 C CNN
	1    1825 3875
	1    0    0    -1  
$EndComp
Wire Wire Line
	1825 3875 1825 3825
NoConn ~ 2125 3575
Wire Wire Line
	2125 3175 2240 3175
Connection ~ 3000 3175
Wire Wire Line
	3000 3175 3300 3175
$Comp
L jclib:Latch_Switch U3
U 1 1 60D1B6DE
P 2470 2895
F 0 "U3" H 2390 2870 50  0000 C CNN
F 1 "Latch_Switch" H 2390 2779 50  0000 C CNN
F 2 "" H 2470 2895 79  0001 C CNN
F 3 "" H 2470 2895 79  0001 C CNN
	1    2470 2895
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60DA8C21
P 2700 3300
AR Path="/60DA8C21" Ref="C?"  Part="1" 
AR Path="/616783E5/60DA8C21" Ref="C23"  Part="1" 
F 0 "C23" H 2792 3346 50  0000 L CNN
F 1 "10uF" H 2792 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2700 3300 50  0001 C CNN
F 3 "~" H 2700 3300 50  0001 C CNN
	1    2700 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60DA8F25
P 2700 3450
AR Path="/60DA8F25" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/60DA8F25" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 2700 3200 50  0001 C CNN
F 1 "GND" H 2705 3277 50  0000 C CNN
F 2 "" H 2700 3450 50  0001 C CNN
F 3 "" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3400 2700 3450
Wire Wire Line
	2550 3175 2700 3175
Wire Wire Line
	2700 3200 2700 3175
Connection ~ 2700 3175
Wire Wire Line
	2700 3175 3000 3175
$Comp
L xc6210b332mr-digikeyjc:XC6210B332MR-DigikeyJc U9
U 1 1 60E43CD4
P 5275 2925
F 0 "U9" H 5250 2940 50  0000 C CNN
F 1 "XC6210B332MR-DigikeyJc" H 5250 2849 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 5275 2925 50  0001 C CNN
F 3 "" H 5275 2925 50  0001 C CNN
	1    5275 2925
	1    0    0    -1  
$EndComp
NoConn ~ 4925 3325
Wire Wire Line
	4925 3475 4825 3475
Wire Wire Line
	4825 3175 4825 3475
Wire Wire Line
	4825 3175 4925 3175
NoConn ~ 5575 3175
Wire Wire Line
	5575 3475 5600 3475
Wire Wire Line
	5600 3475 5600 3650
Connection ~ 6025 3325
Wire Wire Line
	8000 4175 8000 4475
Connection ~ 8000 4175
Wire Wire Line
	8100 4175 8000 4175
Wire Wire Line
	8000 3325 8000 4175
Connection ~ 8000 3325
Wire Wire Line
	8100 3325 8000 3325
Text HLabel 7575 4375 0    50   Input ~ 0
CAM_PWR
Wire Wire Line
	6725 3325 7300 3325
Connection ~ 6725 3325
Wire Wire Line
	6725 3425 6725 3325
$Comp
L Device:R R?
U 1 1 60B19071
P 6725 3575
AR Path="/60B19071" Ref="R?"  Part="1" 
AR Path="/616783E5/60B19071" Ref="R16"  Part="1" 
F 0 "R16" H 6795 3621 50  0000 L CNN
F 1 "130" H 6795 3530 50  0000 L CNN
F 2 "" V 6655 3575 50  0001 C CNN
F 3 "~" H 6725 3575 50  0001 C CNN
	1    6725 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60AFCC5E
P 6725 4025
AR Path="/60AFCC5E" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/60AFCC5E" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 6725 3775 50  0001 C CNN
F 1 "GND" H 6730 3852 50  0000 C CNN
F 2 "" H 6725 4025 50  0001 C CNN
F 3 "" H 6725 4025 50  0001 C CNN
	1    6725 4025
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 60AFBDF9
P 6725 3875
F 0 "D3" V 6764 3757 50  0000 R CNN
F 1 "LED_GREEN" V 6673 3757 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 6725 3875 50  0001 C CNN
F 3 "~" H 6725 3875 50  0001 C CNN
	1    6725 3875
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 3325 6250 3200
Wire Wire Line
	6025 3325 6250 3325
Wire Wire Line
	6250 3325 6725 3325
Connection ~ 6250 3325
$Comp
L power:+3V3 #PWR?
U 1 1 6169C53F
P 6250 3200
AR Path="/6169C53F" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C53F" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 6250 3050 50  0001 C CNN
F 1 "+3V3" H 6265 3373 50  0000 C CNN
F 2 "" H 6250 3200 50  0001 C CNN
F 3 "" H 6250 3200 50  0001 C CNN
	1    6250 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+2V8 #PWR?
U 1 1 6169C494
P 9750 3325
AR Path="/6169C494" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C494" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 9750 3175 50  0001 C CNN
F 1 "+2V8" H 9765 3498 50  0000 C CNN
F 2 "" H 9750 3325 50  0001 C CNN
F 3 "" H 9750 3325 50  0001 C CNN
	1    9750 3325
	1    0    0    -1  
$EndComp
$Comp
L power:+1V2 #PWR?
U 1 1 6169C4CC
P 9750 4175
AR Path="/6169C4CC" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4CC" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 9750 4025 50  0001 C CNN
F 1 "+1V2" H 9765 4348 50  0000 C CNN
F 2 "" H 9750 4175 50  0001 C CNN
F 3 "" H 9750 4175 50  0001 C CNN
	1    9750 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	7575 4375 7700 4375
Wire Wire Line
	8400 4475 8400 4575
Wire Wire Line
	9300 4175 9750 4175
Connection ~ 9300 4175
Connection ~ 9300 4575
Wire Wire Line
	9300 4275 9300 4175
Wire Wire Line
	9300 4575 9300 4475
Wire Wire Line
	8900 4575 9300 4575
Connection ~ 8900 4575
Wire Wire Line
	8900 4475 8900 4575
Wire Wire Line
	8900 4175 8900 4275
Wire Wire Line
	8900 4175 9300 4175
Wire Wire Line
	8400 4575 8900 4575
$Comp
L power:GND #PWR?
U 1 1 6169C4BB
P 9300 4575
AR Path="/6169C4BB" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4BB" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 9300 4325 50  0001 C CNN
F 1 "GND" H 9305 4402 50  0000 C CNN
F 2 "" H 9300 4575 50  0001 C CNN
F 3 "" H 9300 4575 50  0001 C CNN
	1    9300 4575
	1    0    0    -1  
$EndComp
Connection ~ 8900 4175
Wire Wire Line
	8700 4175 8900 4175
$Comp
L Device:C_Small C?
U 1 1 6169C4B3
P 9300 4375
AR Path="/6169C4B3" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4B3" Ref="C15"  Part="1" 
F 0 "C15" H 9392 4421 50  0000 L CNN
F 1 "0.1uF" H 9392 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9300 4375 50  0001 C CNN
F 3 "~" H 9300 4375 50  0001 C CNN
	1    9300 4375
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6169C4AD
P 8900 4375
AR Path="/6169C4AD" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4AD" Ref="C14"  Part="1" 
F 0 "C14" H 8992 4421 50  0000 L CNN
F 1 "10uF" H 8992 4330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8900 4375 50  0001 C CNN
F 3 "~" H 8900 4375 50  0001 C CNN
	1    8900 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3325 9750 3325
Connection ~ 9300 3325
Connection ~ 9300 3725
Wire Wire Line
	9300 3425 9300 3325
Wire Wire Line
	9300 3725 9300 3625
Wire Wire Line
	8900 3725 9300 3725
Connection ~ 8900 3725
Wire Wire Line
	8900 3625 8900 3725
Wire Wire Line
	8900 3325 8900 3425
Wire Wire Line
	8900 3325 9300 3325
Wire Wire Line
	8400 3725 8900 3725
Wire Wire Line
	8400 3625 8400 3725
$Comp
L power:GND #PWR?
U 1 1 6169C49A
P 9300 3725
AR Path="/6169C49A" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C49A" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 9300 3475 50  0001 C CNN
F 1 "GND" H 9305 3552 50  0000 C CNN
F 2 "" H 9300 3725 50  0001 C CNN
F 3 "" H 9300 3725 50  0001 C CNN
	1    9300 3725
	1    0    0    -1  
$EndComp
Connection ~ 8900 3325
Wire Wire Line
	8700 3325 8900 3325
$Comp
L Device:C_Small C?
U 1 1 6169C48C
P 9300 3525
AR Path="/6169C48C" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C48C" Ref="C11"  Part="1" 
F 0 "C11" H 9392 3571 50  0000 L CNN
F 1 "0.1uF" H 9392 3480 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9300 3525 50  0001 C CNN
F 3 "~" H 9300 3525 50  0001 C CNN
	1    9300 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3325 8000 3325
Wire Wire Line
	7700 4375 7700 4225
Wire Wire Line
	7700 3925 7700 3775
Connection ~ 7700 3775
Wire Wire Line
	7300 3775 7700 3775
Wire Wire Line
	7300 3325 7300 3475
Connection ~ 7300 3325
$Comp
L Device:R R?
U 1 1 6169C47D
P 7300 3625
AR Path="/6169C47D" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C47D" Ref="R17"  Part="1" 
F 0 "R17" H 7370 3671 50  0000 L CNN
F 1 "10k" H 7370 3580 50  0000 L CNN
F 2 "" V 7230 3625 50  0001 C CNN
F 3 "~" H 7300 3625 50  0001 C CNN
	1    7300 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3625 7700 3775
$Comp
L Device:C_Small C?
U 1 1 6169C476
P 8900 3525
AR Path="/6169C476" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C476" Ref="C10"  Part="1" 
F 0 "C10" H 8992 3571 50  0000 L CNN
F 1 "10uF" H 8992 3480 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8900 3525 50  0001 C CNN
F 3 "~" H 8900 3525 50  0001 C CNN
	1    8900 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4775 8000 4675
$Comp
L power:GND #PWR?
U 1 1 6169C46F
P 8000 4775
AR Path="/6169C46F" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C46F" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 8000 4525 50  0001 C CNN
F 1 "GND" H 8005 4602 50  0000 C CNN
F 2 "" H 8000 4775 50  0001 C CNN
F 3 "" H 8000 4775 50  0001 C CNN
	1    8000 4775
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6169C469
P 8000 4575
AR Path="/6169C469" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C469" Ref="C16"  Part="1" 
F 0 "C16" H 8092 4621 50  0000 L CNN
F 1 "10uF" H 8092 4530 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8000 4575 50  0001 C CNN
F 3 "~" H 8000 4575 50  0001 C CNN
	1    8000 4575
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6169C462
P 7700 4075
AR Path="/6169C462" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C462" Ref="R19"  Part="1" 
F 0 "R19" H 7770 4121 50  0000 L CNN
F 1 "1k" H 7770 4030 50  0000 L CNN
F 2 "" V 7630 4075 50  0001 C CNN
F 3 "~" H 7700 4075 50  0001 C CNN
	1    7700 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3325 7300 3325
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 6169C45B
P 7700 3425
AR Path="/6169C45B" Ref="Q?"  Part="1" 
AR Path="/616783E5/6169C45B" Ref="Q1"  Part="1" 
F 0 "Q1" V 8042 3425 50  0000 C CNN
F 1 "NDS332P" V 7951 3425 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SuperSOT-3" H 7900 3525 50  0001 C CNN
F 3 "~" H 7700 3425 50  0001 C CNN
	1    7700 3425
	0    1    -1   0   
$EndComp
Wire Wire Line
	6025 3375 6025 3325
Wire Wire Line
	6025 3575 6025 3625
$Comp
L power:GND #PWR?
U 1 1 6169C453
P 6025 3625
AR Path="/6169C453" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C453" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 6025 3375 50  0001 C CNN
F 1 "GND" H 6030 3452 50  0000 C CNN
F 2 "" H 6025 3625 50  0001 C CNN
F 3 "" H 6025 3625 50  0001 C CNN
	1    6025 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6169C44D
P 6025 3475
AR Path="/6169C44D" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C44D" Ref="C8"  Part="1" 
F 0 "C8" H 6117 3521 50  0000 L CNN
F 1 "10uF DNF" H 6025 3400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6025 3475 50  0001 C CNN
F 3 "~" H 6025 3475 50  0001 C CNN
	1    6025 3475
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:XC6206PxxxMR U?
U 1 1 6169C447
P 8400 3325
AR Path="/6169C447" Ref="U?"  Part="1" 
AR Path="/616783E5/6169C447" Ref="U5"  Part="1" 
F 0 "U5" H 8400 3567 50  0000 C CNN
F 1 "XC6206-2.8V" H 8400 3476 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8400 3550 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 8400 3325 50  0001 C CNN
	1    8400 3325
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:XC6206PxxxMR U?
U 1 1 6169C441
P 8400 4175
AR Path="/6169C441" Ref="U?"  Part="1" 
AR Path="/616783E5/6169C441" Ref="U6"  Part="1" 
F 0 "U6" H 8400 4417 50  0000 C CNN
F 1 "XC6206-1.2V" H 8400 4326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8400 4400 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 8400 4175 50  0001 C CNN
	1    8400 4175
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60E7101D
P 5825 3475
AR Path="/60E7101D" Ref="C?"  Part="1" 
AR Path="/616783E5/60E7101D" Ref="C24"  Part="1" 
F 0 "C24" H 5675 3550 50  0000 L CNN
F 1 "1uF" H 5700 3400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5825 3475 50  0001 C CNN
F 3 "~" H 5825 3475 50  0001 C CNN
	1    5825 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60E714DD
P 5825 3650
AR Path="/60E714DD" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/60E714DD" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 5825 3400 50  0001 C CNN
F 1 "GND" H 5830 3477 50  0000 C CNN
F 2 "" H 5825 3650 50  0001 C CNN
F 3 "" H 5825 3650 50  0001 C CNN
	1    5825 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5825 3575 5825 3650
Wire Wire Line
	5575 3325 5825 3325
Wire Wire Line
	5825 3375 5825 3325
Connection ~ 5825 3325
Wire Wire Line
	5825 3325 6025 3325
$EndSCHEMATC
