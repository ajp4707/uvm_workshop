onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /top/DUT/i/rst
add wave -noupdate -format Logic /top/DUT/i/clk
add wave -noupdate -format Logic /top/DUT/i/inc
add wave -noupdate -format Logic /top/DUT/i/ld
add wave -noupdate -format Literal -radix hexadecimal /top/DUT/i/data_in
add wave -noupdate -format Literal -radix hexadecimal /top/DUT/i/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {350 ns} {1350 ns}
