library ieee;
use ieee.std_logic_1164.all;
library lab07;
use lab07.all;

entity d_flip_flop is
	port (
	d: in std_logic;
	clk: in std_logic;
	qff: out std_logic
	);
end d_flip_flop;

architecture behavioral of d_flip_flop is
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			qff <= d;
		end if;
	end process;
end behavioral;
