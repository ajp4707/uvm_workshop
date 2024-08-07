if [file exists "work"] {vdel -all}
vlib work
vlog event.sv
vsim -voptargs="+acc" top
run 55



