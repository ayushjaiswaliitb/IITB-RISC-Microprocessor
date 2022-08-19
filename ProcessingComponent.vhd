library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity ProcessingComponent is
	port (gx, px, gy, py : in std_logic;
	g,p : out std_logic);
end entity;

architecture ProCompArch of ProcessingComponent is
	signal m: std_logic;
	
	component or_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component and_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	begin
		and1 : and_gate port map (x => px, y => py, f => p);
		and2 : and_gate port map (x => px, y => gy, f => m);
		or1  : or_gate  port map (x => m , y => gx, f => g);
end architecture;
