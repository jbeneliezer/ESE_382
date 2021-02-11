library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port(
	g3, g2, g1, g0: in std_logic;
	b3, b2, b1, b0: out std_logic);
end gray_bin;

architecture gray_bin_case of gray_bin is	

begin  		
	process (all) begin
		case (std_logic_vector'(g3, g2, g1, g0)) is
			when "0000" => b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '0';
			when "0001" => b3 <= '0'; b2 <= '0'; b1 <= '0'; b0 <= '1';
			when "0011" => b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '0';
			when "0010" => b3 <= '0'; b2 <= '0'; b1 <= '1'; b0 <= '1';
			when "0110" => b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '0';
			when "0111" => b3 <= '0'; b2 <= '1'; b1 <= '0'; b0 <= '1';
			when "0101" => b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '0';
			when "0100" => b3 <= '0'; b2 <= '1'; b1 <= '1'; b0 <= '1';
			when "1100" => b3 <= '1'; b2 <= '0'; b1 <= '0'; b0 <= '0';
			when "1101" => b3 <= '1'; b2 <= '0'; b1 <= '0'; b0 <= '1';
			when "1111" => b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '0';
			when "1110" => b3 <= '1'; b2 <= '0'; b1 <= '1'; b0 <= '1';
			when "1010" => b3 <= '1'; b2 <= '1'; b1 <= '0'; b0 <= '0';
			when "1011" => b3 <= '1'; b2 <= '1'; b1 <= '0'; b0 <= '1';
			when "1001" => b3 <= '1'; b2 <= '1'; b1 <= '1'; b0 <= '0';
			when "1000" => b3 <= '1'; b2 <= '1'; b1 <= '1'; b0 <= '1';
			when others => b3 <= '-'; b2 <= '-'; b1 <= '-'; b0 <= '-';
		end case;	  
	end process;
	
end gray_bin_case;

