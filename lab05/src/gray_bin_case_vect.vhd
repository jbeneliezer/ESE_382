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
		case (g) is
			when "0000" => b <= "0000";
			when "0001" => b <= "0001";
			when "0011" => b <= "0010";
			when "0010" => b <= "0011";
			when "0110" => b <= "0100";
			when "0111" => b <= "0101";
			when "0101" => b <= "0110";
			when "0100" => b <= "0111";
			when "1100" => b <= "1000";
			when "1101" => b <= "1001";
			when "1111" => b <= "1010";
			when "1110" => b <= "1011";
			when "1010" => b <= "1100";
			when "1011" => b <= "1101";
			when "1001" => b <= "1110";
			when "1000" => b <= "1111";
			when others => b <= "----";
		end case;	  
	end process;
	
end gray_bin_case_vect;

