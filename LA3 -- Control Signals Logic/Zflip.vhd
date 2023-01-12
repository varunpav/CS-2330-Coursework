LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ZFlip IS 
	PORT
	(
    reset : in std_logic;
	 clock : in std_logic;
	 Z : in std_logic;
	 add : in std_logic;
	 sub : in std_logic;
	 dec : in std_logic;
	 inc : in std_logic;
	 t6 : in std_logic;
	 Z_sel :out std_logic
	 Z_d : out std_logic;
	);
END Zflip;

ARCHITECTURE bdf_type OF ZFlip IS 

BEGIN 

Z_sel <=

END bdf_type;
