library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture golden of testbench is	 

signal pattern: std_logic_vector (3 downto 0);
signal data: std_logic_vector (7 downto 0);
signal match: std_logic;

signal pattern_alt: std_logic_vector (3 downto 0);
signal data_alt: std_logic_vector (7 downto 0);
signal match_alt: std_logic;


begin

	uut: entity pattern_match 
	port map
	(
	pattern => pattern,
	data => data,
	match => match
	);
	
	uut2: entity pattern_match_alt 
	port map
	(
	pattern => pattern_alt,
	data => data_alt,
	match => match_alt
	);


process(data,pattern)
begin

for i in 7 downto 3 loop
	if data(i downto i -3) = pattern then
		match <= '1';
		exit;
	end if;
	
	if data_alt(i downto i -3) = pattern_alt then
		match_alt <= '1';
		exit;
	end if;
end loop;

assert (match_alt = match)
report "The outputs did not match"
severity error;

end process;

end architecture;
