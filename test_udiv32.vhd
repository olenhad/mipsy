--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:37 10/09/2013
-- Design Name:   
-- Module Name:   C:/Users/pc richard/Documents/CG3207/cg3207-project/test_udiv32.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: udiv32
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
 
ENTITY test_div32 IS
END test_div32;
 
ARCHITECTURE behavior OF test_div32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div32
    PORT(
         operand1 : IN  std_logic_vector(31 downto 0);
         operand2 : IN  std_logic_vector(31 downto 0);
			clk : in std_logic;
			isSigned : in std_logic;
         remainder : OUT  std_logic_vector(31 downto 0);
         quotient : OUT  std_logic_vector(31 downto 0);
         exception : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal operand2 : std_logic_vector(31 downto 0) := (others => '0');
 	signal isSigned : std_logic;
	signal clk : std_logic;
	--Outputs
   signal remainder : std_logic_vector(31 downto 0);
   signal quotient : std_logic_vector(31 downto 0);
   signal exception : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div32 PORT MAP (
          operand1 => operand1,
          operand2 => operand2,
			 clk => clk,
			 isSigned => isSigned,
          remainder => remainder,
          quotient => quotient,
          exception => exception
        );

    --Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
	   clk <= '1';
	   wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here
		isSigned <= '1';
		operand1 <= x"0000000A";
		operand2 <= x"fffffffd";
		wait for clk_period*9;
		operand1 <= x"00000013";
		operand2 <= x"00000018";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"fffffffe";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"00000000";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"00000001";
		wait for clk_period*9;
		operand1 <= x"fffffffe";
		operand2 <= x"ffffffff";
		wait for clk_period*9;
		
		isSigned <= '0';
		operand1 <= x"0000000A";
		operand2 <= x"00000003";
		wait for clk_period*9;
		operand1 <= x"00000013";
		operand2 <= x"00000018";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"fffffffe";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"00000000";
		wait for clk_period*9;
		operand1 <= x"ffffffff";
		operand2 <= x"00000001";
		wait for clk_period*9;
		operand1 <= x"fffffffe";
		operand2 <= x"ffffffff";
		wait for clk_period*9;

		operand1 <= x"0000000A";
		operand2 <= x"fffffffd";
		wait for clk_period*5;

      wait;
   end process;

END;
