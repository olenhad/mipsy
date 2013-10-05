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
component uadder32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end component;
signal complementedAdd : std_logic_vector(31 downto 0);
signal interResult :  std_logic_vector(31 downto 0);
signal maxNegative : std_logic_vector(31 downto 0) := (31 => '1', others => '0');
begin
interResult <= std_logic_vector( unsigned(operand1) + unsigned(operand2)) when (operand1(31) = '0' and operand2(31) = '0') else
			      std_logic_vector( signed(operand1) + signed(operand2));
complementedAdd <= std_logic_vector(unsigned(not(operand1))+1 + unsigned(not(operand2)) + 1) when (operand1 /= maxNegative and operand2 /= maxNegative) else
                   maxNegative;
overflow <= interResult(31) when (operand1(31) = '0' and operand2(31) = '0') else
            complementedAdd(31) when (operand1(31) = '1' and operand2(31) = '1') else
				'0';
result <= interResult;
			   
		
--UADDR1: port map ('0'& operand1(30 downto 0),operand)
end Behavioral;

