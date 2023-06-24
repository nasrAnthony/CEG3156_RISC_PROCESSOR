library ieee;
use ieee.std_logic_1164.all;

entity mux4t1x8b is
	port 
		(
			inp1 : in std_logic_vector(7 downto 0);
			inp2 : in std_logic_vector(7 downto 0);
			inp3 : in std_logic_vector(7 downto 0);
			inp4 : in std_logic_vector(7 downto 0);
			cntr : in std_logic_vector(1 downto 0);
			outp2 : out std_logic_vector(7 downto 0)
		);
end entity;


architecture struct of mux4t1x8b is 

component mux4t1 is
	port 
		(
			inp : in std_logic_vector(3 downto 0);
			ctrl : in std_logic_vector(1 downto 0);
			outp : out std_logic
		);
end component;
begin 

mux0 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(0), 
				inp(1) => inp2(0), 
				inp(2) => inp3(0), 
				inp(3) => inp4(0),
				ctrl => cntr, 
				outp => outp2(0)
			);
mux1 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(1), 
				inp(1) => inp2(1), 
				inp(2) => inp3(1), 
				inp(3) => inp4(1),
				ctrl => cntr, 
				outp => outp2(1)
			);
mux2 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(2), 
				inp(1) => inp2(2), 
				inp(2) => inp3(2), 
				inp(3) => inp4(2),
				ctrl => cntr, 
				outp => outp2(2)
			);
mux3 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(3), 
				inp(1) => inp2(3), 
				inp(2) => inp3(3), 
				inp(3) => inp4(3),
				ctrl => cntr, 
				outp => outp2(3)
			);
mux4 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(4), 
				inp(1) => inp2(4), 
				inp(2) => inp3(4), 
				inp(3) => inp4(4),
				ctrl => cntr, 
				outp => outp2(4)
			);
mux5 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(5), 
				inp(1) => inp2(5), 
				inp(2) => inp3(5), 
				inp(3) => inp4(5),
				ctrl => cntr, 
				outp => outp2(5)
			);
mux6 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(6), 
				inp(1) => inp2(6), 
				inp(2) => inp3(6), 
				inp(3) => inp4(6),
				ctrl => cntr, 
				outp => outp2(6)
			);
mux7 : mux4t1 
	port 
		map 
			(
				inp(0) => inp1(7), 
				inp(1) => inp2(7), 
				inp(2) => inp3(7), 
				inp(3) => inp4(7),
				ctrl => cntr, 
				outp => outp2(7)
			);
			
end struct;

