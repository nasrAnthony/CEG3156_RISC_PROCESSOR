library ieee;
use ieee.std_logic_1164.all;

entity mux8t1_32b is 
	port 
		(
			in0 : in std_logic_vector(31 downto 0);
			in1 : in std_logic_vector(31 downto 0);
			in2 : in std_logic_vector(31 downto 0);
			in3 : in std_logic_vector(31 downto 0);
			in4 : in std_logic_vector(31 downto 0);
			in5 : in std_logic_vector(31 downto 0);
			in6 : in std_logic_vector(31 downto 0);
			in7 : in std_logic_vector(31 downto 0);
			inSel : in std_logic_vector(2 downto 0);
			outBits : out std_logic_vector(31 downto 0)
			
		);
end entity;

architecture struct of mux8t1_32b is 
--signal buffer of the output. 
signal temp_outBits : std_logic_vector(31 downto 0);

--declare component:
component mux8t1 is
	port 
		(
			i_in : in std_logic_vector(7 downto 0);
			sel : in std_logic_vector (2 downto 0);
			o_out : out std_logic
		);
end component;
begin 

mult0 : mux8t1
	port map 
		(
			i_in(0) => in0(0), 
			i_in(1) => in1(0), 
			i_in(2) => in2(0), 
			i_in(3) => in3(0), 
			i_in(4) => in4(0), 
			i_in(5) => in5(0), 
			i_in(6) => in6(0), 
			i_in(7) => in7(0), 
			sel => inSel, 
			o_out => temp_outBits(0)
		);
mult1 : mux8t1
	port map 
		(
			i_in(0) => in0(1), 
			i_in(1) => in1(1), 
			i_in(2) => in2(1), 
			i_in(3) => in3(1), 
			i_in(4) => in4(1), 
			i_in(5) => in5(1), 
			i_in(6) => in6(1), 
			i_in(7) => in7(1), 
			sel => inSel, 
			o_out => temp_outBits(1)
		);
mult2 : mux8t1
	port map 
		(
			i_in(0) => in0(2), 
			i_in(1) => in1(2), 
			i_in(2) => in2(2), 
			i_in(3) => in3(2), 
			i_in(4) => in4(2), 
			i_in(5) => in5(2), 
			i_in(6) => in6(2), 
			i_in(7) => in7(2), 
			sel => inSel, 
			o_out => temp_outBits(2)
		);	
mult3 : mux8t1
	port map 
		(
			i_in(0) => in0(3), 
			i_in(1) => in1(3), 
			i_in(2) => in2(3), 
			i_in(3) => in3(3), 
			i_in(4) => in4(3), 
			i_in(5) => in5(3), 
			i_in(6) => in6(3), 
			i_in(7) => in7(3), 
			sel => inSel, 
			o_out => temp_outBits(3)
		);
mult4 : mux8t1
	port map 
		(
			i_in(0) => in0(4), 
			i_in(1) => in1(4), 
			i_in(2) => in2(4), 
			i_in(3) => in3(4), 
			i_in(4) => in4(4), 
			i_in(5) => in5(4), 
			i_in(6) => in6(4), 
			i_in(7) => in7(4), 
			sel => inSel,
			o_out => temp_outBits(4)	
		);
mult5 : mux8t1
	port map 
		(
			i_in(0) => in0(5), 
			i_in(1) => in1(5), 
			i_in(2) => in2(5), 
			i_in(3) => in3(5), 
			i_in(4) => in4(5), 
			i_in(5) => in5(5), 
			i_in(6) => in6(5), 
			i_in(7) => in7(5), 
			sel => inSel, 
			o_out => temp_outBits(5)
		);	
mult6 : mux8t1
	port map 
		(
			i_in(0) => in0(6), 
			i_in(1) => in1(6), 
			i_in(2) => in2(6), 
			i_in(3) => in3(6), 
			i_in(4) => in4(6), 
			i_in(5) => in5(6), 
			i_in(6) => in6(6), 
			i_in(7) => in7(6), 
			sel => inSel, 
			o_out => temp_outBits(6)
		);
mult7 : mux8t1
	port map 
		(
			i_in(0) => in0(7), 
			i_in(1) => in1(7), 
			i_in(2) => in2(7), 
			i_in(3) => in3(7), 
			i_in(4) => in4(7), 
			i_in(5) => in5(7), 
			i_in(6) => in6(7), 
			i_in(7) => in7(7), 
			sel => inSel, 
			o_out => temp_outBits(7)
		);
		
mult8 : mux8t1
	port map 
		(
			i_in(0) => in0(8), 
			i_in(1) => in1(8), 
			i_in(2) => in2(8), 
			i_in(3) => in3(8), 
			i_in(4) => in4(8), 
			i_in(5) => in5(8), 
			i_in(6) => in6(8), 
			i_in(7) => in7(8), 
			sel => inSel, 
			o_out => temp_outBits(8)
		);
