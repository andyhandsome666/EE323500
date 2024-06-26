*differential amplifer
.prot
.lib "~/cic018.l" TT
.temp 25
.unprot
.option post acout=0 accurate
.option captab
.option measfile = 1
.option measform = 3
.option DELMAX = 1E-9

.param VB = 1.1
.param VBN1 = 0.76
.param VBN2 = 1.254
.param VBP1 = 0.885
.param vref = 1.8
.param Vin_CM = 0.9


****************************************************************************************************************
*************************************  Circuit && Voltage source  ********************************************
****************************************************************************************************************

*Your circuit in here
M0 w01 vb vdd vdd p_18  w=4.4u   l=1u m=1
M1 w79 vin w01 vdd p_18  w=22u  l=0.92u m=1
M2 w810 vip w01 vdd p_18  w=22u  l=0.92u m=1

M3 w35 w68 vdd vdd p_18  w=0.6u   l=0.5u m=1
M4 w46 w68 vdd vdd p_18  w=0.6u   l=0.5u m=1
M5 Vout vbp1 w35 vdd p_18  w=1.69u   l=0.8u m=1
M6 w68 vbp1 w46 vdd p_18  w=1.69u   l=0.8u m=1
M7 Vout vbn2 w79 vss n_18 w=0.9u   l=1u m=1
M8 w68 vbn2 w810 vss n_18 w=0.9u   l=1u m=1
M9 w79 vbn1 vss vss n_18 w=2.38856u   l=14.78u  m=1
M10 w810 vbn1 vss vss n_18 w=2.38856u   l=14.78u  m=1



*source
VDD vdd gnd vref
VSS vss gnd 0
VB VB gnd VB
VBN1 VBN1 gnd VBN1
VBN2 VBN2 gnd VBN2
VBP1 VBP1 gnd VBP1
CC0 Vout VSS 600f

******************************************************************************************************************
*******************************************  Differential mode  **************************************************
******************************************************************************************************************

*Differential mode input
Vip Vip 0 dc Vin_CM ac 0.5 0
Vin Vin 0 dc Vin_CM ac 0.5 180

*Differential mode test
.op
.tf V(Vout) Vip
.pz V(Vout) Vip
.ac dec 10 1 100G
.print ac V(Vout)
.probe Vdb(Vout) Vp(Vout)

.meas ac dcgain_in_db max Vdb(Vout)
.meas ac dcgain max vm(Vout)
.meas ac unity_frequency when Vdb(Vout) = 0
.meas ac phase find Vp(Vout) at = unity_frequency
.meas ac phase_margin param = '180 + phase'


******************************************************************************************************************
**************************************************  THD  *********************************************************
******************************************************************************************************************

*THD input
*Vip Vip gnd sin(Vin_CM 4m 1x 0 0)
*Vin Vin gnd sin(Vin_CM -4m 1x 0 0)

*THD test
*.op
*.tran 0.1u 10u
*.four 1x v(Vout)

.end

