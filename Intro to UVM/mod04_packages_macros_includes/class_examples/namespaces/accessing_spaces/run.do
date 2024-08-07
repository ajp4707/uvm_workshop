if [file exists work] {vdel -all}
vlib work
vlog  modules.sv
vsim -voptargs="+acc" top;
run -all


