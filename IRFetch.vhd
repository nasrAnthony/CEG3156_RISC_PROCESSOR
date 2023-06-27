library ieee;
use ieee.std_logic_1164.all;

entity IRfetch is 
	port 
		(
			i_PC : in std_logic_vector(7 downto 0);
			i_reset : in std_logic;
			instrMemCLK : in std_logic;
			pcREGclk : in std_logic;
			o_INSTRUCTION : out std_logic_vector(31 downto 0);
			o_Addres : out std_logic_vector(7 downto 0);
			o_AddressInc : out std_logic_vector(7 downto 0)
		);
end entity;
		
architecture RTL of IRFetch is 
signal midAddPointedByPC : std_logic_vector(7 downto 0);
signal midInstruction : std_logic_vector(31 downto 0);
--Component declaration : 
component reg8bitINVreset is --iNVERSE reset register declaration to hold the 8 bit PC value. 
	port 
		(
			i_inp : in std_logic_vector(7 downto 0);
			i_clk : in std_logic;
			i_en : in std_logic;
			i_reset : in std_logic;
			o_out : out std_logic_vector(7 downto 0)
		);
end component;
component instrMemoryREG is  -- Generated ROM unit component. (32 bits instructions x 256)
	port 
		(
			address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
end component;

component cla8bitALU is -- Used as a standard 8 bit adder to increment PC by 4...
	port 
		(
			inA : in std_logic_vector(7 downto 0);
			inB : in std_logic_vector(7 downto 0);
			iCarry : in std_logic;
			oCarry : out std_logic;
			overflowFlag : out std_logic;
			oRes : out std_logic_vector(7 downto 0)
		);
end component;

component reg32bit is  -- standard 32 bit register component declaration. Will hold the instruction fetched from the memory at address pointed to by PC
	port 
		(
			inBits : in std_logic_vector(31 downto 0);
			i_clk : in std_logic;
			i_resetNot : in std_logic;
			i_en : in std_logic;
			outBits : out std_logic_vector(31 downto 0)
		);
end component;

begin

--Instantiations : 
regPC : reg8bitINVreset 
		port 
			map 
				(
					i_inp => i_PC, 
					i_clk => pcREGclk, 
					i_en => '1',  
					i_reset => i_reset, 
					o_out => midAddPointedByPC
				);

pcIncrementerUnit : cla8bitALU -- PC + 4 
		port 
			map 
				(
					inA => midAddPointedByPC, 
					inB => "00000100", --THIS NEEDS TO BE CHECKED, CUZ WE INCREMENT BY 4! not 1!
					iCarry => '0', --no carry needed... carry out is also ommited. 
					oRes => o_AddressInc
				);
instrROMreg : instrMemoryREG -- Instance of the ROM, we give the address and take the instruction (32 bits) as output. 
	port 
		map 
			(
				address	=> midAddPointedByPC, 
				clock	=> instrMemCLK, 
				q		=> midInstruction
			);
			
reg32 : reg32bit 
	port 
		map 
			(
				inBits => midInstruction, 
				i_clk => instrMemCLK, 
				i_resetNot => i_reset, 
				i_en => '1', 
				outBits => o_iNSTRUCTION
			);
--Drive output :
o_addres <= midAddPointedByPC;

end RTL;