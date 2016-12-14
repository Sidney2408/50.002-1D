set projDir "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/planAhead"
set projName "The alu one"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/mojo_top_0.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/boolean_1.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/alu_2.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/reset_conditioner_3.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/button_conditioner_4.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/button_conditioner_4.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/button_conditioner_4.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/button_conditioner_4.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/button_conditioner_4.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_9.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/edge_detector_10.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/counter_15.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pn_gen_16.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pn_gen_16.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/adder_18.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/compare_19.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/shifter_20.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pipeline_21.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pipeline_21.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pipeline_21.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pipeline_21.v" "D:/Sidney/ISTD stuff/50002/Mojo Stuff/The alu one/work/verilog/pipeline_21.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/Sidney/ISTD\ stuff/50002/Mojo\ Stuff/The\ alu\ one/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
