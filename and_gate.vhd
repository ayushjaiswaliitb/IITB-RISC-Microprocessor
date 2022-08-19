--Sub component AND Gate

library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity and_gate is
	port(x, y : in std_logic; f : out std_logic);
end entity;


--and gate implementation
architecture and_arc of and_gate is
begin
	f <= (x and y);
end architecture;
