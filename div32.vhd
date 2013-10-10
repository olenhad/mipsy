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
			  quotient : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic);
end div32;

architecture Behavioral of div32 is

component udiv32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           remainder : out  STD_LOGIC_VECTOR(31 downto 0);
			  quotient : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic);
end component;

signal newOperand1, newOperand2, interQuotient : std_logic_vector(31 downto 0) := (others => '0');

begin
newOperand1 <= operand1 when operand1(31) = '0' else
					std_logic_vector(unsigned(not(operand1))+1);
newOperand2 <= operand2 when operand2(31) = '0' else
					std_logic_vector(unsigned(not(operand2))+1);

udiv : udiv32 port map ( operand1 => newOperand1,
								 operand2 => newOperand2,
								 remainder => remainder,
								 quotient => interQuotient,
								 exception => exception);
quotient <= interQuotient when ((operand1(31) xor operand2(31))='0') else
				std_logic_vector(unsigned(not(interQuotient))+1);

end Behavioral;

