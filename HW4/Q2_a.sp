.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM1 A X 0 0 n_18 w=80u l=2u m=1
MM2 X Vb A 0 n_18 w=80u l=2u m=1
MM3 B X 0 0 n_18 w=80u l=2u m=6
MM4 Vout Vb B 0 n_18 w=80u l=2u m=6

Iref VDD X 20u
VVDD VDD 0 1.8
VVb Vb 0 0.6
VVout Vout 0 0.3

.op
.dc VVout 0 1.8 0.01
.meas dc deriv find deriv('I(MM3)') at 300mV
.meas dc Rout PARAM='1/deriv'
.end