
library ieee;
use ieee.std_logic_1164.all;

entity bcd2aiken is
	port (
	d, c, b, a: in std_logic;
	v, w, x, y: out std_logic);
end bcd2aiken;

architecture cpos_csop of bcd2aiken is
begin
	v <= (not d and c and not b and a) or
	(not d and c and b and not a) or
	(not d and c and b and a) or
	(d and not c and not b and not a) or
	(d and not c and not b and a);
	
	w <= (not d and c and not b and not a) or
	(not d and c and b and not a) or
	(not d and c and b and a) or
	(d and not c and not b and not a) or
	(d and not c and not b and a);
	
	x <= (d or c or b or a) and
	(d or c or b or not a) and
	(d or not c or b or a) and
	(d or not c or not b or a) and
	(d or not c or not b or not a);
	
	y <= (d or c or b or a) and
	(d or c or not b or a) and
	(d or not c or b or a) and
	(d or not c or not b or a) and
	(not d or c or b or a);
end cpos_csop;
