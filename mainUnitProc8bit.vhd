library ieee;
use ieee.std_logic_1164.all;


entity mainUnitProc8bit is 
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
end entity;


architecture struct of mainUnitProc8bit is 
signal midRegAddress : std_logic_vector(7 downto 0);
signal midALUop : std_logic_vector(1 downto 0);
signal midZeroFlag : std_logic;
signal midSlowCLK : std_logic;
--control sigs. 
signal midRegDst, midBranch, midMemWrite, midMemToReg, midMemRead, midALUsrc, midRegWrite , midJump, midBNE: std_logic;
signal midPC, midNextAddr, midIncrementedAddress : std_logic_vector(7 downto 0);
signal midInstruction  : std_logic_vector(31 downto 0);
signal midData1, midData2 : std_logic_vector(7 downto 0);
signal midRegData, midALUres : std_logic_vector(7 downto 0);
--components...
component interface_JUMP_BRANCH is 
	port 
		(
			instrBITS : in std_logic_vector(25 downto 0);
			instrADDR : in std_logic_vector( 7 downto 0);
			incrementedADDR : in std_logic_vector( 7 downto 0);
			assertBranch : in std_logic; --BEQ
			assertBranchNotEqual : in std_logic; -- BNE
			assertJump : in std_logic;
			assertZeroFlag : in std_logic;
			futureADDR : out std_logic_vector(7 downto 0)
			
		);
end component;

component RISCcontrol is 
	port 
		(
			iOp : in std_logic_vector(5 downto 0);
			oALUop : out std_logic_vector(1 downto 0);
			oRegDst : out std_logic;
			oRegWrite : out std_logic;	
			oJump : out std_logic;
			oMemRead :  out std_logic;
			oMemToReg : out std_logic;
			oMemWrite : out std_logic;
			oAluSrc : out std_logic;
			oBranch : out std_logic;
			oBNE : out std_logic
		);
end component;

component load2RAM is 
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
end component;

component ALUir is 
	port 
		(
			ReadData1 : in std_logic_vector(7 downto 0);
			ReadData2 : in std_logic_vector(7 downto 0);
			i_Address : in std_logic_vector(7 downto 0);
			i_function : in std_logic_vector(5 downto 0);
			i_aluOP : in std_logic_vector( 1 downto 0);
			i_aluSRC : in std_logic;
			i_outRes : out std_logic_vector(7 downto 0);
			zeroFlag : out std_logic
		);
end component;

component fileRegister is 
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
end component;

component IRfetch is 
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
end component;

component mux2t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			cntr : in std_logic;
			outp2 : out std_logic_vector(7 downto 0)
		);
end component;
begin
midslowCLK <= globCLK;
--instance of main control unit : 
controllerUNIT : RISCcontrol 
	port 
		map 
			(
				iOp => midInstruction(31 downto 26),
				oALUop => midALUop,
				oRegDst => midRegDst, 
				oRegWrite => midRegWrite, 
				oJump => midJump, 
				oMemRead => midMemRead,
				oMemToReg => midMemToReg, 
				oMemWrite => midMemWrite, 
				oAluSrc => midALUsrc, 
				oBranch => midBranch, 
				oBNE => midBNE
			);
--instance of IR fetch datapath:
DPinstrFetch : IRFetch 
	port 
		map 
			(
				i_PC => midNextAddr, 
				i_reset => globReset, 
				instrMemCLK => midslowCLK, 
				pcREGclk => moveOnFlag, 
				o_INSTRUCTION => midInstruction, 
				o_Addres => midPC, 
				o_AddressInc => midIncrementedAddress
			);

MUXinst0 : mux2t1x8b 
	port 
		map 
			(
				inp1 => midInstruction(23 downto 16), 
				inp2 => midInstruction(18 downto 11), 
				cntr => midRegDst, 
				outp2 => midRegAddress
			);
--REG file instance:
registerFile : fileRegister 
	port 
		map 
			(
				i_clk => moveOnFlag, 
				i_resetNot => globReset, 
				i_regWrite => midRegWrite, 
				i_readReg1 => midInstruction(23 downto 21),
				i_readReg2 => midInstruction(18 downto 16),
				i_writeDATA => midRegData, 
				i_writeSel => midRegAddress(2 downto 0), 
				o_readData1 => midData1,
				o_readData2 => midData2
			);
--JUMP OR BRANCH DATAPATH :
JBRdatapath  : interface_JUMP_BRANCH 
	port 
		map 
			(
				instrBITS => midInstruction(25 downto 0), 
				instrADDR(7) => midInstruction(15), 
				instrADDR(6 downto 0) => midInstruction(6 downto 0), 
				incrementedADDR => midIncrementedAddress,
				assertBranch => midBranch, 
				assertBranchNotEqual=> midBNE, 
				assertJump => midJump, 
				assertZeroFlag => midZeroFlag, 
				futureADDR => midNextAddr
			);

--ALU instance : 
aluINSTANCE : ALUir 
	port 
		map 
			(
				ReadData1 => midData1, 
				ReadData2  => midData2, 
				i_Address(6 downto 0) => midInstruction(6 downto 0), 
				i_Address(7) => midInstruction(15), 
				i_function => midInstruction(5 downto 0), 
				i_aluOP => midALUop, 
				i_aluSRC => midALUsrc, 
				i_outRes => midALUres, 
				zeroFlag => midZeroFlag
			);
			
dataMemoryACCESSdp : load2RAM 
	port 
		map 
			(
				i_data => midData2, 
				i_ALUresult => midALUres, 
				i_clk => midslowCLK, 
				i_reset => globReset, 
				i_MemToReg => midMemToReg, 
				i_MemWrite => midMemWrite, 
				o_data => midRegData
			);
--drive outputs : 
oALUop <= midALUop;
o_DATA1 <=  midData1; 
o_DATA2 <=  midData2; 
o_PC <=  midPC; 
oALUres <=  midALUres; 
o_writeData <=  midRegData; 
--Control signals :
cBranch <=  midBranch; 
cZeroFlag <=  midZeroFlag; 
cJump <=  midJump;
cRegWrite <=  midRegWrite; 
cMemWrite <=  midMemWrite;
cRegDst <=  midRegDst; 
cALUSRC <=  midALUsrc; 
cMemToReg <=  midMemToReg; 
cBNE <=  midBNE;

end struct;