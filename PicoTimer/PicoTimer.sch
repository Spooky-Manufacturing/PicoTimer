EESchema Schematic File Version 4
LIBS:PicoTimer-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PicoTimer"
Date "2020-02-24"
Rev "1"
Comp "Spooky Manufacturing"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Laserdiode_1A3C LD?
U 1 1 5E52719B
P 4500 4200
F 0 "LD?" V 4404 4348 50  0000 L CNN
F 1 "Laserdiode" V 4495 4348 50  0000 L CNN
F 2 "" H 4400 4175 50  0001 C CNN
F 3 "~" H 4530 4000 50  0001 C CNN
	1    4500 4200
	0    1    -1   0   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q?
U 1 1 5E5274B1
P 4400 4700
F 0 "Q?" H 4591 4746 50  0000 L CNN
F 1 "Transistor" H 4591 4655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 4600 4625 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 4400 4700 50  0001 L CNN
	1    4400 4700
	1    0    0    1   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5E5276FD
P 4050 4700
F 0 "R?" V 3845 4700 50  0000 C CNN
F 1 "1k" V 3936 4700 50  0000 C CNN
F 2 "" V 4090 4690 50  0001 C CNN
F 3 "~" H 4050 4700 50  0001 C CNN
	1    4050 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 3200 3200 3050
Wire Wire Line
	3200 3050 4500 3050
Wire Wire Line
	4500 3050 4500 4000
$Comp
L Device:R_US R?
U 1 1 5E52787A
P 4200 5250
F 0 "R?" V 3995 5250 50  0000 C CNN
F 1 "1k" V 4086 5250 50  0000 C CNN
F 2 "" V 4240 5240 50  0001 C CNN
F 3 "~" H 4200 5250 50  0001 C CNN
	1    4200 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 4900 4500 5250
Wire Wire Line
	4500 5250 4350 5250
Wire Wire Line
	4050 5250 3400 5250
Wire Wire Line
	3400 5250 3400 5200
$Comp
L Quantum:Macro-Beam-Splitter BS?
U 1 1 5E52798C
P 5550 4200
F 0 "BS?" V 5504 4428 50  0000 L CNN
F 1 "Beam Splitter" V 5595 4428 50  0000 L CNN
F 2 "" H 5550 4200 50  0001 C CNN
F 3 "" H 5550 4200 50  0001 C CNN
	1    5550 4200
	0    1    1    0   
$EndComp
Wire Notes Line
	4550 4200 9250 4200
Wire Notes Line
	5550 4200 5550 2200
Text Notes 5600 3650 0    50   ~ 0
Optical Path 1\n(P1)
Text Notes 6750 4100 0    50   ~ 0
Optical Path 2\n(P2)
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5E5272A1
P 3400 4200
F 0 "A?" H 3400 3114 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 3400 3023 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3550 3250 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 3400 3200 50  0001 C CNN
	1    3400 4200
	-1   0    0    -1  
$EndComp
Text Notes 5750 3100 0    50   ~ 0
Note:\nThe differential delay is calculated based\non the time it takes for the photons to arrive at a detectors.
Text Notes 3050 2450 0    50   ~ 0
The Arduino Uno is capable of pulsing at 16MHz,\nyou may need to pulse the laser diode faster/slower\ndepending on what you're trying to do, remember:
Text Notes 3200 2850 0    50   Italic 10
iD=|P1/c - P2/c| only tells you how\nlong you need to make the optical \ncircuit to achieve a desired delay\nbetween two components.
$Comp
L Sensor_Optical:BPX61 D?
U 1 1 5E53F4F8
P 5600 2200
F 0 "D?" H 5550 2495 50  0000 C CNN
F 1 "BPX61" H 5550 2404 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-5-2_Window" H 5600 2375 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic3/00101650_0.pdf" H 5550 2200 50  0001 C CNN
	1    5600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E53F829
P 5400 2200
F 0 "#PWR?" H 5400 2050 50  0001 C CNN
F 1 "VCC" H 5418 2373 50  0000 C CNN
F 2 "" H 5400 2200 50  0001 C CNN
F 3 "" H 5400 2200 50  0001 C CNN
	1    5400 2200
	-1   0    0    1   
$EndComp
Wire Notes Line
	5700 2200 6200 2200
Wire Notes Line
	6200 2200 6200 1900
Wire Notes Line
	6200 1900 5700 1900
Wire Notes Line
	5700 1900 5700 2200
Text Notes 5800 2100 0    50   ~ 0
Circuit 1
$Comp
L Sensor_Optical:BPX61 D?
U 1 1 5E53FB00
P 9350 4150
F 0 "D?" V 9250 4350 50  0000 C CNN
F 1 "BPX61" V 9150 4350 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-5-2_Window" H 9350 4325 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic3/00101650_0.pdf" H 9300 4150 50  0001 C CNN
	1    9350 4150
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E53FB07
P 9350 4350
F 0 "#PWR?" H 9350 4200 50  0001 C CNN
F 1 "VCC" H 9368 4523 50  0000 C CNN
F 2 "" H 9350 4350 50  0001 C CNN
F 3 "" H 9350 4350 50  0001 C CNN
	1    9350 4350
	0    1    1    0   
$EndComp
Wire Notes Line
	9350 4050 9350 3550
Wire Notes Line
	9350 3550 9050 3550
Wire Notes Line
	9050 3550 9050 4050
Wire Notes Line
	9050 4050 9350 4050
Text Notes 9250 3950 1    50   ~ 0
Circuit 2
$EndSCHEMATC
