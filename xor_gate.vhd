--Sub component XOR Gate

library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
	port(x,y : in std_logic; f : out std_logic);
end entity;


--xor gate implementation
architecture xor_arc of xor_gate is
	signal notx, noty, xory, notxornoty : std_logic;
	component or_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component and_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component not_gate is
		port (x : in std_logic; f : out std_logic);
	end component;
	
	begin
		not1 : not_gate port map (x => x, f => notx);
		not2 : not_gate port map (x => y, f => noty);
		or1  : or_gate  port map (x => x, y => y, f => xory);
		or2  : or_gate  port map (x => notx, y => noty, f => notxornoty);
		and1 : and_gate port map (x => xory, y => notxornoty, f => f);
end architecture;
