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
			ControlSignals : out std_logic_vector(4 downto 0);
			RegWBAddr : out std_logic_vector(4 downto 0);
			WaitFor : out std_logic_vector (3 downto 0);
			registerOut : out std_logic_vector(31 downto 0);
			lreg: out std_logic_vector(31 downto 0);
			lregAddr : out std_logic_vector(4 downto 0)
			--jAddr : out std_logic_vector(31 downto 0)
			);

end decode;

architecture Behavioral of decode is

begin
-- Circuit can't be combinational because it needs to interface reads and writes to the RegisterFile

-- ControlSignals
-- 0 => Branch
-- 1 => MemRead
-- 2 => MemWrite
-- 3 => RegWrite
-- 4 => MemToReg


process(CLK)
	variable registerFile : RegisterSet := (others => (others => '0'));
	variable opcode : std_logic_vector(5 downto 0) := (others => '0'); 
begin
	if rising_edge(CLK) then
		
		if currentInstruction = x"FFFFFFFF" then
			--registerOut <= registerFile(to_integer(unsigned(WriteAddr)));
			--registerOut <= x"000000" & b"000" & WriteAddr;
		elsif RegWrite = '1' then
			registerFile(to_integer(unsigned(WriteAddr))) := WriteData;
			lreg <= registerFile(to_integer(unsigned(WriteAddr)));
			lregAddr <= WriteAddr;
		else
		
			opcode := currentInstruction(31 downto 26);
			ControlSignals <= (others => '0');
			registerOut <= (others => '0');
			-- R type
			if opcode = b"000000" then
			-- all R type instructions just Write to registers. assert RegWrite	
				ControlSignals <= "01000";
			-- funct portion of Current Instruction
				AluControl <= CurrentInstruction(5 downto 0);

			-- load operand 1 with register whose address is in rs
				AluOP1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
			
				RegWBAddr <= currentInstruction(15 downto 11);
			
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
				AluOP1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
			-- Alu Control set to Add.
				AluControl <=  b"100001";
			-- TODO set ControlSignals appropriately
			-- ControlSignals
			-- 0 => Branch
			-- 1 => MemRead
			-- 2 => MemWrite
			-- 3 => RegWrite
			-- 4 => MemToReg
			-- MemRead => 1. RegWrite => 1. MemToReg => 1	
				ControlSignals <= b"11010";
				RegWBAddr <= currentInstruction(20 downto 16);
				
			elsif opcode = b"101011" then
			-- Store Word (2B)
				AluOP2 <= x"0000" & CurrentInstruction(15 downto 0);
			-- currentInstruction (25 downto 21) denotes rs, which contains base address
				AluOP1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
			-- Alu Control set to Add.
				AluControl <=  b"100000";
				
			-- ControlSignals
			-- 0 => Branch
			-- 1 => MemRead
			-- 2 => MemWrite
			-- 3 => RegWrite
			-- 4 => MemToReg
			-- MemWrite => 1	
				ControlSignals <= b"00100";
				
				registerOut <= registerFile(to_integer(unsigned(currentInstruction(20 downto 16))));
				RegWBAddr <= currentInstruction(20 downto 16);
			elsif opcode = b"001111" then
			-- LUI (F)
				AluOP1 <= x"0000" & CurrentInstruction(15 downto 0);
				AluOP2 <= x"00000010";
				AluControl <= b"000000";
				ControlSignals <= b"01000";
				RegWBAddr <= currentInstruction(20 downto 16);
				
			elsif opcode = b"000010" then
			-- J 
			-- ControlSignals
			-- 0 => Branch
			-- 1 => MemRead
			-- 2 => MemWrite
			-- 3 => RegWrite
			-- 4 => MemToReg
			-- MemWrite => 1	
			--	jAddr <= b"0000" & CurrentInstruction(25 downto 0) & b"00";
				ControlSignals <= b"00001";
			
			elsif opcode = b"000100" then
			-- BEQ	
			-- Jump to offset from 15 to 0
			--	jAddr <= x"000" & b"00" & CurrentInstruction(15 downto 0) & b"00";
			-- ALU performs equality comparison/
			-- RS sent as OP1	
				AluOP1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
			-- RT sent as OP2	
				AluOP2 <= registerFile(to_integer(unsigned(currentInstruction(20 downto 16))));
			-- send equality test to aluControl	
				AluControl <= b"000100";
			-- ControlSignals
			-- 0 => Branch
			-- 1 => MemRead
			-- 2 => MemWrite
			-- 3 => RegWrite
			-- 4 => MemToReg
				ControlSignals <= b"00001";
			end if;
		end if;
	end if;
end process;

-- checks for DIV, DIVU
waitFor <= x"8" when (CurrentInstruction(5 downto 0) = b"011010" or 
							 CurrentInstruction(5 downto 0) = b"011011") else
-- checks for LUI
			  --x"0" when CurrentInstruction(31 downto 26) = b"001111" else
			  x"1";

end Behavioral;

