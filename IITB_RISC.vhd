library ieee;
use ieee.std_logic_1164.all;

entity IITB_RISC is
  port ( clk, mem_iwr : in  std_logic;
         data_input, mem_addr: in std_logic_vector (15 downto 0);
         rst : in std_logic;
         op: out std_logic);
end entity;

architecture cpu of IITB_RISC is

  signal data_in, data_inp, mem_add, memo_add: std_logic_vector(15 downto 0);
  signal from_memory, data_out: std_logic_vector(15 downto 0);

  signal ir_incr, ir_load, t1_write, t2_write, t3_write, carry_write, zero_write, rf_write: std_logic;
  signal mem_write, memo_write, carry, zero, sel_t1, z_in: std_logic;

  signal sel_rf_A1, sel_zero: std_logic;
  signal sel_rf: std_logic_vector(2 downto 0);
  signal sel_pc, sel_alu_a, sel_alu_b, sel_t2, sel_mem_add, sel_rf_A3: std_logic_vector(1 downto 0);
  
  signal instruction, alu_output, t2: std_logic_vector(15 downto 0);
  signal alu_op: std_logic_vector(1 downto 0);
  
  component control_unit is
	port(	op_code: in std_logic_vector(3 downto 0);
			jump_ctrl: out std_logic;
			branch_ctrl:out std_logic;
			memtoreg_ctrl:out std_logic;
			memwrite_ctrl:out std_logic;
			memread_ctrl:out std_logic;
			alu_ctrl:out std_logic;
			reg_ctrl:out std_logic;
			regdest_ctrl:out std_logic
			);
	end component;
  
  component data_path is
    port( rst, clk: in std_logic;
          instruction: out std_logic_vector(15 downto 0);
          ir_incr, ir_load, t1_write, t2_write, t3_write, carry_write, zero_write, rf_write: in std_logic;
          alu_op: in std_logic_vector(1 downto 0);
          sel_rf_A1, sel_t1, sel_zero : in std_logic;
          z_in : in std_logic;
          sel_pc, sel_alu_a, sel_alu_b, sel_t2, sel_mem_add, sel_rf_A3: in std_logic_vector(1 downto 0);
          sel_rf: in std_logic_vector(2 downto 0);
          from_memory: in std_logic_vector(15 downto 0);
          to_memory: out std_logic_vector(15 downto 0);
          t2: out std_logic_vector(15 downto 0);
          mem_add: out std_logic_vector(15 downto 0);
          alu_output: out std_logic_vector(15 downto 0);
          carry, zero: out std_logic);
  end component;
  
  component MemoryUnit is
    port ( rst, clk: in  std_logic;
           mem_add, data_in: in std_logic_vector(15 downto 0);
           data_out: out std_logic_vector(15 downto 0);
           mem_write: in std_logic);
  end component;

  component SixteenbitMux is
    port (a, b: in std_logic_vector(15 downto 0);
          sel: in std_logic;
          f: out std_logic_vector(15 downto 0));
  end component;

begin
  mem_data_mux: SixteenbitMux
    port map (a => data_in, b => data_input, sel => rst, f => data_inp);

  mem_add_mux: SixteenbitMux
    port map (a => mem_add, b => mem_addr, sel => rst , f => memo_add);

  memo_write <= mem_write or mem_iwr;

end architecture;
