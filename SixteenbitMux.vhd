library ieee;
use ieee.std_logic_1164.all;

entity SixteenbitMux is
	port ( a, b : in std_logic_vector ( 15 downto 0 );
	sel : in std_logic;
	f   : out std_logic_vector ( 15 downto 0 ));
end entity;

architecture MuxArch of SixteenbitMux is
begin
	Muxes : for i in 0 to 15 generate
		f(i) <= ((sel and b(i)) or (not sel and a(i)));
	end generate;
end architecture;