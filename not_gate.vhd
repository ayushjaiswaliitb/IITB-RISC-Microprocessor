--Sub Component NOT Gate

library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity not_gate is
	port(x : in std_logic; f : out std_logic);
end entity;

--not gate implementation
architecture not_arc of not_gate is
begin
	f <= not x;
end architecture;
