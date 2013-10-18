--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:34 10/18/2013
-- Design Name:   
-- Module Name:   C:/Users/Hunar Khanna/Desktop/CG3207/VHDL/lab2/cg3207-project/ram_test.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram
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
 
ENTITY ram_test IS
END ram_test;
 
ARCHITECTURE behavior OF ram_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram
    PORT(
         CLK : IN  std_logic;
         WE : IN  std_logic;
         EN : IN  std_logic;
         ADDR : IN  std_logic_vector(11 downto 0);
         DI : IN  std_logic_vector(31 downto 0);
         DO : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal WE : std_logic := '0';
   signal EN : std_logic := '0';
   signal ADDR : std_logic_vector(11 downto 0) := (others => '0');
   signal DI : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DO : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram PORT MAP (
          CLK => CLK,
          WE => WE,
          EN => EN,
          ADDR => ADDR,
          DI => DI,
          DO => DO
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
		en <= '1';
		we <= '0';
		addr <= (others => '0');
      wait for CLK_period*2;
		
		addr <= std_logic_vector(unsigned(addr) + 4);
      wait for CLK_period*2;


		addr <= std_logic_vector(unsigned(addr) + 4);
      wait for CLK_period*2;

      addr <= std_logic_vector(unsigned(addr) + 4);
      wait for CLK_period*2;

		we <= '1';
		DI <= (1 => '1', others => '0');
		wait for CLK_period*2;
		
		we <= '0';
		wait for CLK_period*4;
		-- insert stimulus here 

      wait;
   end process;

END;
