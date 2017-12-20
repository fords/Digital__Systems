library verilog;
use verilog.vl_types.all;
entity zxw_mux2to1_verilog is
    port(
        x1              : in     vl_logic;
        x2              : in     vl_logic;
        s               : in     vl_logic;
        f               : out    vl_logic
    );
end zxw_mux2to1_verilog;
