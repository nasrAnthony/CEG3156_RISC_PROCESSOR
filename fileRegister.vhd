library ieee;
use ieee.std_logic_1164.all;

entity fileRegister is 
	port 
		(
			i_clk : in std_logic;
			i_resetNot : in std_logic;
			i_regWrite : in std_logic; -- Write en
			i_readReg1, i_readReg2 : in std_logic_vector(2 downto 0);
			i_writeDATA :  in std_logic_vector(7 downto 0);
			i_writeSel : in std_logic_vector(2 downto 0);
			o_readData1, o_readData2 : out std_logic_vector(7 downto 0)
		);
end entity;

architecture struct of fileRegister is 
signal midRegWrite, midDecodeRes, midoutData1, midoutData2 : std_logic_vector(7 downto 0);
-- we will need 8 internal signals to carry output of each of the 8 registers within the register file. 
signal midR0, midR1, midR2, midR3, midR4, midR5, midR6, midR7 : std_logic_vector(7 downto 0);
--INSTANCE OF COMPONENTS: 
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

component decode3t8 is 
	port 
		(
			inp : in std_logic_vector(2 downto 0);
			outp : out std_logic_vector(7 downto 0)
		);
end component;

component mux8t1_8b is
	port 
		(
			i_in0 : in std_logic_vector(7 downto 0);
			i_in1 : in std_logic_vector(7 downto 0);
			i_in2 : in std_logic_vector(7 downto 0);
			i_in3 : in std_logic_vector(7 downto 0);
			i_in4 : in std_logic_vector(7 downto 0);
			i_in5 : in std_logic_vector(7 downto 0);
			i_in6 : in std_logic_vector(7 downto 0);
			i_in7 : in std_logic_vector(7 downto 0);
			i_sel : in std_logic_vector(2 downto 0);
			outp : out std_logic_vector(7 downto 0)	
		);
end component;

begin 
midRegWrite(7) <= midDecodeRes(7) and i_regWrite;
midRegWrite(6) <= midDecodeRes(6) and i_regWrite;
midRegWrite(5) <= midDecodeRes(5) and i_regWrite;
midRegWrite(4) <= midDecodeRes(4) and i_regWrite;
midRegWrite(3) <= midDecodeRes(3) and i_regWrite;
midRegWrite(2) <= midDecodeRes(2) and i_regWrite;
midRegWrite(1) <= midDecodeRes(1) and i_regWrite;
midRegWrite(0) <= midDecodeRes(0) and i_regWrite;
 -- DECODER INSTANCE : 
fileReg_decoder_Interface  : decode3t8 
	port 
		map 
			(
				inp => i_writeSel, 
				outp => midDecodeRes
			);

--8 [8 bit] register instances. 
reg0 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(0), 
				outBits => midR0
			);
reg1 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(1), 
				outBits => midR1
			);
reg2 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(2), 
				outBits => midR2
			);
reg3 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(3), 
				outBits => midR3
			);
reg4 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(4), 
				outBits => midR4
			);
reg5 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(5), 
				outBits => midR5
			);
reg6 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(6), 
				outBits => midR6
			);
reg7 : reg8bit 
	port 
		map	
			(
				inBits => i_writeDATA,
				i_clk => i_clk, 
				i_resetNot => i_resetNot, 
				i_en => midRegWrite(7), 
				outBits => midR7
			);
			
mux0 : mux8t1_8b 
	port 
		map 
			(
				i_in0 => midR0,
				i_in1 => midR1,
				i_in2 => midR2,
				i_in3 => midR3,
				i_in4 => midR4,
				i_in5 => midR5,
				i_in6 => midR6,
				i_in7 => midR7,
				i_sel => i_readReg1, 
				outp => midoutData1
			);
mux1 : mux8t1_8b
	port 
		map 
			(
				i_in0 => midR0,
				i_in1 => midR1,
				i_in2 => midR2,
				i_in3 => midR3,
				i_in4 => midR4,
				i_in5 => midR5,
				i_in6 => midR6,
				i_in7 => midR7,
				i_sel => i_readReg2, 
				outp => midoutData2
			);
	o_readData1 <= midoutData1; 
	o_readData2 <= midoutData2;
	
end struct;


