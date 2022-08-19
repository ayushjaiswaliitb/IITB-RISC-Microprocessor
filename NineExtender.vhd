library ieee;
use ieee.std_logic_1164.all;

entity NineExtender is
  port (a: in std_logic_vector(8 downto 0);
        b: out std_logic_vector(15 downto 0));
end entity;

architecture NineExtender_Arch of NineExtender is
begin
  b(8 downto 0) <= a;
  Initial: for i in 15 downto 9 generate
    b(i) <= a(8);
   end generate; 
end architecture;
