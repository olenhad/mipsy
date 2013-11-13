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
use work.utils.ALL;

entity cpu is
    Port ( CLK : in  STD_LOGIC;
			  cpu_op1 : in STD_LOGIC_VECTOR (31 downto 0);
			  cpu_op2 : in STD_LOGIC_VECTOR (31 downto 0);
--			  DHalt : in std_logic;
--	        DRegAddr : in std_logic_vector(4 downto 0);
--			  DMemAddr : out std_logic_vector(31 downto 0);
			  DRegOut : out std_logic_vector(31 downto 0);
			  DOutput : out std_logic_vector(31 downto 0);
			  DOutput2 : out std_logic_vector(31 downto 0);
--			  DMemOut : out std_logic_vector(31 downto 0);
--			  DCPUState : out std_logic_vector(31 downto 0);
			  DCurrentIns : out std_logic_vector(31 downto 0);
			  DCurrentIns2 : out std_logic_vector(31 downto 0);
			  DCurrentIns3 : out std_logic_vector(31 downto 0);
			  DCurrentIns4 : out std_logic_vector(31 downto 0);
			  DCurrentIns5 : out std_logic_vector(31 downto 0);
			  DAlu1 : out std_logic_vector(31 downto 0);
			  DAlu2 : out std_logic_vector(31 downto 0);
			  DAluR1 : out std_logic_vector(31 downto 0);
			  DAluR2 : out std_logic_vector(31 downto 0);
			  DRegOutAddr : out std_logic_vector(4 downto 0) 
			  );
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
			WaitFor : out std_logic_vector (7 downto 0);
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

--component ram is
--	port (CLK  : in std_logic;
--          WE   : in std_logic;
--          EN   : in std_logic;
--          ADDR : in std_logic_vector(31 downto 0);
--          DI   : in std_logic_vector(31 downto 0);
--          DO   : out std_logic_vector(31 downto 0));
--end component;

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
signal decode_waitFor : std_logic_vector(7 downto 0);
signal decode_registerOut : std_logic_vector(31 downto 0);
signal decode_lreg : std_logic_vector(31 downto 0);
signal decode_lregAddr : std_logic_vector(4 downto 0);
signal decode_RegWBAddr : std_logic_vector(4 downto 0);

signal alu_control : std_logic_vector(5 downto 0) := (others => '0');
signal alu_op1 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_op2 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_r1 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_r2 : std_logic_vector(31 downto 0) := (others => '0');
signal alu_debug : std_logic_vector(31 downto 0) := (others => '0');


signal RAM0: RamData := (0 => x"01", 1 => x"06", 2 => x"01", 3 => x"0d",others => (others => '0'));
signal RAM1: RamData := (0 => x"00",others => (others => '0'));
signal RAM2: RamData := (0 => x"00",others => (others => '0'));
signal RAM3: RamData := (0 => x"00",others => (others => '0'));
--signal ram_we : std_logic := '0';
--signal ram_en : std_logic := '1';
--signal ram_addr : std_logic_vector(31 downto 0) := (others => '0');
--signal ram_di  : std_logic_vector(31 downto 0) := (others => '0');
--signal ram_do  : std_logic_vector(31 downto 0) := (others => '0');

signal EX_currentIns :  std_logic_vector(31 downto 0) := (others => '0');
signal ALUW_currentIns :  std_logic_vector(31 downto 0) := (others => '0');
signal MEMWR_currentIns :  std_logic_vector(31 downto 0) := (others => '0');
signal WB_currentIns :  std_logic_vector(31 downto 0) := (others => '0');


signal ALUW_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');
signal MEMWR_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');
signal WB_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');


signal ALUW_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');
signal MEMWR_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');
signal WB_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');

signal MEMWR_alur1:  std_logic_vector(31 downto 0) := (others => '0');
signal MEMWR_alur2:  std_logic_vector(31 downto 0) := (others => '0');
signal WB_alur1:  std_logic_vector(31 downto 0) := (others => '0');
signal WB_alur2:  std_logic_vector(31 downto 0) := (others => '0');

