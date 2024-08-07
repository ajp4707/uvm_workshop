if [file exists work] {vdel -all}
vlib work
vlog  -f compile_sv.f
vsim -voptargs="+acc" top;
run -all


