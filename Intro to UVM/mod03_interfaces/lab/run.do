if [file exists work] {vdel -all}
vlib work
vlog counter.sv
vlog counter_if.sv
vlog top.sv
vsim -voptargs="+acc" top;
run -all
quit -f

