----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:11:28 10/24/2013 
-- Design Name: 
-- Module Name:    fetch - Behavioral 
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

entity fetch is
	Port(CLK  : in std_logic;
	     isJump : in std_logic;
		  jumpAddress : in std_logic_vector(31 downto 0);
		  programCounter : out std_logic_vector(31 downto 0);
		  currentInstruction : out std_logic_vector(31 downto 0));
	
end fetch;

architecture Behavioral of fetch is
component rom is
	port (
			EN : in std_logic;
			ADDR : in std_logic_vector(31 downto 0);
			DATA : out std_logic_vector(31 downto 0));
end component;

signal rom_EN   : std_logic := '1';
-- rom starting address set to 0
signal rom_ADDR : std_logic_vector(31 downto 0) := (others => '0') ;
signal rom_DATA   : std_logic_vector(31 downto 0);

begin


hunars_rom : rom port map(
								  EN => rom_EN,
								  ADDR => rom_ADDR,
								  DATA => rom_DATA);
process(CLK)
	variable pcR : std_logic_vector(31 downto 0) := (others => '0');
	variable ciR : std_logic_vector(31 downto 0) := (others => '0');
	
begin
	if rising_edge(CLK) then
			ciR := rom_data;
			
			pcR := std_logic_vector(unsigned(pcR) + 4);
			programCounter <= pcr;
			currentInstruction <= ciR;
			
			if isJump = '1' then
				pcR := jumpAddress;	
			end if;		
			
			rom_addr <= pcR;
	end if;
end process;

end Behavioral;

