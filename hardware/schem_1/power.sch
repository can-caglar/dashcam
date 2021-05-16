EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L Regulator_Linear:XC6206PxxxMR U?
U 1 1 6169C441
P 7550 3500
AR Path="/6169C441" Ref="U?"  Part="1" 
AR Path="/616783E5/6169C441" Ref="U?"  Part="1" 
F 0 "U?" H 7550 3742 50  0000 C CNN
F 1 "XC6206-1.2V" H 7550 3651 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7550 3725 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 7550 3500 50  0001 C CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:XC6206PxxxMR U?
U 1 1 6169C447
P 7550 2650
AR Path="/6169C447" Ref="U?"  Part="1" 
AR Path="/616783E5/6169C447" Ref="U?"  Part="1" 
F 0 "U?" H 7550 2892 50  0000 C CNN
F 1 "XC6206-2.8V" H 7550 2801 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7550 2875 50  0001 C CIN
F 3 "https://www.torexsemi.com/file/xc6206/XC6206.pdf" H 7550 2650 50  0001 C CNN
	1    7550 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6169C44D
P 6000 2800
AR Path="/6169C44D" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C44D" Ref="C?"  Part="1" 
F 0 "C?" H 6092 2846 50  0000 L CNN
F 1 "10uF" H 6092 2755 50  0000 L CNN
F 2 "" H 6000 2800 50  0001 C CNN
F 3 "~" H 6000 2800 50  0001 C CNN
	1    6000 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6169C453
P 6000 2950
AR Path="/6169C453" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C453" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6000 2700 50  0001 C CNN
F 1 "GND" H 6005 2777 50  0000 C CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "" H 6000 2950 50  0001 C CNN
	1    6000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2900 6000 2950
Wire Wire Line
	6000 2700 6000 2650
$Comp
L Device:Q_PMOS_DGS Q?
U 1 1 6169C45B
P 6850 2750
AR Path="/6169C45B" Ref="Q?"  Part="1" 
AR Path="/616783E5/6169C45B" Ref="Q?"  Part="1" 
F 0 "Q?" V 7192 2750 50  0000 C CNN
F 1 "Q_PMOS_DGS" V 7101 2750 50  0000 C CNN
F 2 "" H 7050 2850 50  0001 C CNN
F 3 "~" H 6850 2750 50  0001 C CNN
	1    6850 2750
	0    1    -1   0   
$EndComp
Wire Wire Line
	6650 2650 6450 2650
$Comp
L Device:R R?
U 1 1 6169C462
P 6850 3400
AR Path="/6169C462" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C462" Ref="R?"  Part="1" 
F 0 "R?" H 6920 3446 50  0000 L CNN
F 1 "1k" H 6920 3355 50  0000 L CNN
F 2 "" V 6780 3400 50  0001 C CNN
F 3 "~" H 6850 3400 50  0001 C CNN
	1    6850 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2650 7150 2650
$Comp
L Device:C_Small C?
U 1 1 6169C469
P 7150 3900
AR Path="/6169C469" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C469" Ref="C?"  Part="1" 
F 0 "C?" H 7242 3946 50  0000 L CNN
F 1 "10uF" H 7242 3855 50  0000 L CNN
F 2 "" H 7150 3900 50  0001 C CNN
F 3 "~" H 7150 3900 50  0001 C CNN
	1    7150 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6169C46F
P 7150 4100
AR Path="/6169C46F" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C46F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7150 3850 50  0001 C CNN
F 1 "GND" H 7155 3927 50  0000 C CNN
F 2 "" H 7150 4100 50  0001 C CNN
F 3 "" H 7150 4100 50  0001 C CNN
	1    7150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4100 7150 4000
$Comp
L Device:C_Small C?
U 1 1 6169C476
P 8050 2850
AR Path="/6169C476" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C476" Ref="C?"  Part="1" 
F 0 "C?" H 8142 2896 50  0000 L CNN
F 1 "10uF" H 8142 2805 50  0000 L CNN
F 2 "" H 8050 2850 50  0001 C CNN
F 3 "~" H 8050 2850 50  0001 C CNN
	1    8050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2950 6850 3100
$Comp
L Device:R R?
U 1 1 6169C47D
P 6450 2950
AR Path="/6169C47D" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C47D" Ref="R?"  Part="1" 
F 0 "R?" H 6520 2996 50  0000 L CNN
F 1 "10k" H 6520 2905 50  0000 L CNN
F 2 "" V 6380 2950 50  0001 C CNN
F 3 "~" H 6450 2950 50  0001 C CNN
	1    6450 2950
	1    0    0    -1  
