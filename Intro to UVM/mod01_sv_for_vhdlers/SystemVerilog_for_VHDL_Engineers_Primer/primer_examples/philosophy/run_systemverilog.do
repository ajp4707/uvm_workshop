if [file exists "work"] {vdel -all}
vlib work
vlog systemverilog_adder.sv
vlog adder_tester.sv
vlog verilog_tb.sv
vsim -voptargs="+acc" top
do wave.do
run -all
