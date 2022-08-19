library ieee;
use ieee.std_logic_1164.all;

entity Three_bit_Two_to_One_Mux is
  port (a, b: in std_logic_vector(2 downto 0);
        sel: in std_logic;
        op: out std_logic_vector(2 downto 0));
end entity;

architecture behavioural of Three_bit_Two_to_One_Mux is
begin
  with sel select
    op <= a when '0',
    b when '1',
    "000" when others;
end architecture;
