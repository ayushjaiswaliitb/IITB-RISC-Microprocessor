library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Five_to_One_Mux is
  port (a, b, c, d, e: in std_logic_vector(15 downto 0);
        sel: in std_logic_vector(2 downto 0);
        op: out std_logic_vector(15 downto 0));
end entity;

architecture behavioural of Five_to_One_Mux is
begin
  with sel select
    op <= a when "000",
    b when "001",
    c when "010",
    d when "011",
    e when "100",
    x"0000" when others;
end architecture;
