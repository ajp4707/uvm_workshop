if [file exists work] {vdel -all}
vlib work
vcom  multadd.vhd
vlog  multadd.sv
vlog  top.sv
vsim -voptargs="+acc" top
run -all

