library verilog;
use verilog.vl_types.all;
entity zeyarW_lab1_vlg_check_tst is
    port(
        LED             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end zeyarW_lab1_vlg_check_tst;
