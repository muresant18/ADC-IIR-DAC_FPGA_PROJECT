
w
Command: %s
53*	vivadotcl2F
2synth_design -top basys3_top -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
95082default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1024.559 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'%s4497*oasys2

basys3_top2default:default2
 2default:default2?
vC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/new/basys3_top.sv2default:default2
282default:default8@Z8-6157h px? 
?
synthesizing module '%s'%s4497*oasys2
spi_adc2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/SPI_master.sv2default:default2
432default:default8@Z8-6157h px? 
?
-case statement is not full and has no default155*oasys2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/SPI_master.sv2default:default2
1362default:default8@Z8-155h px? 
?
-case statement is not full and has no default155*oasys2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/SPI_master.sv2default:default2
1772default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
spi_adc2default:default2
 2default:default2
12default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/SPI_master.sv2default:default2
432default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
iir2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/iir.sv2default:default2
232default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter DATA_W bound to: 12 - type: integer 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
iir2default:default2
 2default:default2
22default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/iir.sv2default:default2
232default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
ste_avg2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/ste_avg_fir.sv2default:default2
332default:default8@Z8-6157h px? 
\
%s
*synth2D
0	Parameter DATA_W bound to: 12 - type: integer 
2default:defaulth p
x
? 
X
%s
*synth2@
,	Parameter zero bound to: 12'b000000000000 
2default:defaulth p
x
? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ste_avg2default:default2
 2default:default2
32default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/ste_avg_fir.sv2default:default2
332default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
uart_tx2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/uart_tx.sv2default:default2
382default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart_tx2default:default2
 2default:default2
42default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/uart_tx.sv2default:default2
382default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
spi_dac2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/spi_dac.sv2default:default2
222default:default8@Z8-6157h px? 
V
%s
*synth2>
*	Parameter SCK_CNT_MAX bound to: 4'b1001 
2default:defaulth p
x
? 
?
-case statement is not full and has no default155*oasys2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/spi_dac.sv2default:default2
1802default:default8@Z8-155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
spi_dac2default:default2
 2default:default2
52default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/spi_dac.sv2default:default2
222default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2

bin_to_bcd2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/bin_to_bcd.sv2default:default2
202default:default8@Z8-6157h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

bin_to_bcd2default:default2
 2default:default2
62default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/bin_to_bcd.sv2default:default2
202default:default8@Z8-6155h px? 
?
synthesizing module '%s'%s4497*oasys2
	seg7_ctrl2default:default2
 2default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/seg7_ctrl.sv2default:default2
212default:default8@Z8-6157h px? 
?
default block is never used226*oasys2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/seg7_ctrl.sv2default:default2
462default:default8@Z8-226h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	seg7_ctrl2default:default2
 2default:default2
72default:default2
12default:default2?
?C:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/Lab9_complete_project_fpga/seg7_ctrl.sv2default:default2
212default:default8@Z8-6155h px? 
?
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

basys3_top2default:default2
 2default:default2
82default:default2
12default:default2?
vC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/sources_1/imports/new/basys3_top.sv2default:default2
282default:default8@Z8-6155h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:10 ; elapsed = 00:00:11 . Memory (MB): peak = 1024.559 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1024.559 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:12 . Memory (MB): peak = 1024.559 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0252default:default2
1024.5592default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2?
xC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/constrs_1/imports/Lab9/basys3_top.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2?
xC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/constrs_1/imports/Lab9/basys3_top.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2?
xC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.srcs/constrs_1/imports/Lab9/basys3_top.xdc2default:default20
.Xil/basys3_top_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1043.5312default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0112default:default2
1043.5312default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2"
curr_state_reg2default:default2
spi_adc2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2(
actual_fsm_state_reg2default:default2
uart_tx2default:defaultZ8-802h px? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2$
fsm_state_ff_reg2default:default2
spi_dac2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                            00001 | 00000000000000000000000000000000
2default:defaulth p
x
? 
?
%s
*synth2s
_       SAMPLE_FIRST_ZERO |                            00010 | 00000000000000000000000000000010
2default:defaulth p
x
? 
?
%s
*synth2s
_              SAMPLE_SDA |                            00100 | 00000000000000000000000000000001
2default:defaulth p
x
? 
?
%s
*synth2s
_                SEND_SDA |                            01000 | 00000000000000000000000000000011
2default:defaulth p
x
? 
?
%s
*synth2s
_                   QUIET |                            10000 | 00000000000000000000000000000100
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2"
curr_state_reg2default:default2
one-hot2default:default2
spi_adc2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    INIT |                               00 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                               01 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_                  RECIVE |                               10 |                               10
2default:defaulth p
x
? 
?
%s
*synth2s
_                    SEND |                               11 |                               11
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2(
actual_fsm_state_reg2default:default2

sequential2default:default2
uart_tx2default:defaultZ8-3354h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                    IDLE |                              000 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_        CS_HIGH_SCK_HIGH |                              001 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_         CS_HIGH_SCK_LOW |                              010 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                SCK_HIGH |                              011 |                              100
2default:defaulth p
x
? 
?
%s
*synth2s
_                 SCK_LOW |                              100 |                              011
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2$
fsm_state_ff_reg2default:default2

sequential2default:default2
spi_dac2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   15 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   15 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   14 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 47    
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               15 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               14 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               13 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               12 Bit    Registers := 9     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               10 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 12    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   15 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input   14 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input   12 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   12 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   10 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input   10 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    5 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 43    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 12    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   5 Input    1 Bit        Muxes := 17    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    1 Bit        Muxes := 4     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:29 ; elapsed = 00:00:31 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:42 ; elapsed = 00:00:44 . Memory (MB): peak = 1043.531 ; gain = 18.973
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1044.750 ; gain = 20.191
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:43 ; elapsed = 00:00:45 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    17|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |     7|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |    48|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    72|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    52|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    30|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    62|
2default:defaulth px? 
D
%s*synth2,
|9     |FDCE   |   214|
2default:defaulth px? 
D
%s*synth2,
|10    |FDPE   |    12|
2default:defaulth px? 
D
%s*synth2,
|11    |FDRE   |    21|
2default:defaulth px? 
D
%s*synth2,
|12    |LDC    |     4|
2default:defaulth px? 
D
%s*synth2,
|13    |IBUF   |    20|
2default:defaulth px? 
D
%s*synth2,
|14    |OBUF   |    35|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 0 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:36 ; elapsed = 00:00:49 . Memory (MB): peak = 1063.844 ; gain = 20.312
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:51 ; elapsed = 00:00:53 . Memory (MB): peak = 1063.844 ; gain = 39.285
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0142default:default2
1063.8442default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
212default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1063.8442default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2Z
F  A total of 4 instances were transformed.
  LDC => LDCE: 4 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
412default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:002default:default2
00:01:042default:default2
1063.8442default:default2
39.2852default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2}
iC:/STM1/DE_c/Lab9_complete_project_fpga/ADC_AVG_DAC_System/ADC_AVG_DAC_System.runs/synth_1/basys3_top.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2~
jExecuting : report_utilization -file basys3_top_utilization_synth.rpt -pb basys3_top_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Feb  5 21:27:41 20222default:defaultZ17-206h px? 


End Record