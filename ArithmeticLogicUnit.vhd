library ieee;
use ieee.std_logic_1164.all;

entity ArithmeticLogicUnit is
	port(A, B : in std_logic_vector (15 downto 0);
	operation : in std_logic_vector (1 downto 0);
	carry_init : in std_logic;
	C : out std_logic_vector (15 downto 0);
	carry, zero : out std_logic);
end entity;

architecture ALUArch of ArithmeticLogicUnit is
	signal C1, C2, D : std_logic_vector ( 15 downto 0 );
	signal carry_out : std_logic;
	
	component SixteenbitNand is
		port (x,y : in std_logic_vector (15 downto 0);
		f : out std_logic_vector (15 downto 0));
	end component;

	component SixteenbitKogStonAddSub is
		port ( a,b : in std_logic_vector ( 15 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector ( 15 downto 0 );
		cout : out std_logic);
	end component;
	
	component SixteenbitALUMux is
		port ( a, b : in std_logic_vector ( 15 downto 0 );
		carry1, carry2 : in std_logic;
		sel : in std_logic_vector (1 downto 0);
		f   : out std_logic_vector ( 15 downto 0 );
		g   : out std_logic);
	end component;		

	begin 
                -- operation 01 is addition, 10 is nand and 11 is subtraction
		Adder : SixteenbitKogStonAddSub port map ( a => A, b => B, cin => operation(1), sum => C1, cout => carry_out);
		Logic : SixteenbitNand port map ( x => A, y => B, f => C2);
		Mux   : SixteenbitALUMux port map (a => C2, b => C1, carry1 => carry_init, carry2 => carry_out, sel => operation, f => D, g => carry);
                zero <= '1' when (D = x"0000") else '0';
		C <= D;
end architecture;
