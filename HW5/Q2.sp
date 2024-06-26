.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ acout=0 runlvl=6
+ post
+ captable

MM3 Vout2 Vx 0 0 n_18 w=35.5u l=0.2u m=2
MM4 Vout2 Vx VDD VDD p_18 w=60u l=0.3u m=8

C3 Vx 0 1p
RS2 Vx 0 50k
C4 Vout2 0 1p
VVDD VDD 0 1.5

Iin2 0 Vx 15u ac 1

.op
.tf V(Vout2) Iin2
.ac DEC 10 1 100G
.probe vdb(Vout2) vp(Vout2)
.meas ac dcgain_in_db find Vdb(Vout2) at=10k
.meas ac BW when Vdb(Vout2)='dcgain_in_db-3'
.pz V(Vout2) Iin2