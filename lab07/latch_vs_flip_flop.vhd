library ieee;
use ieee.std_logic_1164.all;
library lab07;
use lab07.all;

entity latch_vs_flip_flop is
	port(
	d : in std_logic; -- data input
	clk : in std_logic; -- clock input
	ql : out std_logic; -- latch output
	qff : out std_logic -- flip-flop output
	);
end latch_vs_flip_flop;

architecture structural of latch_vs_flip_flop is
begin
	u1: entity d_latch port map ( d => d, le_bar => clk, ql => ql);
	u2: entity d_flip_flop port map (d => d, clk => clk, qff => qff);
end structural;
	