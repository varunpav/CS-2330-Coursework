LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component decoder IS 
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
  END component;

  signal opcode_tb : STD_LOGIC_VECTOR(2 DOWNTO 0);
  signal execute_tb :  STD_LOGIC;
  signal load_tb :  STD_LOGIC;
  signal store_tb :  STD_LOGIC;
  signal add_tb :  STD_LOGIC;
  signal sub_tb :  STD_LOGIC;
  signal inc_tb :  STD_LOGIC;
  signal dec_tb :  STD_LOGIC;
  signal bra_tb :  STD_LOGIC;
  signal beq_tb :  STD_LOGIC;

BEGIN 

  -- Component instantiation of Device Under Test (DUT)
  decoder_0 : decoder
    PORT MAP(
      opcode => opcode_tb,  
      execute => execute_tb,
		load => load_tb,
		store => store_tb,
		add => add_tb,
		sub => sub_tb,
		inc => inc_tb,
		dec => dec_tb,
		bra => bra_tb,
		beq => beq_tb
      );

  -- Concurrent process statement that applies input test vectors and
  -- monitors output results
  testbench_process : process
  begin

    -- Assign input and expected output values, and then create
    -- a time delay and compare actual output with expected output.
    opcode_tb <= "000";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (load_tb = '1') report "Output incorrect for opcode 000 and execute 1" severity note;
    assert (load_tb /= '1') report "Output correct for opcode 000 and execute 1" severity note;
	 
	 opcode_tb <= "000";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (load_tb = '0') report "Output incorrect for opcode 000 and execute 0" severity note;
    assert (load_tb /= '0') report "Output correct for opcode 000 and execute 0" severity note;

    opcode_tb <= "001";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (store_tb = '1') report "Output incorrect for opcode 001 and execute 1" severity note;
    assert (store_tb /= '1') report "Output correct for opcode 001 and execute 1" severity note;
	 
	 opcode_tb <= "001";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (store_tb = '0') report "Output incorrect for opcode 001 and execute 0" severity note;
    assert (store_tb /= '0') report "Output correct for opcode 001 and execute 0" severity note;

    opcode_tb <= "010";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (add_tb = '1') report "Output incorrect for opcode 010 and execute 1" severity note;
    assert (add_tb /= '1') report "Output correct for opcode 010 and execute 1" severity note;
	 
	 opcode_tb <= "010";
	 execute_tb <='0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (add_tb = '0') report "Output incorrect for opcode 010 and execute 0" severity note;
    assert (add_tb /= '0') report "Output correct for opcode 010 and execute 0" severity note;

    opcode_tb <= "011";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (sub_tb = '1') report "Output incorrect for opcode 011 and execute 1" severity note;
    assert (sub_tb /= '1') report "Output correct for opcode 011 and execute 1" severity note;
	 
	 opcode_tb <= "011";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (sub_tb = '0') report "Output incorrect for opcode 011 and execute 0" severity note;
    assert (sub_tb /= '0') report "Output correct for opcode 011 and execute 0" severity note;

    opcode_tb <= "100";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (inc_tb = '1') report "Output incorrect for opcode 100 and execute 1" severity note;
    assert (inc_tb /= '1') report "Output correct for opcode 100 and execute 1" severity note;
	 
	 opcode_tb <= "100";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (inc_tb = '0') report "Output incorrect for opcode 100 and execute 0" severity note;
    assert (inc_tb /= '0') report "Output correct for opcode 100 and execute 0" severity note;

    opcode_tb <= "101";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (dec_tb = '1') report "Output incorrect for opcode 101 and execute 1" severity note;
    assert (dec_tb /= '1') report "Output correct for opcode 101 and execute 1" severity note;
	 
	 opcode_tb <= "101";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (dec_tb = '0') report "Output incorrect for opcode 101 and execute 0" severity note;
    assert (dec_tb /= '0') report "Output correct for opcode 101 and execute 0" severity note;


    opcode_tb <= "110";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (bra_tb = '1') report "Output incorrect for opcode 110 and execute 1" severity note;
    assert (bra_tb /= '1') report "Output correct for opcode 110 and execute 1" severity note;
	 
	 opcode_tb <= "110";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (bra_tb = '0') report "Output incorrect for opcode 110 and execute 0" severity note;
    assert (bra_tb /= '0') report "Output correct for opcode 110 and execute 0" severity note;

    opcode_tb <= "111";
	 execute_tb <= '1';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (beq_tb = '1') report "Output incorrect for opcode 111 and execute 1" severity note;
    assert (beq_tb /= '1') report "Output correct for opcode 111 and execute 1" severity note;
	 
	 opcode_tb <= "111";
	 execute_tb <= '0';
    wait for 10 ns;

    -- Compare actual and expected outputs.
    assert (beq_tb = '0') report "Output incorrect for opcode 111 and execute 0" severity note;
    assert (beq_tb /= '0') report "Output correct for opcode 111 and execute 0" severity note;

    -- Finally, a wait statement without any time parameter suspends the
    -- process indefintely.
    wait;
    
  end process testbench_process;

END gate_level;
