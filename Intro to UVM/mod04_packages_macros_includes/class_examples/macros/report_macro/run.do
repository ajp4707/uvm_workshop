if [file exists work] {vdel -all}
vlib work
vlog  report.sv
vsim -voptargs="+acc" top;
run -all


