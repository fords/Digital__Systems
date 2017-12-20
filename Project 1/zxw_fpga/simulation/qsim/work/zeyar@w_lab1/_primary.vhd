library verilog;
use verilog.vl_types.all;
entity zeyarW_lab1 is
    port(
        LED             : out    vl_logic_vector(3 downto 0);
        KEY             : in     vl_logic_vector(0 downto 0);
        CLOCK_50        : in     vl_logic
    );
end zeyarW_lab1;
