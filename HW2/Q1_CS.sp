.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM1 Vout Vin VSS VSS n_18 w=6u l=2u m=1
VVDD VDD 0 1.8
VVSS VSS 0 0
RRD VDD Vout 8k
VVin Vin 0 0.9

.op
.tf V(Vout) VVin
.end