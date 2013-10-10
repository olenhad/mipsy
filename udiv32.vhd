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
           isSigned : in std_logic;
			  remainder : out  STD_LOGIC_VECTOR(31 downto 0);
			  quotient : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic
			  );
end udiv32;

architecture Behavioral of udiv32 is

begin


process (operand1, operand2)
variable tquotient : std_logic_vector(31 downto 0) := (others => '0');
variable tremainder : std_logic_vector(31 downto 0) := (others => '0');
variable cOperand1 : std_logic_vector(31 downto 0):= (others => '0');
variable cOperand2 : std_logic_vector(31 downto 0) := (others => '0');
begin
	    tremainder := ( others =>'0');
		tquotient := ( others =>'0');
		if isSigned = '0' then
			cOperand1 := operand1 ;
			cOperand2 := operand2;
		else 
			if operand1(31) = '0' then
				cOperand1 := operand1;
			else
				cOperand1 := std_logic_vector(unsigned(not(operand1))+1);
			end if;
			
			if operand2(31) = '0' then
				cOperand2 := operand2;
			else
				cOperand2 := std_logic_vector(unsigned(not(operand2))+1);
			end if;
		end if;
		if operand2 /= x"00000000" then
				for i in 31 downto 0 loop
					tremainder := std_logic_vector( unsigned(tremainder) sll 1);
					tremainder(0) := cOperand1(i);
					
					if tremainder >= cOperand2 then
						tremainder := std_logic_vector(unsigned(tremainder) - unsigned(cOperand2));
						tquotient(i) := '1';
					end if;
				end loop;
				if isSigned='1' and (operand1(31) xor operand2(31)) = '1' then 
					quotient <= std_logic_vector(unsigned(not(tquotient))+1);
				else
					quotient <= tquotient;
				end if;
				remainder <= tremainder;
				exception <= '0';
		else
			remainder <= x"00000000";
			quotient <= x"00000000";
			exception <= '1';
		end if;
end process;
end Behavioral;

