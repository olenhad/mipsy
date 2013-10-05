--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:07:27 10/02/2013
-- Design Name:   
-- Module Name:   C:/Users/pc richard/Documents/CG3207/cg3207-project/test_adder32.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder32
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
USE ieee.numeric_std.ALL;
 
ENTITY test_adder32 IS
END test_adder32;
 
ARCHITECTURE behavior OF test_adder32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder32
    PORT(
         operand1 : IN  std_logic_vector(31 downto 0);
         operand2 : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   signal overflow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder32 PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
          result => result,
          overflow => overflow
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';-
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		operand1 <= x"FFFFFFFF";
		operand2 <= x"00000008";
		
		wait for 100 ns;	
		operand1 <= x"00000005";
		operand2 <= x"00000008";
		      wait for 100 ns;	
		operand1 <= x"FFFFFFFF";-- -1
		operand2 <= x"FFFFFFFE";-- -2
		      wait for 100 ns;	
		operand1 <= x"7FFFFFFF";
		operand2 <= x"7FFFFFFF";
		
		wait for 100 ns;	
		operand1 <= x"FFFFFFFF";
		operand2 <= x"FFFFFFFF";
		
		wait for 100 ns;	
		operand1 <= x"80000001";
		operand2 <= x"80000001";
		
		wait for 100 ns;	
		operand1 <= x"80000000";
		operand2 <= x"FFFFFFFF";
		
		wait for 100 ns;	
		operand1 <= x"80000000";
		operand2 <= x"00000001";
      wait;
   end process;

END;
