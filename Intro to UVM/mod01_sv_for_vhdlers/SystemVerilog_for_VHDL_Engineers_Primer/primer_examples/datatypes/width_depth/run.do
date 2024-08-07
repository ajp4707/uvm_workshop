if [file exists "work"] {vdel -all}
vlib work
vlog width_depth.sv
vsim -voptargs="+acc" top
run -all




