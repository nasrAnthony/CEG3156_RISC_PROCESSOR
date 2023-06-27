library ieee;
use ieee.std_logic_1164.all;

entity clkBufferReg is 
	port 
		(
			i_clk : in std_logic;
			i_en  : in std_logic;
			i_resetNot  : in std_logic;
			o_CLK : out std_logic;
			o_CLKbar : out std_logic
		);

end entity;

architecture RTL of clkBufferReg is 
signal midCLK : std_logic;
signal midCLKnot : std_logic;

--component DFF declaration. 
component enARdFF_2 
	port 
		(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC
		);
end component;

--instansiation: 
begin 
	buffer_0 : enARdFF_2 
		port 
			map 
				(
					i_resetBar	=> i_resetNot, 
					i_d		=>  midCLKnot, 
					i_enable	=> i_en, 
					i_clock	=> i_clk, 
					o_q  => midCLK, 
					o_qBar => midCLKnot	
				);
	o_CLKbar <= midCLKnot;
	o_CLK <= midCLK;
end RTL;
