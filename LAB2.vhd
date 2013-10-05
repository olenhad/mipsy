----------------------------------------------------------------------------------
-- Company: 		NATIONAL UNIVERSITY OF SINGAPORE
-- Engineer:		SYED RIZWAN
-- 
-- Create Date:		09:42:03 09/18/2013 
-- Design Name: 
-- Module Name:		LAB2 - Structural 
-- Project Name: 	CG3207 LAB2
-- Target Devices:	xc3s400a-4ft256
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LAB2 is
Port (	Clk		: in	STD_LOGIC;
        Reset	: in	STD_LOGIC;
		PUSH_A	: in	STD_LOGIC;
		PUSH_B	: in	STD_LOGIC;
		PUSH_C	: in	STD_LOGIC;
		D2		: out	STD_LOGIC;
		D3		: out	STD_LOGIC;
		D4		: out	STD_LOGIC;
		D5		: out	STD_LOGIC;
		UART_Tx	: out	STD_LOGIC;
		UART_Rx	: in	STD_LOGIC
	);
end LAB2;

architecture Structural of LAB2 is

	signal Control		: STD_LOGIC_VECTOR(5 DOWNTO 0);
	signal Operand1		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Operand2		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Result1		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Result2		: STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal Debug		: STD_LOGIC_VECTOR(31 DOWNTO 0);

	signal PushButtons	: STD_LOGIC_VECTOR(2 DOWNTO 0);
	signal LEDs			: STD_LOGIC_VECTOR(2 DOWNTO 0);

------------------------------------------------------------------------------
-- Component Definition for UART Interfacing Unit 
------------------------------------------------------------------------------
COMPONENT mcs
PORT (
	Clk				:	IN	STD_LOGIC;
	Reset			:	IN	STD_LOGIC;
	UART_Rx			:	IN	STD_LOGIC;
	UART_Tx			:	OUT	STD_LOGIC;
	UART_Interrupt	:	OUT	STD_LOGIC;
	GPO1			:	OUT	STD_LOGIC_VECTOR(5 DOWNTO 0);
	GPO2			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	GPO3			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	GPO4			:	OUT	STD_LOGIC_VECTOR(2 DOWNTO 0);
	GPI1			:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	GPI1_Interrupt	:	OUT	STD_LOGIC;
	GPI2			:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	GPI2_Interrupt	:	OUT	STD_LOGIC;
	GPI3			:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	GPI3_Interrupt	:	OUT	STD_LOGIC;
	GPI4			:	IN	STD_LOGIC_VECTOR(2 DOWNTO 0);
	GPI4_Interrupt	:	OUT	STD_LOGIC;
	INTC_IRQ		:	OUT	STD_LOGIC
);
END COMPONENT;

------------------------------------------------------------------------------
-- Instantiating UART Interfacing Unit 
------------------------------------------------------------------------------
COMPONENT alu
PORT (
	Clk				:	IN	STD_LOGIC;
	Control			:	IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
	Operand1		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	Operand2		:	IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
	Result1			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	Result2			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
	Debug			:	OUT	STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END COMPONENT;

begin

------------------------------------------------------------------------------
-- Instantiating UART Interfacing Unit 
------------------------------------------------------------------------------
mcs0 : mcs
PORT MAP (
	Clk				=>	Clk,
	Reset			=>	Reset,
	UART_Rx			=>	UART_Rx,
	UART_Tx			=>	UART_Tx,
	UART_Interrupt	=>	open,
	GPO1			=>	Control,
	GPO2			=>	Operand1,
	GPO3			=>	Operand2,
	GPO4			=>	LEDs,	
	GPI1			=>	Result1,
	GPI1_Interrupt	=>	open,
	GPI2			=>	Result2,
	GPI2_Interrupt	=>	open,
	GPI3			=>	Debug,
	GPI3_Interrupt	=>	open,
	GPI4			=>	PushButtons,
	GPI4_Interrupt	=>	open,
	INTC_IRQ		=>	open
);

------------------------------------------------------------------------------
-- Instantiating ALU 
------------------------------------------------------------------------------
alu0 : alu
PORT MAP (
	Clk				=>	Clk,
	Control			=>  Control,
	Operand1		=>  Operand1,
	Operand2		=>  Operand2,
	Result1			=>  Result1,
	Result2			=>  Result2,
	Debug			=>  Debug
);

---------------------------------------
-- Connecting Input Buttons and LEDs --
---------------------------------------
	D2 <= Reset;
	D3 <= LEDs(2);
	D4 <= LEDs(1);
	D5 <= LEDs(0);
	PushButtons <= (PUSH_A & PUSH_B & PUSH_C);

end Structural;