signal ALUW_decodeRegWBAddr : std_logic_vector(4 downto 0);
signal MEMWR_decodeRegWBAddr : std_logic_vector(4 downto 0);
signal WB_decodeRegWBAddr : std_logic_vector(4 downto 0);

	signal END_currentIns : std_logic_vector(31 downto 0) := (others => '0');
	signal END_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');
	signal END_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');
	signal END_alur1 :  std_logic_vector(31 downto 0) := (others => '0');
	signal END_alur2 :  std_logic_vector(31 downto 0) := (others => '0');
	signal END_decodeRegWBAddr : std_logic_vector(4 downto 0);
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

ialu : alu port map (CLK => CLK,
							Control => alu_control,
							Operand1	=> alu_op1,
							Operand2	=> alu_op2,
							Result1	=> alu_r1,
							Result2  => alu_r2,
							Debug		=> alu_debug);
--
--iram : ram port map (CLK => CLK,
--							WE => ram_WE,
--							EN =>  ram_EN,
--							ADDR => ram_ADDR,
--							DI  => ram_DI,
--							DO  => ram_DO);
--							




process(CLK) 
	variable pc : std_logic_vector(31 downto 0) := (others => '0');
	variable currentState : CPUState := FetchDecode;

	variable FD_currentIns :  std_logic_vector(31 downto 0) := (others => '0');


	
	variable waitCounter : integer := 0;
	variable tconcat : std_logic_vector(17 downto 0);
	variable ram_WE : std_logic := '0';
	variable vlreg : std_logic_vector(31 downto 0) := (others => '0');
	variable vlregAddr : std_logic_vector(4 downto 0) := (others => '0');
	variable prev_op1 : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
	variable prev_op2 : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
	variable res1Reg : STD_LOGIC_vector (31 downto 0):= (others => '0');
	variable res2Reg : STD_LOGIC_vector (31 downto 0):= (others => '0');
	
	variable lo : std_logic_vector(31 downto 0) := (others => '0'); 
	variable hi : std_logic_vector(31 downto 0) := (others => '0'); 
	
	--Prefix indicates stage where value is fetched
	variable EX_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');
	variable EX_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');
	variable ALUW_alur1 :  std_logic_vector(31 downto 0) := (others => '0');
	variable ALUW_alur2 :  std_logic_vector(31 downto 0) := (others => '0');
	variable EX_decodeRegWBAddr : std_logic_vector(4 downto 0);
	variable EX_assignO1 :  std_logic_vector(32 downto 0) := (others => '0');
	variable EX_assignO2 :  std_logic_vector(32 downto 0) := (others => '0');
	variable EX_assignRegOut :  std_logic_vector(32 downto 0) := (others => '0');
	
	variable sig_Branch : std_logic := '0';
	variable sig_MemRead : std_logic := '0';
	variable sig_MemWrite : std_logic := '0';
	variable sig_RegWrite : std_logic := '0';
	variable sig_MemToReg : std_logic := '0';
begin
	
	if falling_edge(CLK) then
		vlreg := decode_lreg;
		vlregAddr := decode_lregAddr;
		
		if(prev_op1 /= cpu_op1) then
			prev_op1 := cpu_op1;
			RAM0(0) <= prev_op1(7 downto 0);
			RAM1(0) <= prev_op1(15 downto 8);
			RAM2(0) <= prev_op1(23 downto 16);
			RAM3(0) <= prev_op1(31 downto 24);
		--end if;
		else
		--if(prev_op2 /= cpu_op2) then
			prev_op2 := cpu_op2;
			RAM0(1) <= prev_op2(7 downto 0);
			RAM1(1) <= prev_op2(15 downto 8);
			RAM2(1) <= prev_op2(23 downto 16);
			RAM3(1) <= prev_op2(31 downto 24);
		end if;
		
		if waitCounter = 0 then
			
			alu_control <= decode_AluControl;
			
			if currentState = FetchDecode then
				
				
				FD_currentIns := rom_DATA;
				DCurrentIns <= FD_currentIns;
	--			DCPUState <= (others => '0');

