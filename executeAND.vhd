library ieee;
use ieee.std_logic_1164.all;


entity executeAND is port 
	(
		i_op1 : in std_logic_vector(7 downto 0);
		i_op2 : in std_logic_vector(7 downto 0);
		o_res : out std_logic_vector(7 downto 0)
		
	);
end entity;


architecture RTL of executeAND is 
begin 
	o_res <= i_op1 and i_op2;
	
end RTL;
