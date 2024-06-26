.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM2 Vout Vb Vin Vin n_18 w=3u l=1u m=1
VVDD VDD 0 1.8
RRD VDD Vout 95k
VVin Vin 0 0.5
VVb Vb 0 1.027

.op
.tf V(Vout) VVin
.end