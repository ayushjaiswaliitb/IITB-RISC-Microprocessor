library ieee;
use ieee.std_logic_1164.all;

entity SixteenbitNand is
	port(x,y : in std_logic_vector (15 downto 0) ;
	f : out std_logic_vector ( 15 downto 0));
end entity;

architecture nandarch of SixteenbitNand is
	component nand_gate is
		port (a,b : in std_logic; c : out std_logic);
	end component;	
	begin
		NandOnebit : for i in 0 to 15 generate
			nandGatei : nand_gate port map ( a => x(i), b => y(i), c => f(i) );
		end generate;
		
end architecture;
