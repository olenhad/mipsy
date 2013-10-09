----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:42 10/09/2013 
-- Design Name: 
-- Module Name:    div32 - Behavioral 
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

entity div32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           remainder : out  STD_LOGIC_VECTOR(31 downto 0);
			  coeff : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic);
end div32;

architecture Behavioral of div32 is
signal isException : std_logic;
begin

isException <= '1' when (operand2 = x"00000000") else
				   '0';
coeff <= std_logic_vector(signed(operand1) / signed(operand2)) when isException = '0' else (others => '0');
remainder <= std_logic_vector(signed(operand1) rem signed(operand2)) when isException = '0' else (others => '0');
exception <= isException;
end Behavioral;

