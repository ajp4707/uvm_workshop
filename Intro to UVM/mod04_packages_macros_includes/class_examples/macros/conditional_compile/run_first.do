if [file exists work] {vdel -all}
vlib work
vlog  top.sv +define+FIRST
vsim -voptargs="+acc" top 
run -all


