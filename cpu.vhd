----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    05:33:54 10/24/2013 
-- Design Name: 
-- Module Name:    cpu - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu is
    Port ( CLK : in  STD_LOGIC;
	        DInstruction : out std_logic_vector(31 downto 0);
			  DRamWord0 : out std_logic_vector(31 downto 0);
			  DRamWord1 : out std_logic_vector(31 downto 0));
end cpu;

architecture Behavioral of cpu is

component fetch is
	Port(CLK  : in std_logic;
	     isJump : in std_logic;
		  jumpAddress : in std_logic_vector(31 downto 0);
		  programCounter : out std_logic_vector(31 downto 0);
		  currentInstruction : out std_logic_vector(31 downto 0));
	
end component;

component decode is
	PORT( CLK : in std_logic;
			CurrentInstruction : in std_logic_vector(31 downto 0);
			WriteAddr : in std_logic_vector(4 downto 0);
			WriteData : in std_logic_vector(31 downto 0);
			RegWrite : in std_logic;
			AluOP1 : out std_logic_vector(31 downto 0);
			AluOP2 : out std_logic_vector(31 downto 0);
			AluControl : out std_logic_vector(5 downto 0);
			ControlSignals : out std_logic_vector(5 downto 0));
end component;

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

signal fetch_isJump : std_logic := '0';
signal fetch_jumpAddress : std_logic_vector(31 downto 0) := (others => '0');
signal fetch_programCounter : std_logic_vector(31 downto 0) := (others => '0');

signal decode_CurrentInstruction : std_logic_vector(31 downto 0) := (others => '0');
signal decode_WriteAddr : std_logic_vector(4 downto 0) := (others => '0');
signal decode_WriteData : std_logic_vector(31 downto 0) := (others => '0');
signal decode_RegWrite : std_logic := '0';
signal decode_AluOP1 :  std_logic_vector(31 downto 0) := (others => '0');
signal decode_AluOP2 :  std_logic_vector(31 downto 0) := (others => '0');
signal decode_AluControl : std_logic_vector(5 downto 0) := (others => '0');
signal decode_ControlSignals : std_logic_vector(5 downto 0) := (others => '0');

signal alu_control : std_logic_vector(5 downto 0) := (others => '0');
signal alu_op1 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_op2 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_r1 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_r2 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_debug : std_logic_vector(31 downto 0) := (others => '0');

signal ram_we : std_logic := '0';
signal ram_en : std_logic := '1';
signal ram_addr : std_logic_vector(11 downto 0) := (others => '0');
signal ram_di  : std_logic_vector(31 downto 0) := (others => '0');
signal ram_do  : std_logic_vector(31 downto 0) := (others => '0');

begin

ifetch : fetch port map (CLK => CLK,
								 isJump => fetch_isJump,
								 jumpAddress => fetch_jumpAddress,
		                   programCounter => fetch_programCounter,
								 currentInstruction => decode_currentInstruction);

idecode : decode port map (CLK => CLK,
                          CurrentInstruction => decode_currentInstruction,
								  WriteAddr => decode_WriteAddr,
								  WriteData => decode_WriteData,
								  RegWrite => decode_RegWrite,
								  AluOP1 => decode_AluOP1,
								  AluOP2 => decode_AluOP2,
								  AluControl => decode_AluControl,
								  ControlSignals => decode_ControlSignals);

ialu : alu port map (CLK => CLK,
							Control => alu_control,
							Operand1	=> alu_op1,
							Operand2	=> alu_op2,
							Result1	=> alu_r1,
							Result2  => alu_r2,
							Debug		=> alu_debug);

iram : ram port map (CLK => CLK,
							WE => ram_WE,
							EN =>  ram_EN,
							ADDR => ram_ADDR,
							DI  => ram_DI,
							DO  => ram_DO);
							

process(CLK) 

if rising_edge()

end process;

end Behavioral;

