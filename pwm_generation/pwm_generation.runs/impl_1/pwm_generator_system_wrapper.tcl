proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -ruleid {1}  -id {Common 17-163}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z010clg400-1
  set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/EAAES/assignments/pwm_generation/pwm_generation.cache/wt [current_project]
  set_property parent.project_path C:/EAAES/assignments/pwm_generation/pwm_generation.xpr [current_project]
  set_property ip_repo_paths C:/EAAES/EEAES_coreIPS [current_project]
  set_property ip_output_repo C:/EAAES/assignments/pwm_generation/pwm_generation.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  add_files -quiet C:/EAAES/assignments/pwm_generation/pwm_generation.runs/synth_1/pwm_generator_system_wrapper.dcp
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0.dcp]
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_xbar_1/pwm_generator_system_xbar_1.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_xbar_1/pwm_generator_system_xbar_1.dcp]
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_processing_system7_0_0/pwm_generator_system_processing_system7_0_0.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_processing_system7_0_0/pwm_generator_system_processing_system7_0_0.dcp]
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0.dcp]
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_modulator_axi_ip_0_0/pwm_generator_system_modulator_axi_ip_0_0.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_modulator_axi_ip_0_0/pwm_generator_system_modulator_axi_ip_0_0.dcp]
  add_files -quiet c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_auto_pc_0/pwm_generator_system_auto_pc_0.dcp
  set_property netlist_only true [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_auto_pc_0/pwm_generator_system_auto_pc_0.dcp]
  read_xdc -prop_thru_buffers -ref pwm_generator_system_axi_gpio_0_0 -cells U0 c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0_board.xdc]
  read_xdc -ref pwm_generator_system_axi_gpio_0_0 -cells U0 c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_axi_gpio_0_0/pwm_generator_system_axi_gpio_0_0.xdc]
  read_xdc -ref pwm_generator_system_processing_system7_0_0 -cells inst c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_processing_system7_0_0/pwm_generator_system_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_processing_system7_0_0/pwm_generator_system_processing_system7_0_0.xdc]
  read_xdc -prop_thru_buffers -ref pwm_generator_system_rst_ps7_0_100M_0 -cells U0 c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0_board.xdc
  set_property processing_order EARLY [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0_board.xdc]
  read_xdc -ref pwm_generator_system_rst_ps7_0_100M_0 -cells U0 c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0.xdc
  set_property processing_order EARLY [get_files c:/EAAES/assignments/pwm_generation/pwm_generation.srcs/sources_1/bd/pwm_generator_system/ip/pwm_generator_system_rst_ps7_0_100M_0/pwm_generator_system_rst_ps7_0_100M_0.xdc]
  read_xdc C:/EAAES/assignments/pwm_generation/constraints.xdc
  link_design -top pwm_generator_system_wrapper -part xc7z010clg400-1
  write_hwdef -file pwm_generator_system_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force pwm_generator_system_wrapper_opt.dcp
  catch { report_drc -file pwm_generator_system_wrapper_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force pwm_generator_system_wrapper_placed.dcp
  catch { report_io -file pwm_generator_system_wrapper_io_placed.rpt }
  catch { report_utilization -file pwm_generator_system_wrapper_utilization_placed.rpt -pb pwm_generator_system_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file pwm_generator_system_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force pwm_generator_system_wrapper_routed.dcp
  catch { report_drc -file pwm_generator_system_wrapper_drc_routed.rpt -pb pwm_generator_system_wrapper_drc_routed.pb -rpx pwm_generator_system_wrapper_drc_routed.rpx }
  catch { report_methodology -file pwm_generator_system_wrapper_methodology_drc_routed.rpt -rpx pwm_generator_system_wrapper_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file pwm_generator_system_wrapper_timing_summary_routed.rpt -rpx pwm_generator_system_wrapper_timing_summary_routed.rpx }
  catch { report_power -file pwm_generator_system_wrapper_power_routed.rpt -pb pwm_generator_system_wrapper_power_summary_routed.pb -rpx pwm_generator_system_wrapper_power_routed.rpx }
  catch { report_route_status -file pwm_generator_system_wrapper_route_status.rpt -pb pwm_generator_system_wrapper_route_status.pb }
  catch { report_clock_utilization -file pwm_generator_system_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force pwm_generator_system_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES XPM_CDC [current_project]
  catch { write_mem_info -force pwm_generator_system_wrapper.mmi }
  write_bitstream -force -no_partial_bitfile pwm_generator_system_wrapper.bit 
  catch { write_sysdef -hwdef pwm_generator_system_wrapper.hwdef -bitfile pwm_generator_system_wrapper.bit -meminfo pwm_generator_system_wrapper.mmi -file pwm_generator_system_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

