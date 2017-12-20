onerror {quit -f}
vlib work
vlog -work work zxw_mux2to1.vo
vlog -work work zxw_mux2to1.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.zxw_mux2to1_vlg_vec_tst
vcd file -direction zxw_mux2to1.msim.vcd
vcd add -internal zxw_mux2to1_vlg_vec_tst/*
vcd add -internal zxw_mux2to1_vlg_vec_tst/i1/*
add wave /*
run -all
