----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:23 10/09/2013 
-- Design Name: 
-- Module Name:    umul32 - Behavioral 
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

entity umul32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result1 : out  STD_LOGIC_VECTOR(31 downto 0);
			  result2 : out STD_LOGIC_VECTOR(31 downto 0));
end umul32;

architecture Behavioral of umul32 is
signal largeResult : std_logic_vector(63 downto 0);
begin
largeResult <= std_logic_vector(unsigned(operand1) * unsigned(operand2));
result1 <= largeResult(31 downto 0);
result2 <= largeResult(63 downto 32);
end Behavioral;

