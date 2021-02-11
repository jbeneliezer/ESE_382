library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port(
	g: in std_logic_vector;
	b: out std_logic_vector);
end gray_bin;

architecture gray_bin_loop of gray_bin is	

begin  		  
	process (all)
	variable i: integer;
	begin
		b(3) <= g(3);

		for i in 0 to 2 loop
			b(i) <= b(i + 1) xor g(i);
		end loop;			
	end process;
	
end gray_bin_loop;
