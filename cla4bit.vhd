library ieee;
use ieee.std_logic_1164.all;

entity cla4bit is --adderCLA_4bit
	port 
		(
			inA : in std_logic_vector(3 downto 0);
			inB : in std_logic_vector(3 downto 0);
			i_carry : in std_logic;
			o_P, o_G : out std_logic;
			res : out std_logic_vector(3 downto 0)
		);
end entity;


architecture struct of cla4bit is 
signal midCarry : std_logic_vector(3 downto 1);
signal midProp, midGen : std_logic_vector(3 downto 0); -- propagate and generate factors. 

begin 
midGen  <= inB and inA;
midProp <= inB or inA;
midCarry(1) <= midGen(0) or (i_carry and midProp(0));
midCarry(2) <= midGen(1) or (midProp(1) and midGen(0)) or (midProp(0) and midProp(1) and i_carry);
midCarry(3) <= midGen(2) or (midProp(2) and midGen(1)) or (midProp(2) and midProp(1) and midProp(0) and i_carry);
o_P <= midProp(0) and midProp(1) and midProp(2) and midProp(3);
o_G <= (midGen(3) or (midProp(3) and midGen(2)) or (midProp(3) and midProp(2) and midGen(1)) or (midProp(3) and midProp(2) and midProp(1) and midGen(0)));
res(0) <= (inA(0) xor inB(0)) xor i_carry;
res(1) <= midCarry(1) xor (inA(1) xor inB(1));
res(2) <= midCarry(2) xor (inA(2) xor inB(2));
res(3) <= midCarry(3) xor (inA(3) xor inB(3));

end struct;