# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx485tffg1157-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir E:/wyb/minyCPU/minyCPU.cache/wt [current_project]
set_property parent.project_path E:/wyb/minyCPU/minyCPU.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib {
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/Regsfile.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/psw.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/Program_Counter.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/MPC.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/mem_256x16.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/Imem.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/Decoder.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/DBUS.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/alu_16bit.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/CUmem.v
  E:/wyb/minyCPU/minyCPU.srcs/sources_1/new/tinycpu.v
}
synth_design -top tinycpu -part xc7vx485tffg1157-1
write_checkpoint -noxdef tinycpu.dcp
catch { report_utilization -file tinycpu_utilization_synth.rpt -pb tinycpu_utilization_synth.pb }
