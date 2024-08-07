if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim -voptargs="+acc" top
run -all


