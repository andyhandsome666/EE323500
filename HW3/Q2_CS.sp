.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM1 Vout1 Vin VSS VSS n_18 w=8u l=4u m=1

VVDD VDD 0 1.8
VVSS VSS 0 0
ID VDD Vout1 3u
VVin Vin 0 0.41932

.op
.tf V(Vout1) VVin
.end