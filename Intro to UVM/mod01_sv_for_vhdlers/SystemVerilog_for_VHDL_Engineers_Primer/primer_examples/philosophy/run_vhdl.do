if [file exists "work"] {vdel -all}
vlib work
vcom vhdl_adder.vhd
vlog adder_tester.sv
vlog vhdl_tb.sv
vsim top
do wave.do
run -all
