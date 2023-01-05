LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY decoder IS 
	PORT
	(
		opcode :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		execute :  IN  STD_LOGIC;
		load :  OUT  STD_LOGIC;
		store :  OUT  STD_LOGIC;
		add :  OUT  STD_LOGIC;
		sub :  OUT  STD_LOGIC;
		inc :  OUT  STD_LOGIC;
		dec :  OUT  STD_LOGIC;
		bra :  OUT  STD_LOGIC;
		beq :  OUT  STD_LOGIC
	);
END decoder;

ARCHITECTURE bdf_type OF decoder IS 

BEGIN 

load <= NOT(opcode(2)) and NOT(opcode(1)) and NOT(opcode(0)) and execute;
store <= NOT(opcode(2)) and NOT(opcode(1)) and opcode(0) and execute;
add <= NOT(opcode(2)) and opcode(1) and NOT(opcode(0)) and execute;
sub <= NOT (opcode(2)) and opcode(1) and opcode(0) and execute;
inc <= opcode(2) and NOT(opcode(1)) and NOT(opcode(0)) and execute;
dec <= opcode(2) and NOT(opcode(1)) and opcode(0) and execute;
bra <= opcode(2) and opcode(1) and NOT(opcode(0)) and execute;
beq <= opcode(2) and opcode(1) and opcode(0) and execute;

END bdf_type;
