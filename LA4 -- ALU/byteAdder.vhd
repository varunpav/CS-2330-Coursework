LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY byteAdder IS 
	PORT
	(
		a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		cin : IN  STD_LOGIC;
		sel : IN STD_LOGIC;
		sum :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout :  OUT  STD_LOGIC
		
	);
END byteAdder;

ARCHITECTURE bdf_type OF byteAdder IS 

component bitAdder 
	port (
	a : in STD_LOGIC;
	b : in STD_LOGIC;
	cin : in STD_LOGIC;
	sum : out STD_LOGIC;
	cout : out STD_LOGIC
	);
	end component;

signal cout0 : std_logic;
signal cout1 : std_logic;
signal cout2 : std_logic;
signal cout3 : std_logic;
signal cout4 : std_logic;
signal cout5 : std_logic;
signal cout6 : std_logic;

signal bAlter : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 

Adder0 : bitAdder
port map (
a => a(0),
b => bAlter(0),
cin => cin,
sum => sum(0),
cout => cout0
);

Adder1 : bitAdder
port map (
a => a(1),
b => bAlter(1),
cin => cout0,
sum => sum(1),
cout => cout1
);

Adder2 : bitAdder
port map (
a => a(2),
b => bAlter(2),
cin => cout1,
sum => sum(2),
cout => cout2
);

Adder3 : bitAdder
port map (
a => a(3),
b => bAlter(3),
cin => cout2,
sum => sum(3),
cout => cout3
);

Adder4 : bitAdder
port map (
a => a(4),
b => bAlter(4),
cin => cout3,
sum => sum(4),
cout => cout4
);

Adder5 : bitAdder
port map (
a => a(5),
b => bAlter(5),
cin => cout4,
sum => sum(5),
cout => cout5
);

Adder6 : bitAdder
port map (
a => a(6),
b => bAlter(6),
cin => cout5,
sum => sum(6),
cout => cout6
);

Adder7 : bitAdder
port map (
a => a(7),
b => bAlter(7),
cin => cout6,
sum => sum(7),
cout => cout
);

bAlter(0) <= b(0) xor sel;
bAlter(1) <= b(1) xor sel;
bAlter(2) <= b(2) xor sel;
bAlter(3) <= b(3) xor sel;
bAlter(4) <= b(4) xor sel;
bAlter(5) <= b(5) xor sel;
bAlter(6) <= b(6) xor sel;
bAlter(7) <= b(7) xor sel;

END bdf_type;
