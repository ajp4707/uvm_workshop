if [file exists "work"] {vdel -all}
vlib work
vlog sensitivity.sv
vsim -voptargs="+acc" top
run -all




