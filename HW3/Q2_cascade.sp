.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ acout=0 runlvl=6
+ post
+ captable

MM1 V1 Vin VSS VSS n_18 w=8u l=4u m=1 
MM2 Vout Vb V1 VSS n_18 w=8u l=0.8u m=1

VVDD VDD 0 1.8
VVSS VSS 0 0
ID1 VDD V1 3u
ID2 V1 0 10u
VVin Vin 0 0.41932
RD VDD Vout 100k
VVb Vb 0 1.0475 

.op
.tf V(Vout) VVin
.end