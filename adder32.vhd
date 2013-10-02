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
signal sameSigns : std_logic_vector(31 downto 0);
begin
sameSigns <= (std_logic_vector(unsigned('0' & operand1(30 downto 0)) + unsigned('0' & operand2(30 downto 0))));
result <= std_logic_vector(signed(operand1) + signed(operand2)) when (operand1(31) /= operand2(31)) else
			operand1(31)& sameSigns(30 downto 0)
			
overflow <= sameSigns(31);
		
--UADDR1: port map ('0'& operand1(30 downto 0),operand)
end Behavioral;

