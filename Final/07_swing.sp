Analog IC Term Project: closed-loop DC sweep 

.protect
.lib '~/cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.spi" * Include your OP netlist
.option measform=3
                                                                                
.param rload=100k cload=2p * Your load
                                                                                
Xop Vinp Vinn vdd vss vop von vocm op * Modify your subcircuit name
rload1 von 0 rload
rload2 vop 0 rload
cload1 von 0 cload
cload2 vop 0 cload
rtest1 Vinn test2 25k
rtest2 Vinp test1 25k
rtest3 Vinn Vop 25k
rtest4 Vinp Von 25k

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon
                                
.op
                                                                                
vinp test1 0 dc 'supplyn+sweepv'
vinn test2 0 dc 'supplyp-sweepv'
                                                                                
.dc sweepv 0 'supplyp-supplyn' 0.01
                                                                                
.probe dc v(vop,von) v(test1,test2)

.end
