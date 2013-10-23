----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:13 10/18/2013 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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



entity control_unit is
	port(CLK  : in std_logic;
	     Debug_Ins: out std_logic_vector(31 downto 0);
		  Debug_PC : out std_logic_vector(8 downto 0)
		  );
end control_unit;

architecture Behavioral of control_unit is



component alu is
Port (	Clk			: in	STD_LOGIC;
		Control		: in	STD_LOGIC_VECTOR (5 downto 0);
		Operand1	: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2	: in	STD_LOGIC_VECTOR (31 downto 0);
		Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
		Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
		Debug		: out	STD_LOGIC_VECTOR (31 downto 0));
end component;

component ram is
	port (CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(11 downto 0);
          DI   : in std_logic_vector(31 downto 0);
          DO   : out std_logic_vector(31 downto 0));
end component;

component rom is
port (CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(8 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end component;



signal alu_control : std_logic_vector(5 downto 0) := (others => '0');
signal alu_operand1	: STD_LOGIC_VECTOR (31 downto 0) := (others => '0') ;
signal alu_operand2	: STD_LOGIC_VECTOR (31 downto 0) := (others => '0') ;
signal alu_result1	: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal alu_result2	: STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
signal alu_debug : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

signal ram_WE   : std_logic := '0';
signal ram_EN   : std_logic := '0';
signal ram_ADDR : std_logic_vector(11 downto 0) := (others => '0') ;
signal ram_DI   : std_logic_vector(31 downto 0) := (others => '0');
signal ram_DO   : std_logic_vector(31 downto 0) := (others => '0');

signal rom_EN   : std_logic := '0';
-- rom starting address set to 0
signal rom_ADDR : std_logic_vector(8 downto 0) := (others => '0') ;
signal rom_DATA   : std_logic_vector(31 downto 0) := (others => '0');


begin

mips_alu : alu port map(CLK => CLK,
                        operand1 => alu_operand1,
								operand2 => alu_operand2,
								control => alu_control,
								result1 => alu_result1,
								result2 => alu_result2,
								debug => alu_debug);

mips_ram : ram port map(CLK => CLK,
								WE => ram_WE,
								EN => ram_EN,
								ADDR => ram_ADDR,
								DI => ram_DI,
								DO => ram_DO);

mips_rom : rom port map(CLK => CLK,
								EN => rom_EN,
								ADDR => rom_ADDR,
								DATA => rom_DATA);
rom_EN <= '1';

process(clk)

	variable registerFile : RegisterSet := (others => (others => '0'));
	variable programCounter : std_logic_vector(8 downto 0) := (others => '0');
	variable currentInstruction : std_logic_vector(31 downto 0) := (others => '0');
	variable opcode : std_logic_vector(5 downto 0) := (others => '0');
	begin
	if (rising_edge(CLK)) then
		
		currentInstruction := rom_data;
		Debug_Ins <= currentInstruction;
		Debug_PC <=  programCounter;
		
		opcode := currentInstruction(31 downto 26);
		
		-- R type
		if opcode = (others => '0') then
		-- funct portion of Current Instruction
			alu_control <= currentInstruction(5 downto 0);
		-- load operand 1 with register whose address is in rs
			alu_operand1 <= registerFile(to_integer(unsigned(currentInstruction(25 downto 21))));
		-- load operand 2 with register whose address is in rt
			alu_operand2 <= registerFile(to_integer(unsigned(currentInstruction(20 downto 16))));
		-- sets register whose address is at rd to alu_result1
			registerFile(to_integer(unsigned(currentInstruction(15 downto 11)))) := alu_result1;
		end if;
		-- Program COunter update
		programCounter := std_logic_vector(unsigned(programCounter) + 4);
		rom_addr <= programCounter;
		
	end if;

end process;


end Behavioral;

