library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity KoggeStoneAdder is
	port ( a,b : in std_logic_vector ( 15 downto 0);
	cin : in std_logic;
	sum : out std_logic_vector ( 15 downto 0 );
	cout : out std_logic);
end entity;

architecture AddArch of KoggeStoneAdder is
	signal Q : std_logic_vector ( 15 downto 0 );
	signal gn,pr : std_logic_vector ( 15 downto 0 );
	signal g1,p1 : std_logic_vector ( 15 downto 1 );
	signal g2,p2 : std_logic_vector ( 15 downto 2 );
	signal g3,p3 : std_logic_vector ( 15 downto 4 );
	signal g4,p4 : std_logic_vector ( 15 downto 8 );
	signal p,r : std_logic;
	
	component or_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component and_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component xor_gate is
		port (x,y : in std_logic; f : out std_logic);
	end component;
	
	component ProcessingComponent is
		port (gx, px, gy, py : in std_logic;
		g,p : out std_logic);
	end component;
	
	begin
		XorQ: for i in 0 to 15 generate
			xorgenQ : xor_gate port map ( x => b(i), y => cin, f => Q(i) );
		end generate;
		
		XorP: for i in 0 to 15 generate
			xorgenP : xor_gate port map ( x => Q(i), y => a(i), f => pr(i));
		end generate;
		
		AndG: for i in 1 to 15 generate
			andgenG : and_gate port map ( x => Q(i), y => a(i), f => gn(i));
		end generate;
		Gpre1 : and_gate port map ( x => pr(0), y => cin, f => p);
		Gpre2 : and_gate port map ( x => Q(0), y => a(0), f => r);
		Gpre3 : or_gate  port map ( x => p , y => r, f => gn(0));
		
		Layer1: for i in 1 to 15 generate
			processBitgen1: ProcessingComponent port map ( gx => gn(i), px => pr(i), gy => gn(i-1), py => pr(i-1), g => g1(i), p => p1(i));
		end generate;
		
		Layer2init: ProcessingComponent port map ( gx => g1(2), px => p1(2), gy => gn(0), py => pr(0), g => g2(2), p => p2(2));
		
		Layer2: for i in 3 to 15 generate
			processBitgen2: ProcessingComponent port map ( gx => g1(i), px => p1(i), gy => g1(i-2), py => p1(i-2), g => g2(i), p => p2(i));
		end generate;
		
		P34: ProcessingComponent port map ( gx => g2(4), px => p2(4), gy => gn(0), py => pr(0), g => g3(4), p => p3(4));
		P35: ProcessingComponent port map ( gx => g2(5), px => p2(5), gy => g1(1), py => p1(1), g => g3(5), p => p3(5));
		P36: ProcessingComponent port map ( gx => g2(6), px => p2(6), gy => g2(2), py => p2(2), g => g3(6), p => p3(6));
		P37: ProcessingComponent port map ( gx => g2(7), px => p2(7), gy => g2(3), py => p2(3), g => g3(7), p => p3(7));
		P38: ProcessingComponent port map ( gx => g2(8), px => p2(8), gy => g2(4), py => p2(4), g => g3(8), p => p3(8));
		P39: ProcessingComponent port map ( gx => g2(9), px => p2(9), gy => g2(5), py => p2(5), g => g3(9), p => p3(9));
		P310: ProcessingComponent port map ( gx => g2(10), px => p2(10), gy => g2(6), py => p2(6), g => g3(10), p => p3(10));
		P311: ProcessingComponent port map ( gx => g2(11), px => p2(11), gy => g2(7), py => p2(7), g => g3(11), p => p3(11));
		P312: ProcessingComponent port map ( gx => g2(12), px => p2(12), gy => g2(8), py => p2(8), g => g3(12), p => p3(12));
		P313: ProcessingComponent port map ( gx => g2(13), px => p2(13), gy => g2(9), py => p2(9), g => g3(13), p => p3(13));
		P314: ProcessingComponent port map ( gx => g2(14), px => p2(14), gy => g2(10), py => p2(10), g => g3(14), p => p3(14));
		P315: ProcessingComponent port map ( gx => g2(15), px => p2(15), gy => g2(11), py => p2(11), g => g3(15), p => p3(15));

		P48: ProcessingComponent port map ( gx => g3(8), px => p3(8), gy => gn(0), py => pr(0), g => g4(8), p => p4(8));
		P49: ProcessingComponent port map ( gx => g3(9), px => p3(9), gy => g1(1), py => p1(1), g => g4(9), p => p4(9));
		P410: ProcessingComponent port map ( gx => g3(10), px => p3(10), gy => g2(2), py => p2(2), g => g4(10), p => p4(10));
		P411: ProcessingComponent port map ( gx => g3(11), px => p3(11), gy => g2(3), py => p2(3), g => g4(11), p => p4(11));
		P412: ProcessingComponent port map ( gx => g3(12), px => p3(12), gy => g3(4), py => p3(4), g => g4(12), p => p4(12));
		P413: ProcessingComponent port map ( gx => g3(13), px => p3(13), gy => g3(5), py => p3(5), g => g4(13), p => p4(13));
		P414: ProcessingComponent port map ( gx => g3(14), px => p3(14), gy => g3(6), py => p3(6), g => g4(14), p => p4(14));
		P415: ProcessingComponent port map ( gx => g3(15), px => p3(15), gy => g3(7), py => p3(7), g => g4(15), p => p4(15));
		
		xorS0 : xor_gate port map (x => cin, y => pr(0), f => sum(0));
		xorS1 : xor_gate port map (x => gn(0), y => pr(1), f => sum(1));
		xorS2 : xor_gate port map (x => g1(1), y => pr(2), f => sum(2));
		xorS3 : xor_gate port map (x => g2(2), y => pr(3), f => sum(3));
		xorS4 : xor_gate port map (x => g2(3), y => pr(4), f => sum(4));
		xorS5 : xor_gate port map (x => g3(4), y => pr(5), f => sum(5));
		xorS6 : xor_gate port map (x => g3(5), y => pr(6), f => sum(6));
		xorS7 : xor_gate port map (x => g3(6), y => pr(7), f => sum(7));
		xorS8 : xor_gate port map (x => g3(7), y => pr(8), f => sum(8));
		xorS9 : xor_gate port map (x => g4(8), y => pr(9), f => sum(9));
		xorS10 : xor_gate port map (x => g4(9), y => pr(10), f => sum(10));
		xorS11 : xor_gate port map (x => g4(10), y => pr(11), f => sum(11));
		xorS12 : xor_gate port map (x => g4(11), y => pr(12), f => sum(12));
		xorS13 : xor_gate port map (x => g4(12), y => pr(13), f => sum(13));
		xorS14 : xor_gate port map (x => g4(13), y => pr(14), f => sum(14));
		xorS15 : xor_gate port map (x => g4(14), y => pr(15), f => sum(15));
		
		cout<= g4(15);
end architecture;
