
library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port
	(
	g: in std_logic_vector (3 downto 0);
	b: out std_logic_vector (3 downto 0)
	);
end gray_bin;

architecture conditional_dc of gray_bin is	   
--architecture declartive part
begin
	
	
	b <= "0000" when g = "0000" else
	 "0001" when g = "0001" else 
	 "0010" when g = "0011" else
	 "0011" when g = "0010" else
	 "0100" when g = "0110" else
	 "0101" when g = "0111" else
	 "0110" when g = "0101" else
	 "0111" when g = "0100" else
	 "1000" when g = "1100" else
	 "1001" when g = "1101" else
	 "1010" when g = "1111" else
	 "1011" when g = "1110" else
	 "0000";	
	 
end conditional_dc;