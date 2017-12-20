library verilog;
use verilog.vl_types.all;
entity zxw_mux2to1_verilog_vlg_sample_tst is
    port(
        s               : in     vl_logic;
        x1              : in     vl_logic;
        x2              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end zxw_mux2to1_verilog_vlg_sample_tst;
