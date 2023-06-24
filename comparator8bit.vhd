 library ieee;
use ieee.std_logic_1164.all;

entity comparator8bit is 
	port 
		(
			inA, inB : in std_logic_vector(7 downto 0);
			flagLE : out std_logic;
			flagEQ : out std_logic;
			flagGR : out std_logic
		);
end entity;

architecture struct of comparator8bit is 
signal midLE : std_logic_vector(6 downto 0);
signal midGR : std_logic_vector(6 downto 0);
signal midEQ : std_logic_vector(6 downto 0);

-- using the previous 2 bit comparator. [comparator2bit.vhd]
component comparator2bit is 
	port 
		(
			in1, in2 : in std_logic; 
			pL : in std_logic; 
			pG : in std_logic;
			pE : in std_logic;
			L : out std_logic;
			E : out std_logic;
			G : out std_logic
		);
end component;
begin 

	--Start at the MSB count of bit 6:
	comparator6 : comparator2bit 
		port 
			map 
				(
					in1 => inA(6), 
					in2 => inB(6), 
					pL => midLE(5), 
					pE => midEQ(5), 
					pG => midGR(5), 
					L => midLE(6), 
					G => midGR(6), 
					E => midEQ(6)
				);
	comparator5 : comparator2bit 
		port 
			map 
				(
					in1 => inA(5), 
					in2 => inB(5), 
					pL => midLE(4), 
					pE => midEQ(4), 
					pG => midGR(4), 
					L => midLE(5), 
					G => midGR(5), 
					E => midEQ(5)
				);
	comparator4 : comparator2bit 
		port 
			map 
				(
					in1 => inA(4), 
					in2 => inB(4), 
					pL => midLE(3), 
					pE => midEQ(3), 
					pG => midGR(3), 
					L => midLE(4), 
					G => midGR(4), 
					E => midEQ(4)
				);
	comparator3 : comparator2bit 
		port 
			map 
				(
					in1 => inA(3), 
					in2 => inB(3), 
					pL => midLE(2), 
					pE => midEQ(2), 
					pG => midGR(2), 
					L => midLE(3), 
					G => midGR(3), 
					E => midEQ(3)
				);
	comparator2 : comparator2bit 
		port 
			map 
				(
					in1 => inA(2), 
					in2 => inB(2), 
					pL => midLE(1), 
					pE => midEQ(1), 
					pG => midGR(1), 
					L => midLE(2), 
					G => midGR(2), 
					E => midEQ(2)
				);
	comparator1 : comparator2bit 
		port 
			map 
				(
					in1 => inA(1), 
					in2 => inB(1), 
					pL => midLE(0), 
					pE => midEQ(0), 
					pG => midGR(0), 
					L => midLE(1), 
					G => midGR(1), 
					E => midEQ(1)
				);
	comparator0 : comparator2bit 
		port 
			map 
				(
					in1 => inA(0), 
					in2 => inB(0), 
					pL =>  '0', 
					pE =>  '1', 
					pG =>  '0', 
					L => midLE(0), 
					G => midGR(0), 
					E => midEQ(0)
				);
 -- Drive the oputputs : 
 flagEQ <= ((not inB(7)) and (not inA(7)) and midEQ(6)) or (inA(7) and inB(7) and midEQ(6));
 flagGR <= ((not inA(7)) and midEQ(6)) or (inB(7) and midGR(6)) or ((not inA(7)) and inB(7));
 flagLE <= ((not inB(7)) and midLE(6)) or (inA(7) and midGR(6)) or ((not inB(7)) and inA(7));
end struct;
