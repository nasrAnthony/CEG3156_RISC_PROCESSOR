library ieee;
use ieee.std_logic_1164.all;

entity ALUcontrolUNIT is 
	port 
		(
			i_oper : in std_logic_vector(5 downto 0);
			alu_OP : in std_logic_vector(1 downto 0);
			o_oper : out std_logic_vector(2 downto 0)
		);
end entity;

architecture struct of ALUcontrolUNIT  is 
	begin 
		--DRIVE outputs. 
		--000 and --from lec slides
		--001 or 
		--010 add
		--110 sub
		--111 set on less than
		o_oper(2) <= (i_oper(1) and alu_OP(1)) or alu_OP(0);
		o_oper(1) <= (not alu_op(1)) or (not i_oper(2)) or alu_OP(0);
		o_oper(0) <= (i_oper(0) or i_oper(3)) and alu_OP(1);
end struct;

