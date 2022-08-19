library ieee;
use ieee.std_logic_1164.all;

entity SixteenbitALUMux is
	port ( a, b : in std_logic_vector ( 15 downto 0 );
	carry1, carry2 : in std_logic;
	sel : in std_logic_vector (1 downto 0);
	f   : out std_logic_vector ( 15 downto 0 );
	g   : out std_logic);
end entity;

architecture MuxArch of SixteenbitALUMux is
begin
	Muxes : for i in 0 to 15 generate
		f(i) <= ((sel(0) and b(i)) or (not sel(0) and sel(1) and a(i)));
	end generate;
	g <= (sel(0) and carry2) or (not sel(0) and sel(1) and carry1);
end architecture;