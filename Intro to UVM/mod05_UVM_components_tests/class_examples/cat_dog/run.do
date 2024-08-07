if [file exists work] {vdel -all}
vlib work
vlog -f compile.f
vsim  top +UVM_TESTNAME=cat
set  NoQuitOnFinish 1
onbreak {resume}
run -all
vsim  top +UVM_TESTNAME=dog
run -all
quit

