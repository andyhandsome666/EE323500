.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM6 Vin1 Vin1 Vx 0 n_18 w=80u l=2u m=1
MM5 Vx Vin1 0 0 n_18 w=3u l=0.7u m=1
MM4 Vin2 Vin1 Vy 0 n_18 w=80u l=2u m=1
MM3 Vy Vin2 0 0 n_18 w=80u l=2u m=1
MM2 Vout Vin1 Vz 0 n_18 w=80u l=2u m=6
MM1 Vz Vin2 0 0 n_18 w=80u l=2u m=6

VVDD VDD 0 1.8
Iin1 VDD Vin1 20u
Iin2 VDD Vin2 20u
VVout Vout 0 0.3

.op
.end