Analog IC Term Project: DC sweep

.protect
.lib '~/cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.spi" *Include your OP netlist
.option measform=3

.param rload=100k cload=2p *Your load

Xop  Vinp Vinn vdd vss vop von vocm op
rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

.param sweepv=0

*vinp vinp 0 dc 'supplyn+sweepv'
*vinn vinn 0 dc 'supplyp-sweepv'

*.dc sweepv 0.72 0.78 0.0000001

vinp vinp 0 dc sweepv
vinn vinn 0 dc sweepv
.dc sweepv 0 'supplyp-supplyn' 100u
.meas dc vomax max v(vop)
.meas dc vomin min v(von)
.meas dc vodmax max v(vop,von)
.meas dc vodmin min v(vop,von)
.end
