--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:57:07 10/24/2013
-- Design Name:   
-- Module Name:   C:/Users/Hunar Khanna/Desktop/CG3207/VHDL/lab2/cg3207-project/test_decode.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decode
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_decode IS
END test_decode;
 
ARCHITECTURE behavior OF test_decode IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decode
    PORT(
         CLK : IN  std_logic;
         CurrentInstruction : IN  std_logic_vector(31 downto 0);
         WriteAddr : IN  std_logic_vector(4 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         RegWrite : IN  std_logic;
         AluOP1 : OUT  std_logic_vector(31 downto 0);
         AluOP2 : OUT  std_logic_vector(31 downto 0);
         AluControl : OUT  std_logic_vector(5 downto 0);
         ControlSignals : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CurrentInstruction : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteAddr : std_logic_vector(4 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal RegWrite : std_logic := '0';

 	--Outputs
   signal AluOP1 : std_logic_vector(31 downto 0);
   signal AluOP2 : std_logic_vector(31 downto 0);
   signal AluControl : std_logic_vector(5 downto 0);
   signal ControlSignals : std_logic_vector(5 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode PORT MAP (
          CLK => CLK,
          CurrentInstruction => CurrentInstruction,
          WriteAddr => WriteAddr,
          WriteData => WriteData,
          RegWrite => RegWrite,
          AluOP1 => AluOP1,
          AluOP2 => AluOP2,
          AluControl => AluControl,
          ControlSignals => ControlSignals
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CurrentInstruction <= x"01495820";
		
      wait for CLK_period;
		CurrentInstruction <= x"8d490064"; 
		
		wait for CLK_period;
		CurrentInstruction <= x"8d2b000e";

      -- insert stimulus here 

      wait;
   end process;

END;
