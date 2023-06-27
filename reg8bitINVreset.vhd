library ieee;
use ieee.std_logic_1164.all;

entity reg8bitINVreset is 
	port 
		(
			i_inp : in std_logic_vector(7 downto 0);
			i_clk : in std_logic;
			i_en : in std_logic;
			i_reset : in std_logic;
			o_out : out std_logic_vector(7 downto 0)
		);
end entity;
architecture struct of reg8bitINVreset is 

--comp declaration :
component posResetDFF IS
	PORT(
			i_resetBar	: in std_logic;
			i_d		:  in std_logic;
			i_enable	:  in std_logic;
			i_clock		:  in std_logic;
			o_q, o_qBar	: out std_logic
		);
end component;

begin
--DFF instances :
bit7: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(7), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(7)  
			);
			
bit6: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(6), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(6)  
			);

bit5: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(5), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(5)  
			);
bit4: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(4), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(4)  
			);
bit3: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(3), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(3)  
			);
bit2: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(2), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(2)  
			);
bit1: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(1), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(1)  
			);
bit0: posResetDFF 
	port 
		map 
			(
				i_resetBar	=> i_reset, 
				i_d		=> i_inp(0), 
				i_enable	=> i_en, 
				i_clock  => i_clk, 
				o_q  => o_out(0)  
			);
end struct;



