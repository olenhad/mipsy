----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:34 10/09/2013 
-- Design Name: 
-- Module Name:    udiv32 - Behavioral 
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

entity udiv32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  clk : in std_logic;
           remainder : out  STD_LOGIC_VECTOR(31 downto 0);
			  quotient : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic);
end udiv32;

architecture Behavioral of udiv32 is
begin


process (clk)
variable tquotient : std_logic_vector(31 downto 0) := (others => '0');
variable tremainder : std_logic_vector(31 downto 0) := (others => '0');
variable isLoopDone : std_logic := '0';
variable cOperand1 : std_logic_vector(31 downto 0):= (others => '0');
variable cOperand2 : std_logic_vector(31 downto 0) := (0 => '1', others => '0');
begin
	if rising_edge(clk) then
		if (((cOperand1 xor operand1) /= X"00000000" ) or ((cOperand2 xor operand2) /= X"00000000" )) then
			isLoopDone := '0';
			tremainder := ( others =>'0');
			tquotient := ( others =>'0');
			cOperand1 := operand1;
			cOperand2 := operand2;
		end if;
		if operand2 /= x"00000000" then
			if isLoopDone = '0' then
				for i in 31 downto 0 loop
					if i = 0 then
						isLoopDone := '1';
					end if;
					tremainder := std_logic_vector( unsigned(tremainder) sll 1);
					tremainder(0) := operand1(i);
					
					if tremainder >= operand2 then
						tremainder := std_logic_vector(unsigned(tremainder) - unsigned(operand2));
						tquotient(i) := '1';
					end if;
				end loop;
			else
				remainder <= tremainder;
				quotient <= tquotient;
				exception <= '0';
			end if;
		else
			remainder <= x"00000000";
			quotient <= x"00000000";
			exception <= '1';
		end if;
	end if;
end process;
end Behavioral;

