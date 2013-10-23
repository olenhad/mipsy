--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:35:12 10/24/2013
-- Design Name:   
-- Module Name:   C:/Users/Hunar Khanna/Desktop/CG3207/VHDL/lab2/cg3207-project/test_fetch.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fetch
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
 
ENTITY test_fetch IS
END test_fetch;
 
ARCHITECTURE behavior OF test_fetch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fetch
    PORT(
         CLK : IN  std_logic;
         isJump : IN  std_logic;
         jumpAddress : IN  std_logic_vector(31 downto 0);
         programCounter : OUT  std_logic_vector(31 downto 0);
         currentInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal isJump : std_logic := '0';
   signal jumpAddress : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal programCounter : std_logic_vector(31 downto 0);
   signal currentInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fetch PORT MAP (
          CLK => CLK,
          isJump => isJump,
          jumpAddress => jumpAddress,
          programCounter => programCounter,
          currentInstruction => currentInstruction
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
		
      wait for CLK_period*10;
		
		isJump <= '0';
		jumpAddress <= ( others => '0');
		
		wait for CLK_period*2;
		
		isJump <= '1';
		jumpAddress <= ( 3 => '1', others => '0');
		
		wait for CLK_period;
		isJump <= '0';
		wait for CLK_period;
		isJump <= '1';
		jumpAddress <= ( others => '0');
		
		wait for CLK_period;
		isJump <= '0';
		
		wait for CLK_period*2;
		
		isJump <= '0';
		jumpAddress <= ( 4 => '1', others => '0');
		

      -- insert stimulus here 

      wait;
   end process;

END;
