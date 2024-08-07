if [file exists work] {vdel -all}
vlib work
vcom  mux_vhdl_rtl.vhd
vlog  mux_sv_rtl.sv
vlog  top.sv
vsim -voptargs="+acc" top
run
quit -f
