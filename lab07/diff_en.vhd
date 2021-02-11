library ieee;
use ieee.std_logic_1164.all;
library lab07;
use lab07.all;

entity diff_en is
	 port(
	 d : in std_logic; -- data input
	 clk : in std_logic; -- clock input
	 en : in std_logic; -- enable input
	 rst_bar : in std_logic; -- asynchronous reset
	 q : out std_logic -- output
	 );
end diff_en;

architecture behavioral of diff_en is
	signal gated_clk : std_logic;
begin
	gated_clk <= clk when en = '1' and rst_bar = '1' else '1';
	process (gated_clk)
	begin
		if gated_clk'event and gated_clk = '1' then
			q <= d;
		end if;
	end process;
end behavioral;				   