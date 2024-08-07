if [file exists "work"] {vdel -all}
vlib work
vlog signed_unsigned.sv
vsim -voptargs="+acc" top
run -all




