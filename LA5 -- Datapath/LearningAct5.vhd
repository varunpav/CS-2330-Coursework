-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Tue Nov 29 17:43:52 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY LearningAct5 IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		cmar :  IN  STD_LOGIC;
		embr :  IN  STD_LOGIC;
		cmbr :  IN  STD_LOGIC;
		eir :  IN  STD_LOGIC;
		cir :  IN  STD_LOGIC;
		epc :  IN  STD_LOGIC;
		cpc :  IN  STD_LOGIC;
		ed0 :  IN  STD_LOGIC;
		cd0 :  IN  STD_LOGIC;
		ealu :  IN  STD_LOGIC;
		calu :  IN  STD_LOGIC;
		f0 :  IN  STD_LOGIC;
		f1 :  IN  STD_LOGIC;
		data_bus :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC;
		address_bus :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		opcode :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END LearningAct5;

ARCHITECTURE bdf_type OF LearningAct5 IS 

COMPONENT alu
	PORT(f1 : IN STD_LOGIC;
		 f0 : IN STD_LOGIC;
		 p : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC;
		 ALU_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tri_state_model
	PORT(enable : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dreg_e
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	alu_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	D0_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	fPQ :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	IR_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	MAR_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	MBR_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	PC_in :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	PC_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_alu : alu
PORT MAP(f1 => f1,
		 f0 => f0,
		 p => D0_out,
		 q => data_bus,
		 Z => Z,
		 ALU_out => alu_out);


b2v_alu_buffer : tri_state_model
PORT MAP(enable => ealu,
		 data_in => fPQ,
		 data_out => data_bus);


b2v_alu_register : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => calu,
		 d => alu_out,
		 q => fPQ);


b2v_D0 : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cd0,
		 d => data_bus,
		 q => D0_out);


b2v_D0_buffer : tri_state_model
PORT MAP(enable => ed0,
		 data_in => D0_out,
		 data_out => data_bus);


PC_in(4 DOWNTO 0) <= data_bus(4 DOWNTO 0);



b2v_IR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cir,
		 d => data_bus,
		 q => IR_out);


b2v_IR_buffer : tri_state_model
PORT MAP(enable => eir,
		 data_in => IR_out,
		 data_out => data_bus);


b2v_MAR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cmar,
		 d => data_bus,
		 q => MAR_out);


b2v_MBR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cmbr,
		 d => data_bus,
		 q => MBR_out);


b2v_MBR_buffer : tri_state_model
PORT MAP(enable => embr,
		 data_in => MBR_out,
		 data_out => data_bus);


b2v_PC : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cpc,
		 d => PC_in,
		 q => PC_out);


b2v_PC_buffer : tri_state_model
PORT MAP(enable => epc,
		 data_in => PC_out,
		 data_out => data_bus);

address_bus(4 DOWNTO 0) <= MAR_out(4 DOWNTO 0);
opcode(2 DOWNTO 0) <= IR_out(7 DOWNTO 5);

PC_in(7 DOWNTO 5) <= "000";
END bdf_type;