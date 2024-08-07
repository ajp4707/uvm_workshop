if [file exists "work"] {vdel -all}
if [file exists "coverage.txt"] {file delete -force coverage.txt}
vlib work
vlog -f compile_sv.f 
vcom -f compile_vhdl.f
set contents [glob -directory tests *]
foreach item $contents {
	file copy -force $item ./test_constraint.svh
	vlog alu_tester.sv
	puts "*******************************************"
	puts "*******************************************"
	puts "                 $item"
	puts "*******************************************"
	puts "*******************************************"
	set testpath [split $item "/"]
	set testfile [split [lindex $testpath 1] "."]
	set testname [lindex $testfile 0]
	vsim top -voptargs="+acc" -coverage -debugDB=debug/$testname.dbg -wlf debug/$testname.wlf -l debug/$testname.txt -assertdebug
	set NoQuitOnFinish 1
	onbreak {resume}
	log -r /*
	run -all	
}

coverage report -cvg -detail -file coverage.txt


