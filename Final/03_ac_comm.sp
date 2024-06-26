Analog IC Term Project: Common mode AC responses

.protect
.lib '~/cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.spi" *Include your OP netlist
.option measform=3

.param rload=100k cload=2p *Your load
.option pz_num = 15

Xop Vinp Vinp vdd vss vop von vocm op 
rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

vinp vinp 0 dc comon ac 1 0
vinn vinn 0 dc comon ac 1 0

.ac dec 10 10 1g
.tf V(vop) vinp
.pz V(vop) vinp

.meas ac acm_in_db find vdb(vop) at=10k
.end
