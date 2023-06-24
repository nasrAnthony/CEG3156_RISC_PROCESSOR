library ieee;
use ieee.std_logic_1164.all;

entity claOneBit is port --unitCLA_8bit
	(
		i_CARRY : in std_logic;
		in_P : in std_logic_vector(1 downto 0);
		in_G : in std_logic_vector(1 downto 0);
		o_CARRY : out std_logic;
		genC : out std_logic
	);
end entity;
architecture struct of claOneBit is 
begin 
	o_CARRY  <= (in_P(1) and in_G(0)) or (in_P(1) and in_P(0) and i_CARRY) or in_G(0);
	genC <= (in_P(0) and i_CARRY) or in_G(0);
end struct;