library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port(
	g: in std_logic_vector;
	b: out std_logic_vector);
end gray_bin;

architecture gray_bin_case_vect of gray_bin is	

begin  		
	process (all) begin
		if g = "0000" then b <= "0000";
		elsif g = "0000" then b <= "0000";
		elsif g = "0001" then b <= "0001";
		elsif g = "0011" then b <= "0010";
		elsif g = "0010" then b <= "0011";
		elsif g = "0110" then b <= "0100";
		elsif g = "0111" then b <= "0101";
		elsif g = "0101" then b <= "0110";
		elsif g = "0100" then b <= "0111";
		elsif g = "1100" then b <= "1000";
		elsif g = "1101" then b <= "1001";
		elsif g = "1111" then b <= "1010";
		elsif g = "1110" then b <= "1011";
		elsif g = "1010" then b <= "1100";
		elsif g = "1011" then b <= "1101";
		elsif g = "1001" then b <= "1110";
		elsif g = "1000" then b <= "1111";
		else b <= "----";
		end if;
	end process;
	
end gray_bin_case_vect;
