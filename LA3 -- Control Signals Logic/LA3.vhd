LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY LA3 IS 
	PORT
	(
    reset : in std_logic;
    clock : in std_logic;
    load : in std_logic;
    store : in std_logic;
    add : in std_logic;
    sub : in std_logic;
    inc : in std_logic;
    dec : in std_logic;
    bra : in std_logic;
    beq : in std_logic;
    t0 : in std_logic;
    t1 : in std_logic;
    t2 : in std_logic;
    t3 : in std_logic;
    t4 : in std_logic;
    t5 : in std_logic;
    t6 : in std_logic;
    t7 : in std_logic;
    Z : in std_logic;
    r : out std_logic;
    w : out std_logic;
    cmar : out std_logic;
    cmbr : out std_logic;
    embr : out std_logic;
    cir : out std_logic;
    eir : out std_logic;
    cpc : out std_logic;
    epc : out std_logic;
    cd0 : out std_logic;
    ed0 : out std_logic;
    calu : out std_logic;
    ealu : out std_logic;
    F0 : out std_logic;
    F1 : out std_logic
	);
END LA3;

ARCHITECTURE bdf_type OF LA3 IS 

component d_ff
   port ( 
	   reset : in std_logic;
		clock : in std_logic;
		d : in std_logic;
		q : out std_logic
		);
end component;

signal Z_q : std_logic;
signal Z_d : std_logic;
signal Z_sel : std_logic;
signal not_clock : std_logic;


BEGIN -- LA3

Z_ff : d_ff
  port map(
  reset => reset,
  clock => not_clock,
  d => Z_d,
  q => Z_q
  );

r <= (t1) or (load and t5) or (add and t5) or (sub and t5) or (inc and t5) or (dec and t5);
w <= (t5 and store) or (t7 and inc) or (t7 and dec);

cmar <= (t0) or (t4 and load) or (t4 and store) or (t4 and add) or (t4 and sub) or (t4 and inc) or (t4 and dec);
cmbr <= (t5 and add) or (t5 and sub) or (t5 and inc) or (t5 and dec);
embr <= (t6 and add) or (t6 and sub) or (t6 and inc) or (t6 and dec);

cir <= (t1);
eir <= (load and t4) or (add and t4) or (sub and t4) or (inc and t4) or (dec and t4) or (store and t4) or (bra and t4) or (beq and t4 and Z_q);
cpc <= (t3) or (bra and t4) or (beq and t4 and Z_q);
epc <= (t0) or (t2);

cd0 <= (t5 and load) or (t7 and add) or (t7 and sub);
ed0 <= (t5 and store);

calu <= (t2) or (t6 and add) or (t6 and sub) or (t6 and inc) or (t6 and dec);
ealu <= (t3) or (t7 and add) or (t7 and sub) or (t7 and inc) or (t7 and dec);

F0 <= (t6 and sub) or (t6 and dec);
F1 <= (t2) or (t6 and inc) or (t6 and dec);

Z_sel <= (t6) and (add or sub or dec or inc);
Z_d <= (Z_sel and Z) or (not(Z_sel) and Z_q);

not_clock <= not(clock);

END bdf_type;
