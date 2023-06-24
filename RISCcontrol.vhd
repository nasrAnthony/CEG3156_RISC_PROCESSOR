library ieee;
use ieee.std_logic_1164.all;

entity RISCcontrol is 
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
			oBranch : out std_logic
		);
end entity;

architecture struct of RISCcontrol is 
--Define signals for each type of instruction : 
--load word (lw):
signal midLW : std_logic;
--store word (sw):
signal midSW : std_logic;
--R type (RT):
signal midRT : std_logic;
--Jump : (JUMP):
signal midJUMP : std_logic;
--Branch if equal (BEQ):
signal midBEQ : std_logic;

begin  --DOUBLE CHECK
 -- Control logic assigned to each of the instruction inter signal. 
 -- 000001 : (1) -> Rtpye. 
midRT <= not(iOP(5)) and not(iOP(4)) and not(iOP(3)) and not(iOP(2)) and not(iOP(1)) and iOP(0);
 -- 000010 : (2) -> Store word.
midSW <= not(iOP(5)) and not(iOP(4)) and not(iOP(3)) and not(iOP(2)) and iOP(1) and not(iOP(0));
 -- 000100 : (3) -> Load word.
midLW <= not(iOP(5)) and not(iOP(4)) and not(iOP(3)) and iOP(2) and not(iOP(1)) and not(iOP(0));
 -- 001000 : (4) -> Jump word.
midJUMP <= not(iOP(5)) and not(iOP(4)) and iOP(3) and not(iOP(2)) and not(iOP(1)) and not(iOP(0));
 -- 010000 : (5) -> BEQ word.
midBEQ <= not(iOP(5)) and iOP(4) and not(iOP(3)) and not(iOP(2)) and not(iOP(1)) and not(iOP(0));

--Driving the correct sets and resets to the control signals output by the control unit. 
oALUop(1) <= midRT;
oALUop(0) <= midBEQ;
oRegDst <= midRT;
oRegWrite <= midLW or midRT;
oJump <= midJUMP;
oMemRead <= midLW;
oMemToReg <= midLW;
oMemWrite <= midSW;
oAluSrc <= midSW or midLW;
oBranch <= midBEQ;
 
end struct;
 