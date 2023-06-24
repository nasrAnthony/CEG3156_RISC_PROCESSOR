library ieee;
use ieee.std_logic_1164.all;

entity mux2t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			cntr : in std_logic;
			outp2 : out std_logic_vector(7 downto 0)
		);
end entity;


architecture struct of mux2t1x8b is 

component mux2t1 is
	port 
		(
			inp : in std_logic_vector(1 downto 0);
			ctrl : in std_logic;
			outp : out std_logic
		);
end component;
begin 

mux1 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(0), 
				inp(1) => inp2(0), 
				ctrl => cntr, 
				outp => outp2(0)
			);
mux2 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(1), 
				inp(1) => inp2(1), 
				ctrl => cntr, 
				outp => outp2(1)
			);
mux3 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(2), 
				inp(1) => inp2(2), 
				ctrl => cntr, 
				outp => outp2(2)
			);
mux4 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(3), 
				inp(1) => inp2(3), 
				ctrl => cntr, 
				outp => outp2(3)
			);
mux5 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(4), 
				inp(1) => inp2(4), 
				ctrl => cntr, 
				outp => outp2(4)
			);
mux6 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(5), 
				inp(1) => inp2(5), 
				ctrl => cntr, 
				outp => outp2(5)
			);
mux7 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(6), 
				inp(1) => inp2(6), 
				ctrl => cntr, 
				outp => outp2(6)
			);
mux8 : mux2t1 
	port 
		map 
			(
				inp(0) => inp1(7), 
				inp(1) => inp2(7), 
				ctrl => cntr, 
				outp => outp2(7)
			);
			
end struct;

