----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:23:31 10/24/2013 
-- Design Name: 
-- Module Name:    decode - Behavioral 
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
use work.utils.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decode is
	PORT( CLK : in std_logic;
			CurrentInstruction : in std_logic_vector(31 downto 0);
			WriteAddr : in std_logic_vector(4 downto 0);
			WriteData : in std_logic_vector(31 downto 0);
			RegWrite : in std_logic;
			AluOP1 : out std_logic_vector(31 downto 0);
			AluOP2 : out std_logic_vector(31 downto 0);
			AluControl : out std_logic_vector(5 downto 0);
			ControlSignals : out std_logic_vector(5 downto 0));
end decode;

architecture Behavioral of decode is

begin
-- Circuit can't be combinational because it needs to interface reads and writes to the RegisterFile

process(CLK)
	variable registerFile : RegisterSet := (others => (others => '0'));
	variable opcode : std_logic_vector(5 downto 0) := (others => '0');
begin
	if rising_edge(CLK) then
		
		opcode := currentInstruction(31 downto 26);
		ControlSignals <= (others => '0');
		-- R type
		if opcode = b"000000" then
		
		-- funct portion of Current Instruction
			AluControl <= CurrentInstruction(5 downto 0);

		-- load operand 1 with register whose address is in rs
			AluOP1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
		
		
			if (CurrentInstruction(5 downto 0) = b"00000" or 
			    CurrentInstruction(5 downto 0) = b"00010" or  
				 CurrentInstruction(5 downto 0) = b"00011") then
			-- load operand 2 with shamt
				 AluOP2 <= x"000000" & b"000" & CurrentInstruction(10 downto 6);
			else
			-- load operand 2 with register whose address is in rt
				AluOP2 <= registerFile(to_integer(unsigned(currentInstruction(20 downto 16))));
			end if;
		-- sets register whose address is at rd to alu_result1
			--registerFile(to_integer(unsigned(currentInstruction(15 downto 11)))) := alu_result1;
		
		-- I types
		elsif opcode = b"100011" then
		 -- Load Word (23)
		 -- sign extension to offset
			AluOP2 <= x"0000" & CurrentInstruction(15 downto 0);
		-- currentInstruction (25 downto 21) denotes rs, which contains base address
			AluOp1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
		-- Alu Control set to Add.
			AluControl <=  b"100000";
		-- TODO set ControlSignals appropriately
		
		elsif opcode = b"101011" then
		-- Store Word (2B)
			AluOP2 <= x"0000" & CurrentInstruction(15 downto 0);
		-- currentInstruction (25 downto 21) denotes rs, which contains base address
			AluOp1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
		-- Alu Control set to Add.
			AluControl <=  b"100000";
		
		end if;

	end if;
end process;

end Behavioral;
