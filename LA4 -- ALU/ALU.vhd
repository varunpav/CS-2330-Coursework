LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ALU IS 
	PORT
	(
		p :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		f1 :  IN  STD_LOGIC;
		f0 :  IN  STD_LOGIC;
		Z :  OUT  STD_LOGIC;
		ALU_out : OUT  STD_LOGIC_VECTOR(7 downto 0)
		
	);
END ALU;

ARCHITECTURE bdf_type OF ALU IS 

component byteAdder
	port(
    	a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		cin :  IN  STD_LOGIC;
		sel :  IN  STD_LOGIC;
		sum :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout :  OUT  STD_LOGIC
	);
	end component;
	
	Signal aSig : STD_LOGIC_VECTOR(7 DOWNTO 0);
	Signal bSig : STD_LOGIC_VECTOR(7 DOWNTO 0);
	Signal aluSig : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
BEGIN 

-- nof1p <= not(f1) and p;
aSig(0) <= (not(f1) and p(0)) or (f1 and q(0));
aSig(1) <= (not(f1) and p(1)) or (f1 and q(1));
aSig(2) <= (not(f1) and p(2)) or (f1 and q(2));
aSig(3) <= (not(f1) and p(3)) or (f1 and q(3));
aSig(4) <= (not(f1) and p(4)) or (f1 and q(4));
aSig(5) <= (not(f1) and p(5)) or (f1 and q(5));
aSig(6) <= (not(f1) and p(6)) or (f1 and q(6));
aSig(7) <= (not(f1) and p(7)) or (f1 and q(7));

bSig(0) <= (not(f1) and q(0)) or (f1 and '1');
bSig(1) <= (not(f1) and q(1));
bSig(2) <= (not(f1) and q(2));
bSig(3) <= (not(f1) and q(3));
bSig(4) <= (not(f1) and q(4));
bSig(5) <= (not(f1) and q(5));
bSig(6) <= (not(f1) and q(6));
bSig(7) <= (not(f1) and q(7));

ALU_out <= aluSig;

byteAdder0 : byteAdder
port map(
a => aSig,
b => bSig,
cin => f0,
sel => f0,
sum => aluSig,
cout => open
);

Z <= '1' when (aluSig = X"00") else '0';

END bdf_type;
