LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;

entity tri_state_model is
  port (
    enable : in std_logic;
    data_in : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0)
    );
end tri_state_model;

architecture rtl of tri_state_model is

begin  -- rtl
  
  Q: process (enable,data_in)
  begin  -- process Q
    if (enable = '1') then
      data_out <= data_in;
    else
      data_out <= (others => 'Z');
    end if;
  end process Q;

end rtl;