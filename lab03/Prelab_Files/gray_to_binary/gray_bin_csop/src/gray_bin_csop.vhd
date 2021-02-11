library ieee;
use ieee.std_logic_1164.all;

entity gray_bin is
	port
	(
	g3,g2,g1,g0: in std_logic;
	b3,b2,b1,b0: out std_logic
	);
end gray_bin;

architecture dataflow of gray_bin is
begin
	
	b3 <= g3;
	b2 <= (g3 and (not g2)) or ((not g3) and g2);
	b1 <= ((not g3) and g2 and (not g1)) or ((not g3) and (not g2) and g1) or (g3 and g2 and g1) or (g3 and (not g2) and (not g1));
	b0 <= (not g3 and not g2 and not g1 and g0) or ( not g3 and not g2 and g1 and  not g0) or (not g3 and g2 and g1 and g0) or (not g3 and g2 and not g1 and not g0) or (g3 and g2 and not g1 and g0) or (g3 and g2 and g1 and not g0) or (g3 and not g2 and g1 and g0) or (g3 and not g2 and not g1 and not g0) ;

end dataflow;