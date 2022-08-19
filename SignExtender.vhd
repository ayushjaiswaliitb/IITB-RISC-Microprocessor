library ieee;
use ieee.std_logic_1164.all;

entity SignExtender is
  port (a: in std_logic_vector(5 downto 0);
        b: out std_logic_vector(15 downto 0));
end entity;

architecture SignExtender_Arch of SignExtender is
begin
  b(5 downto 0) <= a;
  Initial: for i in 15 downto 6 generate
    b(i) <= a(5);
   end generate; 
end architecture;
