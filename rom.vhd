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
port (
		 EN : in std_logic;
      ADDR : in std_logic_vector(31 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom;

architecture Behavioral of rom is
-- TODO. RomDefault       
signal rom0 : RomData := (x"3c",x"8c",x"3c",x"8c",x"3c",x"3c",x"ac",x"3c",x"ac",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"0c",others => (others => '0')); 
signal rom1 : RomData := (x"01",x"30",x"01",x"31",x"0a",x"01",x"30",x"01",x"3f",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"10",others => (others => '0')); 
signal rom2 : RomData := (x"10",x"00",x"10",x"00",x"00",x"10",x"00",x"10",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",others => (others => '0')); 
signal rom3 : RomData := (x"01",x"48",x"01",x"4c",x"40",x"01",x"40",x"01",x"44",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",others => (others => '0')); 



begin


	data <= rom0(to_integer(unsigned(addr(5 downto 0)))) & 
			  rom1(to_integer(unsigned(addr(5 downto 0)))) & 
			  rom2(to_integer(unsigned(addr(5 downto 0)))) & 
			  rom3(to_integer(unsigned(addr(5 downto 0))));
			 

--	data <= (rom_data(to_integer(unsigned(addr(19 downto 0)) + 3))) & 
--			  (rom_data(to_integer(unsigned(addr(19 downto 0)) + 2))) & 
--			  (rom_data(to_integer(unsigned(addr(19 downto 0)) + 1))) & 
--			  (rom_data(to_integer(unsigned(addr(19 downto 0))))) when en ='1' else 
--			  (others => '0');
	--data <= (rom_data(to_integer(unsigned(addr(19 downto 0)) + 3))) & x"000000";

end Behavioral;

