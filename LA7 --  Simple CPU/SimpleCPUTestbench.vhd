LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SimpleCPUTestbench IS 
END SimpleCPUTestbench;

ARCHITECTURE bdf_type OF SimpleCPUTestbench IS 

  COMPONENT simple_cpu
    PORT(reset : IN STD_LOGIC;
         clock : IN STD_LOGIC;
         data_bus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         r : OUT STD_LOGIC;
         w : OUT STD_LOGIC;
         address_bus : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
         );
  END COMPONENT;

  COMPONENT eeprom_memory
  generic (filename : string);
    PORT(r : IN STD_LOGIC;
         w : IN STD_LOGIC;
         clock : IN STD_LOGIC;
         address_bus : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
  END COMPONENT;

  COMPONENT tri_state_model
    PORT(enable : IN STD_LOGIC;
         data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
         data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
         );
  END COMPONENT;

  COMPONENT clock_reset_generation
    PORT(		 reset : OUT STD_LOGIC;
                         clock : OUT STD_LOGIC
                         );
  END COMPONENT;

  SIGNAL	address_bus :  STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL	data_bus :  STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL	memory_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL	r :  STD_LOGIC;
  SIGNAL	system_clock :  STD_LOGIC;
  SIGNAL	system_reset :  STD_LOGIC;
  SIGNAL	w :  STD_LOGIC;


BEGIN 

  b2v_CPU : simple_cpu
    PORT MAP(reset => system_reset,
             clock => system_clock,
             data_bus => data_bus,
             r => r,
             w => w,
             address_bus => address_bus);

  b2v_memory : eeprom_memory
    generic map (filename => "ProgramData.txt")
    PORT MAP(r => r,
             w => w,
             clock => system_clock,
             address_bus => address_bus,
             data_in => data_bus,
             data_out => memory_out);

  b2v_memory_buffer : tri_state_model
    PORT MAP(enable => r,
             data_in => memory_out,
             data_out => data_bus);

  b2v_SystemClockReset : clock_reset_generation
    PORT MAP(		 reset => system_reset,
                         clock => system_clock);

END bdf_type;