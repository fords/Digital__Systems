onerror {quit -f}
vlib work
vlog -work work zeyarW_lab1.vo
vlog -work work zeyarW_lab1.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.zeyarW_lab1_vlg_vec_tst
vcd file -direction zeyarW_lab1.msim.vcd
vcd add -internal zeyarW_lab1_vlg_vec_tst/*
vcd add -internal zeyarW_lab1_vlg_vec_tst/i1/*
add wave /*
run -all