mult9 : mux8t1
	port map 
		(
			i_in(0) => in0(9), 
			i_in(1) => in1(9), 
			i_in(2) => in2(9), 
			i_in(3) => in3(9), 
			i_in(4) => in4(9), 
			i_in(5) => in5(9), 
			i_in(6) => in6(9), 
			i_in(7) => in7(9), 
			sel => inSel, 
			o_out => temp_outBits(9)
		);

mult10 : mux8t1
	port map 
		(
			i_in(0) => in0(10), 
			i_in(1) => in1(10), 
			i_in(2) => in2(10), 
			i_in(3) => in3(10), 
			i_in(4) => in4(10), 
			i_in(5) => in5(10), 
			i_in(6) => in6(10), 
			i_in(7) => in7(10), 
			sel => inSel, 
			o_out => temp_outBits(10)
		);
	

mult11 : mux8t1
	port map 
		(
			i_in(0) => in0(11), 
			i_in(1) => in1(11), 
			i_in(2) => in2(11), 
			i_in(3) => in3(11), 
			i_in(4) => in4(11), 
			i_in(5) => in5(11), 
			i_in(6) => in6(11), 
			i_in(7) => in7(11), 
			sel => inSel, 
			o_out => temp_outBits(11)
		);
	

mult12 : mux8t1
	port map 
		(
			i_in(0) => in0(12), 
			i_in(1) => in1(12), 
			i_in(2) => in2(12), 
			i_in(3) => in3(12), 
			i_in(4) => in4(12), 
			i_in(5) => in5(12), 
			i_in(6) => in6(12), 
			i_in(7) => in7(12), 
			sel => inSel,
			o_out => temp_outBits(12)
		);
	

mult13 : mux8t1
	port map 
		(
			i_in(0) => in0(13), 
			i_in(1) => in1(13), 
			i_in(2) => in2(13), 
			i_in(3) => in3(13), 
			i_in(4) => in4(13), 
			i_in(5) => in5(13), 
			i_in(6) => in6(13), 
			i_in(7) => in7(13), 
			sel => inSel, 
			o_out => temp_outBits(13)
		);
	

mult14 : mux8t1
	port map 
		(
			i_in(0) => in0(14), 
			i_in(1) => in1(14), 
			i_in(2) => in2(14), 
			i_in(3) => in3(14), 
			i_in(4) => in4(14), 
			i_in(5) => in5(14), 
			i_in(6) => in6(14), 
			i_in(7) => in7(14), 
			sel => inSel, 
			o_out => temp_outBits(14)
		);
	

mult15 : mux8t1
	port map 
		(
			i_in(0) => in0(15), 
			i_in(1) => in1(15), 
			i_in(2) => in2(15), 
			i_in(3) => in3(15), 
			i_in(4) => in4(15), 
			i_in(5) => in5(15), 
			i_in(6) => in6(15), 
			i_in(7) => in7(15), 
			sel => inSel, 
			o_out => temp_outBits(15)
		);
	
mult16 : mux8t1
	port map 
		(
			i_in(0) => in0(16), 
			i_in(1) => in1(16), 
			i_in(2) => in2(16), 
			i_in(3) => in3(16), 
			i_in(4) => in4(16), 
			i_in(5) => in5(16), 
			i_in(6) => in6(16), 
			i_in(7) => in7(16), 
			sel => inSel, 
			o_out => temp_outBits(16)
		);
	
mult17 : mux8t1
	port map 
		(
			i_in(0) => in0(17), 
			i_in(1) => in1(17), 
			i_in(2) => in2(17), 
			i_in(3) => in3(17), 
			i_in(4) => in4(17), 
			i_in(5) => in5(17), 
			i_in(6) => in6(17), 
			i_in(7) => in7(17), 
			sel => inSel, 
			o_out => temp_outBits(17)
		);

mult18 : mux8t1
	port map 
		(
			i_in(0) => in0(18), 
			i_in(1) => in1(18), 
			i_in(2) => in2(18), 
			i_in(3) => in3(18), 
			i_in(4) => in4(18), 
			i_in(5) => in5(18), 
			i_in(6) => in6(18), 
			i_in(7) => in7(18), 
			sel => inSel, 
			o_out => temp_outBits(18)
		);
mult19 : mux8t1
	port map 
		(
			i_in(0) => in0(19), 
			i_in(1) => in1(19), 
			i_in(2) => in2(19), 
			i_in(3) => in3(19), 
			i_in(4) => in4(19), 
			i_in(5) => in5(19), 
			i_in(6) => in6(19), 
			i_in(7) => in7(19), 
			sel => inSel, 
			o_out => temp_outBits(19)
		);
mult20 : mux8t1
	port map 
		(
			i_in(0) => in0(20), 
			i_in(1) => in1(20), 
			i_in(2) => in2(20), 
			i_in(3) => in3(20), 
			i_in(4) => in4(20), 
			i_in(5) => in5(20), 
			i_in(6) => in6(20), 
			i_in(7) => in7(20), 
			sel => inSel, 
			o_out => temp_outBits(20)
		);
