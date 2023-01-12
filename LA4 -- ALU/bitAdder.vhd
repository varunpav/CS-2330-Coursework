LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY bitAdder IS 
	PORT
	(
		a :  IN  STD_LOGIC;
		b :  IN  STD_LOGIC;
		cin :  IN  STD_LOGIC;
		sum :  OUT  STD_LOGIC;
		cout :  OUT  STD_LOGIC
	);
END bitAdder;

ARCHITECTURE bdf_type OF bitAdder IS 

BEGIN 

sum <= a xor b xor cin;
cout<= (a and b) or (a and cin) or (b and cin);

END bdf_type;
