library ieee;
use ieee.std_logic_1164.all;


entity complementer8bit is 
	port 
		(
			inBits : in std_logic_vector(7 downto 0);
			carry : in std_logic;
			outBits : out std_logic_vector(7 downto 0)
		);
end entity;


architecture struct of complementer8bit is 
begin 
	outBits(0) <= inBits(0) xor carry;
	outBits(1) <= inBits(1) xor carry;
	outBits(2) <= inBits(2) xor carry;
	outBits(3) <= inBits(3) xor carry;
	outBits(4) <= inBits(4) xor carry;
	outBits(5) <= inBits(5) xor carry;
	outBits(6) <= inBits(6) xor carry;
	outBits(7) <= inBits(7) xor carry;
	
end struct;

	
	