Analog IC Term Project: Differential mode AC responses

.protect
.lib '~/cic018.l' TT
.unprotect
.option post acout=0 accurate
.option captab
.option unwrap
.include "op.spi" *Include your OP netlist
.option measfile=1
.option measform=3
.option pz_num = 27

.param rload=100k cload=2p *Your load

Xop Vinp Vinn vdd vss vop von vocm op 
rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn

vocm vocm 0 dc comon

vinp vinp 0 dc comon ac 0.5 0
vinn vinn 0 dc comon ac 0.5 180

.op

.pz V(vop, von) vinp
.tf V(vop, von) vinp

.ac dec 10 10 1g
.probe ac vdb(vop,von) vp(vop,von)

.meas ac dcgain_in_db max vdb(vop,von)
.meas ac dcgain max vm(vop,von)
.meas ac unity_frequency when vdb(vop,von)=0
.meas ac phase find vp(vop,von) at=unity_frequency
.meas ac phase_margin param='180+phase'

.end
