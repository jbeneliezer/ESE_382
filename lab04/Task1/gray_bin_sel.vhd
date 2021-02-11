library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port
	(
	g3,g2,g1,g0: in std_logic;
	b: out std_logic_vector (3 downto 0)
	);
end gray_bin;

architecture selected of gray_bin is	   

begin
	
	with std_logic_vector'(g3,g2,g1,g0) select
	b <= "0000" when "0000",
	 "0001" when "0001",
	 "0010" when "0011",
	 "0011" when "0010",
	 "0100" when "0110",
	 "0101" when "0111",
	 "0110" when "0101",
	 "0111" when "0100",
	 "1000" when "1100",
	 "1001" when "1101",
	 "1010" when "1111",
	 "1011" when "1110",
	 "1100" when "1010",
	 "1101" when "1011",
	 "1110" when "1001",
	 "1111" when "1000",
	 "0000" when others;	
end selected;
