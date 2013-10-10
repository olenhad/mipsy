----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:18 09/18/2013 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
Port (	Clk			: in	STD_LOGIC;
		Control		: in	STD_LOGIC_VECTOR (5 downto 0);
		Operand1	: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2	: in	STD_LOGIC_VECTOR (31 downto 0);
		Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
		Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
		Debug		: out	STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is
component addsub32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isadd : in std_logic;
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end component;
component uaddsub32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isadd : in std_logic;
           result : out  STD_LOGIC_VECTOR(31 downto 0);
			  overflow : out STD_LOGIC);
end component;

component mul32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isSigned : in std_logic;
           result1 : out  STD_LOGIC_VECTOR(31 downto 0);
			  result2 : out STD_LOGIC_VECTOR(31 downto 0));
end component;
component udiv32 is
    Port ( operand1 : in  STD_LOGIC_VECTOR(31 downto 0);
           operand2 : in  STD_LOGIC_VECTOR(31 downto 0);
			  isSigned: in STD_LOGIC;
           remainder : out  STD_LOGIC_VECTOR(31 downto 0);
			  quotient : out STD_LOGIC_VECTOR(31 downto 0);
			  exception : out std_logic);
end component;


signal addsubResult : std_logic_vector(31 downto 0);
signal uaddsubResult : std_logic_vector(31 downto 0);

signal mulResult : std_logic_vector(63 downto 0);
signal mulIsSigned : std_logic;

signal udivRemainder : std_logic_vector(31 downto 0);
signal udivQuotient : std_logic_vector(31 downto 0);
signal udivException : std_logic;
signal udivIsSigned : std_logic;

signal divRemainder : std_logic_vector(31 downto 0);
signal divQuotient : std_logic_vector(31 downto 0);
signal divException : std_logic;


signal isAdd: std_logic;
signal isOverflowAdd : std_logic;
signal isOverflowAddU : std_logic;

begin
addsub: addsub32 port map (operand1 => operand1, 
									operand2 => operand2,
									isadd => isadd, 
									result => addsubResult,
									overflow => isOverflowAdd);

uaddsub: uaddsub32 port map (operand1 => operand1, 
									 operand2 => operand2,
									 isadd => isadd, 
									 result => uaddsubResult,
									 overflow => isOverflowAddU);
									 
mult: mul32 port map ( operand1 => operand1,
							  operand2 => operand2,
							  isSigned => mulIsSigned,
							  result1 => mulResult(31 downto 0),
							  result2 => mulResult(63 downto 32));

udiv: udiv32 port map ( operand1 => operand1,
							  operand2 => operand2,
							  isSigned => udivIsSigned,
							  remainder => udivRemainder,
							  quotient => udivQuotient,
							  exception => udivException);


process (Clk)
begin  
   if (Clk'event and Clk = '1') then
		Debug   <= X"00000000";
      if Control(5) = '1' then
			Result1 <= X"00000000";
			Result2 <= X"00000000";
			Debug   <= X"00000000";
      elsif Control = b"000000" then
         Result1 <= Operand1;
			Result2 <= Operand2;
			Debug   <= (Control(1) & Control(0) & Control & Control & Control & Control & Control);
		elsif Control = b"000001" then
		-- ADD
			isadd <= '1';
			Result1 <= addsubResult;
			Debug <= ( 0 => isOverflowAdd, others => '0');
		elsif Control = b"000010" then
		-- ADDU
			isadd <= '1';
			Result1 <= uaddsubResult;
			Debug <= ( 0 => isOverflowAddU, others => '0');
		elsif Control = b"000011" then
		-- SUB
			isadd <= '0';
			Result1 <= addsubResult;
			Debug <= ( 0 => isOverflowAdd, others => '0');
		elsif Control = b"000100" then
		-- SUBU
			isadd <= '0';
			Result1 <= uaddsubResult;
			Debug <= ( 0 => isOverflowAddU, others => '0');
		elsif Control = b"000101" then
		-- MULT
			mulIsSigned <= '1';
			Result1 <= mulResult(31 downto 0);
			Result2 <= mulResult(63 downto 32);
		elsif Control = b"000110" then
		-- MULTU
			mulIsSigned <= '0';
			Result1 <= mulResult(31 downto 0);
			Result2 <= mulResult(63 downto 32);
		elsif Control = b"000111" then
		-- DIV
			Result1 <= udivRemainder;
			Result2 <= udivQuotient;
			udivIsSigned <= '1';
			Debug <= ( 1 => divException, others => '0');
		
		elsif Control = b"001000" then
		-- DIVU	
			Result1 <= udivRemainder;
			Result2 <= udivQuotient;
			udivIsSigned <= '0';
			Debug <= ( 1 => udivException, others => '0');
		elsif Control = b"001001" then
		-- AND
			Result1 <= operand1 and operand2;
		elsif Control = b"001010" then
		-- OR
			Result1 <= operand1 or operand2;
		elsif Control = b"001011" then
		-- XOR
			Result1 <= operand1 xor operand2;
		elsif Control = b"001100" then
		-- NOR
			Result1 <= operand1 nor operand2;
		elsif Control = b"001101" then
		-- SLT
			isadd <= '0';
			Result1 <= (0 => addsubResult(31), others => '0');
			Debug <= ( 0 => isOverflowAdd, others => '0');
		elsif Control = b"001110" then
		-- SLL
			Result1 <= std_logic_vector( unsigned(operand1) sll to_integer(unsigned(operand2)));
		elsif Control = b"001111" then
		-- SRL
			Result1 <= std_logic_vector( unsigned(operand1) srl to_integer(unsigned(operand2)));
		elsif Control = b"010000" then
		-- SRA
			Result1 <= to_stdLogicVector(to_bitvector(operand1) sra to_integer(unsigned(operand2)));
			
		elsif Control = b"010001" then
		-- BEQ
			if operand1 = operand2 then
				Result1 <= (0 => '1', others => '0');
			else
				Result1 <= (others => '0');
			end if;
		elsif Control = b"010010" then
		-- BNE
			if operand1 /= operand2 then
				Result1 <= (0 => '1', others => '0');
			else
				Result1 <= (others => '0');
			end if;
      end if;
   end if;
end process;

end Behavioral;

