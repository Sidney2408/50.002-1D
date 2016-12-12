set projDir "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/planAhead"
set projName "The final project"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/mojo_top_0.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/boolean_1.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/reset_conditioner_2.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/button_conditioner_3.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/button_conditioner_3.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/edge_detector_5.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/edge_detector_6.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/edge_detector_6.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/multi_seven_seg_8.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/multi_dec_ctr_9.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/counter_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/pn_gen_11.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/pipeline_12.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/pipeline_12.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/counter_14.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/seven_seg_15.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/decoder_16.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The final project/work/verilog/decimal_counter_17.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Sidney/ISTD\ stuff/50002/Mojo\ Stuff/The\ final\ project/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
