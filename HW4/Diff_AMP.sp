
.SUBCKT Diff_AMP VDD VSS Vb Vin Vip Voutn Voutp
CC1 Voutn VSS 1p 
CC0 Voutp VSS 1p 
RR1 VDD Voutp 100.8k
RR0 VDD Voutn 100.8k 
MM3 net26 Vb VSS VSS N_18 W=5.21u L=2.2u m=30
MM2 Voutp Vin net26 VSS N_18 W=15u L=4.5u m=8
MM1 Voutn Vip net26 VSS N_18 W=15u L=4.5u m=8
.ENDS