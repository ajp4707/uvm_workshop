if [file exists "work"] {vdel -all}
vlib work
vlog wait_example.sv
vsim -voptargs="+acc" top
run -all




