if [file exists work] {vdel -all}
vlib work
vlog classes.sv
vsim -voptargs="+acc" top;
run 1
quit -f


