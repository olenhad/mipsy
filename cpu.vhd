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
			  DHalt : in std_logic;
	        DRegAddr : in std_logic_vector(4 downto 0);
			  DMemAddr : out std_logic_vector(31 downto 0);
			  DRegOut : out std_logic_vector(31 downto 0);
			  DMemOut : out std_logic_vector(31 downto 0);
			  DCPUState : out std_logic_vector(31 downto 0);
			  DCurrentIns : out std_logic_vector(31 downto 0);
			  DAlu1 : out std_logic_vector(31 downto 0);
			  DAlu2 : out std_logic_vector(31 downto 0);
			  DAluR1 : out std_logic_vector(31 downto 0);
			  DRegOutAddr : out std_logic_vector(4 downto 0) );
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
			ControlSignals : out std_logic_vector(4 downto 0);
			RegWBAddr : out std_logic_vector(    4 downto 0);
			WaitFor : out std_logic_vector (3 downto 0);
			registerOut : out std_logic_vector(31 downto 0);
			lreg: out std_logic_vector(31 downto 0);
			lregAddr : out std_logic_vector(4 downto 0));
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
          ADDR : in std_logic_vector(31 downto 0);
          DI   : in std_logic_vector(31 downto 0);
          DO   : out std_logic_vector(31 downto 0));
end component;

type CPUState is (FetchDecode, Execute, MemWR, WriteBack, AluWait, AluWaitWB);

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
signal decode_ControlSignals : std_logic_vector(4 downto 0) := (others => '0');
signal decode_waitFor : std_logic_vector(3 downto 0);
signal decode_registerOut : std_logic_vector(31 downto 0);
signal decode_lreg : std_logic_vector(31 downto 0);
signal decode_lregAddr : std_logic_vector(4 downto 0);
signal decode_RegWBAddr : std_logic_vector(4 downto 0);

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
signal ram_addr : std_logic_vector(31 downto 0) := (others => '0');
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
								  RegWBAddr => decode_RegWBAddr,
								  WaitFor => decode_waitFor,
								  registerOut => decode_registerOut,
								  lreg => decode_lreg,
								  lregAddr => decode_lregAddr);

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
				DCurrentIns <= currentIns;
				DCPUState <= (others => '0');
				
				currentState := Execute;
				
					
			elsif currentState = Execute then
				
				decode_RegWrite <= '0';
				decode_WriteAddr <= (others => '0');
				decode_WriteData <= (others => '0');
				
				DCPUState <= (0 => '1', others => '0');
				
				waitCounter :=  to_integer(unsigned(decode_WaitFor));
				currentState := AluWait;
			
			elsif currentState = AluWait then
				DCPUState <= (5 => '1', others => '0');
				currentState := MemWR;
			
			elsif currentState = MemWR then
				DCPUState <= (1 => '1', others => '0');
				if sig_Branch = '0' and 
					sig_MemRead = '0' and 
					sig_MemWrite = '0' then 
					
				-- DO nothing. Update to next stage
				-- R Type	
					
				elsif sig_Branch = '0' and
				      sig_MemRead = '1' and 
					   sig_MemWrite = '0' then 
					
				-- lw 
				-- send alu's r1 which contains actual memory address after adding base and offset	
					ram_addr <= alu_r1;
					DCPUState <= x"FFFFFFFF";
				elsif sig_Branch = '0' and
				      sig_MemRead = '0' and
						sig_MemWrite = '1' then
				-- sw		
					ram_WE <= '1';	
					ram_ADDR <= alu_r1;
				-- registerOut sends data from rt	
					ram_DI <= decode_registerOut;
					
				end if;	
				currentState := AluWaitWB;
			
			elsif currentState = AluWaitWB then
				DCPUState <= (6 => '1', others => '0');
				currentState := WriteBack;
	
			elsif currentState = WriteBack then
					DCPUState <= (2 => '1', others => '0');
					ram_WE <= '0';
				-- R Type
				if sig_RegWrite = '1' and
					sig_MemToReg = '0' then
					
					decode_regWrite <= '1';
					-- TODO fix me for MUL, DIV
					-- write to rd
					-- also goes here with LUI
					decode_WriteAddr <= decode_RegWBAddr;
					-- send alu_r1
					decode_WriteData <= alu_r1;
					
				
				elsif sig_RegWrite = '1' and
				      sig_MemToReg = '1' then
					-- lw	
						-- RT for I type instructions	
					decode_regWrite <= '1';
					decode_WriteAddr <= decode_RegWBAddr;
					decode_WriteData <= ram_DO;
					
				end if;
				
				currentState := FetchDecode;
				
			end if;
			
			
		else
		
			waitCounter := waitCounter - 1;
		
		end if;
	end if;

end process;

DRegOut <= decode_lreg;

alu_op1 <= decode_AluOP1;
alu_op2 <= decode_AluOP2;

DAlu1 <= alu_op1;
DAlu2 <= alu_op2;

alu_control <= decode_AluControl;
DAluR1 <= alu_r1;
DRegOutAddr <= decode_lregAddr;

DMemOut <= ram_DO;
DMemAddr <= ram_addr;

end Behavioral;

