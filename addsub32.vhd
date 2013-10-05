----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:04 10/05/2013 
-- Design Name: 
-- Module Name:    addsub32 - Behavioral 
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

entity addsub32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isadd : in std_logic;
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end addsub32;

architecture Behavioral of addsub32 is
component adder32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end component;
signal newOperand2 : std_logic_vector(31 downto 0);
begin
newOperand2 <= operand2 when isadd = '1' else
					std_logic_vector(unsigned(not(operand2)) + 1);
add: adder32 port map (operand1 => operand1, 
							  operand2 => newOperand2,
							  result => result,
							  overflow => overflow);
end Behavioral;

