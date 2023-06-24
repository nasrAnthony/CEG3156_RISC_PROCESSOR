library ieee;
use ieee.std_logic_1164.all;

entity decode3t8 is 
	port 
		(
			inp : in std_logic_vector(2 downto 0);
			outp : out std_logic_vector(7 downto 0)
		);
end entity;


architecture struct of decode3t8 is 
signal tmp_inp : std_logic_vector(7 downto 0);

begin 
	tmp_inp(7) <= inp(0) and inp(1) and inp(2);
	tmp_inp(6) <= not(inp(0)) and inp(1) and inp(2);
	tmp_inp(5) <= inp(0) and not(inp(1)) and inp(2);
	tmp_inp(4) <= not(inp(0)) and not(inp(1)) and inp(2);
	tmp_inp(3) <= inp(0) and inp(1) and not(inp(2));
	tmp_inp(2) <= not(inp(0)) and inp(1) and not(inp(2));
	tmp_inp(1) <= inp(0) and not(inp(1)) and not(inp(2));
	tmp_inp(0) <= not(inp(0)) and not(inp(1)) and not(inp(2));
	
	outp <= tmp_inp;
end struct;
