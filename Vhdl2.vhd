library ieee;
use ieee.std_logic_1164.all;


entity interface_JUMP_BRANCH is 
	port 
		(
		);
end entity;


architecture struct of interface_JUMP_BRANCH is 
signal midBRANCHADDRESS, midBRANCHADDRESSNOW : std_logic_vector(7 downto 0);
signal midMUXSEL : std_logic;
