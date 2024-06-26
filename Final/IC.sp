.protect
.lib '~/cic018.l' tt
.unprotect
.option post acout=0 runlvl=6
.option measform=3 

MB1 net31 net67 vss vss n_18 W=0.3u L=45u 
MB2 net67 net52 vss vss n_18 W=2u L=1u 
MB3 net67 net52 VDD VDD p_18 W=2u L=10u 
MB4 net26 net52 vss vss n_18 W=5u L=1u 
MB5 net31 net26 vss vss n_18 W=20u L=1u
MB6 net52 net31 VDD VDD p_18 W=5u L=1u 
MB7 net31 net31 VDD VDD p_18 W=5u L=1u 
MB8 net68 net52 vss vss n_18 W=1u L=1u 
MB9 net68 net68 VDD VDD p_18 W=11u L=1u 

vss 0 0
VDD VDD 0 PWL(0n 0 0.1n 0 1n 1.5)
vgnd vss 0 dc 0
RRb net52 net26 7300

.op
.trans 0.1ns 25ns uic
.IC V(net31)=1.5 V(net52)=0
.probe V(*)
.probe i(*)