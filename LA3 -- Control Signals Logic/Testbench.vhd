LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench IS 
END testbench;

ARCHITECTURE gate_level OF testbench IS 

  component LA3
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
  END component;

  -- input signals
  signal reset_signal :  STD_LOGIC;
  signal clock_signal :  STD_LOGIC;
  signal load_signal :  STD_LOGIC;
  signal store_signal :  STD_LOGIC;
  signal add_signal :  STD_LOGIC;
  signal sub_signal :  STD_LOGIC;
  signal inc_signal :  STD_LOGIC;
  signal dec_signal :  STD_LOGIC;
  signal bra_signal :  STD_LOGIC;
  signal beq_signal :  STD_LOGIC;
  signal t0_signal :  STD_LOGIC;
  signal t1_signal :  STD_LOGIC;
  signal t2_signal :  STD_LOGIC;
  signal t3_signal :  STD_LOGIC;
  signal t4_signal :  STD_LOGIC;
  signal t5_signal :  STD_LOGIC;
  signal t6_signal :  STD_LOGIC;
  signal t7_signal :  STD_LOGIC;
  signal Z_signal :  STD_LOGIC;

  -- output signals
  signal r_signal :  STD_LOGIC;
  signal w_signal :  STD_LOGIC;
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

  signal r_expected :  STD_LOGIC;
  signal w_expected :  STD_LOGIC;
  signal cmar_expected :  STD_LOGIC;
  signal cmbr_expected :  STD_LOGIC;
  signal embr_expected :  STD_LOGIC;
  signal cir_expected :  STD_LOGIC;
  signal eir_expected :  STD_LOGIC;
  signal cpc_expected :  STD_LOGIC;
  signal epc_expected :  STD_LOGIC;
  signal cd0_expected :  STD_LOGIC;
  signal ed0_expected :  STD_LOGIC;
  signal calu_expected :  STD_LOGIC;
  signal ealu_expected :  STD_LOGIC;
  signal f0_expected :  STD_LOGIC;
  signal f1_expected :  STD_LOGIC;

