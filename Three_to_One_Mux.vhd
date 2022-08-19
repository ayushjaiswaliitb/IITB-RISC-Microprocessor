library ieee;
use ieee.std_logic_1164.all;

entity Three_to_One_Mux is
  port (a, b, c: in std_logic_vector(15 downto 0);
        sel: in std_logic_vector(1 downto 0);
        op: out std_logic_vector(15 downto 0));
end entity;

architecture behavioural of Three_to_One_Mux is
begin
  with sel select
    op <= a when "00",
    b when "01",
    c when "10",
    x"0000" when others;
end architecture;
