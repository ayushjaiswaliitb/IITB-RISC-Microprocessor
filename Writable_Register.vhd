library ieee;
use ieee.std_logic_1164.all;

entity Writable_Register is
  port (rst, clk, reg_write: in std_logic;
        ip: in std_logic_vector(15 downto 0);
        op: out std_logic_vector(15 downto 0));
end entity;

architecture behaviour of Writable_Register is
  signal reg: std_logic_vector(15 downto 0) := x"0000";
begin
    op <= reg;
  process (clk, rst, reg_write, ip)
  begin
    -- if (reg_write = '1') then
    if (rising_edge(clk)) then
      if (rst = '1') then
        reg <= x"0000";
      -- elsif (rising_edge(clk)) then
      elsif (reg_write = '1') then
        reg <= ip;
      end if;
    end if;
  end process;
end architecture;

        
