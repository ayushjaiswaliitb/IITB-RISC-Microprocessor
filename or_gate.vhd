--Sub component OR Gate

library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
	port(x,y : in std_logic; f : out std_logic);
end entity;


--or gate implementation
architecture or_arc of or_gate is
begin
	f <= (x or y);
end architecture;