--				 Check if instruction is a jump
				if FD_currentIns(31 downto 26) = b"000010" then
					--pc := b"0000" & CurrentIns(25 downto 0) & b"00";
					pc := b"000000" & FD_currentIns(25 downto 0);
					currentState := Execute;
					decode_currentInstruction <= FD_currentIns;						
				elsif FD_currentIns(31 downto 26) = b"000011" then
				-- check for JAL
					decode_WriteAddr <= b"11111";
					decode_WriteData <= std_logic_vector(unsigned(pc) + 1);
					decode_RegWrite <= '1';
					pc := b"000000" & FD_currentIns(25 downto 0);
					currentState := FetchDecode;
				else
					pc := std_logic_vector(unsigned(pc) + 1);
					-- feed cur Ins to decode. decode will give alu appropriate operands by nnext clk cycle
					
					decode_currentInstruction <= FD_currentIns;	
				
					currentState := Execute;
				end if;
				
				EX_currentIns <= FD_currentIns;
			
			end if;		
			
			if currentState = Execute then
				
				DCurrentIns2 <= EX_currentIns;
				--Assignment of propagated values
				EX_decodeControlSignals := decode_controlSignals;
				EX_decodeRegWBAddr := decode_RegWBAddr;
				--Main execution
				alu_op1 <= decode_AluOP1;
				alu_op2 <= decode_AluOP2;
				EX_assignO1 := decode_AluOP1 & b"0";
				EX_assignO2 := decode_AluOP2 & b"0";

				--change if store word to latest value
				--EX_decodeRegOut := decode_registerOut;
				EX_assignRegOut := decode_registerOut & b"0";
				-- First stage gathers data to be forwaded
				-- Dont know where to forward in this stage
				-- Hence, gathered data is assigned to temp (EX_assignO1 and EX_assignO2) vars
				if END_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
						END_alur1(0) /= 'U' then
							--Checking if END is R-type.
							if END_decodeControlSignals(3) = '1' and 
								END_decodeControlSignals(4) = '0' then
									--alu_op2 <= END_alur1;
									EX_assignO2 := END_alur1 & b"0";
							-- Checking if LW
							elsif END_decodeControlSignals(3) = '1' and 
								END_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op2 <= RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- EX_assignO2 := RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(END_alur1(3 downto 0))));
								EX_assignO2 := END_alur1 & b"1";
							-- Checking if SW
							elsif END_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
							
					end if;
					
					if END_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
						END_alur1(0) /= 'U' and
						EX_currentIns(31 downto 26) /= b"001000" and
						EX_currentIns(31 downto 26) /= op_SLTI and
						EX_currentIns(31 downto 26) /= op_ORI 
						then
							--Checking if END is R-type.
							if END_decodeControlSignals(3) = '1' and 
								END_decodeControlSignals(4) = '0' then
								--alu_op1 <= END_alur1;
								EX_assignO1 := END_alur1 & b"0";
								EX_assignRegOut := END_alur1 & b"0";
							-- Checking if LW
							elsif END_decodeControlSignals(3) = '1' and 
								END_decodeControlSignals(4) = '1' then
								DRegOut <= (others => '1');
								-- Sets value to last value contained at rs + offset
								--alu_op1 <= RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- EX_assignO1 := RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(END_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(END_alur1(3 downto 0))));
								EX_assignO1 := END_alur1 & b"1";
								EX_assignRegOut := END_alur1 & b"1";
							-- Checking if SW
							elsif END_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					
					-- If value is written towards the end of a WB stage
					if WB_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
						WB_alur1(0) /= 'U' then
							--Checking if WB is R-type.
							if WB_decodeControlSignals(3) = '1' and 
								WB_decodeControlSignals(4) = '0' then
								--alu_op2 <= WB_alur1;
								EX_assignO2 := WB_alur1 & b"0";
							-- Checking if LW
							elsif WB_decodeControlSignals(3) = '1' and 
								WB_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op2 <= RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- EX_assignO2 := RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(WB_alur1(3 downto 0))));
								EX_assignO2 := WB_alur1 & b"1";
							-- Checking if SW
							elsif WB_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					
					if WB_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
						WB_alur1(0) /= 'U' and
						EX_currentIns(31 downto 26) /= b"001000"  and
						EX_currentIns(31 downto 26) /= op_SLTI and
						EX_currentIns(31 downto 26) /= op_ORI then
							--Checking if END is R-type.
							if WB_decodeControlSignals(3) = '1' and 
								WB_decodeControlSignals(4) = '0' then
								--alu_op1 <= WB_alur1;
								EX_assignO1 := WB_alur1 & b"0";
								EX_assignRegOut := WB_alur1 & b"0";
							-- Checking if LW
							elsif WB_decodeControlSignals(3) = '1' and 
								WB_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op1 <= RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- EX_assignO1 := RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(WB_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(WB_alur1(3 downto 0))));
								EX_assignO1 := WB_alur1 & b"1";
								EX_assignRegOut := WB_alur1 & b"1";
							-- Checking if SW
							elsif WB_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					--last change
					
					-- If value is written towards the end of MEMWR stage
					if MEMWR_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
						MEMWR_alur1(0) /= 'U' then
							--Checking if END is R-type.
							if MEMWR_decodeControlSignals(3) = '1' and 
								MEMWR_decodeControlSignals(4) = '0' then
								--alu_op2 <= MEMWR_alur1;
								EX_assignO2 := MEMWR_alur1 & b"0";
							-- Checking if LW
							elsif MEMWR_decodeControlSignals(3) = '1' and 
								MEMWR_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op2 <= RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- EX_assignO2 := RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(MEMWR_alur1(3 downto 0))));
								EX_assignO2 := MEMWR_alur1 & b"1";
							-- Checking if SW
							elsif MEMWR_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					
					if MEMWR_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
						MEMWR_alur1(0) /= 'U' and
						EX_currentIns(31 downto 26) /= b"001000"  and
						EX_currentIns(31 downto 26) /= op_SLTI and
						EX_currentIns(31 downto 26) /= op_ORI then
							--Checking if END is R-type.
							if MEMWR_decodeControlSignals(3) = '1' and 
								MEMWR_decodeControlSignals(4) = '0' then
								--alu_op1 <= MEMWR_alur1;
								EX_assignO1 := MEMWR_alur1 & b"0";
								EX_assignRegOut := MEMWR_alur1 & b"0";
							-- Checking if LW
							elsif MEMWR_decodeControlSignals(3) = '1' and 
								MEMWR_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op1 <= RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- EX_assignO1 := RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(MEMWR_alur1(3 downto 0))));
								EX_assignO1 := MEMWR_alur1 & b"1";
								EX_assignRegOut := MEMWR_alur1 & b"1";
							-- Checking if SW
							elsif MEMWR_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					
					-- If value is written towards the end of AluW stage
					-- Unlike other stages, we check alu_r1 directly here because we use a 
					-- variable below and variables are sequentially assigned
					if ALUW_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
						ALUW_alur1(0) /= 'U' then
							
							--Checking if END is R-type.
							if ALUW_decodeControlSignals(3) = '1' and 
								ALUW_decodeControlSignals(4) = '0' then
								--alu_op2 <= alu_r1;
								EX_assignO2 := alu_r1 & b"0";
							-- Checking if LW
							elsif ALUW_decodeControlSignals(3) = '1' and 
								ALUW_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op2 <= RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- EX_assignO2 := RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(alu_r1(3 downto 0))));
								EX_assignO2 := alu_r1 & b"1";
							-- Checking if SW
							elsif ALUW_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
					end if;
					-- AND HERE
					if ALUW_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
						ALUW_alur1(0) /= 'U' and
						EX_currentIns(31 downto 26) /= b"001000"  and
						EX_currentIns(31 downto 26) /= op_SLTI and
						EX_currentIns(31 downto 26) /= op_ORI then
							--Checking if END is R-type.
							if ALUW_decodeControlSignals(3) = '1' and 
								ALUW_decodeControlSignals(4) = '0' then
								--alu_op1 <= alu_r1;
								EX_assignO1 := alu_r1 & b"0";
								EX_assignRegOut := alu_r1 & b"0";
							-- Checking if LW
							elsif ALUW_decodeControlSignals(3) = '1' and 
								ALUW_decodeControlSignals(4) = '1' then
								
								-- Sets value to last value contained at rs + offset
								--alu_op1 <= RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- EX_assignO1 := RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM2(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM1(to_integer(unsigned(alu_r1(3 downto 0)))) &
								-- 			  RAM0(to_integer(unsigned(alu_r1(3 downto 0))));
								EX_assignO1 := alu_r1 & b"1";
								EX_assignRegOut := alu_r1 & b"1";
							-- Checking if SW
							elsif ALUW_decodeControlSignals(2) = '1' then
							-- MEM[$s + offset] = $t; advance_pc (4);
							-- Syntax:
							---sw $t, offset($s)	
							-- Don't care for R-type
							end if;
						--	DRegOut <= (others => '0');
					end if;
				-- checking for MFHI
				if (EX_currentIns(5 downto 0) = b"010000" and EX_currentIns(31 downto 26) = b"000000") then
					-- If ALUW Ins is of the MUL/DIV family then we can't access HI directly as it hasn't been assigned yet
					-- therefore we use alu_r1
					if (ALUW_currentIns(5 downto 0) = b"011000" and ALUW_currentIns(31 downto 26) = b"000000") or 
						(ALUW_currentIns(5 downto 0) = b"011001" and ALUW_currentIns(31 downto 26) = b"000000") or 
						(ALUW_currentIns(5 downto 0) = b"011010" and ALUW_currentIns(31 downto 26) = b"000000") or
						(ALUW_currentIns(5 downto 0) = b"011011" and ALUW_currentIns(31 downto 26) = b"000000")	then
							alu_op1 <= alu_r2;
					else
					-- Otherwise we just assign HI
						alu_op1 <= HI;
					end if;					
					
				-- checking for MMFLO	 
				elsif (EX_currentIns(5 downto 0) = b"010010" and EX_currentIns(31 downto 26) = b"000000") then
					if (ALUW_currentIns(5 downto 0) = b"011000" and ALUW_currentIns(31 downto 26) = b"000000") or 
						(ALUW_currentIns(5 downto 0) = b"011001" and ALUW_currentIns(31 downto 26) = b"000000") or 
						(ALUW_currentIns(5 downto 0) = b"011010" and ALUW_currentIns(31 downto 26) = b"000000") or
						(ALUW_currentIns(5 downto 0) = b"011011" and ALUW_currentIns(31 downto 26) = b"000000")	then
							alu_op1 <= alu_r1;
					else
						alu_op1 <= LO;
					end if;
				-- checking for R type, or ADDI or SLTI
				elsif EX_currentIns(31 downto 26) = b"000000" or 
						EX_currentIns(31 downto 26) = b"001000" or
						EX_currentIns(31 downto 26) = op_SLTI or
						EX_currentIns(31 downto 26) = op_ORI 
						then
						
						case EX_assignO1(0) is
							when '1' => alu_op1 <= RAM3(to_integer(unsigned(EX_assignO1(4 downto 1)))) &
								 			  RAM2(to_integer(unsigned(EX_assignO1(4 downto 1)))) &
								 			  RAM1(to_integer(unsigned(EX_assignO1(4 downto 1)))) &
								 			  RAM0(to_integer(unsigned(EX_assignO1(4 downto 1))));
							when others => alu_op1 <= EX_assignO1(32 downto 1);
						end case;
						--alu_op1 <= EX_assignO1 ;
						case EX_assignO2(0) is
							when '1' => alu_op2 <= RAM3(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM2(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM1(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM0(to_integer(unsigned(EX_assignO2(4 downto 1))));
							when others => alu_op2 <= EX_assignO2(32 downto 1);
						end case;
						--alu_op2 <= EX_assignO2;	
				
				elsif EX_currentIns(31 downto 26) = b"100011" then
				-- LOAD WORD
				-- $t = MEM[$s + offset]; advance_pc (4);
				--Syntax:
				--lw $t, offset($s) 
				-- forward ONLY Rs (25 to 21).

				case EX_assignO2(0) is
							when '1' => alu_op1 <= RAM3(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM2(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM1(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM0(to_integer(unsigned(EX_assignO2(4 downto 1))));
							when others => alu_op1 <= EX_assignO2(32 downto 1);
						end case;
					--alu_op1 <= EX_assignO1;

				elsif EX_currentIns(31 downto 26) = b"101011" then
					--- STORE WORD
					-- Both Rs, and Rt to be forwarded
				-- Check for 'U' for unintialised valus
				-- Priority system. Most recent change is applied
				-- if 25-21 i.e , Rs, or the base addr. to be forwarded
				-- if 20-16 i.e , rT, or value to be stored, to be forwarded 

				-- EX_assign2 should contain new val of 25-21, rS
					case EX_assignO2(0) is
							when '1' => alu_op1 <= RAM3(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM2(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM1(to_integer(unsigned(EX_assignO2(4 downto 1)))) &
								 			  RAM0(to_integer(unsigned(EX_assignO2(4 downto 1))));
							when others => alu_op1 <= EX_assignO2(32 downto 1);
						end case;
					--alu_op1 <= EX_assignO2;
					--rT val being forwarded

				-- EX_assign1 should contain new val of 20-16, rT
					if EX_assignRegOut(0) = '1' then
							EX_decodeRegOut := RAM3(to_integer(unsigned(EX_assignRegOut(4 downto 1)))) &
								 			  RAM2(to_integer(unsigned(EX_assignRegOut(4 downto 1)))) &
								 			  RAM1(to_integer(unsigned(EX_assignRegOut(4 downto 1)))) &
								 			  RAM0(to_integer(unsigned(EX_assignRegOut(4 downto 1))));
					else
						EX_decodeRegOut := EX_assignRegOut(32 downto 1);
					end if;
					--EX_decodeRegOut := EX_assignO1;
					-- If value is written to a register towards the end of a instruction
					-- TODO. Check whether ControlSignal checks are required?
				-- else
				-- 	alu_op1 <= EX_assignO1(32 downto 1);
				-- 	alu_op2 <= EX_assignO2(32 downto 1);
				end if;


				waitCounter :=  to_integer(unsigned(decode_WaitFor));
				currentState := AluWait;
				
				
				--Signal propagation
				ALUW_currentIns <= EX_currentIns;
				ALUW_decodeRegOut <= EX_decodeRegOut;
				ALUW_decodeControlSignals <= EX_decodeControlSignals;
				ALUW_decodeRegWBAddr <= EX_decodeRegWBAddr;
				
			end if;
			
			if currentState = AluWait then
				DAluR1 <= alu_r1;
				DAluR2 <= alu_r2;
				DCurrentIns3 <= ALUW_currentIns;
				ALUW_alur1 := alu_r1;
				ALUW_alur2 := alu_r2;
				Dregout <= alu_r2;
				
				-- IF ALUW_Currennt Ins is of mul/div family
				if (ALUW_currentIns(5 downto 0) = b"011000" and ALUW_currentIns(31 downto 26) = b"000000") or 
					(ALUW_currentIns(5 downto 0) = b"011001" and ALUW_currentIns(31 downto 26) = b"000000") or 
					(ALUW_currentIns(5 downto 0) = b"011010" and ALUW_currentIns(31 downto 26) = b"000000") or
					(ALUW_currentIns(5 downto 0) = b"011011" and ALUW_currentIns(31 downto 26) = b"000000")	then
						lo := ALUW_alur1;
						hi := ALUW_alur2;
				end if;
				
				if (ALUW_currentIns(20 downto 0) = b"000000000000000001000" and
					 ALUW_CurrentIns(31 downto 26) = b"000000") then
				-- JR
					pc := ALUW_decodeRegOut;
					currentState := FetchDecode;
				elsif (ALUW_CurrentIns(20 downto 0) = b"000001111100000001001" and
					    ALUW_CurrentIns(31 downto 26) = b"000000") then
				-- JALR
				-- TODO. JALR Writing back will lead to Hazard!!!!
					decode_WriteAddr <= b"11111";
					decode_WriteData <= pc;
					decode_RegWrite <= '1';
					pc := ALUW_decodeRegOut;
					currentState := FetchDecode;
				else
	--			DCPUState <= (5 => '1', others => '0');
					currentState := MemWR;
				end if;
				
				--Signal propagation
				MEMWR_currentIns <= ALUW_currentIns;
				MEMWR_decodeRegOut <= ALUW_decodeRegOut;	
				MEMWR_decodeControlSignals <= ALUW_decodeControlSignals;
				MEMWR_decodeRegWBAddr <= ALUW_decodeRegWBAddr;
				MEMWR_alur1 <= ALUW_alur1;
				MEMWR_alur2 <= ALUW_alur2;
			end if;
			
			if currentState = MemWR then
	--			DCPUState <= (1 => '1', others => '0');
				--Assignment of propagated values
				DCurrentIns4 <= MEMWR_currentIns;
				
				sig_Branch := MEMWR_decodeControlSignals(0);
				sig_MemRead := MEMWR_decodeControlSignals(1);
				sig_MemWrite := MEMWR_decodeControlSignals(2);
				sig_RegWrite := MEMWR_decodeControlSignals(3);
				sig_MemToReg := MEMWR_decodeControlSignals(4);
				
				--Main execution
				if sig_Branch = '0' and 
					sig_MemRead = '0' and 
					sig_MemWrite = '0' then 
					
				-- DO nothing. Update to next stage
				-- R Type	
					currentState := WriteBack;
			
				elsif sig_Branch = '0' and
				      sig_MemRead = '1' and 
					   sig_MemWrite = '0' then 
					
				-- lw 					
					currentState := WriteBack;
			
				elsif sig_Branch = '0' and
				      sig_MemRead = '0' and
						sig_MemWrite = '1' then
--				-- sw		
--				-- registerOut sends data from rt	
					if MEMWR_alur1(5 downto 0) = b"010000" then
						res1Reg := MEMWR_decodeRegOut;
					elsif MEMWR_alur1(5 downto 0) = b"010001" then
						res2Reg := MEMWR_decodeRegOut;
					else
						RAM0(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) <= MEMWR_decodeRegOut(7 downto 0);
						RAM1(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) <= MEMWR_decodeRegOut(15 downto 8);
						RAM2(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) <= MEMWR_decodeRegOut(23 downto 16);
						RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) <= MEMWR_decodeRegOut(31 downto 24);
	--					DMemOut <= read_ram_at(RAM, alu_r1);
	--					DMemAddr <= alu_r1;
					end if;
					currentState := WriteBack;
				
				
				elsif sig_Branch = '1' then
					-- BEQ
					-- TODO ... flushing
					if MEMWR_currentIns(31 downto 26) = b"000100" then
						if MEMWR_alur1 = x"00000001" then
			
				-- shift branch offset by 2 			
				--		tconcat := CurrentIns(15 downto 0) & b"00";
				
								tconcat := b"00" & MEMWR_currentIns(15 downto 0);
				
				-- add offset to pc				
								pc := std_logic_vector( signed(pc) + signed( tconcat));
						
						end if;
				-- BGEZ
					elsif MEMWR_currentIns(31 downto 26) = b"000001" then
						if MEMWR_alur1 = X"00000000" then
								tconcat := b"00" & MEMWR_currentIns(15 downto 0);
								if MEMWR_currentIns(20 downto 16) = b"10001" then
								-- BGEZAL
								-- TODO  Write issue. May lead to HAZARD!!! 
								--	Possible fix by waiting?							
									decode_WriteAddr <= b"11111";
									decode_WriteData <= pc;
									decode_RegWrite <= '1';
								
								end if;
				-- add offset to pc				
								pc := std_logic_vector( signed(pc) + signed( tconcat));
						end if;
					end if;
					
					currentState := FetchDecode;
					
				end if;	
				
				--Signal propagation
				WB_currentIns <= MEMWR_currentIns;
				WB_decodeRegOut <= MEMWR_decodeRegOut;
				WB_alur1 <= MEMWR_alur1;
				WB_alur2 <= MEMWR_alur2;
				WB_decodeControlSignals <= MEMWR_decodeControlSignals;
				WB_decodeRegWBAddr <= MEMWR_decodeRegWBAddr;
			end if;
			
			if currentState = WriteBack then
--					DCPUState <= (2 => '1', others => '0');
					--ram_WE <= '0';
				-- R Type
				DCurrentIns5 <= WB_currentIns;
				--Assignment of propagated values
				sig_Branch := WB_decodeControlSignals(0);
				sig_MemRead := WB_decodeControlSignals(1);
				sig_MemWrite := WB_decodeControlSignals(2);
				sig_RegWrite := WB_decodeControlSignals(3);
				sig_MemToReg := WB_decodeControlSignals(4);
				
				--Main execution
				if sig_RegWrite = '1' and
					sig_MemToReg = '0' then
					
					-- if instruction is mul/div family then place result in hi/lo

						--Dregout <= WB_alur1;
					
						decode_regWrite <= '1';
						-- write to rd
						-- also goes here with LUI
						decode_WriteAddr <= WB_decodeRegWBAddr;
						-- send WB_alur1
						-- check if mfhi
						if (WB_currentIns(5 downto 0) = b"010000" and WB_currentIns(31 downto 26) = b"000000") then
							decode_WriteData <= hi;
						elsif (WB_currentIns(5 downto 0) = b"010010" and WB_currentIns(31 downto 26) = b"000000") then
						-- check if mflo
							decode_WriteData <= lo;
						else
							-- otherwise send WB_alur1
							decode_WriteData <= WB_alur1;
						end if;
					
					
				
				elsif sig_RegWrite = '1' and
				      sig_MemToReg = '1' then
					-- lw	
						-- RT for I type instructions	
					decode_regWrite <= '1';
					decode_WriteAddr <= WB_decodeRegWBAddr;
					--decode_WriteData <= read_ram_at(RAM, WB_alur1);
					decode_WriteData <= RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
					                    RAM2(to_integer(unsigned(WB_alur1(3 downto 0)))) &
											  RAM1(to_integer(unsigned(WB_alur1(3 downto 0)))) &
											  RAM0(to_integer(unsigned(WB_alur1(3 downto 0))));
--					DMemOut <= read_ram_at(RAM, WB_alur1);
--					DMemAddr <= WB_alur1;
--					
				end if;
				
				END_currentIns <= WB_currentIns;
				END_decodeRegOut <= WB_decodeRegOut;
				END_decodeControlSignals <=  WB_decodeControlSignals;
				END_alur1 <= WB_alur1;
				END_alur2 <= WB_alur2;
				END_decodeRegWBAddr <= WB_decodeRegWBAddr;
	
				currentState := FetchDecode;
				
			end if;
			
			
		else
		
			waitCounter := waitCounter - 1;
		
		end if;
	end if;

rom_ADDR <= pc;
--DRegOutAddr <= vlregAddr;
--DRegOut <= decode_registerOut;-- vlreg;
--DMeMOut <= pc;

DOutput <= res1Reg;
DOutput2 <= res2Reg;

end process;


DAlu1 <= alu_op1;
DAlu2 <= alu_op2;
--DAlu1 <= Decode_ALUOP1;
--DAlu2 <= Decode_ALUOP2;

DRegOutAddr <= alu_control(4 downto 0);


--DMemOut <= ram_DO;
--DMemAddr <= ram_addr;

end Behavioral;

