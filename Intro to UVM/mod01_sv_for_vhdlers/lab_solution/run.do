if [file exists work] {vdel -all}
vlib work
vlog DUT.sv
vlog top.sv
vsim -voptargs="+acc" top;
run -all


