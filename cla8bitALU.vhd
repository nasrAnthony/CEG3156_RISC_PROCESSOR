library ieee;
use ieee.std_logic_1164.all;

entity cla8bitALU is 
	port 
		(
			inA : in std_logic_vector(7 downto 0);
			inB : in std_logic_vector(7 downto 0);
			iCarry : in std_logic;
			oCarry : out std_logic;
			overflowFlag : out std_logic;
			oRes : out std_logic_vector(7 downto 0)
		);
end entity;

architecture struct of cla8bitALU is 
signal midCarryFlag : std_logic; 
signal midB, midRes: std_logic_vector(7 downto 0);
signal midProp, midGen : std_logic_vector(1 downto 0);

component cla4bit is 
	port 
		(
			inA : in std_logic_vector(3 downto 0);
			inB : in std_logic_vector(3 downto 0);
			i_carry : in std_logic;
			o_P, o_G : out std_logic;
			res : out std_logic_vector(3 downto 0)
		);
end  component;


component claOneBit is 
	port 
		(
			i_CARRY : in std_logic;
			in_P : in std_logic_vector(1 downto 0);
			in_G : in std_logic_vector(1 downto 0);
			o_CARRY : out std_logic;
			genC : out std_logic
		);
end component;

component complementer8bit is 
	port 
		(
			inBits : in std_logic_vector(7 downto 0);
			carry : in std_logic;
			outBits : out std_logic_vector(7 downto 0)
		);
end component;

begin 
	
	wageyFlipper : complementer8bit 
		port 
			map 
				(
					inBits => inB,
					carry => iCarry, --set to enable the flip
					outBits => midB
				);
	flip1 : claOneBit 
		port 
			map 
				(
					i_CARRY => iCarry, 
					in_P => midProp(1 downto 0),
					in_G => midGen(1 downto 0),
					o_CARRY => oCarry, 
					genC => midCarryFlag
				);
			
	claUNTI1 : cla4bit 
		port 
			map
				(
					inA => inA(3 downto 0), 
					inB => inB(3 downto 0), 
					i_carry => iCarry, 
					o_P => midProp(0),  
					o_G => midGen(0),
					res => midRes(3 downto 0)
				);
	claUNIT2 : cla4bit 
		port 
			map 
				(
					inA => inA(7 downto 4), 
					inB => inB(7 downto 4), 
					i_carry => iCarry, 
					o_P => midProp(1),  
					o_G => midGen(1),
					res => midRes(7 downto 4)
				);
				
				
		--Drive outputs : 
		oRes <= midRes; -- overflow conditions.
		overflowFlag <= ((not inA(7)) and (not midB(7)) and midRes(7)) or (inA(7) and midB(7) and (not midRes(7)));
end struct;

				