mult21 : mux8t1
	port map 
		(
			i_in(0) => in0(21), 
			i_in(1) => in1(21), 
			i_in(2) => in2(21), 
			i_in(3) => in3(21), 
			i_in(4) => in4(21), 
			i_in(5) => in5(21), 
			i_in(6) => in6(21), 
			i_in(7) => in7(21), 
			sel => inSel, 
			o_out => temp_outBits(21)
		);
mult22 : mux8t1
	port map 
		(
			i_in(0) => in0(22), 
			i_in(1) => in1(22), 
			i_in(2) => in2(22), 
			i_in(3) => in3(22), 
			i_in(4) => in4(22), 
			i_in(5) => in5(22), 
			i_in(6) => in6(22), 
			i_in(7) => in7(22), 
			sel => inSel, 
			o_out => temp_outBits(22)
		);
mult23 : mux8t1
	port map 
		(
			i_in(0) => in0(23), 
			i_in(1) => in1(23), 
			i_in(2) => in2(23), 
			i_in(3) => in3(23), 
			i_in(4) => in4(23), 
			i_in(5) => in5(23), 
			i_in(6) => in6(23), 
			i_in(7) => in7(23), 
			sel => inSel, 
			o_out => temp_outBits(23)
		);
mult24 : mux8t1
	port map 
		(
			i_in(0) => in0(24), 
			i_in(1) => in1(24), 
			i_in(2) => in2(24), 
			i_in(3) => in3(24), 
			i_in(4) => in4(24), 
			i_in(5) => in5(24), 
			i_in(6) => in6(24), 
			i_in(7) => in7(24), 
			sel => inSel, 
			o_out => temp_outBits(24)
		);
mult25 : mux8t1
	port map 
		(
			i_in(0) => in0(25), 
			i_in(1) => in1(25), 
			i_in(2) => in2(25), 
			i_in(3) => in3(25), 
			i_in(4) => in4(25), 
			i_in(5) => in5(25), 
			i_in(6) => in6(25), 
			i_in(7) => in7(25), 
			sel => inSel, 
			o_out => temp_outBits(25)
		);
mult26 : mux8t1
	port map 
		(
			i_in(0) => in0(26), 
			i_in(1) => in1(26), 
			i_in(2) => in2(26), 
			i_in(3) => in3(26), 
			i_in(4) => in4(26), 
			i_in(5) => in5(26), 
			i_in(6) => in6(26), 
			i_in(7) => in7(26), 
			sel => inSel, 
			o_out => temp_outBits(26)
		);
mult27 : mux8t1
	port map 
		(
			i_in(0) => in0(27), 
			i_in(1) => in1(27), 
			i_in(2) => in2(27), 
			i_in(3) => in3(27), 
			i_in(4) => in4(27), 
			i_in(5) => in5(27), 
			i_in(6) => in6(27), 
			i_in(7) => in7(27), 
			sel => inSel, 
			o_out => temp_outBits(27)
		);	
mult28 : mux8t1
	port map 
		(
			i_in(0) => in0(28), 
			i_in(1) => in1(28), 
			i_in(2) => in2(28), 
			i_in(3) => in3(28), 
			i_in(4) => in4(28), 
			i_in(5) => in5(28), 
			i_in(6) => in6(28), 
			i_in(7) => in7(28), 
			sel => inSel, 
			o_out => temp_outBits(28)
		);
mult29 : mux8t1
	port map 
		(
			i_in(0) => in0(29), 
			i_in(1) => in1(29), 
			i_in(2) => in2(29), 
			i_in(3) => in3(29), 
			i_in(4) => in4(29), 
			i_in(5) => in5(29), 
			i_in(6) => in6(29), 
			i_in(7) => in7(29), 
			sel => inSel, 
			o_out => temp_outBits(29)
		);
mult30 : mux8t1
	port map 
		(
			i_in(0) => in0(30), 
			i_in(1) => in1(30), 
			i_in(2) => in2(30), 
			i_in(3) => in3(30), 
			i_in(4) => in4(30), 
			i_in(5) => in5(30), 
			i_in(6) => in6(30), 
			i_in(7) => in7(30), 
			sel => inSel, 
			o_out => temp_outBits(30)
		);
mult31 : mux8t1
	port map 
		(
			i_in(0) => in0(31), 
			i_in(1) => in1(31), 
			i_in(2) => in2(31), 
			i_in(3) => in3(31), 
			i_in(4) => in4(31), 
			i_in(5) => in5(31), 
			i_in(6) => in6(31), 
			i_in(7) => in7(31), 
			sel => inSel, 
			o_out => temp_outBits(31)
		);
		
		
	--Drive output
outBits <= temp_outBits;

end struct;
