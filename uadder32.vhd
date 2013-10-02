----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:12:07 10/02/2013 
-- Design Name: 
-- Module Name:    uadder32 - Behavioral 
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
--use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uadder32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end uadder32;

architecture Behavioral of uadder32 is
signal largeResult : STD_LOGIC_VECTOR(32 downto 0) := b"000000000000000000000000000000000";
begin
	largeResult <= std_logic_vector((unsigned('0' & operand1) + unsigned('0' & operand2)));
	overflow <= largeResult(32);
	result <= largeResult(31 downto 0);
end Behavioral;

