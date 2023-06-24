library ieee;
use ieee.std_logic_1164.all;


entity comparator2bit is 
	port 
		(
			in1, in2 : in std_logic; --enter two operands. 
			pL : in std_logic; -- previous less (pL), previous Greater (pG) and previous equal (pE). 
			pG : in std_logic;
			pE : in std_logic;
			L : out std_logic;
			E : out std_logic;
			G : out std_logic
			);
end entity;

architecture struct of comparator2bit is 
--signal declaration (intermediate)
signal int_L : std_logic;
signal int_E : std_logic;
signal int_G : std_logic;

begin 
	int_L  <= in2 and (not in1);
	int_G  <= (not in2) and in1;
	int_E  <= not(int_L) and not(int_G);
	
	--Drive outputs:
	E <= pE and int_E;
	L <= (int_E and (not pG) and (not pE)) or ( int_L and (not pL));
	G <= ((not int_L) and (not int_E)) or (pG and (not int_L)) or ((not int_E) and pL);
end struct;

			