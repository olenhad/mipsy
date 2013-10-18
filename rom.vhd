----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:00 10/18/2013 
-- Design Name: 
-- Module Name:    rom - Behavioral 
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
use STD.textio.all;
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
--use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.utils.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


-- The libraries ieee.std_logic_unsigned and std.textio will need to be included
-- with this example
-- The following code will infer a Single port Block RAM and initialize it using a FILE

-- Place the following code before the begin of the architecture

 
-- Place the following after the begin

 
entity rom is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(8 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom;

architecture Behavioral of rom is
       
                                          

    signal rom_data : RomData := read_rom_from_file("C:\Users\Hunar Khanna\Desktop\CG3207\Mars\test1.hex");

begin

   process (clk)                                                
    begin                                                        
       if clk'event and clk = '1' then                              
          if EN = '1' then                                             
             data <= (rom_data(to_integer(unsigned(addr) + 3))) & 
				         (rom_data(to_integer(unsigned(addr) + 2))) & 
							(rom_data(to_integer(unsigned(addr) + 1))) & 
							(rom_data(to_integer(unsigned(addr))));      
          end if;                                                      
       end if;                                                      
    end process;   

end Behavioral;

