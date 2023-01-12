LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component LearningAct6
    PORT
      (
        opcode : in std_logic_vector(2 downto 0);
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
  END component;

  signal reset_signal :  STD_LOGIC := '0';
  signal clock_signal :  STD_LOGIC := '0';
  signal opcode_signal : std_logic_vector(2 downto 0);
  signal t0_signal : std_logic;
  signal t1_signal : std_logic;
  signal t2_signal : std_logic;
  signal t3_signal : std_logic;
  signal t4_signal : std_logic;
  signal t5_signal : std_logic;
  signal t6_signal : std_logic;
  signal t7_signal : std_logic;
  signal execute_signal : std_logic;

BEGIN 

  instruction_sequencer_0 : LearningAct6
    PORT MAP(
      opcode => opcode_signal,
      reset => reset_signal,
      clock => clock_signal,
      t0 => t0_signal,
      t1 => t1_signal,
      t2 => t2_signal,
      t3 => t3_signal,
      t4 => t4_signal,
      t5 => t5_signal,
      t6 => t6_signal,
      t7 => t7_signal,
      execute => execute_signal
      );

  clock_process : process
  begin
    wait for 50 ns;
    clock_signal <= not clock_signal;
  end process;

  testbench_process : process
    variable opcode_index : integer := 0;
  begin
    
    -- Enable/disable reset, generate opcode signal, then wait for successive clock signals
    for opcode_index in 0 to 7 loop
      
      reset_signal <= '1';
      wait for 1 ns;
      reset_signal <= '0';
      wait for 1 ns;
      opcode_signal <= std_logic_vector(to_unsigned(opcode_index,3));
      wait for 1 ns;

      -- After reset and before the first rising clock edge, the expected outputs
      -- should be T0 = 1 with all other timing signals equal to 0. Execute = 0.
      assert (t0_signal = '1') report "T0 incorrect for current state = 000";
      assert (t0_signal /= '1') report "T0 correct for current state = 000";
      assert (execute_signal = '0') report "Execute incorrect for current state = 000";
      assert (execute_signal /= '0') report "Execute correct for current state = 000";

      -- At the first rising clock edge, the instruction sequencer will
      -- transition to the next state. So, by the next falling clock edge,
      -- the outputs will be updated so that T1 = 1 and Execute = 0.
      wait until rising_edge(clock_signal);
      wait until falling_edge(clock_signal);
      assert (t1_signal = '1') report "T1 incorrect for current state = 001";
      assert (t1_signal /= '1') report "T1 correct for current state = 001";
      assert (execute_signal = '0') report "Execute incorrect for current state = 001";
      assert (execute_signal /= '0') report "Execute correct for current state = 001";

      -- Now, T2 = 1 and Execute = 0.
      wait until falling_edge(clock_signal);
      assert (t2_signal = '1') report "T2 incorrect for current state = 010";
      assert (t2_signal /= '1') report "T2 correct for current state = 010";
      assert (execute_signal = '0') report "Execute incorrect for current state = 010";
      assert (execute_signal /= '0') report "Execute correct for current state = 010";

      -- Now, T3 = 1 and Execute = 0.
      wait until falling_edge(clock_signal);
      assert (t3_signal = '1') report "T3 incorrect for current state = 011";
      assert (t3_signal /= '1') report "T3 correct for current state = 011";
      assert (execute_signal = '0') report "Execute incorrect for current state = 011";
      assert (execute_signal /= '0') report "Execute correct for current state = 011";

      -- Now, T4 = 1 and Execute = 1.
      wait until falling_edge(clock_signal);
      assert (t4_signal = '1') report "T4 incorrect for current state = 100";
      assert (t4_signal /= '1') report "T4 correct for current state = 100";
      assert (execute_signal = '1') report "Execute incorrect for current state = 100";
      assert (execute_signal /= '1') report "Execute correct for current state = 100";

      -- Here, if the opcode is 110 (branch instruction) or 111 (Branch equal
      -- zero instruction), then the instruction sequencer will reset to
      -- current state = 000, which means that T0 will once again equal 1 and
      -- Execute = 0. Otherwise, for all other instructions, T5 = 1 and
      -- Execute = 1.
      wait until falling_edge(clock_signal);
      if (opcode_index >= 6) then
        assert (t0_signal = '1') report "T0 incorrect for current state = 000";
        assert (t0_signal /= '1') report "T0 correct for current state = 000";
        assert (execute_signal = '0') report "Execute incorrect for current state = 000";
        assert (execute_signal /= '0') report "Execute correct for current state = 000";
      else
        assert (t5_signal = '1') report "T5 incorrect for current state = 101";
        assert (t5_signal /= '1') report "T5 correct for current state = 101";
        assert (execute_signal = '1') report "Execute incorrect for current state = 101";
        assert (execute_signal /= '1') report "Execute correct for current state = 101";
      end if;

      -- Likewise, if the opcode is 000 (load instruction) or 001 (store
      -- instruction), then the instruction sequencer will reset to current
      -- state = 000, which means T0 = 1 and Execute = 0. Otherwise, T6 = 1 and
      -- Execute = 1.
      wait until falling_edge(clock_signal);
      if (opcode_index >= 6) then
        assert (t1_signal = '1') report "T1 incorrect for current state = 001";
        assert (t1_signal /= '1') report "T1 correct for current state = 001";
        assert (execute_signal = '0') report "Execute incorrect for current state = 001";
        assert (execute_signal /= '0') report "Execute correct for current state = 001";
      elsif (opcode_index <= 1) then
        assert (t0_signal = '1') report "T0 incorrect for current state = 000";
        assert (t0_signal /= '1') report "T0 correct for current state = 000";
        assert (execute_signal = '0') report "Execute incorrect for current state = 000";
        assert (execute_signal /= '0') report "Execute correct for current state = 000";
      else
        assert (t6_signal = '1') report "T6 incorrect for current state = 110";
        assert (t6_signal /= '1') report "T6 correct for current state = 110";
        assert (execute_signal = '1') report "Execute incorrect for current state = 110";
        assert (execute_signal /= '1') report "Execute correct for current state = 110";
      end if;

      wait until falling_edge(clock_signal);
      if (opcode_index >= 6) then
        assert (t2_signal = '1') report "T2 incorrect for current state = 010";
        assert (t2_signal /= '1') report "T2 correct for current state = 010";
        assert (execute_signal = '0') report "Execute incorrect for current state = 010";
        assert (execute_signal /= '0') report "Execute correct for current state = 010";
      elsif (opcode_index <= 1) then
        assert (t1_signal = '1') report "T1 incorrect for current state = 001";
        assert (t1_signal /= '1') report "T1 correct for current state = 001";
        assert (execute_signal = '0') report "Execute incorrect for current state = 001";
        assert (execute_signal /= '0') report "Execute correct for current state = 001";
      else
        assert (t7_signal = '1') report "T7 incorrect for current state = 111";
        assert (t7_signal /= '1') report "T7 correct for current state = 111";
        assert (execute_signal = '1') report "Execute incorrect for current state = 111";
        assert (execute_signal /= '1') report "Execute correct for current state = 111";
      end if;

    end loop;

    wait;
    
  end process testbench_process;

END gate_level;
