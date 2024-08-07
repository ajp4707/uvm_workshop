if [file exists work] {vdel -all}
vlib work
vlog -f compile_sv.f
vsim -voptargs="+acc" top;
log /* -r
run -all