$EndComp
Connection ~ 6450 2650
Wire Wire Line
	6450 2650 6000 2650
Wire Wire Line
	6450 2650 6450 2800
Wire Wire Line
	6450 3100 6850 3100
Connection ~ 6850 3100
Wire Wire Line
	6850 3250 6850 3100
Wire Wire Line
	6850 3700 6850 3550
Wire Wire Line
	7050 2650 7150 2650
Connection ~ 7150 2650
$Comp
L Device:C_Small C?
U 1 1 6169C48C
P 8450 2850
AR Path="/6169C48C" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C48C" Ref="C?"  Part="1" 
F 0 "C?" H 8542 2896 50  0000 L CNN
F 1 "0.1uF" H 8542 2805 50  0000 L CNN
F 2 "" H 8450 2850 50  0001 C CNN
F 3 "~" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2650 8050 2650
Connection ~ 8050 2650
$Comp
L power:GND #PWR?
U 1 1 6169C49A
P 8450 3050
AR Path="/6169C49A" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C49A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 2800 50  0001 C CNN
F 1 "GND" H 8455 2877 50  0000 C CNN
F 2 "" H 8450 3050 50  0001 C CNN
F 3 "" H 8450 3050 50  0001 C CNN
	1    8450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2950 7550 3050
Wire Wire Line
	7550 3050 8050 3050
Wire Wire Line
	8050 2650 8450 2650
Wire Wire Line
	8050 2650 8050 2750
Wire Wire Line
	8050 2950 8050 3050
Connection ~ 8050 3050
Wire Wire Line
	8050 3050 8450 3050
Wire Wire Line
	8450 3050 8450 2950
Wire Wire Line
	8450 2750 8450 2650
Connection ~ 8450 3050
Connection ~ 8450 2650
Wire Wire Line
	8450 2650 8900 2650
Wire Wire Line
	7250 3500 7150 3500
$Comp
L Device:C_Small C?
U 1 1 6169C4AD
P 8050 3700
AR Path="/6169C4AD" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4AD" Ref="C?"  Part="1" 
F 0 "C?" H 8142 3746 50  0000 L CNN
F 1 "10uF" H 8142 3655 50  0000 L CNN
F 2 "" H 8050 3700 50  0001 C CNN
F 3 "~" H 8050 3700 50  0001 C CNN
	1    8050 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6169C4B3
P 8450 3700
AR Path="/6169C4B3" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4B3" Ref="C?"  Part="1" 
F 0 "C?" H 8542 3746 50  0000 L CNN
F 1 "0.1uF" H 8542 3655 50  0000 L CNN
F 2 "" H 8450 3700 50  0001 C CNN
F 3 "~" H 8450 3700 50  0001 C CNN
	1    8450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3500 8050 3500
Connection ~ 8050 3500
$Comp
L power:GND #PWR?
U 1 1 6169C4BB
P 8450 3900
AR Path="/6169C4BB" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4BB" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8450 3650 50  0001 C CNN
F 1 "GND" H 8455 3727 50  0000 C CNN
F 2 "" H 8450 3900 50  0001 C CNN
F 3 "" H 8450 3900 50  0001 C CNN
	1    8450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3900 8050 3900
Wire Wire Line
	8050 3500 8450 3500
Wire Wire Line
	8050 3500 8050 3600
Wire Wire Line
	8050 3800 8050 3900
Connection ~ 8050 3900
Wire Wire Line
	8050 3900 8450 3900
Wire Wire Line
	8450 3900 8450 3800
Wire Wire Line
	8450 3600 8450 3500
Connection ~ 8450 3900
Connection ~ 8450 3500
Wire Wire Line
	8450 3500 8900 3500
Wire Wire Line
	7550 3800 7550 3900
Connection ~ 7150 3500
Wire Wire Line
	7150 3500 7150 2650
Wire Wire Line
	7150 3500 7150 3800
