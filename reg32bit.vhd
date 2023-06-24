library ieee;
use ieee.std_logic_1164.all;

entity reg32bit is
	port 
		(
			inBits : in std_logic_vector(31 downto 0);
			i_clk : in std_logic;
			i_resetNot : in std_logic;
			i_en : in std_logic;
			outBits : out std_logic_vector(31 downto 0)
		);
end entity;


architecture struct of reg32bit is 
signal temp_out : std_logic_vector(31 downto 0); --used to buffer and drive output at the end. 

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
bit8 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(8), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(8)
				);
bit9 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(9), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(9)
				);
bit10 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(10), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(10)
				);
bit11 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(11), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(11)
				);
bit12 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(12), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(12)
				);
bit13 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(13), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(13)
				);
bit14 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(14), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(14)
				);
bit15 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(15), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(15)
				);
bit16 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(16), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(16)
				);
bit17 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(17), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(17)
				);
bit18 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(18), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(18)
				);
bit19 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(19), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(19)
				);
bit20 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(20), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(20)
				);
bit21 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(21), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(21)
				);
bit22 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(22), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(22)
				);
bit23 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(23), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(23)
				);
bit24 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(24), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(24)
				);
bit25 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(25), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(25)
				);
bit26 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(26), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(26)
				);	
bit27 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(27), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(27)
				);
bit28 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(28), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(28)
				);
bit29 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(29), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(29)
				);
bit30 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(30), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(30)
				);
bit31 : enARdFF_2 
		port 
			map 
				( 
					i_resetBar => i_resetNot, 
					i_d => inBits(31), 
					i_enable => i_en, 
					i_clock => i_clk, 
					o_q => temp_out(31)
				);
	--drive outputs :
	outBits <= temp_out;
end struct;