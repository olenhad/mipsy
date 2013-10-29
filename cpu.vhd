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
use IEEE.NUMERIC_STD.ALL;

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

component rom is
	port (
			EN : in std_logic;
			ADDR : in std_logic_vector(31 downto 0);
			DATA : out std_logic_vector(31 downto 0));
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
			ControlSignals : out std_logic_vector(5 downto 0);
			WaitFor : out std_logic_vector (3 downto 0));
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

type CPUState is (FetchDecode, Execute, MemRW, WriteBack);

signal rom_EN : std_logic := '0';
signal rom_ADDR : std_logic_vector(31 downto 0) := (others => '0');
signal rom_DATA : std_logic_vector(31 downto 0) := (others => '0');

signal decode_CurrentInstruction : std_logic_vector(31 downto 0) := (others => '0');
signal decode_WriteAddr : std_logic_vector(4 downto 0) := (others => '0');
signal decode_WriteData : std_logic_vector(31 downto 0) := (others => '0');
signal decode_RegWrite : std_logic := '0';
signal decode_AluOP1 :  std_logic_vector(31 downto 0) := (others => '0');
signal decode_AluOP2 :  std_logic_vector(31 downto 0) := (others => '0');
signal decode_AluControl : std_logic_vector(5 downto 0) := (others => '0');
signal decode_ControlSignals : std_logic_vector(5 downto 0) := (others => '0');
signal decode_waitFor : std_logic_vector(3 downto 0);

signal sig_Branch : std_logic := '0';
signal sig_MemRead : std_logic := '0';
signal sig_MemWrite : std_logic := '0';
signal sig_RegWrite : std_logic := '0';
signal sig_MemToReg : std_logic := '0';

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

irom  : rom port map (EN => '1',
							  ADDR => rom_ADDR,
							  DATA => rom_DATA);
	
idecode : decode port map (CLK => CLK,
                          CurrentInstruction => decode_currentInstruction,
								  WriteAddr => decode_WriteAddr,
								  WriteData => decode_WriteData,
								  RegWrite => decode_RegWrite,
								  AluOP1 => decode_AluOP1,
								  AluOP2 => decode_AluOP2,
								  AluControl => decode_AluControl,
								  ControlSignals => decode_ControlSignals,
								  WaitFor => decode_waitFor);

		-- ControlSignals
		-- 0 => Branch
		-- 1 => MemRead
		-- 2 => MemWrite
		-- 3 => RegWrite
		-- 4 => MemToReg
		-- MemWrite => 1

sig_Branch <= decode_ControlSignals(0);
sig_MemRead <= decode_ControlSignals(1);
sig_MemWrite <= decode_ControlSignals(2);
sig_RegWrite <= decode_ControlSignals(3);
sig_MemToReg <= decode_ControlSignals(4);

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
							

alu_op1 <= decode_AluOP1;
alu_op2 <= decode_AluOP2;
alu_control <= decode_AluControl;


process(CLK) 
variable pc : std_logic_vector(31 downto 0) := (others => '0');
variable currentIns :  std_logic_vector(31 downto 0) := (others => '0');
variable currentState : CPUState := FetchDecode;
variable waitCounter : integer := 0;
begin
	if rising_edge(CLK) then
		if waitCounter = 0 then
			if currentState = FetchDecode then
				
				currentIns := rom_DATA;
				
				pc := std_logic_vector(unsigned(pc) + 4);

				rom_ADDR <= pc;

				
				-- feed cur Ins to decode. decode will give alu appropriate operands by nnext clk cycle
				decode_currentInstruction <= currentIns;
				decode_RegWrite <= '0';
				
	
				currentState := Execute;
					
			elsif currentState = Execute then
				
				waitCounter := decode_WaitFor;
				currentState := MemWR;
				
			elsif currentState = MemWR then
			
			-- R Type			
				if sig_Branch = '0' and 
					sig_MemRead = '0' and 
					sig_MemWrite = '0' and 
					sig_RegWrite = '1' and
					sig_MemToReg = '0' then
					
					
					
				end if;
			end if;
			
			if currentState = WriteBack then
			
				
			end if;
			
		else
			waitCounter := waitCounter - 1;
		end if;
	end if;

end process;

end Behavioral;

