.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM3 VDD Vin Vout Vout n_18 w=3u l=1u m=1
VVDD VDD 0 1.8
VVin Vin 0 1.5
RRS Vout 0 45k

.op
.tf V(Vout) VVin
.end