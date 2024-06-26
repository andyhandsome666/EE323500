.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ acout=0 runlvl=6
+ post
+ captable

MM1 Vout1 Vx 0 0 n_18 w=35.5u l=0.2u m=2
MM2 Vout1 Vx VDD VDD p_18 w=60u l=0.3u m=8

C1 Vx 0 1p
RS1 Vx 0 50k
C2 Vout1 0 1p
RF Vx Vout1 1k
VVDD VDD 0 1.5

Iin1 0 Vx 15u ac 1

.op
.tf V(Vout1) Iin1
.ac DEC 10 1 100G
.probe vdb(Vout1) vp(Vout1)
.meas ac dcgain_in_db find Vdb(Vout1) at=10k
.meas ac BW when Vdb(Vout1)='dcgain_in_db-3'
.pz V(Vout1) Iin1