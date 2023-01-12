LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY d_ff IS 
	PORT
	(
    reset : in std_logic;
    clock : in std_logic;
	 d : in std_logic;
	 q : out std_logic
	);
END d_ff;

ARCHITECTURE bdf_type OF d_ff IS 


BEGIN 

	current_state: process (clock, reset)
	begin
		if (reset = '1') then
			q<='0';
		elsif rising_edge(clock) then
			q<=d;
		end if;
	end process;

END bdf_type;
