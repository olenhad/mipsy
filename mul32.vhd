----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:29:23 10/09/2013 
-- Design Name: 
-- Module Name:    mul32 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isSigned : in STD_LOGIC;
           result1 : out  STD_LOGIC_VECTOR(31 downto 0);
			  result2 : out STD_LOGIC_VECTOR(31 downto 0));
end mul32;

architecture Behavioral of mul32 is
signal newOperand1 : std_logic_vector(31 downto 0);
signal newOperand2 : std_logic_vector(31 downto 0);
signal combinedResult : std_logic_vector(63 downto 0);
signal interResult1 : std_logic_vector(31 downto 0);
signal interResult2 : std_logic_vector(31 downto 0);
signal convertedResult : std_logic_vector(63 downto 0); 
begin

newOperand1 <= operand1 when isSigned = '0' else
					operand1 when (isSigned = '1' and operand1(31) = '0') else
					std_logic_vector(unsigned(not(operand1))+1);

newOperand2 <= operand2 when isSigned = '0' else
					operand2 when (isSigned = '1' and operand2(31) = '0') else
					std_logic_vector(unsigned(not(operand2))+1);

combinedResult <= std_logic_vector(unsigned(newOperand1) * unsigned(newOperand2));

convertedResult <= std_logic_vector(signed(not(combinedResult)) + 1);

result1 <= convertedResult(31 downto 0) when isSigned = '1' and ((operand1(31) xor operand2(31))='1') else
			  combinedResult(31 downto 0);
			  
result2 <= convertedResult(63 downto 32) when isSigned = '1' and ((operand1(31) xor operand2(31))='1') else
			  combinedResult(63 downto 32);
			  
end Behavioral;

