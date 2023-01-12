LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;

entity dreg_e is
  port (
    reset : in std_logic;
    clock : in std_logic;
    enable : in std_logic;
    d : in std_logic_vector(7 downto 0);
    q : out std_logic_vector(7 downto 0)
    );
end dreg_e;

architecture rtl of dreg_e is

  signal q_internal : std_logic_vector(7 downto 0);
  signal q_next : std_logic_vector(7 downto 0);

begin
  
  current_state: process (clock, reset)
  begin
    if (reset = '1') then
      q_internal <= (others => '0');
    elsif rising_edge(clock) then
      q_internal <= q_next;
    end if;
  end process;

  -- 2-input MUX logic
  next_state_0: q_next(0) <= (enable and d(0)) or (not(enable) and q_internal(0));
  next_state_1: q_next(1) <= (enable and d(1)) or (not(enable) and q_internal(1));
  next_state_2: q_next(2) <= (enable and d(2)) or (not(enable) and q_internal(2));
  next_state_3: q_next(3) <= (enable and d(3)) or (not(enable) and q_internal(3));
  next_state_4: q_next(4) <= (enable and d(4)) or (not(enable) and q_internal(4));
  next_state_5: q_next(5) <= (enable and d(5)) or (not(enable) and q_internal(5));
  next_state_6: q_next(6) <= (enable and d(6)) or (not(enable) and q_internal(6));
  next_state_7: q_next(7) <= (enable and d(7)) or (not(enable) and q_internal(7));

  output_process: q <= q_internal;

end rtl;