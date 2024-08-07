if [file exists "work"] {vdel -all}
vlib work
vlog dff.sv
vcom dff.vhd
vlog dff_tester.sv
vsim -voptargs="+acc" top
run 200