Text Notes 5975 775  0    79   ~ 0
Power
Text Notes 2625 4350 0    50   ~ 0
5V in from USB, drop to 3V3 for ESP32. Then to 2.8V and 1.2V for camera. \nWhen USB is disconnected, supercapacitor provides power for device to safely shut down.
$Comp
L Connector:USB_B_Mini J?
U 1 1 6169C4D8
P 2775 2850
AR Path="/6169C4D8" Ref="J?"  Part="1" 
AR Path="/616783E5/6169C4D8" Ref="J?"  Part="1" 
F 0 "J?" H 2832 3317 50  0000 C CNN
F 1 "USB_B_Mini" H 2832 3226 50  0000 C CNN
F 2 "" H 2925 2800 50  0001 C CNN
F 3 "~" H 2925 2800 50  0001 C CNN
	1    2775 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3075 2850 3125 2850
Wire Wire Line
	3125 2850 3125 2950
Wire Wire Line
	3125 2950 3075 2950
Wire Wire Line
	2675 3300 2675 3250
Wire Wire Line
	2775 3250 2775 3300
Connection ~ 2775 3300
Wire Wire Line
	2775 3300 2675 3300
$Comp
L power:GND #PWR?
U 1 1 6169C4E5
P 2775 3350
AR Path="/6169C4E5" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4E5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2775 3100 50  0001 C CNN
F 1 "GND" H 2780 3177 50  0000 C CNN
F 2 "" H 2775 3350 50  0001 C CNN
F 3 "" H 2775 3350 50  0001 C CNN
	1    2775 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2775 3350 2775 3300
NoConn ~ 3075 3050
Wire Wire Line
	6250 3700 6850 3700
Wire Wire Line
	3425 2725 3425 2650
Wire Wire Line
	3075 2650 3175 2650
Wire Wire Line
	4025 2750 4025 2650
Wire Wire Line
	4025 3400 4025 3050
$Comp
L power:GND #PWR?
U 1 1 6169C4F6
P 3425 3775
AR Path="/6169C4F6" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4F6" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3425 3525 50  0001 C CNN
F 1 "GND" H 3430 3602 50  0000 C CNN
F 2 "" H 3425 3775 50  0001 C CNN
F 3 "" H 3425 3775 50  0001 C CNN
	1    3425 3775
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 6169C4FC
P 3425 3625
AR Path="/6169C4FC" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C4FC" Ref="C?"  Part="1" 
F 0 "C?" H 3543 3671 50  0000 L CNN
F 1 "1F" H 3543 3580 50  0000 L CNN
F 2 "" H 3463 3475 50  0001 C CNN
F 3 "~" H 3425 3625 50  0001 C CNN
	1    3425 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 6169C502
P 4025 2900
AR Path="/6169C502" Ref="D?"  Part="1" 
AR Path="/616783E5/6169C502" Ref="D?"  Part="1" 
F 0 "D?" V 4050 3000 50  0000 C CNN
F 1 "D_Schottky" V 4150 2925 50  0000 C CNN
F 2 "" H 4025 2900 50  0001 C CNN
F 3 "~" H 4025 2900 50  0001 C CNN
	1    4025 2900
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky D?
U 1 1 6169C508
P 3425 2875
AR Path="/6169C508" Ref="D?"  Part="1" 
AR Path="/616783E5/6169C508" Ref="D?"  Part="1" 
F 0 "D?" V 3450 2975 50  0000 C CNN
F 1 "D_Schottky" V 3550 2900 50  0000 C CNN
F 2 "" H 3425 2875 50  0001 C CNN
F 3 "~" H 3425 2875 50  0001 C CNN
	1    3425 2875
	0    -1   -1   0   
$EndComp
Connection ~ 3425 2650
Wire Wire Line
	3425 3400 4025 3400
Wire Wire Line
	3425 3400 3425 3475
$Comp
L Device:R_Small R?
U 1 1 6169C511
P 3425 3200
AR Path="/6169C511" Ref="R?"  Part="1" 
AR Path="/616783E5/6169C511" Ref="R?"  Part="1" 
F 0 "R?" H 3484 3246 50  0000 L CNN
F 1 "24R 3W" H 3275 3175 50  0000 L CNN
F 2 "" H 3425 3200 50  0001 C CNN
F 3 "~" H 3425 3200 50  0001 C CNN
	1    3425 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3425 3025 3425 3100
Wire Wire Line
	3425 3300 3425 3400
Connection ~ 3425 3400
Wire Wire Line
	3425 2650 4025 2650
Connection ~ 4025 2650
$Comp
L schem_1-cache:XC6222D331MR-G U?
U 1 1 6169C51C
P 5050 2525
AR Path="/6169C51C" Ref="U?"  Part="1" 
AR Path="/616783E5/6169C51C" Ref="U?"  Part="1" 
F 0 "U?" H 5212 2625 50  0000 C CNN
F 1 "XC6222D331MR-G" H 5212 2534 50  0000 C CNN
F 2 "" H 5050 2525 50  0001 C CNN
F 3 "" H 5050 2525 50  0001 C CNN
	1    5050 2525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6169C522
