.protect
.lib "~/cic018.l" TT
.unprotect
.temp 25
.option
+ post
+ acout=0 runlvl=6
+ captable

MM4 Vx Vb3 VDD VDD p_18 w=4u l=0.5u m=1
MM3 Vout Vb2 Vx VDD p_18 w=4u l=0.5u m=1
MM2 Vout Vb1 Vy VSS n_18 w=2u l=0.5u m=1
MM1 Vy Vin VSS VSS n_18 w=2u l=0.5u m=1

VVb3 Vb3 VSS 1.19
VVb2 Vb2 VSS 1.05
VVb1 Vb1 VSS 0.65
VVin Vin VSS 0.5
VVDD VDD VSS 1.8
VVSS VSS 0 0

.op
.tf V(Vout) VVin
.dc VVin 0 1.8 10u
.probe gain=deriv('V(Vout)')
.meas DC output_swing_upper_bound FIND V(Vout) WHEN deriv('V(Vout)')='-10^(45/20)' cross=1
.meas DC output_swing_lower_bound FIND V(Vout) WHEN deriv('V(Vout)')='-10^(45/20)' cross=2
.meas DC output_swing param='output_swing_upper_bound-output_swing_lower_bound'
.end