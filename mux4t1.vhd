library ieee;
use ieee.std_logic_1164.all;

entity mux4t1 is
	port 
		(
			inp : in std_logic_vector(3 downto 0);
			ctrl : in std_logic_vector(1 downto 0);
			outp : out std_logic
		);
end entity;


architecture struct of mux4t1 is 
signal int_inp : std_logic_vector(3 downto 0);
begin 
	-- SELECTION LOGIC
	int_inp(3) <= inp(3) and ctrl(0) and ctrl(1);
	int_inp(2) <= inp(2) and ctrl(1) and not(ctrl(0));
	int_inp(1) <= inp(1) and ctrl(0) and not(ctrl(1));
	int_inp(0) <= inp(0) and not(ctrl(1)) and not(ctrl(0));
	--drive output : 
	outp <= int_inp(0) or int_inp(1) or int_inp(2) or int_inp(3);
end struct;

