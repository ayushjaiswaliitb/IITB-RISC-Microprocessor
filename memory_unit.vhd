library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;
use std.textio.all;

entity MemoryUnit is
    port ( rst, clk: in  std_logic;
        mem_add, data_in: in std_logic_vector(15 downto 0);
        data_out: out std_logic_vector(15 downto 0);
        mem_write: in std_logic);
end entity;

architecture behavioral of MemoryUnit is
type mem_type is array(1023 downto 0) of std_logic_vector(15 downto 0);
          signal memory_data : mem_type:=(others => x"0000");
begin
    data_out <= memory_data(to_integer(unsigned(mem_add)));
    memory_write: process(mem_write, mem_add, clk, data_in)
    file out_file : text open write_mode is "./out_mem.txt";
        variable row: line;
    begin
          if (rising_edge(clk)) then
            if(mem_write = '1') then
              memory_data(to_integer(unsigned(mem_add))) <= data_in;
              write(row, integer'image(to_integer(unsigned(mem_add))) & " " & integer'image(to_integer(unsigned(data_in))));
              writeline(out_file, row);
            end if;
          end if;
    end process;

end architecture;
