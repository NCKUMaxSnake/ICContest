#Read All Files
read_file -format verilog IOTDF.v 
current_design IOTDF
link

#Setting Clock Constraints
source -echo -verbose IOTDF_DC.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
compile -map_effort high -area_effort high
compile -map_effort high -area_effort high -inc

write -format ddc     -hierarchy -output "IOTDF_syn.ddc"
write_sdf -version 1.0  IOTDF_syn.sdf
write -format verilog -hierarchy -output IOTDF_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  IOTDF_syn.qor
