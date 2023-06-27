library ieee;
use ieee.std_logic_1164.all;

entity load2RAM is 
	port 
		(
			i_data : in std_logic_vector(7 downto 0);
			i_ALUresult: in std_logic_vector(7 downto 0);
			i_clk : in std_logic;
			i_reset : in std_logic;
			-- Control signals : 
			i_MemToReg : in std_logic;
			i_MemWrite : in std_logic;
			o_data : out std_logic_vector(7 downto 0)
			
		);
end entity;


architecture struct of load2RAM is 
--signals :
signal midIn  :  std_logic_vector(7 downto 0);
signal midOut :  std_logic_Vector(7 downto 0);
component mux2t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			cntr : in std_logic;
			outp2 : out std_logic_vector(7 downto 0)
		);
end component;

component reg8bit is
	port 
		(
			inBits : in std_logic_vector(7 downto 0);
			i_clk : in std_logic;
			i_resetNot : in std_logic;
			i_en : in std_logic;
			outBits : out std_logic_vector(7 downto 0)
		);
end component;

component dataMemoryReg IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

begin

--instance of the RAM unit  DATA MEM :
ramUNIT : dataMemoryReg 
	port 
		map 	
			(
				address => i_aLUresult, 
				clock => i_clk, 
				data => i_data, 
				wren => i_MemWrite, 
				q => midIn
			);
			
buffREG : reg8bit 
	port 
		map 
			(
				inBits => midIn, 
				i_clk => i_clk, 
				i_resetNot => i_reset,
				i_en => '1', 
				outBits => midOut
			);
muxunit : mux2t1x8b 
	port 
		map 
			(
				inp1 => i_aLUresult, 
				inp2 => midOut, 
				cntr => i_MemToReg, 
				outp2 => o_data
			);
		
end struct;