library ieee;
use ieee.std_logic_1164.all;

entity Writable_Bit is
  port (rst, reg_write, clk: in std_logic;
        ip: in std_logic;
        op: out std_logic);
end entity;

architecture behaviour of Writable_Bit is
  signal reg: std_logic := '0';
begin
      op <= reg;
  process (clk, rst, reg_write, ip)
  begin
    -- if (reg_write = '1') then
    if (rising_edge(clk)) then
      if (rst = '1') then
        reg <= '0';
      -- elsif (rising_edge(clk)) then
      elsif (reg_write = '1') then
        reg <= ip;
      end if;
    end if;
  end process;
end architecture;

        
