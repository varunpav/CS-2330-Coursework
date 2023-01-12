LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;

entity clock_reset_generation is
  port (
    reset : out std_logic;
    clock : out std_logic
    );
end clock_reset_generation;

architecture rtl of clock_reset_generation is 

  signal internal_clock : std_logic := '0';

begin  -- rtl
  
  clock_process: process
  begin  -- process clock_process
    wait for 50 ns;
    internal_clock <= not internal_clock;
  end process clock_process;

  clock <= internal_clock;

  system_reset: process
  begin  -- process system_reset
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait;
  end process system_reset;

end rtl;
