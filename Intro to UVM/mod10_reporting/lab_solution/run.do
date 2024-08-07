if [file exists work] {vdel -all}
vlib work
vlog -f compile_sv.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs="+acc" top +UVM_TESTNAME=verbose_test
run -all
vsim -voptargs="+acc" top +UVM_TESTNAME=quiet_test
run -all
quit -f




