if [file exists work] {vdel -all}
vlib work
vlog  top.sv
vsim -voptargs="+acc" top 
run -all


