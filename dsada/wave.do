onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /leitura_escrita/ci
add wave -noupdate /leitura_escrita/e
add wave -noupdate /leitura_escrita/f
add wave -noupdate /leitura_escrita/g
add wave -noupdate /leitura_escrita/h
add wave -noupdate /leitura_escrita/i
add wave -noupdate /leitura_escrita/j
add wave -noupdate /leitura_escrita/clock
add wave -noupdate /leitura_escrita/s
add wave -noupdate /leitura_escrita/cout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1000003285 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {9007199254740992 ns}
