.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ acout=0 runlvl=6
+ post
+ captable

MM2 Vout Vb Vin1 VSS n_18 w=8u l=0.8u m=1

VVDD VDD 0 1.8
VVSS VSS 0 0
VVin1 Vin1 0 0.5
RD VDD Vout 100k
VVb Vb 0 1.0475 

.op
.tf V(Vout) VVin1
.end