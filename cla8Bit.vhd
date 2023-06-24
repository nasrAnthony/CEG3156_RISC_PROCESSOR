library ieee;
use ieee.std_logic_1164.all;

entity cla8bitALU is --aluCLA_8bit
	port 
		(
			inA : in std_logic_vector(7 downto 0);
			inB : in std_logic_vector(7 downto 0);
			iCarry : in std_logic;
			oCarry : out std_logic;
			overflowFlag : out std_logic;
			oRes : out std_logic_vector(7 downto 0)
		);
end entity;

architecture struct of cla8bitALU is 
signal midSignFlag : std_logic;
signal midAND, midOR, midCLA, midRes : std_logic_vector(7 downto 0);
component 