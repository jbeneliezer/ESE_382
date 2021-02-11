library ieee;
use ieee.std_logic_1164.all;	 
use ieee.Numeric_Std.all;

entity pattern_match_alt is 
port(
data: in std_logic_vector (7 downto 0);
pattern : in std_logic_vector (3 downto 0);
match : out std_logic;
match_count: out std_logic_vector (2 downto 0)
);
end pattern_match_alt;

architecture golden of pattern_match_alt is
begin

	process(data,pattern)

	variable count: integer;

	begin

		for i in 7 downto 3 loop
	
			if data(i) = pattern(0) then
				if data(i downto i -3) = pattern then
		
					match <= '1';
					
				end if;
	
			end if;

		end loop;
		
	end process;
end architecture;