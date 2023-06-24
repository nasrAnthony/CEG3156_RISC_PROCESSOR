library ieee;
use ieee.std_logic_1164.all;

entity mux2t1 is
	port 
		(
			inp : in std_logic_vector(1 downto 0);
			ctrl : in std_logic;
			outp : out std_logic
		);
end entity;


architecture struct of mux2t1 is 
signal int_inp : std_logic_vector(1 downto 0);
begin 
	-- SELECTION LOGIC
	int_inp(1) <= inp(1) nand ctrl;
	int_inp(0) <= inp(0) nand (not ctrl);
	--drive output : 
	outp <= int_inp(1) nand int_inp(0);
end struct;

