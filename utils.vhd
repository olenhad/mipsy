--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--
use STD.textio.all;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;
--use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

package utils is

	type RomData is array(0 to 255) of std_logic_vector(7 downto 0);
	type RamData is array(0 to 64) of std_logic_vector(7 downto 0);
	type RegisterSet is array (31 downto 0) of std_logic_vector(31 downto 0);
	type CodeAddress is array (8 downto 0) of std_logic;
	type CodeInstruction is array (31 downto 0) of std_logic;
	subtype Word is std_logic_vector(31 downto 0);
	
	impure function read_rom_from_file ( rom_file_name : in string) return RomData;
--	impure function read_ram_from_file ( ram_file_name : in string) return RamData;
	
	constant RomDefault : RomData := (x"0b", x"00", x"10", x"08", x"01", x"00", x"09", x"3c", x"01", x"00", x"0a", x"3c", x"05", x"00", x"0a", x"3c", 
x"06", x"00", x"0c", x"3c", x"01", x"10", x"01", x"3c", x"00", x"00", x"29", x"8c", x"01", x"10", x"01", x"3c", 
x"04", x"00", x"2a", x"8c", x"20", x"58", x"49", x"01", x"22", x"60", x"69", x"01", x"03", x"00", x"10", x"08", 
x"01", x"10", x"01", x"3c", x"00", x"00", x"2c", x"ac", others => (others => '0'));

	constant RamDefault : RamData := (
	x"0a", x"00", x"00", x"00", x"0c", others => (others => '0'));
	
	
	function read_ram_at ( ram_data : in RamData; addr: in std_logic_vector(31 downto 0))  
		return Word;
	
--	function write_ram_at (ram_data : in RamData; 
--								  addr: in std_logic_vector(31 downto 0);
--								  DI: in Word)
--		return RamData;

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end utils;

package body utils is
	
		function read_ram_at ( ram_data : in RamData; addr: in std_logic_vector(31 downto 0)) 
		return Word is
		begin
		
			return ram_data(to_integer(unsigned(ADDR(5 downto 0))+3)) &
					 ram_data(to_integer(unsigned(ADDR(5 downto 0))+2)) &
					 ram_data(to_integer(unsigned(ADDR(5 downto 0))+1)) &
					 ram_data(to_integer(unsigned(ADDR(5 downto 0))));
		end function;
		
--	function write_ram_at (ram_data : in RamData; 
--								  addr: in std_logic_vector(31 downto 0);
--								  DI: in Word)
--		return RamData is
--			variable RAM : RamData := ram_data;
--		begin
--			RAM(to_integer(unsigned(ADDR(15 downto 0)))) := DI(7 downto 0);
--			RAM(to_integer(unsigned(ADDR(15 downto 0)) + 1)) := DI(15 downto 8);
--			RAM(to_integer(unsigned(ADDR(15 downto 0)) + 2)) := DI(23 downto 16);
--			RAM(to_integer(unsigned(ADDR(15 downto 0)) + 3)) := DI(31 downto 24);
--			return RAM;
--	end function;
	
	impure function read_rom_from_file ( rom_file_name : in string) return RomData is                                                   
       FILE rom_file         : text is in rom_file_name;                       
       variable line_read : line;                                 
       variable rom_name       : RomData := (others => (others => '0'));
		 variable hex_temp : std_logic_vector (0 to 31);
		 variable main_counter : integer := 0 ;
    begin                                                        
  
		while not endfile(rom_file) loop

          -- read digital data from input file 
          readline(rom_file, line_read);
			 exit when endfile (rom_file);
          hread(line_read, hex_temp);
			 for i in 3 downto 0 loop
				rom_name(main_counter) := hex_temp((8*i) to (8*(i+1) - 1));
				main_counter := main_counter+1;
			 end loop;
        end loop;
		return rom_name;
		  
    end function;

--impure function read_ram_from_file ( ram_file_name : in string) return RamData is                                                   
--       FILE ram_file         : text is in ram_file_name;                       
--       variable line_read : line;                                 
--       variable ram_name       : RamData := (others => (others => '0'));
--		 variable hex_temp : std_logic_vector (0 to 31);
--		 variable main_counter : integer := 0;
--    begin                                                        
--       	
--  
--		while not endfile(ram_file) loop
--
--          -- read digital data from input file 
--          readline(ram_file, line_read);
--			 exit when endfile (ram_file);
--          hread(line_read, hex_temp);
--			 for i in 3 downto 0 loop
--				ram_name(main_counter) := hex_temp((8*i) to (8*(i+1) - 1));
--				main_counter := main_counter+1;
--			 end loop;
--        end loop;
--		return ram_name;
--		  
--    end function; 


	
---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end utils;
