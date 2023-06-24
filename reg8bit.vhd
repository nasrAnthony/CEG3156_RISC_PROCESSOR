library ieee;
use ieee.std_logic_1164.all;

entity reg8bit is
	port 
		(
			inBits : in std_logic_vector(7 downto 0);
			i_clk : in std_logic;
			i_resetNot : in std_logic;
			i_en : in std_logic;
			outBits : out std_logic_vector(7 downto 0)
		);
end entity;


architecture struct of reg8bit is 
signal temp_out : std_logic_vector(7 downto 0); --used to buffer and drive output at the end. 

--using the given DFF as a sub component to buffer and hold incoming values. 

component enARdFF_2 is 
	port 
		(
			i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC
		);
end component;

--component instantiation : 
begin 
bit0 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(0), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(0)
				);
bit1 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(1), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(1)
				);
bit2 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(2), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(2)
				);
				
bit3 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(3), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(3)
				);
bit4 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(4), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(4)
				);
bit5 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(5), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(5)
				);
bit6 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(6), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(6)
				);
bit7 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(7), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(7)
				);
	--drive outputs :
	outBits <= temp_out;
end struct;