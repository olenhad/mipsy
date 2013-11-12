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
signal decode_waitFor : std_logic_vector(3 downto 0);
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
	
	variable END_currentIns : std_logic_vector(31 downto 0) := (others => '0');
	variable END_decodeRegOut :  std_logic_vector(31 downto 0) := (others => '0');
	variable END_decodeControlSignals :  std_logic_vector(4 downto 0) := (others => '0');
	variable END_alur1 :  std_logic_vector(31 downto 0) := (others => '0');
	variable END_alur2 :  std_logic_vector(31 downto 0) := (others => '0');
	variable END_decodeRegWBAddr : std_logic_vector(4 downto 0);
	
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
		end if;
		
		if(prev_op2 /= cpu_op2) then
			prev_op2 := cpu_op2;
			RAM0(1) <= prev_op2(7 downto 0);
			RAM1(1) <= prev_op2(15 downto 8);
			RAM2(1) <= prev_op2(23 downto 16);
			RAM3(1) <= prev_op2(31 downto 24);
		end if;
		
		if waitCounter = 0 then
			
			
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
			-- decode reset	
			--	decode_RegWrite <= '0';
			--	decode_WriteAddr <= (others => '0');
			--	decode_WriteData <= (others => '0');
				
			--	DCPUState <= (0 => '1', others => '0');
				
				DCurrentIns2 <= EX_currentIns;
				--Assignment of propagated values
				EX_decodeControlSignals := decode_controlSignals;
				EX_decodeRegWBAddr := decode_RegWBAddr;
				--Main execution
				alu_op1 <= decode_AluOP1;
				alu_op2 <= decode_AluOP2;
				
				sig_Branch := ALUW_decodeControlSignals(0);
				sig_MemRead := ALUW_decodeControlSignals(1);
				sig_MemWrite := ALUW_decodeControlSignals(2);
				sig_RegWrite := ALUW_decodeControlSignals(3);
				sig_MemToReg := ALUW_decodeControlSignals(4);


				DRegOut <= (others => '0');
				if MEMWR_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
				   sig_RegWrite = '1' and 
					sig_MemToReg = '0' and
					MEMWR_alur1(0) /= 'U' then
						alu_op1 <= ALUW_alur1;
				end if;
				
				if MEMWR_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
				   sig_RegWrite = '1' and 
					sig_MemToReg = '0' and
					MEMWR_alur1(0) /= 'U' then
						alu_op2 <= ALUW_alur1;
				end if;
				
				if ALUW_decodeRegWBAddr = EX_currentIns(25 downto 21) and 
				   sig_RegWrite = '1' and 
					sig_MemToReg = '0' and
					ALUW_alur1(0) /= 'U' then
						DRegOut <= (others => '0');
						alu_op1 <= alu_r1;
				end if;
				
				if ALUW_decodeRegWBAddr = EX_currentIns(20 downto 16) and 
				   sig_RegWrite = '1' and 
					sig_MemToReg = '0' and
					ALUW_alur1(0) /= 'U' then
						alu_op2 <= alu_r1;
						DRegOut <= (others => '0');
				end if;

				if END_decodeControlSignals(3) = '1' and
				   END_decodeControlSignals(4) = '1' and
					END_decodeRegWBAddr = EX_currentIns(25 downto 21) then
						alu_op1 <= RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(END_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(END_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(END_alur1(3 downto 0))));
				end if;
				
				if END_decodeControlSignals(3) = '1' and
				   END_decodeControlSignals(4) = '1' and
					END_decodeRegWBAddr = EX_currentIns(20 downto 16) then
						alu_op2 <= RAM3(to_integer(unsigned(END_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(END_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(END_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(END_alur1(3 downto 0))));
				end if;
				
				if WB_decodeControlSignals(3) = '1' and
				   WB_decodeControlSignals(4) = '1' and
					WB_decodeRegWBAddr = EX_currentIns(25 downto 21) then
						alu_op1 <= RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(WB_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(WB_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(WB_alur1(3 downto 0))));
						DRegOut <= (others => '0');
				end if;
				
				if WB_decodeControlSignals(3) = '1' and
				   WB_decodeControlSignals(4) = '1' and
					WB_decodeRegWBAddr = EX_currentIns(20 downto 16) then
						alu_op2 <= RAM3(to_integer(unsigned(WB_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(WB_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(WB_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(WB_alur1(3 downto 0))));
									  DRegOut <= (others => '1');
				end if;

				
				if MEMWR_decodeControlSignals(3) = '1' and
				   MEMWR_decodeControlSignals(4) = '1' and
					MEMWR_decodeRegWBAddr = EX_currentIns(25 downto 21) then
						alu_op1 <= RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(MEMWR_alur1(3 downto 0))));
									  --DRegOut <= (others => '0');
				end if;
				
				if MEMWR_decodeControlSignals(3) = '1' and
				   MEMWR_decodeControlSignals(4) = '1' and
					MEMWR_decodeRegWBAddr = EX_currentIns(20 downto 16) then
						alu_op2 <= RAM3(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(MEMWR_alur1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(MEMWR_alur1(3 downto 0))));
									 -- DRegOut <= (others => '0');
				end if;
								
				if ALUW_decodeControlSignals(3) = '1' and
				   ALUW_decodeControlSignals(4) = '1' and
					ALUW_decodeRegWBAddr = EX_currentIns(25 downto 21) then
						alu_op1 <= RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(alu_r1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(alu_r1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(alu_r1(3 downto 0))));
									--  DRegOut <= (others => '0');
				end if;
				
				if ALUW_decodeControlSignals(3) = '1' and
				   ALUW_decodeControlSignals(4) = '1' and
					ALUW_decodeRegWBAddr = EX_currentIns(20 downto 16) then
						alu_op2 <= RAM3(to_integer(unsigned(alu_r1(3 downto 0)))) &
					              RAM2(to_integer(unsigned(alu_r1(3 downto 0)))) &
									  RAM1(to_integer(unsigned(alu_r1(3 downto 0)))) &
									  RAM0(to_integer(unsigned(alu_r1(3 downto 0))));
									 -- DRegOut <= (others => '0');
				end if;

				waitCounter :=  to_integer(unsigned(decode_WaitFor));
				currentState := AluWait;
				EX_decodeRegOut := decode_registerOut;
				
				--Signal propagation
				ALUW_currentIns <= EX_currentIns;
				ALUW_decodeRegOut <= EX_decodeRegOut;
				ALUW_decodeControlSignals <= EX_decodeControlSignals;
				ALUW_decodeRegWBAddr <= EX_decodeRegWBAddr;
				
			end if;
			
			if currentState = AluWait then
				DAluR1 <= alu_r1;
				DCurrentIns3 <= ALUW_currentIns;
				ALUW_alur1 := alu_r1;
				ALUW_alur2 := alu_r2;
				
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
					if (WB_currentIns(5 downto 0) = b"011000" and WB_currentIns(31 downto 26) = b"000000") or 
						(WB_currentIns(5 downto 0) = b"011001" and WB_currentIns(31 downto 26) = b"000000") or 
						(WB_currentIns(5 downto 0) = b"011010" and WB_currentIns(31 downto 26) = b"000000") or
						(WB_currentIns(5 downto 0) = b"011011" and WB_currentIns(31 downto 26) = b"000000")	then
						lo := WB_alur1;
						hi := WB_alur2;
					else
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
				
				END_currentIns := WB_currentIns;
				END_decodeRegOut := WB_decodeRegOut;
				END_decodeControlSignals :=  WB_decodeControlSignals;
				END_alur1 := WB_alur1;
				END_alur2 := WB_alur2;
				END_decodeRegWBAddr := WB_decodeRegWBAddr;
	
				currentState := FetchDecode;
				
			end if;
			
			
		else
		
			waitCounter := waitCounter - 1;
		
		end if;
	end if;

rom_ADDR <= pc;
DRegOutAddr <= vlregAddr;
--DRegOut <= decode_registerOut;-- vlreg;
--DMeMOut <= pc;

DOutput <= res1Reg;
DOutput2 <= res2Reg;

end process;





--RAM(63) & RAM(62) & RAM(61) & RAM(60);



DAlu1 <= alu_op1;
DAlu2 <= alu_op2;
--DAlu1 <= Decode_ALUOP1;
--DAlu2 <= Decode_ALUOP2;
alu_control <= decode_AluControl;



--DMemOut <= ram_DO;
--DMemAddr <= ram_addr;

end Behavioral;

