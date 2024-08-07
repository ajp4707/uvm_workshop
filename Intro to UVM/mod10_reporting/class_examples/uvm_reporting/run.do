if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim top -voptargs="+acc" -c
run -all



