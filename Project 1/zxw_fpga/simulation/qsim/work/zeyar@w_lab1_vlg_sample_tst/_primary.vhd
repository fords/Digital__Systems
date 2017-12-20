library verilog;
use verilog.vl_types.all;
entity zeyarW_lab1_vlg_sample_tst is
    port(
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(0 downto 0);
        sampler_tx      : out    vl_logic
    );
end zeyarW_lab1_vlg_sample_tst;
