if [file exists work] {vdel -all}
vlib work

file copy -force ../lab_solution/DUT.sv DUT.sv
file copy -force ../lab_solution/top.sv top.sv

vlog DUT.sv
vlog top.sv
vsim -voptargs="+acc" top;
run -all


