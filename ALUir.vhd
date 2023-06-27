library ieee;
use ieee.std_logic_1164.all;

entity ALUir is 
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
end entity;


architecture RTL of ALUir is 
signal midReadData2 : std_logic_vector(7 downto 0);
signal midALUopCode : std_logic_vector(2 downto 0);

component mux2t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			cntr : in std_logic;
			outp2 : out std_logic_vector(7 downto 0)
		);
end component;

component ALUcontrolUNIT is 
	port 
		(
			i_oper : in std_logic_vector(5 downto 0);
			alu_OP : in std_logic_vector(1 downto 0);
			o_oper : out std_logic_vector(2 downto 0)
		);
end component;

component ALU8bit_U is port
	(
		inA : in std_logic_vector(7 downto 0);
		inB : in std_logic_vector(7 downto 0);
		opCode : in std_logic_vector(2 downto 0);
		zeroFlag, overFlowFlag : out std_logic;
		oRes : out std_logic_vector(7 downto 0)
	);
end component;

begin 

	instMUX : mux2t1x8b 
		port 
			map 
				(	
					inp1 => readData2, 
					inp2 => i_address, 
					cntr => i_aluSRC, 
					outp2 => midReadData2
				);
	controlUnitALU : ALUcontrolUNIT 
		port 
			map 
				(
					i_oper => i_function, 
					alu_OP => i_AluOP, 
					o_oper => midALUopCode
				);
	instALU : ALU8bit_U 
		port 
			map 
				(
					inA => readData1, 
					inB => midReadData2, 
					opCode => midALUopCode, 
					zeroFlag => zeroFlag, 
					oRes => i_outRes
				);
		
end RTL;
