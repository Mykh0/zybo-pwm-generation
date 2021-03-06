# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {1}  -id {Common 17-163}  -suppress 
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/EAAES/assignments/pwm_generation/pwm_generation.cache/wt [current_project]
set_property parent.project_path C:/EAAES/assignments/pwm_generation/pwm_generation.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_repo_paths c:/EAAES/EEAES_coreIPS [current_project]
set_property ip_output_repo c:/EAAES/assignments/pwm_generation/pwm_generation.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib C:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/hdl/pwm_generator_system_wrapper.vhd
add_files C:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/pwm_generator_system.bd
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_xbar_1/pwm_generator_system_xbar_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_processing_system7_0_0/pwm_generator_system_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_auto_pc_0/pwm_generator_system_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/pwm_generator_system_ooc.xdc]
set_property is_locked true [get_files C:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/pwm_generator_system.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/EAAES/assignments/pwm_generation/constraints.xdc
set_property used_in_implementation false [get_files C:/EAAES/assignments/pwm_generation/constraints.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top pwm_generator_system_wrapper -part xc7z010clg400-1


write_checkpoint -force -noxdef pwm_generator_system_wrapper.dcp

catch { report_utilization -file pwm_generator_system_wrapper_utilization_synth.rpt -pb pwm_generator_system_wrapper_utilization_synth.pb }
