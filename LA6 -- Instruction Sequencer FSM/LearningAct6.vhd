LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY LearningAct6 IS 
	PORT
	(
    opcode : in std_logic_vector(2 DOWNTO 0);
    reset : in std_logic;
	 clock : in std_logic;
	 t0 : out std_logic;
	 t1 : out std_logic;
	 t2 : out std_logic;
	 t3 : out std_logic;
	 t4 : out std_logic;
	 t5 : out std_logic;
	 t6 : out std_logic;
	 t7 : out std_logic;
	 execute : out std_logic
	);
	
END LearningAct6;

ARCHITECTURE bdf_type OF LearningAct6 IS 

component d_ff
	port(
    reset : in std_logic;
    clock : in std_logic;
	 d : in std_logic;
	 q : out std_logic
	);
	end component;
	
	Signal t0_curr : STD_LOGIC;
	Signal t1_curr : STD_LOGIC;
	Signal t2_curr : STD_LOGIC;
	Signal t0_next : STD_LOGIC;
	Signal t1_next : STD_LOGIC;
	Signal t2_next : STD_LOGIC;

BEGIN 

t0 <= (not(t2_curr) and not(t1_curr) and not(t0_curr));
t1 <= (not(t2_curr) and not(t1_curr) and    (t0_curr));
t2 <= (not(t2_curr) and    (t1_curr) and not(t0_curr));
t3 <= (not(t2_curr) and    (t1_curr) and    (t0_curr));
t4 <= (   (t2_curr) and not(t1_curr) and not(t0_curr));
t5 <= (   (t2_curr) and not(t1_curr) and    (t0_curr));
t6 <= (   (t2_curr) and    (t1_curr) and not(t0_curr));
t7 <= (   (t2_curr) and    (t1_curr) and    (t0_curr));

execute <= t2_curr;

d_ff0 : d_ff
port map(
reset => reset,
clock => clock,
d => t0_next,
q => t0_curr
);

d_ff1 : d_ff
port map(
reset => reset,
clock => clock,
d => t1_next,
q => t1_curr
);

d_ff2 : d_ff
port map(
reset => reset,
clock => clock,
d => t2_next,
q => t2_curr
);

t0_next <= (not(opcode(1)) and not(t0_curr)) or (not(opcode(2)) and not(t0_curr)) or (not(t2_curr) and not(t0_curr));
t1_next <= (t1_curr and not(t0_curr)) or (not(t2_curr) and not(t1_curr) and t0_curr) or (opcode(1) and not(t1_curr) and t0_curr) or (not(t1_curr) and t0_curr and opcode(2));
t2_next <= (t2_curr and t1_curr and not(t0_curr)) or (not(t2_curr) and t1_curr and t0_curr) or (not(opcode(1)) and t2_curr and not(t0_curr)) or (not(t1_curr) and opcode(1) and t2_curr and not(opcode(2))) or (not(t1_curr) and not(opcode(1)) and t2_curr and opcode(2));

END;
