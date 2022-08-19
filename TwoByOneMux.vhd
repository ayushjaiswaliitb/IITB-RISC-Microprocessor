library ieee;
use ieee.std_logic_1164.all;

entity TwoByOneMux is
	port( a, b : in std_logic;
	sel : in std_logic;
	z  : out std_logic);
end entity;

architecture MuxArch of TwoByOneMux is
	begin
		z <= (((not sel) and a) or (sel and b));
end architecture;


