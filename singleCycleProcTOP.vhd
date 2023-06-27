library ieee;
use ieee.std_logic_1164.all;


entity singleCycleProcTOP is 
	port 
		(
			--GIVEN top lvl in & outs of block. 
			ValueSelect : in std_logic_vector(2 downto 0);
			GReset : in std_logic;
			GClock : in std_logic;
			nC : in std_logic;
			--outs:
			MuxOut : out std_logic_vector(7 downto 0);
			InstructionOut : out std_logic_vector(31 downto 0);
			BranchOut : out std_logic;
			ZeroOut : out std_logic;
			MemWriteOut : out std_logic;
			RegWriteOut : out std_logic	
		);
end entity;
architecture struct of singleCycleProcTOP is 
signal midAssertNext : std_logic;
signal midBranch, midBNE, midMemWrite, midRegWrite, midRegDst : std_logic;
signal midJump, midMemToReg, midAlUsrc, midZeroFlag : std_logic;
signal midALUop : std_logic_vector(1 downto 0);
signal midInstruction : std_logic_vector(31 downto 0);
signal midPC, midALUres, midWriteData, midInt, midData1, midData2 : std_logic_vector(7 downto 0);

--Component declaration : 
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

component mainUnitProc8bit is 
	port 
		(
			globCLK : in std_logic;
			globReset : in std_logic;
			moveOnFlag : in std_logic;
			i_INSTRUCTION : out std_logic_vector(31 downto 0);
			--outputs : 
			oALUop : out std_logic_vector(1 downto 0);
			o_DATA1 : out std_logic_vector(7 downto 0);
			o_DATA2 : out std_logic_vector(7 downto 0);
			o_PC : out std_logic_vector(7 downto 0);
			oALUres : out std_logic_vector(7 downto 0);
			o_writeData : out std_logic_vector(7 downto 0);
			--Control signals :
			cBranch : out std_logic;
			cZeroFlag : out std_logic;
			cJump : out std_logic;
			cRegWrite : out std_logic;
			cMemWrite : out std_logic;
			cRegDst : out std_logic;
			cALUSRC : out std_logic;
			cMemToReg: out std_logic;
			cBNE : out std_logic
		);
end component;

begin

midInt(0) <= midALUsrc;
midInt(2 downto 1) <= midALUop;
midInt(3) <= midMemToReg;
midInt(4) <= not(midMemWrite);
midInt(5) <= midJump;
midInt(6) <= midRegDst;
midInt(7) <= '0';

proc8bit_inst0 : mainUnitProc8bit 
	port 
		map 
			(
				globCLK => GClock, 
				globReset => GReset, 
				moveOnFlag => 	nC, 
				i_INSTRUCTION => midInstruction, 
				oALUop => midALUop, 
				o_DATA1 => midData1, 
				o_DATA2 => midData2, 
				o_PC => midPC, 
				oALUres => midALUres, 
				o_writeData => midWriteData, 
				cBranch => midBranch, 
				cZeroFlag => midZeroFlag, 
				cJump => midJump, 
				cRegWrite => midRegWrite, 
				cMemWrite => midMemWrite, 
				cRegDst => midRegDst, 
				cALUSRC => midALUsrc, 
				cMemToReg => midMemToReg, 
				cBNE => midBNE
			);
muxINST : mux8t1_8b 
	port 
		map 
			(
				i_in0 => midPC, 
				i_in1 => midALUres, 
				i_in2 => midData1, 
				i_in3 => midData2, 
				i_in4 => midWriteData, 
				i_in5 => midInt, 
				i_in6 => midInt, 
				i_in7 => midInt, 
				i_sel => ValueSelect, 
				outp => MuxOut	
			);
			
--Drive outputs:
midAssertNext <= not(nC);
BranchOut <= midBranch or midBNE;
InstructionOut <= midInstruction; 
zeroOut <= midZeroFlag;
RegWriteOut <= midRegWrite;
MemWriteOut <= midMemWrite;

end struct;