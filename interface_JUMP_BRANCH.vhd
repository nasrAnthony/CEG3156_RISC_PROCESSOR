library ieee;
use ieee.std_logic_1164.all;


entity interface_JUMP_BRANCH is 
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
end entity;


architecture struct of interface_JUMP_BRANCH is 
signal midBRANCHADDRESS, midBRANCHADDRESSNEXT : std_logic_vector(7 downto 0);
signal midMUXSEL : std_logic;

component cla8bitALU is
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
	adderBranch : cla8bitALU 
		port 
			map 
				(
					inA => incrementedADDR, 
					inB => instrADDR, 
					iCarry => '0', 
					oRes => midBRANCHADDRESS
					
				);

	branchMUX : mux2t1x8b 
		port 
			map 
				(
					inp1 => incrementedADDR,
					inp2 => midBRANCHADDRESS,
					cntr => midMUXSEL, 
					outp2 => midBRANCHADDRESSNEXT
				);

				
	jumpMUX : mux2t1x8b 
		port 
			map 
				(
					inp1 => instrBITS(7 downto 0),
					inp2 => midBRANCHADDRESS,
					cntr => assertJump, 
					outp2 => futureADDR
				);
	--Drive a signal: BEQ condition of branch mux select
	midMUXSEL <= (assertZeroFlag and assertBranch) or (not(assertZeroFlag) and assertBranchNotEqual);
end struct;

