LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component LearningAct5
    port
      (
        reset :  IN  STD_LOGIC;
        clock :  IN  STD_LOGIC;
        cmar :  IN  STD_LOGIC;
        cmbr :  IN  STD_LOGIC;
        embr :  IN  STD_LOGIC;
        cir :  IN  STD_LOGIC;
        eir :  IN  STD_LOGIC;
        cpc :  IN  STD_LOGIC;
        epc :  IN  STD_LOGIC;
        cd0 :  IN  STD_LOGIC;
        ed0 :  IN  STD_LOGIC;
        calu :  IN  STD_LOGIC;
        ealu :  IN  STD_LOGIC;
        F0 :  IN  STD_LOGIC;
        F1 :  IN  STD_LOGIC;
        data_bus :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
        address_bus :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
        opcode :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0);
        Z :  OUT  STD_LOGIC
        );
  END component;

  signal reset_signal :  STD_LOGIC := '0';
  signal clock_signal :  STD_LOGIC := '0';
  signal cmar_signal :  STD_LOGIC;
  signal cmbr_signal :  STD_LOGIC;
  signal embr_signal :  STD_LOGIC;
  signal cir_signal :  STD_LOGIC;
  signal eir_signal :  STD_LOGIC;
  signal cpc_signal :  STD_LOGIC;
  signal epc_signal :  STD_LOGIC;
  signal cd0_signal :  STD_LOGIC;
  signal ed0_signal :  STD_LOGIC;
  signal calu_signal :  STD_LOGIC;
  signal ealu_signal :  STD_LOGIC;
  signal f0_signal :  STD_LOGIC;
  signal f1_signal :  STD_LOGIC;
  signal data_bus :  STD_LOGIC_VECTOR(7 DOWNTO 0);
  signal address_bus :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  signal opcode :  STD_LOGIC_VECTOR(2 DOWNTO 0);
  signal Z :  STD_LOGIC;
  signal MAR_expected : std_logic_vector(7 downto 0) := "11111111";
  signal MBR_expected : std_logic_vector(7 downto 0) := "00000001";
  signal IR_expected : std_logic_vector(7 downto 0) := "11100010";
  signal PC_expected : std_logic_vector(7 downto 0) := "00000011";
  signal D0_expected : std_logic_vector(7 downto 0) := "00000100";
  signal fPQ_expected : std_logic_vector(7 downto 0) := "00000100";

BEGIN 

  datapath_0 : LearningAct5
    PORT MAP(
      reset => reset_signal,
      clock => clock_signal,
      cmar => cmar_signal,
      cmbr => cmbr_signal,
      embr => embr_signal,
      cir => cir_signal,
      eir => eir_signal,
      cpc => cpc_signal,
      epc => epc_signal,
      cd0 => cd0_signal,
      ed0 => ed0_signal,
      calu => calu_signal,
      ealu => ealu_signal,
      F0 => f0_signal,
      F1 => f1_signal,
      data_bus => data_bus,
      address_bus => address_bus,
      opcode => opcode,
      Z => z
      );

  clock_process : process
  begin
    wait for 50 ns;
    clock_signal <= not clock_signal;
  end process;

  testbench_process : process
  begin

    -- Begin by initializing the input control signals.
    cmar_signal <= '0';
    cmbr_signal <= '0';
    embr_signal <= '0';
    cir_signal <= '0';
    eir_signal <= '0';
    cpc_signal <= '0';
    epc_signal <= '0';
    cd0_signal <= '0';
    ed0_signal <= '0';
    calu_signal <= '0';
    ealu_signal <= '0';
    f0_signal <= '0';
    f1_signal <= '0';
    data_bus <= (others => 'Z');

    -- Then initialize the registers at reset.
    reset_signal <= '1';
    wait for 10 ns;
    reset_signal <= '0';

    -- Now, load each register with a value from the data_bus.
    -- Memory Address Register (MAR)
    data_bus <= MAR_expected;
    cmar_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    cmar_signal <= '0' after 5 ns;
    
    -- Memory Buffer Register (MBR)
    data_bus <= MBR_expected;
    cmbr_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    cmbr_signal <= '0' after 5 ns;

    -- Instruction Register (IR)
    data_bus <= IR_expected;
    cir_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    cir_signal <= '0' after 5 ns;

    -- Program Counter (PC)
    data_bus <= PC_expected;
    cpc_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    cpc_signal <= '0' after 5 ns;

    -- Data Register 0 (D0)
    data_bus <= D0_expected;
    cd0_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    cd0_signal <= '0' after 5 ns;

    -- ALU register (fPQ)
    data_bus <= (others => '0');
    calu_signal <= '1' after 5 ns;
    wait until rising_edge(clock_signal);
    calu_signal <= '0' after 5 ns;

    -- Now, confirm that the registers have been loading by having
    -- each register drive the data bus.
    data_bus <= (others => 'Z');

    -- Compare actual and expected outputs.
    assert (address_bus = MAR_expected(4 downto 0)) report "Output incorrect for MAR" severity note;
    assert (address_bus /= MAR_expected(4 downto 0)) report "Output correct for MAR" severity note;

    -- MBR
    embr_signal <= '1' after 5 ns;
    wait until falling_edge(clock_signal);

    -- Compare actual and expected outputs.
    assert (data_bus = MBR_expected) report "Output incorrect for MBR" severity note;
    assert (data_bus /= MBR_expected) report "Output correct for MBR" severity note;

    wait until rising_edge(clock_signal);
    embr_signal <= '0' after 5 ns;

    -- IR
    eir_signal <= '1' after 5 ns;
    wait until falling_edge(clock_signal);

    -- Compare actual and expected outputs.
    assert (data_bus = IR_expected) report "Output incorrect for IR" severity note;
    assert (data_bus /= IR_expected) report "Output correct for IR" severity note;

    wait until rising_edge(clock_signal);
    eir_signal <= '0' after 5 ns;

    -- PC
    epc_signal <= '1' after 5 ns;
    wait until falling_edge(clock_signal);

    -- Compare actual and expected outputs.
    assert (data_bus = PC_expected) report "Output incorrect for PC" severity note;
    assert (data_bus /= PC_expected) report "Output correct for PC" severity note;

    wait until rising_edge(clock_signal);
    epc_signal <= '0' after 5 ns;

    -- D0
    ed0_signal <= '1' after 5 ns;
    wait until falling_edge(clock_signal);

    -- Compare actual and expected outputs.
    assert (data_bus = D0_expected) report "Output incorrect for D0" severity note;
    assert (data_bus /= D0_expected) report "Output correct for D0" severity note;

    wait until rising_edge(clock_signal);
    ed0_signal <= '0' after 5 ns;

    -- fPQ
    ealu_signal <= '1' after 5 ns;
    wait until falling_edge(clock_signal);

    -- Compare actual and expected outputs.
    assert (data_bus = fPQ_expected) report "Output incorrect for fPQ" severity note;
    assert (data_bus /= fPQ_expected) report "Output correct for fPQ" severity note;

    wait until rising_edge(clock_signal);
    ealu_signal <= '0' after 5 ns;

    wait;
    
  end process testbench_process;

END gate_level;
