library ieee;
use ieee.std_logic_1164.all;

entity pattern_match is
  port(
    data: in std_logic_vector (7 downto 0);
    pattern: in std_logic_vector (3 downto 0);
    match : out std_logic);
end pattern_match;

architecture loop_arch of pattern_match is
begin
  process (data, pattern)
  begin
    match <= '0';
    for i in 7 downto 3 loop
      if data(i downto(i - 3)) = pattern then
        match <= '1';
        exit;
      end if;
    end loop;
  end process;
 end loop_arch;
