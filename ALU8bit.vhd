library ieee;
use ieee.std_logic_1164.all;

entity ALU8bit is 
	port 
		(
			inA, inB : in std_logic_vector(7 downto 0);
			i_Carry : in std_logic;
			o_Carry : out std_logic;
			o_Overflow : out std_logic;
			oRes : out std_logic_vector(7 downto 0)
		);
end entity;

architecture struct of ALU8bit is 
signal temp_operB : std_logic_vector(7 downto 0):
signal temp_res : std_logic_vector(7 downto 0);
signal temp_P, temp_G : std_logic_vector(1 downto 0);
signal temp_carry : std_logic;

--use previously created 4 bit cla unit, declare component. 
component cla4bit is 
	port 
		(
			inA : in std_logic_vector(3 downto 0);
			inB : in std_logic_vector(3 downto 0);
			i_carry : in std_logic;
			o_P, o_G : out std_logic;
			res : out std_logic_vector(3 downto 0)
		);
end component;

--component instances : 


end struct;