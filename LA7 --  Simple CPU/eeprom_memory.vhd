LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use std.textio.all;

entity eeprom_memory is
  generic (filename : string);
  port (
    data_in : in std_logic_vector(7 downto 0);
    data_out : out std_logic_vector(7 downto 0);
    address_bus : in std_logic_vector(4 downto 0);
    r : in std_logic;
    w : in std_logic;
    clock : in std_logic
    );
end eeprom_memory;

architecture rtl of eeprom_memory is

  constant not_digit : integer := -999;
  constant MemorySize : integer := 31;
  type memory_array is array(0 TO MemorySize) of std_logic_vector(7 downto 0);
  signal memory_contents : memory_array;

  function digit_value(c : character) return integer is
    begin
      if (c >= '0') AND (c <= '9') then
        return (character'pos(c) - character'pos('0'));
      elsif (c >= 'a') AND (c <= 'f') then
        return (character'pos(c) - character'pos('a') + 10);
      elsif (c >= 'A') AND (c <= 'F') then
        return (character'pos(c) - character'pos('A') + 10);
      else
        return not_digit;
      end if;
  end function digit_value;

  procedure read_modelfile (file fp : text;
                            signal memory_image : inout memory_array) is
    variable ln : line;
    variable temp_char : character;
    variable temp_value : natural;
    variable temp_addr : natural;
    variable temp_data : natural;
    variable good : boolean;
  begin
    while(not(endfile (fp))) loop
      readline(fp,ln);
      read(ln,temp_char,good);
      if(good and (digit_value(temp_char) /= not_digit)) then
        temp_addr := digit_value(temp_char);
        read(ln,temp_char,good);
        while(good and (digit_value(temp_char) /= not_digit)) loop
          temp_addr := temp_addr * 16 + digit_value(temp_char);
          read(ln,temp_char,good);
        end loop;
        read(ln,temp_char);
        temp_value := digit_value(temp_char);
        read(ln,temp_char);
        temp_data := temp_value * 16 + digit_value(temp_char);
        memory_image(temp_addr) <= std_logic_vector(To_Unsigned(temp_data,8));
      end if;
    end loop;
    return;
 end read_modelfile;

begin

  memory_process: process (r,w,address_bus,clock)
    
    variable first : boolean := true;
    file fp : text open READ_MODE is filename;
    
  begin  -- process memory_process
    if (first = true) then
      read_modelfile(fp,memory_contents);
      first := false;
    else
      if (r = '1') then
        data_out <= memory_contents(to_integer(unsigned(address_bus)));
      elsif ((w = '1') and falling_edge(clock)) then
        memory_contents(to_integer(unsigned(address_bus))) <= data_in;
      end if;
    end if;
  end process memory_process;

end rtl;