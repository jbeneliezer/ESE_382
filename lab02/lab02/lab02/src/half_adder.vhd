

library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port(
		a, b: in std_logic;
		sum, carry_out: out std_logic);
end half_adder;

architecture dataflow of half_adder is
begin
	sum <= (a and not b) or (not a and b);
	carry_out <= a and b;
end dataflow;