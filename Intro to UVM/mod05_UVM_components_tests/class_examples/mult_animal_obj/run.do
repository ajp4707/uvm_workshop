if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim  top +UVM_TESTNAME=multi
run -all


