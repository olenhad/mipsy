----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:36:51 10/18/2013 
-- Design Name: 
-- Module Name:    ram - Behavioral 
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
use work.utils.ALL;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;	
					
entity ram is
	port (CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(11 downto 0);
          DI   : in std_logic_vector(31 downto 0);
          DO   : out std_logic_vector(31 downto 0));
end ram;

architecture Behavioral of ram is
	
    signal RAM: RamData := read_ram_from_file("C:\Users\Hunar Khanna\Desktop\CG3207\Mars\test1data.hex");
begin
	 process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if EN = '1' then
                if WE = '1' then
                    RAM(to_integer(unsigned(ADDR))) <= DI(7 downto 0);
						  RAM(to_integer(unsigned(ADDR) + 1)) <= DI(15 downto 8);
						  RAM(to_integer(unsigned(ADDR) + 2)) <= DI(23 downto 16);
						  RAM(to_integer(unsigned(ADDR) + 3)) <= DI(31 downto 24);
						  
                end if;
                DO <= RAM(to_integer(unsigned(ADDR)+3)) &
							 RAM(to_integer(unsigned(ADDR)+2)) &
							 RAM(to_integer(unsigned(ADDR)+1)) &
							 RAM(to_integer(unsigned(ADDR)));
					       
            end if;
        end if;
    end process;

end Behavioral;