BEGIN 

  control_signals_logic_0 : LA3
    PORT MAP(
    reset => reset_signal,
    clock => clock_signal,
    load => load_signal,
    store => store_signal,
    add => add_signal,
    sub => sub_signal,
    inc => inc_signal,
    dec => dec_signal,
    bra => bra_signal,
    beq => beq_signal,
    t0 => t0_signal,
    t1 => t1_signal,
    t2 => t2_signal,
    t3 => t3_signal,
    t4 => t4_signal,
    t5 => t5_signal,
    t6 => t6_signal,
    t7 => t7_signal,
    Z => Z_signal,
    r => r_signal,
    w => w_signal,
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
    F1 => f1_signal
      );

  testbench_process : process
  begin
    -- Input signals: Reset Clock Load Store Add Sub Inc Dec Bra Beq T0 T1 T2 T3 T4 T5 T6 T7 Z
    -- Output signals:  R W Cmar Cmbr Cpc Cir Cd0 Calu Embr Epc Eir Ed0 Ealu F1 F0

    -- Initialize input signals and expected values
    reset_signal <= '0';
    clock_signal <= '0';
    load_signal <= '0';
    store_signal <= '0';
    add_signal <= '0';
    sub_signal <= '0';
    inc_signal <= '0';
    dec_signal <= '0';
    bra_signal <= '0';
    beq_signal <= '0';
    t0_signal <= '0';
    t1_signal <= '0';
    t2_signal <= '0';
    t3_signal <= '0';
    t4_signal <= '0';
    t5_signal <= '0';
    t6_signal <= '0';
    t7_signal <= '0';
    Z_signal <= '0';
    
    r_expected <= '0';
    w_expected <= '0';
    cmar_expected <= '0';
    cmbr_expected <= '0';
    cpc_expected <= '0';
    cir_expected <= '0';
    cd0_expected <= '0';
    calu_expected <= '0';
    embr_expected <= '0';
    epc_expected <= '0';
    eir_expected <= '0';
    ed0_expected <= '0';
    ealu_expected <= '0';
    f1_expected <= '0';
    f0_expected <= '0';

    wait for 10 ns;

    -- Load instruction
    -- Fetch
    -- MAR <- [PC]
    clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';

	 assert (cmar_signal = cmar_expected) report "Output incorrect for Load Fetch MAR <- PC; CMAR expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Load Fetch MAR <- PC; CMAR expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Load Fetch MAR <- PC; EPC expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Load Fetch MAR <- PC; EPC expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;
	 
    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';

    -- IR <- [MAR]
    clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Load Fetch IR <- [Mar]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Load Fetch IR <- [Mar]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect for Load Fetch IR <- [Mar]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Load Fetch IR <- [Mar]; cir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';

    -- ALU (Q) <- [PC]
    clock_signal <= not clock_signal;
    t2_signal <= '1';
    load_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Load Fetch ALU (Q) <- PC; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Load Fetch ALU (Q) <- PC; calu expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect for Load Fetch ALU (Q) <- PC; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Load Fetch ALU (Q) <- PC; cir expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Load Fetch ALU (Q) <- PC; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Load Fetch ALU (Q) <- PC; f1 expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';

    -- PC <- [ALU]
    clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';

	 assert (cpc_signal = cpc_expected) report "Output incorrect for Load Fetch PC <- ALU; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Load Fetch PC <- ALU; cpc expected 1" severity note;
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Load Fetch PC <- ALU; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Load Fetch PC <- ALU; ealu expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';

    -- MAR <- [IR]
    clock_signal <= not clock_signal;
    t4_signal <= '1';
    cmar_expected <= '1';
    eir_expected <= '1';

	 assert (cmar_signal = cmar_expected) report "Output incorrect for Load Fetch MAR <- IR; CMAR expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Load Fetch MAR <- IR; CMAR expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Load Fetch MAR <- IR; Eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Load Fetch MAR <- IR; Eir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;
    
    t4_signal <= '0';
    cmar_expected <= '0';
    eir_expected <= '0';

    -- D0 <- [MAR]
    clock_signal <= not clock_signal;
    t5_signal <= '1';
    r_expected <= '1';
    cd0_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Load Fetch DO mar; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Load Fetch Do mar; r expected 1" severity note;
	 assert (cd0_signal = cd0_expected) report "Output incorrect for Load D0  [MAR]; cd0 expected 1" severity note;
    assert (cd0_signal /= cd0_expected) report "Output correct for Load D0  [MAR]; cd0 expected 1" severity note;
	
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;
    
    load_signal <= '0';
    t5_signal <= '0';
    r_expected <= '0';
    cd0_expected <= '0';

    -- Store instruction
    -- Fetch
    -- MAR <- [PC]
    clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';

	 assert (cmar_signal = cmar_expected) report "Output incorrect for Store Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Store Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Store Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Store Fetch MAR <- [PC]; epc expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Store Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Store Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect for Store Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Store Fetch IR <- [MAR]; cir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    store_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Store ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Store ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Store ALU (Q) <- [PC] epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Store ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Store ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Store ALU (Q) <- [PC]; f1 expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';

	 assert (cpc_signal = cpc_expected) report "Output incorrect for Store PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Store PC <- [ALU]; cpc expected 1" severity note;
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Store PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Store PC <- [ALU]; ealu expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- MAR <- [IR]
	 clock_signal <= not clock_signal;
	 t4_signal <= '1';
	 cmar_expected <= '1';
	 eir_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Store MAR <- [IR]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Store MAR <- [IR]; cmar expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Store MAR <- [IR]; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Store MAR <- [IR]; eir expected 1" severity note;
	 
	 wait for 10 ns; 
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t4_signal <= '0';
	 cmar_expected <= '0';
	 eir_expected <= '0';
	 
    -- [MAR] <- [D0]
	 clock_signal <= not clock_signal;
	 t5_signal <= '1';
	 r_expected <= '1';
	 ed0_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Store [MAR] <- [D0]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Store [MAR] <- [D0]; r expected 1" severity note;
	 assert (ed0_signal = ed0_expected) report "Output incorrect for Store [MAR] <- [D0]; ed0 expected 1" severity note;
    assert (ed0_signal /= ed0_expected) report "Output correct for Store [MAR] <- [D0]; ed0 expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;

	 t5_signal <= '0';
	 r_expected <= '0';
	 ed0_expected <= '0';
	 store_signal <= '0';
	 
    -- Add instruction
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';

	 assert (cmar_signal = cmar_expected) report "Output incorrect for Add Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Add Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Add Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Add Fetch MAR <- [PC]; epc expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Add Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Add Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect for Add Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Add Fetch IR <- [MAR]; cir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';

    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    add_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Add Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Add Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Add Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Add Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Add Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Add Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';

	 assert (cpc_signal = cpc_expected) report "Output incorrect for Add Fetch PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Add Fetch PC <- [ALU]; cpc expected 1" severity note;
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Add Fetch PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Add Fetch PC <- [ALU]; ealu expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- MAR <- [IR]
	 clock_signal <= not clock_signal;
	 t4_signal <= '1';
	 cmar_expected <= '1';
	 eir_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Add MAR <- [IR]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Add MAR <- [IR]; cmar expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Add MAR <- [IR]; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Add MAR <- [IR]; eir expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t4_signal <='0';
	 cmar_expected <= '0';
	 eir_expected <= '0';
	 
    -- MBR <- [MAR]
	 clock_signal <= not clock_signal;
	 t5_signal <= '1';
	 r_expected <= '1';
	 cmbr_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Add MBR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Add MBR <- [MAR]; r expected 1" severity note;
	 assert (cmbr_signal = cmbr_expected) report "Output incorrect for Add MBR <- [MAR]; cmbr expected 1" severity note;
    assert (cmbr_signal /= cmbr_expected) report "Output correct for Add MBR <- [MAR]; cmbr expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t5_signal <= '0';
	 r_expected <= '0';
	 cmbr_expected <= '0';
	 
    -- ALU (P) <- [MBR]
	 clock_signal <= not clock_signal;
	 t6_signal <= '1';
	 calu_expected <= '1';
	 embr_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Add ALU (P) <- [MBR]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Add ALU (P) <- [MBR]; calu expected 1" severity note;
	 assert (embr_signal = embr_expected) report "Output incorrect for Add ALU (P) <- [MBR]; embr expected 1" severity note;
    assert (embr_signal /= embr_expected) report "Output correct for Add ALU (P) <- [MBR]; embr expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t6_signal <= '0';
	 calu_expected <= '0';
	 embr_expected <= '0';
	 
    -- D0 <- [ALU]
	 clock_signal <= not clock_signal;
	 t7_signal <= '1';
	 cd0_expected <= '1';
	 ealu_expected <= '1';
	 
	 assert (cd0_signal = cd0_expected) report "Output incorrect for Add D0 <- [ALU]; cd0 expected 1" severity note;
    assert (cd0_signal /= cd0_expected) report "Output correct for Add D0 <- [ALU]; cd0 expected 1" severity note;
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Add D0 <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Add D0 <- [ALU]; ealu expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t7_signal <= '0';
	 cd0_expected <= '0';
	 ealu_expected <= '0';
	 add_signal <= '0';

    -- Sub instruction
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';

	 assert (cmar_signal = cmar_expected) report "Output incorrect for Sub Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Sub Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Sub Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Sub Fetch MAR <- [PC]; epc expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Sub Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Sub Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect for Sub Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Sub Fetch IR <- [MAR]; cir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    sub_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Sub Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Sub Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Sub Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Sub Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Sub Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Sub Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
	
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';

	 assert (ealu_signal = ealu_expected) report "Output incorrect for Sub Fetch PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Sub Fetch PC <- [ALU]; ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Sub Fetch PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Sub Fetch PC <- [ALU]; cpc expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- MAR <- [IR]
	 clock_signal <= not clock_signal;
	 t4_signal <= '1';
	 cmar_expected <= '1';
	 eir_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Sub MAR <- [IR]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Sub MAR <- [IR]; cmar expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Sub MAR <- [IR]; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Sub MAR <- [IR]; eir expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t4_signal <= '0';
	 cmar_expected <= '0';
	 eir_expected <= '0';
	 
    -- MBR <- [MAR]
	 clock_signal <= not clock_signal;
	 t5_signal <= '1';
	 r_expected <= '1';
	 cmbr_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Sub MBR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Sub MBR <- [MAR]; r expected 1" severity note;
	 assert (cmbr_signal = cmbr_expected) report "Output incorrect for Sub MBR <- [MAR]; cmbr expected 1" severity note;
    assert (cmbr_signal /= cmbr_expected) report "Output correct for Sub MBR <- [MAR]; cmbr expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t5_signal <= '0';
	 r_expected <= '0';
	 cmbr_expected <= '0';
	 
    -- ALU (P) <- [MBR]
	 clock_signal <= not clock_signal;
	 t6_signal <= '1';
	 calu_expected <= '1';
	 embr_expected <= '1';
	 f0_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Sub ALU (P) <- [MBR]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Sub ALU (P) <- [MBR]; calu expected 1" severity note;
	 assert (embr_signal = embr_expected) report "Output incorrect for Sub ALU (P) <- [MBR]; embr expected 1" severity note;
    assert (embr_signal /= embr_expected) report "Output correct for Sub ALU (P) <- [MBR]; embr expected 1" severity note;
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t6_signal <= '0';
	 calu_expected <= '0';
	 embr_expected <= '0';
	 f0_expected <= '0';
	 
    -- D0 <- [ALU]
    clock_signal <= not clock_signal;
	 t7_signal <= '1';
	 cd0_expected <= '1';
	 ealu_expected <= '1';
	 
	 assert (cd0_signal = cd0_expected) report "Output incorrect for Sub D0 <- [ALU]; cd0 expected 1" severity note;
    assert (cd0_signal /= cd0_expected) report "Output correct for Sub D0 <- [ALU]; cd0 expected 1" severity note;
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Sub D0 <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Sub D0 <- [ALU]; ealu expected 1" severity note;
	 
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t7_signal <= '0';
	 cd0_expected <= '0';
	 ealu_expected <= '0';
	 sub_signal <= '0';
	 
    -- Inc instruction
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Inc Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Inc Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Inc Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Inc Fetch MAR <- [PC]; epc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Inc Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Inc Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect Inc Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Inc Fetch IR <- [MAR]; cir expected 1" severity note;
	 
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    inc_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Inc Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Inc Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Inc Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Inc Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Inc Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Inc Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Inc Fetch PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Inc Fetch PC <- [ALU]; ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Inc Fetch PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Inc Fetch PC <- [ALU]; cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- MAR <- [IR]
	 clock_signal <= not clock_signal;
    t4_signal <= '1';
    cmar_expected <= '1';
    eir_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Inc MAR <- [IR]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Inc MAR <- [IR]; cmar expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Inc MAR <- [IR]; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Inc MAR <- [IR]; eir expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t4_signal <= '0';
    cmar_expected <= '0';
    eir_expected <= '0';
	 
    -- MBR <- [MAR]
	 clock_signal <= not clock_signal;
    t5_signal <= '1';
    r_expected <= '1';
    cmbr_expected <= '1';
	 
	 assert (cmbr_signal = cmbr_expected) report "Output incorrect for Inc MBR <- [MAR]; cmbr expected 1" severity note;
    assert (cmbr_signal /= cmbr_expected) report "Output correct for Inc MBR <- [MAR]; cmbr expected 1" severity note;
	 assert (r_signal = r_expected) report "Output incorrect for Inc MBR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Inc MBR <- [MAR]; r expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t5_signal <= '0';
    r_expected <= '0';
    cmbr_expected <= '0';
	 
    -- ALU (P) <- [MBR]
	 clock_signal <= not clock_signal;
    t6_signal <= '1';
    calu_expected <= '1';
    embr_expected <= '1';
	 f1_expected <= '1';
	 
	 assert (embr_signal = embr_expected) report "Output incorrect for Inc ALU (P) <- [MBR]; embr expected 1" severity note;
    assert (embr_signal /= embr_expected) report "Output correct for Inc ALU (P) <- [MBR]; embr expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Inc ALU (P) <- [MBR]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Inc ALU (P) <- [MBR]; f1 expected 1" severity note;
	 assert (calu_signal = calu_expected) report "Output incorrect for Inc ALU (P) <- [MBR]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Inc ALU (P) <- [MBR]; calu expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t6_signal <= '0';
    calu_expected <= '0';
    embr_expected <= '0';
	 f1_expected <= '0';
	 
    -- D0 <- [ALU]
	 clock_signal <= not clock_signal;
    t7_signal <= '1';
    w_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Inc D0 <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Inc D0 <- [ALU]; ealu expected 1" severity note;
	 assert (w_signal = w_expected) report "Output incorrect for Inc D0 <- [ALU]; w expected 1" severity note;
    assert (w_signal /= w_expected) report "Output correct for Inc D0 <- [ALU]; w expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t7_signal <= '0';
    w_expected <= '0';
    ealu_expected <= '0';
	 inc_signal <= '0';
	 
    -- Dec instruction
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Dec Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Dec Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Dec Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Dec Fetch MAR <- [PC]; epc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Dec Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Dec Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect Dec Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Dec Fetch IR <- [MAR]; cir expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    dec_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Dec Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Dec Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Dec Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Dec Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Dec Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Dec Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Dec Fetch PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Dec Fetch PC <- [ALU]; ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Dec Fetch PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Dec Fetch PC <- [ALU]; cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- MAR <- [IR]
	 clock_signal <= not clock_signal;
    t4_signal <= '1';
    cmar_expected <= '1';
    eir_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Dec Mar <- IR; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Dec Mar <- IR; cmar expected 1" severity note;
	 assert (eir_signal = eir_expected) report "Output incorrect for Dec Mar <- IR; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Dec Mar <- IR; eir expected 1" severity note;


    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t4_signal <= '0';
    cmar_expected <= '0';
    eir_expected <= '0';
	 
    -- MBR <- [MAR]
	 clock_signal <= not clock_signal;
    t5_signal <= '1';
    r_expected <= '1';
    cmbr_expected <= '1';
	 
	 assert (cmbr_signal = cmbr_expected) report "Output incorrect for Dec MBR <- [MAR]; cmbr expected 1" severity note;
    assert (cmbr_signal /= cmbr_expected) report "Output correct for Dec MBR <- [MAR]; cmbr expected 1" severity note;
	 assert (r_signal = r_expected) report "Output incorrect for Dec MBR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Dec MBR <- [MAR]; r expected 1" severity note;


    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t5_signal <= '0';
    r_expected <= '0';
    cmbr_expected <= '0';
	 
    -- ALU (P) <- [MBR]
	 clock_signal <= not clock_signal;
    t6_signal <= '1';
    calu_expected <= '1';
    embr_expected <= '1';
	 f1_expected <= '1';
	 f0_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Dec ALU (P) <- [MBR]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Dec ALU (P) <- [MBR]; calu expected 1" severity note;
	 assert (embr_signal = embr_expected) report "Output incorrect for Dec ALU (P) <- [MBR]; embr expected 1" severity note;
    assert (embr_signal /= embr_expected) report "Output correct for Dec ALU (P) <- [MBR]; embr expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Dec ALU (P) <- [MBR]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Dec ALU (P) <- [MBR]; f1 expected 1" severity note;
	 assert (f0_signal = f0_expected) report "Output incorrect for Dec ALU (P) <- [MBR]; f0 expected 1" severity note;
    assert (f0_signal /= f0_expected) report "Output correct for Dec ALU (P) <- [MBR]; f0 expected 1" severity note;

	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t6_signal <= '0';
    calu_expected <= '0';
    embr_expected <= '0';
	 f1_expected <= '0';
	 f0_expected <= '0';
	 
    -- D0 <- [ALU]
	 clock_signal <= not clock_signal;
    t7_signal <= '1';
    w_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Dec D0 <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Dec D0 <- [ALU]; ealu expected 1" severity note;
	 assert (w_signal = w_expected) report "Output incorrect for Dec D0 <- [ALU]; w expected 1" severity note;
    assert (w_signal /= w_expected) report "Output correct for Dec D0 <- [ALU]; w expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t7_signal <= '0';
    w_expected <= '0';
    ealu_expected <= '0';
	 dec_signal <= '0';
	 

    -- Bra instruction
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Bra Fetch MAR <- [PC]; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Bra Fetch MAR <- [PC]; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Bra Fetch MAR <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Bra Fetch MAR <- [PC]; epc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Bra Fetch IR <- [MAR]; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Bra Fetch IR <- [MAR]; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect Bra Fetch IR <- [MAR]; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Bra Fetch IR <- [MAR]; cir expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    bra_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Bra Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Bra Fetch ALU (Q) <- [PC]; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Bra Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Bra Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Bra Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Bra Fetch ALU (Q) <- [PC]; f1 expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Bra Fetch PC <- [ALU]; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Bra Fetch PC <- [ALU]; ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Bra Fetch PC <- [ALU]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Bra Fetch PC <- [ALU]; cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- PC <- [IR]
	 clock_signal <= not clock_signal;
    t4_signal <= '1';
    cpc_expected <= '1';
    eir_expected <= '1';

	 assert (eir_signal = eir_expected) report "Output incorrect for Bra Fetch PC <- [IR]; eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Bra Fetch PC <- [IR]; eir expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Bra Fetch PC <- [IR]; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Bra Fetch PC <- [IR]; cpc expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t4_signal <= '0';
    cpc_expected <= '0';
    eir_expected <= '0';
	 bra_signal <= '0';
	 
    -- Beq instruction
    -- To test the Beq instruction, we must use test vectors that assign Z = 0 and Z = 1.

    -- Assign Z = 1 and ensure the value is stored during T6 before the branch
    -- instruction.
	 clock_signal <= not clock_signal;
	 t6_signal <= '1';
	 add_signal <= '1';
	 Z_signal <= '1';
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t6_signal <= '0';
	 add_signal <= '0';
	 Z_signal <= '0';
	 
	 
    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Beq Fetch MAR <- [PC]; Z=1; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Beq Fetch MAR <- [PC]; Z=1; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Beq Fetch MAR <- [PC]; Z=1; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Beq Fetch MAR <- [PC]; Z=1; epc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';

	 assert (r_signal = r_expected) report "Output incorrect for Beq Fetch IR <- [MAR]; Z=1;  r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Beq Fetch IR <- [MAR]; Z=1;  r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect Beq Fetch IR <- [MAR]; Z=1;  cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Beq Fetch IR <- [MAR]; Z=1;  cir expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    beq_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';

	 assert (calu_signal = calu_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC]; Z=1;  calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC]; Z=1;  calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC]; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC];  Z=1; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC]; Z=1;  f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC]; Z=1;  f1 expected 1" severity note;
	 
    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Beq Fetch PC <- [ALU]; Z=1;  ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Beq Fetch PC <- [ALU]; Z=1;  ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Beq Fetch PC <- [ALU]; Z=1;  cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Beq Fetch PC <- [ALU]; Z=1;  cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- PC <- [IR]
	 clock_signal <= not clock_signal;
    t4_signal <= '1';
    cpc_expected <= '1';
    eir_expected <= '1';

	 assert (eir_signal = eir_expected) report "Output incorrect for Beq PC <- [IR]; Z=1;  eir expected 1" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Beq PC <- [IR]; Z=1;  eir expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Beq PC <- [IR]; Z=1;  cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Beq PC <- [IR]; Z=1;  cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t4_signal <= '0';
    cpc_expected <= '0';
	 beq_signal <= '0';
    eir_expected <= '0';

    -- Then, assign Z = 0 and once again ensure the value is stored before the
    -- branch.

    clock_signal <= not clock_signal;
	 t6_signal <= '1';
	 add_signal <= '1';
	 
	 wait for 10 ns;
	 clock_signal <= not clock_signal;
	 wait for 10 ns;
	 
	 t6_signal <= '0';
	 add_signal <= '0';

    -- Fetch
    -- MAR <- [PC]
	 clock_signal <= not clock_signal;
    t0_signal <= '1';
    cmar_expected <= '1';
    epc_expected <= '1';
	 
	 assert (cmar_signal = cmar_expected) report "Output incorrect for Beq Fetch MAR <- [PC];Z=0; cmar expected 1" severity note;
    assert (cmar_signal /= cmar_expected) report "Output correct for Beq Fetch MAR <- [PC];Z=0; cmar expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Beq Fetch MAR <- [PC];Z=0; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Beq Fetch MAR <- [PC];Z=0; epc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t0_signal <= '0';
    cmar_expected <= '0';
    epc_expected <= '0';
	 
    -- IR <- [MAR]
	 clock_signal <= not clock_signal;
    t1_signal <= '1';
    r_expected <= '1';
    cir_expected <= '1';
	 
	 assert (r_signal = r_expected) report "Output incorrect for Beq Fetch IR <- [MAR];Z=0; r expected 1" severity note;
    assert (r_signal /= r_expected) report "Output correct for Beq Fetch IR <- [MAR];Z=0; r expected 1" severity note;
	 assert (cir_signal = cir_expected) report "Output incorrect Beq Fetch IR <- [MAR];Z=0; cir expected 1" severity note;
    assert (cir_signal /= cir_expected) report "Output correct for Beq Fetch IR <- [MAR];Z=0; cir expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t1_signal <= '0';
    r_expected <= '0';
    cir_expected <= '0';
	 
    -- ALU (Q) <- [PC]
	 clock_signal <= not clock_signal;
    t2_signal <= '1';
    beq_signal <= '1';
    calu_expected <= '1';
    epc_expected <= '1';
    f1_expected <= '1';
	 
	 assert (calu_signal = calu_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC];Z=0; calu expected 1" severity note;
    assert (calu_signal /= calu_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC];Z=0; calu expected 1" severity note;
	 assert (epc_signal = epc_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC];Z=0; epc expected 1" severity note;
    assert (epc_signal /= epc_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC];Z=0; epc expected 1" severity note;
	 assert (f1_signal = f1_expected) report "Output incorrect for Beq Fetch ALU (Q) <- [PC];Z=0; f1 expected 1" severity note;
    assert (f1_signal /= f1_expected) report "Output correct for Beq Fetch ALU (Q) <- [PC];Z=0; f1 expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t2_signal <= '0';
    calu_expected <= '0';
    epc_expected <= '0';
    f1_expected <= '0';
	 
    -- PC <- [ALU]
	 clock_signal <= not clock_signal;
    t3_signal <= '1';
    cpc_expected <= '1';
    ealu_expected <= '1';
	 
	 assert (ealu_signal = ealu_expected) report "Output incorrect for Beq Fetch PC <- [ALU];Z=0; ealu expected 1" severity note;
    assert (ealu_signal /= ealu_expected) report "Output correct for Beq Fetch PC <- [ALU];Z=0; ealu expected 1" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Beq Fetch PC <- [ALU];Z=0; cpc expected 1" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Beq Fetch PC <- [ALU];Z=0; cpc expected 1" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t3_signal <= '0';
    cpc_expected <= '0';
    ealu_expected <= '0';
	 
    -- PC <- [IR]
	 clock_signal <= not clock_signal;
    t4_signal <= '1';
	 
	 assert (eir_signal = eir_expected) report "Output incorrect for Beq PC <- [IR]; Z=1;  eir expected 0" severity note;
    assert (eir_signal /= eir_expected) report "Output correct for Beq PC <- [IR]; Z=1;  eir expected 0" severity note;
	 assert (cpc_signal = cpc_expected) report "Output incorrect for Beq PC <- [IR]; Z=1;  cpc expected 0" severity note;
    assert (cpc_signal /= cpc_expected) report "Output correct for Beq PC <- [IR]; Z=1;  cpc expected 0" severity note;

    wait for 10 ns;
    clock_signal <= not clock_signal;
    wait for 10 ns;

    t4_signal <= '0';
	 beq_signal <= '0';

    -- Once all of the tests are complete, a wait statement without any timing
    -- parameters will halt the concurrent process.
    wait;
    
  end process testbench_process;

END gate_level;
