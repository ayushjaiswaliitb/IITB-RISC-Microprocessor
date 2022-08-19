library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;

entity RegisterFile is
  port (AddrA, AddrB, AddrC : in std_logic_vector( 2 downto 0 );
	RegC : in std_logic_vector (15 downto 0);
	rf_write : in std_logic;
	rst, clk: in std_logic;
	RegA, RegB : out std_logic_vector (15 downto 0));
end entity;

architecture rf_arch of RegisterFile is
type rf_type is array(0 to 7) of std_logic_vector(15 downto 0);
  signal RF : rf_type;
begin
  RegA <= RF(to_integer(unsigned(AddrA)));
  RegB <= RF(to_integer(unsigned(AddrB)));

  process(rst, clk, rf_write, AddrC, RegC)
    file out_file : text open write_mode is "./out_reg.txt";
      variable row: line;
  begin
    if (rising_edge(clk)) then
      if (rst = '1') then
        for i in 0 to 7 loop
          RF(i) <= x"0000";
        end loop;
        
      elsif(rf_write = '1') then
        RF(to_integer(unsigned(AddrC))) <= RegC;

      for i in 0 to 7 loop
         write(row, "R" & integer'image(i) & " = " & integer'image(to_integer(unsigned(RF(i)))));
         writeline(out_file, row);
      end loop;
        write(row, string'("====================="));
         writeline(out_file, row);
      end if;
    end if;

  end process;
end architecture;
