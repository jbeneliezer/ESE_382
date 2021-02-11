
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_bin is
	port
	(
	g: in std_logic_vector (3 downto 0);
	b: out std_logic_vector (3 downto 0)
	);
end gray_bin;

architecture table_lookup_dc of gray_bin is	   
--architecture declartive part
type truth_table is array (0 to 15) of std_logic_vector (3 downto 0);  
constant binary_values : truth_table :=("0000", "0001",
"0011","0010", 
"0111","0110", 
"0100","0101", 
"1111","1110", 
"1100","1101",
"0000", "0000",
"0000", "0000");

begin
	
b <= binary_values(to_integer(unsigned(g)));
	 
end table_lookup_dc;