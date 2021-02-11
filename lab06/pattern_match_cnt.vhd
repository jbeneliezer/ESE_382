library ieee;
use ieee.std_logic_1164.all;	 
use ieee.Numeric_Std.all;

entity pattern_match is 
port(
data: in std_logic_vector (7 downto 0);
pattern : in std_logic_vector (3 downto 0);
match : out std_logic;
match_count: out std_logic_vector (2 downto 0)
);
end pattern_match;

architecture golden of pattern_match is
begin

	process(data,pattern)

	variable count: integer;

	begin

		for i in 7 downto 3 loop
	
			if data(i downto i - 3) = paatern then
		
				match <= '1';
		
				count := count + 1;
	
			end if;

		end loop;
		match_count <= std_logic_vector(to_unsigned(count,3));
	end process;
end architecture;