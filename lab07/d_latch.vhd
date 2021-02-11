library ieee;
use ieee.std_logic_1164.all;
library lab07;
use lab07.all;

entity d_latch is
	port (
	d: in std_logic;
	le_bar: in std_logic;
	ql: out std_logic
	);
end d_latch;

architecture behavioral of d_latch is
begin
	process (d, le_bar)
	begin
		if le_bar = '0' then
			ql <= d;
		end if;
	end process;
end behavioral;

	
	