P 4450 2850
AR Path="/6169C522" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C522" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4450 2600 50  0001 C CNN
F 1 "GND" H 4455 2677 50  0000 C CNN
F 2 "" H 4450 2850 50  0001 C CNN
F 3 "" H 4450 2850 50  0001 C CNN
	1    4450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2650 4825 2650
Connection ~ 4450 2650
Wire Wire Line
	4025 2650 4450 2650
$Comp
L Device:C_Small C?
U 1 1 6169C52B
P 4450 2750
AR Path="/6169C52B" Ref="C?"  Part="1" 
AR Path="/616783E5/6169C52B" Ref="C?"  Part="1" 
F 0 "C?" H 4542 2796 50  0000 L CNN
F 1 "1uF ceramic" H 4275 2400 50  0000 L CNN
F 2 "" H 4450 2750 50  0001 C CNN
F 3 "~" H 4450 2750 50  0001 C CNN
	1    4450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2900 4825 2900
Wire Wire Line
	4825 2900 4825 2650
Connection ~ 4825 2650
Wire Wire Line
	4825 2650 4900 2650
Wire Wire Line
	5525 2900 5600 2900
Wire Wire Line
	5600 2900 5600 2975
$Comp
L power:GND #PWR?
U 1 1 6169C537
P 5600 2975
AR Path="/6169C537" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C537" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 2725 50  0001 C CNN
F 1 "GND" H 5605 2802 50  0000 C CNN
F 2 "" H 5600 2975 50  0001 C CNN
F 3 "" H 5600 2975 50  0001 C CNN
	1    5600 2975
	1    0    0    -1  
$EndComp
Connection ~ 6000 2650
Text Notes 825  1925 0    50   ~ 0
Supercapacitor charged from USB input. \nAssume 5V input, Vr = 4.8V due to drop across Schottky diode.\nCurrent through 24R resistor at 4.8V = 200mA (300mA spare for rest of circuit).\nCapacitance = 0.47F\nt = CV/I\n\nTime to keep circuit alive:\nLDO = 0.3V dropout worst case at 500mA, so regulates until 3.3+0.3 =  3.6V\nCurrent required by circuit is roughly 250mA, assume 300mA in this calculation for 'worst case'.\nVoltage provided to LDO = 4.6V max (due to second Schottky)\ndV = 4.6-3.6 = 1V\nt = (1 * 0.47) / 0.3\nt = 1.57 seconds to safely shut down circuit.
Wire Wire Line
	3175 2525 3175 2650
Connection ~ 3175 2650
Wire Wire Line
	3175 2650 3425 2650
$Comp
L power:+1V2 #PWR?
U 1 1 6169C4CC
P 8900 3500
AR Path="/6169C4CC" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C4CC" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 3350 50  0001 C CNN
F 1 "+1V2" H 8915 3673 50  0000 C CNN
F 2 "" H 8900 3500 50  0001 C CNN
F 3 "" H 8900 3500 50  0001 C CNN
	1    8900 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+2V8 #PWR?
U 1 1 6169C494
P 8900 2650
AR Path="/6169C494" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C494" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 8900 2500 50  0001 C CNN
F 1 "+2V8" H 8915 2823 50  0000 C CNN
F 2 "" H 8900 2650 50  0001 C CNN
F 3 "" H 8900 2650 50  0001 C CNN
	1    8900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2650 6000 2650
Wire Wire Line
	5525 2650 5700 2650
Connection ~ 5700 2650
$Comp
L power:+3V3 #PWR?
U 1 1 6169C53F
P 5700 2650
AR Path="/6169C53F" Ref="#PWR?"  Part="1" 
AR Path="/616783E5/6169C53F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 2500 50  0001 C CNN
F 1 "+3V3" H 5715 2823 50  0000 C CNN
F 2 "" H 5700 2650 50  0001 C CNN
F 3 "" H 5700 2650 50  0001 C CNN
	1    5700 2650
	1    0    0    -1  
$EndComp
Text GLabel 3175 2525 1    50   Input ~ 0
Vusb
Text GLabel 6250 3700 0    50   Input ~ 0
CAM_PWR
$EndSCHEMATC
