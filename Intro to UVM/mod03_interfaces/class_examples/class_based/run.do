if [file exists work] {vdel -all}
vlib work
vcom  memory.vhd
vlog  -f compile.f
vsim -voptargs="+acc" top;
run -all


