library ieee;
use ieee.std_logic_1164.all;

entity ALU8bit_U is port --ignore thesign extension , cuthe msb/lsb
	(
		inA : in std_logic_vector(7 downto 0);
		inB : in std_logic_vector(7 downto 0);
		opCode : in std_logic_vector(2 downto 0);
		zeroFlag, overFlowFlag : out std_logic;
		oRes : out std_logic_vector(7 downto 0)
	);
end entity;

architecture struct of ALU8bit_U is 
signal midAND, midOR, midCLAout, midRes : std_logic_vector(7 downto 0);
signal midLESSflag : std_logic;

component mux4t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			inp3 : in std_logic_vector(7 downto 0);
			inp4 : in std_logic_vector(7 downto 0);
			cntr : in std_logic_vector(1 downto 0);
			outp2 : out std_logic_vector(7 downto 0)
		);
end component;

component comparator8bit is 
	port 
		(
			inA, inB : in std_logic_vector(7 downto 0);
			flagLE : out std_logic;
			flagEQ : out std_logic;
			flagGR : out std_logic
		);
end component;

component cla8bitALU is --aluCLA_8bit
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
begin 
	muxInst : mux4t1x8b 
		port 
			map 
				(
					inp1 => midOR,
					inp2 =>  midAND, 
					inp3 => midCLAout, 
					inp4(7 downto 1) => "0000000",
					inp4(0) => midLESSflag,
					cntr => opCode(1 downto 0),
					outp2 => midRes
				);
	comp : comparator8bit 
		port 
			map 
				(
					inA => inA, 
					inB => inB, 
					flagLE => midLESSflag
				);
	cla8bit : cla8bitALU  
		port 
			map 
				(
					inA => inA, 
					inB => inB, 
					iCarry => opCode(2), 
					overflowFlag => overFlowFlag, 
					oRes => midCLAout
				);
		--Drive outputs....
		
		midAND <= inA and inB;
		midOR <= inA or inB;
		oRes <= midRes;
		zeroFlag <= (not(midRes(0) or midRes(1) or midRes(2) or midRes(3) or midRes(4) or midRes(5) or midRes(6) or midRes(7)));
	
end struct;
