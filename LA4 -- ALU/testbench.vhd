LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component ALU IS 
    PORT
      (
      p :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		f1 :  IN  STD_LOGIC;
		f0 :  IN  STD_LOGIC;
		Z :  OUT  STD_LOGIC;
		ALU_out : OUT  STD_LOGIC_VECTOR(7 downto 0)
	   );
  END component;
  
  signal p_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal q_tb :  STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal f1_tb : STD_LOGIC;
  signal f0_tb : STD_LOGIC;
  signal ALU_output : STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal Z_output : STD_LOGIC;

BEGIN 

  -- Component instantiation of Device Under Test (DUT)
  ALU_0 : ALU
    PORT MAP(
      p => p_tb,  
      q => q_tb,
		f1 => f1_tb,
		f0 => f0_tb,
		ALU_out => ALU_output,
		Z => Z_output
      );

  -- Concurrent process statement that applies input test vectors and
  -- monitors output results
  testbench_process : process
  begin

    -- Assign input and expected output values, and then create
    -- a time delay and compare actual output with expected output.
    p_tb <= "00000011";
	 q_tb <= "00000010";
	 f1_tb <= '0';
	 f0_tb <= '0';
	 
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (ALU_output = "00000101") report "Output incorrect for 00000011 + 00000010" severity note;
    assert (ALU_output /= "00000101") report "Output correct for databits 00000011 + 00000010" severity note;
	 
	 assert (Z_output = '0') report "Output incorrect for 00000011 + 00000010" severity note;
	 assert (Z_output /= '0') report "Output correct for 00000011 + 00000010" severity note;
	 
    wait for 10 ns;
	 
	  -- Assign input and expected output values, and then create
    -- a time delay and compare actual output with expected output.
    p_tb <= "00000010";
	 q_tb <= "00000011";
	 f0_tb <= '1';
	 
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (ALU_output = "11111111") report "Output incorrect for 00000010 + 00000011" severity note;
    assert (ALU_output /= "11111111") report "Output correct for databits 00000010 + 00000011" severity note;
	 
	 assert (Z_output = '0') report "Output incorrect for 00000010 + 00000011" severity note;
	 assert (Z_output /= '0') report "Output correct for 00000010 + 00000011" severity note;
	 
    wait for 10 ns;
	 
	  -- Assign input and expected output values, and then create
    -- a time delay and compare actual output with expected output.
    p_tb <= "00000000";
	 q_tb <= "00000001";
	 f0_tb <= '0';
	 f1_tb <= '1';
	 
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (ALU_output = "00000010") report "Output incorrect for 00000000 + 00000001" severity note;
    assert (ALU_output /= "00000010") report "Output correct for databits 00000000 + 00000001" severity note;
	 
	 assert (Z_output = '0') report "Output incorrect for 00000000 + 00000001" severity note;
	 assert (Z_output /= '0') report "Output correct for 00000000 + 00000001" severity note;
	 
    wait for 10 ns;
	 
	  -- Assign input and expected output values, and then create
    -- a time delay and compare actual output with expected output.
	 f0_tb <= '1';
	 
    wait for 10 ns;
    -- Compare actual and expected outputs.
    assert (ALU_output = "00000000") report "Output incorrect for 00000011 + 00000001" severity note;
    assert (ALU_output /= "00000000") report "Output correct for databits 00000011 + 00000001" severity note;
	 
	 assert (Z_output = '0') report "Output incorrect for 00000011 + 00000001" severity note;
	 assert (Z_output /= '0') report "Output correct for 00000011 + 00000001" severity note;
	 
    wait for 10 ns;
	 
	 
    -- Finally, a wait statement without any time parameter suspends the
    -- process indefintely.
    wait;
    
  end process testbench_process;

END gate_level;
