library ieee;
use ieee.std_logic_1164.all;

entity mux8t1_8b is
	port 
		(
			i_in0 : in std_logic_vector(7 downto 0);
			i_in1 : in std_logic_vector(7 downto 0);
			i_in2 : in std_logic_vector(7 downto 0);
			i_in3 : in std_logic_vector(7 downto 0);
			i_in4 : in std_logic_vector(7 downto 0);
			i_in5 : in std_logic_vector(7 downto 0);
			i_in6 : in std_logic_vector(7 downto 0);
			i_in7 : in std_logic_vector(7 downto 0);
			i_sel : in std_logic_vector(2 downto 0);
			outp : out std_logic_vector(7 downto 0)	
		);
end entity;


architecture struct of mux8t1_8b is 
signal int_out : std_logic_vector(7 downto 0);
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
--instance of all 8 bit sub multiplexers..
mult0 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(0),
				i_in(1) => i_in1(0), 
				i_in(2) => i_in2(0), 
				i_in(3) => i_in3(0), 
				i_in(4) => i_in4(0), 
				i_in(5) => i_in5(0), 
				i_in(6) => i_in6(0), 
				i_in(7) => i_in7(0), 
				sel =>  i_sel, 
				o_out => int_out(0)
			);
mult1 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(1),
				i_in(1) => i_in1(1), 
				i_in(2) => i_in2(1), 
				i_in(3) => i_in3(1), 
				i_in(4) => i_in4(1), 
				i_in(5) => i_in5(1), 
				i_in(6) => i_in6(1), 
				i_in(7) => i_in7(1), 
				sel =>  i_sel, 
				o_out => int_out(1)
			);
mult2 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(2),
				i_in(1) => i_in1(2), 
				i_in(2) => i_in2(2), 
				i_in(3) => i_in3(2), 
				i_in(4) => i_in4(2), 
				i_in(5) => i_in5(2), 
				i_in(6) => i_in6(2), 
				i_in(7) => i_in7(2), 
				sel =>  i_sel, 
				o_out => int_out(2)
			);
mult3 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(3),
				i_in(1) => i_in1(3), 
				i_in(2) => i_in2(3), 
				i_in(3) => i_in3(3), 
				i_in(4) => i_in4(3), 
				i_in(5) => i_in5(3), 
				i_in(6) => i_in6(3), 
				i_in(7) => i_in7(3), 
				sel =>  i_sel, 
				o_out => int_out(3)
			);
mult4 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(4),
				i_in(1) => i_in1(4), 
				i_in(2) => i_in2(4), 
				i_in(3) => i_in3(4), 
				i_in(4) => i_in4(4), 
				i_in(5) => i_in5(4), 
				i_in(6) => i_in6(4), 
				i_in(7) => i_in7(4), 
				sel =>  i_sel, 
				o_out => int_out(4)
			);
mult5 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(5),
				i_in(1) => i_in1(5), 
				i_in(2) => i_in2(5), 
				i_in(3) => i_in3(5), 
				i_in(4) => i_in4(5), 
				i_in(5) => i_in5(5), 
				i_in(6) => i_in6(5), 
				i_in(7) => i_in7(5), 
				sel =>  i_sel, 
				o_out => int_out(5)
			);
mult6 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(6),
				i_in(1) => i_in1(6), 
				i_in(2) => i_in2(6), 
				i_in(3) => i_in3(6), 
				i_in(4) => i_in4(6), 
				i_in(5) => i_in5(6), 
				i_in(6) => i_in6(6), 
				i_in(7) => i_in7(6), 
				sel =>  i_sel, 
				o_out => int_out(6)
			);
mult7 : mux8t1 
	port 
		map 
			(
				i_in(0) => i_in0(7),
				i_in(1) => i_in1(7), 
				i_in(2) => i_in2(7), 
				i_in(3) => i_in3(7), 
				i_in(4) => i_in4(7), 
				i_in(5) => i_in5(7), 
				i_in(6) => i_in6(7), 
				i_in(7) => i_in7(7), 
				sel =>  i_sel, 
				o_out => int_out(7)
			);

			--Drive the output :
			outp <= int_out;
end struct;
