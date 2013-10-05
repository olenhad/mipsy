----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:17 10/02/2013 
-- Design Name: 
-- Module Name:    adder32 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity adder32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end adder32;

architecture Behavioral of adder32 is
signal complementedAdd : std_logic_vector(31 downto 0);
signal interResult :  std_logic_vector(31 downto 0);
signal maxNegative : std_logic_vector(31 downto 0) := (31 => '1', others => '0');
begin
-- interResult buffers the result
-- When both numbers are positive, signed addition is pretty much quivalent to unsigned addition.
-- We use unsigned as we want to preserve the last bit in case of overflows
interResult <= std_logic_vector( unsigned(operand1) + unsigned(operand2)) when (operand1(31) = '0' and operand2(31) = '0') else
-- When both numbers are postive or negative we perform standard signed addition to get the result
			      std_logic_vector( signed(operand1) + signed(operand2));
-- Calculating overflow is tricky when both numbers are negative. So instead convert the negative numbers to positive using 2's complement
-- We find the overflow then using the same idea as in unsigned numbers
-- When performing 2's complement need to watch out for the maximum possible negative number
complementedAdd <= std_logic_vector(unsigned(not(operand1))+1 + unsigned(not(operand2)) + 1) when (operand1 /= maxNegative and operand2 /= maxNegative) else
                   maxNegative;
-- overflow is the MSB of interResult when both numbers are positive
-- Its the MSB of complementedAdd when both numbers are negative
-- Its always 0 otherwise
overflow <= interResult(31) when (operand1(31) = '0' and operand2(31) = '0') else
            complementedAdd(31) when (operand1(31) = '1' and operand2(31) = '1') else
				'0';
result <= interResult;
			   
end Behavioral;

