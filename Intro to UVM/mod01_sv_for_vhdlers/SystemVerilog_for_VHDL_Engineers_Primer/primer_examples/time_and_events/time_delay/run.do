if [file exists "work"] {vdel -all}
vlib work
vlog clock_gen.sv
vsim -voptargs="+acc" clock_gen
do clock_wave.do
run 100


