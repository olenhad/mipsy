--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:34:15 10/09/2013
-- Design Name:   
-- Module Name:   C:/Users/pc richard/Documents/CG3207/cg3207-project/test_umul32.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: umul32
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
 
ENTITY test_umul32 IS
END test_umul32;
 
ARCHITECTURE behavior OF test_umul32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT umul32
    PORT(
         operand1 : IN  std_logic_vector(31 downto 0);
         operand2 : IN  std_logic_vector(31 downto 0);
         result1 : OUT  std_logic_vector(31 downto 0);
         result2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result1 : std_logic_vector(31 downto 0);
   signal result2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: umul32 PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
          result1 => result1,
          result2 => result2
        );

   -- Clock process definitions
 --  <clock>_process :process
 --  begin
	--	<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

   --   wait for <clock>_period*10;
		operand1 <= x"FFFFFFFF";
		operand2 <= X"FFFFFFFF";
		
		wait for 100 ns;
		
		operand1 <= x"00000002";
		operand2 <= x"00000002";
		wait for 100 ns;
		
		operand1 <= x"00000000";
		operand2 <= x"000000FF";
		wait for 100 ns;
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
