----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:42:04 10/05/2013 
-- Design Name: 
-- Module Name:    uaddsub32 - Behavioral 
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

entity uaddsub32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isadd : in std_logic;
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end uaddsub32;

architecture Behavioral of uaddsub32 is
component uadder32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end component;
signal newOperand2 : std_logic_vector(31 downto 0);
signal newOverflow :std_logic;
begin
newOperand2 <= operand2 when isadd = '1' else
					std_logic_vector(unsigned(not(operand2)) + 1);
					
uadd32: uadder32 port map (operand1 => operand1, operand2 => newOperand2, result=> result, overflow => newOverflow);
overflow <= '0' when isadd= '0' else
            newOverflow;
end Behavioral;

