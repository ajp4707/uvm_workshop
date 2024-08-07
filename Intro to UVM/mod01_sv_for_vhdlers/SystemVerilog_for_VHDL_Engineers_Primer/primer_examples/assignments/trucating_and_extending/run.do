if [file exists work] {vdel -all}
vlib work
vlog top.sv
vsim -c -voptargs="+acc" top
run
quit -f
