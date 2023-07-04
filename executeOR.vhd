library ieee;
use ieee.std_logic_1164.all;


entity executeOR is port 
	(
		i_op1 : in std_logic_vector(7 downto 0);
		i_op2 : in std_logic_vector(7 downto 0);
		o_res : out std_logic_vector(7 downto 0)
		
	);
end entity;


architecture RTL of executeOR is 
begin 
	o_res <= i_op1 OR i_op2;
	
end RTL;
