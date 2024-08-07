if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim  top +UVM_TESTNAME=verbose_test
set  NoQuitOnFinish 1
onbreak {resume}
run -all
vsim  top +UVM_TESTNAME=quiet_test
run -all
quit

