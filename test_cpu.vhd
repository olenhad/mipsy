--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:28:20 10/30/2013
-- Design Name:   
-- Module Name:   C:/Users/pc richard/Documents/CG3207/cg3207-project/test_cpu.vhd
-- Project Name:  LAB2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu
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
 
ENTITY test_cpu IS
END test_cpu;
 
ARCHITECTURE behavior OF test_cpu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu
    PORT(
 CLK : in  STD_LOGIC;
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
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal DHalt : std_logic := '0';
   signal DRegAddr : std_logic_vector(4 downto 0) := (others => '0');
   signal DMemAddr : std_logic_vector(31 downto 0) := (others => '0');
	signal cpu_op1 : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	signal cpu_op2 : STD_LOGIC_VECTOR (31 downto 0):= (others => '0');
 	--Outputs
   signal DRegOut : std_logic_vector(31 downto 0);
   signal DMemOut : std_logic_vector(31 downto 0);
	signal DCPUState : std_logic_vector(31 downto 0);
	signal DCurrentIns : std_logic_vector(31 downto 0);
	signal DCurrentIns2 : std_logic_vector(31 downto 0);
	signal DCurrentIns3 : std_logic_vector(31 downto 0);
	signal DCurrentIns4 : std_logic_vector(31 downto 0);
	signal DCurrentIns5 : std_logic_vector(31 downto 0);
	signal DAlu1 : std_logic_vector(31 downto 0);
	signal DAlu2 : std_logic_vector(31 downto 0);
	signal DAluR1 : std_logic_vector(31 downto 0);
   signal DRegOutAddr : std_logic_vector(4 downto 0);
	signal DOutput : std_logic_vector(31 downto 0);
		signal DOutput2 : std_logic_vector(31 downto 0);
	-- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu PORT MAP (
          CLK => CLK,
			 cpu_op1 => cpu_op1,
			 cpu_op2 => cpu_op2,
--          DHalt => DHalt,
--          DRegAddr => DRegAddr,
--          DMemAddr => DMemAddr,
          DRegOut => DRegOut,
--          DMemOut => DMemOut,
--			 DCPUState => DCPUState,
			 DCurrentIns => DCurrentIns,
			 DCurrentIns2 => DCurrentIns2,
				DCurrentIns3 => DCurrentIns3,
				DCurrentIns4 => DCurrentIns4,
				DCurrentIns5 => DCurrentIns5,
			 DAlu1 => Dalu1,
		 DAlu2 => DAlu2,
			 DAluR1 => DAluR1,
			 DRegOutAddr => DRegOutAddr,
			 DOutput => DOutput,
			 			 DOutput2 => DOutput2

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
      wait for 20 ns;
		
      wait for CLK_period*7;

		
		-- insert stimulus here 

      wait;
   end process;

END;
