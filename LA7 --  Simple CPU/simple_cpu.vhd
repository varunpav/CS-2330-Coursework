LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY simple_cpu IS 
  PORT
    (
      reset :  IN  STD_LOGIC;
      clock :  IN  STD_LOGIC;
      data_bus :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
      r :  OUT  STD_LOGIC;
      w :  OUT  STD_LOGIC;
      address_bus :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
      );
END simple_cpu;

ARCHITECTURE bdf_type OF simple_cpu IS 

--LA3 is control signals logic

  COMPONENT LA3
    PORT(reset : IN STD_LOGIC;
         clock : IN STD_LOGIC;
         load : IN STD_LOGIC;
         store : IN STD_LOGIC;
         add : IN STD_LOGIC;
         sub : IN STD_LOGIC;
         inc : IN STD_LOGIC;
         dec : IN STD_LOGIC;
         bra : IN STD_LOGIC;
         beq : IN STD_LOGIC;
         t0 : IN STD_LOGIC;
         t1 : IN STD_LOGIC;
         t2 : IN STD_LOGIC;
         t3 : IN STD_LOGIC;
         t4 : IN STD_LOGIC;
         t5 : IN STD_LOGIC;
         t6 : IN STD_LOGIC;
         t7 : IN STD_LOGIC;
         Z : IN STD_LOGIC;
         r : OUT STD_LOGIC;
         w : OUT STD_LOGIC;
         cmar : OUT STD_LOGIC;
         cmbr : OUT STD_LOGIC;
         embr : OUT STD_LOGIC;
         cir : OUT STD_LOGIC;
         eir : OUT STD_LOGIC;
         cpc : OUT STD_LOGIC;
         epc : OUT STD_LOGIC;
         cd0 : OUT STD_LOGIC;
         ed0 : OUT STD_LOGIC;
         calu : OUT STD_LOGIC;
         ealu : OUT STD_LOGIC;
         F0 : OUT STD_LOGIC;
         F1 : OUT STD_LOGIC
         );
  END COMPONENT;


--LearningAct5 is datapath

  COMPONENT LearningAct5
    PORT(reset : IN STD_LOGIC;
         clock : IN STD_LOGIC;
         cmar : IN STD_LOGIC;
         cmbr : IN STD_LOGIC;
         embr : IN STD_LOGIC;
         cir : IN STD_LOGIC;
         eir : IN STD_LOGIC;
         cpc : IN STD_LOGIC;
         epc : IN STD_LOGIC;
         cd0 : IN STD_LOGIC;
         ed0 : IN STD_LOGIC;
         calu : IN STD_LOGIC;
         ealu : IN STD_LOGIC;
         F0 : IN STD_LOGIC;
         F1 : IN STD_LOGIC;
         data_bus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
         Z : OUT STD_LOGIC;
         address_bus : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
         opcode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
         );
  END COMPONENT;


--LearningAct6 is the Instruction Sequencer

  COMPONENT LearningAct6
    PORT(reset : IN STD_LOGIC;
         clock : IN STD_LOGIC;
         opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         t0 : OUT STD_LOGIC;
         t1 : OUT STD_LOGIC;
         t2 : OUT STD_LOGIC;
         t3 : OUT STD_LOGIC;
         t4 : OUT STD_LOGIC;
         t5 : OUT STD_LOGIC;
         t6 : OUT STD_LOGIC;
         t7 : OUT STD_LOGIC;
         execute : OUT STD_LOGIC
         );
  END COMPONENT;


--decoder is the Opcode Decoder


  COMPONENT decoder
    PORT(execute : IN STD_LOGIC;
         opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         load : OUT STD_LOGIC;
         store : OUT STD_LOGIC;
         add : OUT STD_LOGIC;
         sub : OUT STD_LOGIC;
         inc : OUT STD_LOGIC;
         dec : OUT STD_LOGIC;
         bra : OUT STD_LOGIC;
         beq : OUT STD_LOGIC
         );
  END COMPONENT;

  SIGNAL	add :  STD_LOGIC;
  SIGNAL	beq :  STD_LOGIC;
  SIGNAL	bra :  STD_LOGIC;
  SIGNAL	calu :  STD_LOGIC;
  SIGNAL	cd0 :  STD_LOGIC;
  SIGNAL	cir :  STD_LOGIC;
  SIGNAL	cmar :  STD_LOGIC;
  SIGNAL	cmbr :  STD_LOGIC;
  SIGNAL	cpc :  STD_LOGIC;
  SIGNAL	dec :  STD_LOGIC;
  SIGNAL	ealu :  STD_LOGIC;
  SIGNAL	ed0 :  STD_LOGIC;
  SIGNAL	eir :  STD_LOGIC;
  SIGNAL	embr :  STD_LOGIC;
  SIGNAL	epc :  STD_LOGIC;
  SIGNAL	execute :  STD_LOGIC;
  SIGNAL	f0 :  STD_LOGIC;
  SIGNAL	f1 :  STD_LOGIC;
  SIGNAL	inc :  STD_LOGIC;
  SIGNAL	load :  STD_LOGIC;
  SIGNAL	opcode :  STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL	store :  STD_LOGIC;
  SIGNAL	sub :  STD_LOGIC;
  SIGNAL	t0 :  STD_LOGIC;
  SIGNAL	t1 :  STD_LOGIC;
  SIGNAL	t2 :  STD_LOGIC;
  SIGNAL	t3 :  STD_LOGIC;
  SIGNAL	t4 :  STD_LOGIC;
  SIGNAL	t5 :  STD_LOGIC;
  SIGNAL	t6 :  STD_LOGIC;
  SIGNAL	t7 :  STD_LOGIC;
  SIGNAL	Z :  STD_LOGIC;


BEGIN 

  b2v_ControlSignalsLogic : LA3
    PORT MAP(reset => reset,
             clock => clock,
             load => load,
             store => store,
             add => add,
             sub => sub,
             inc => inc,
             dec => dec,
             bra => bra,
             beq => beq,
             t0 => t0,
             t1 => t1,
             t2 => t2,
             t3 => t3,
             t4 => t4,
             t5 => t5,
             t6 => t6,
             t7 => t7,
             Z => Z,
             r => r,
             w => w,
             cmar => cmar,
             cmbr => cmbr,
             embr => embr,
             cir => cir,
             eir => eir,
             cpc => cpc,
             epc => epc,
             cd0 => cd0,
             ed0 => ed0,
             calu => calu,
             ealu => ealu,
             F0 => f0,
             F1 => f1);

  b2v_Datapath : LearningAct5
    PORT MAP(reset => reset,
             clock => clock,
             cmar => cmar,
             cmbr => cmbr,
             embr => embr,
             cir => cir,
             eir => eir,
             cpc => cpc,
             epc => epc,
             cd0 => cd0,
             ed0 => ed0,
             calu => calu,
             ealu => ealu,
             F0 => f0,
             F1 => f1,
             data_bus => data_bus,
             Z => Z,
             address_bus => address_bus,
             opcode => opcode);

  b2v_InstructionSequencer : LearningAct6
    PORT MAP(reset => reset,
             clock => clock,
             opcode => opcode,
             t0 => t0,
             t1 => t1,
             t2 => t2,
             t3 => t3,
             t4 => t4,
             t5 => t5,
             t6 => t6,
             t7 => t7,
             execute => execute);

  b2v_OpcodeDecoder : decoder
    PORT MAP(execute => execute,
             opcode => opcode,
             load => load,
             store => store,
             add => add,
             sub => sub,
             inc => inc,
             dec => dec,
             bra => bra,
             beq => beq);

END bdf_type;