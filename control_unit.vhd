library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity control_unit is
	port(	op_code: in std_logic_vector(3 downto 0);
			jump_ctrl: out std_logic;
			branch_ctrl:out std_logic;
			memtoreg_ctrl:out std_logic;
			memwrite_ctrl:out std_logic;
			memread_ctrl:out std_logic;
			alu_ctrl:out std_logic;
			reg_ctrl:out std_logic;
			regdest1_ctrl:out std_logic;
			regdest2_ctrl:out std_logic
			);
	end entity;
	
architecture control_unit_arch of control_unit is
	
	signal jmp1,jmp2,jmp_out:std_logic;
	
	begin
	
	jump_ctrl <= ((op_code(0) and (not op_code(2)) and op_code(3)) or (op_code(3) and (not op_code(2)) and op_code(1)));
	branch_ctrl <= (not op_code(0)) and (not op_code(1)) and (not op_code(2)) and (op_code(3));
	regdest1_ctrl <= (not op_code(1)) and (not op_code(0));
	regdest2_ctrl <= (op_code(3) or (op_code(2) and (not op_code(1))) or ((not op_code(2)) and op_code(1) and op_code(0)));
	
end architecture;