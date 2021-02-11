-- Selfchecking testbench for 4-bit Gray code to Binary Code decoder.
-- K Short

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_bin_selfcheck_tb is
end gray_bin_selfcheck_tb;

architecture tb_architecture of gray_bin_selfcheck_tb is

	-- Stimulus signals
	signal g : std_logic_vector (3 downto 0);
	-- Observed signals
	signal b : std_logic_vector (3 downto 0);

	constant period: time := 20ns;

begin

	-- Unit Under Test port map
	UUT : entity gray_bin
		port map (g => g,
			b => b
		);

	stimulus: process
	begin
		for i in 0 to 15 loop	 -- generate all integer values of i from 0 to 15
			-- convert i to a vector of std_logic elements and assign to g
			g <= std_logic_vector(to_unsigned(i, 4));
			wait for period;	-- wait for outputs to settle
			-- verify outputs
			assert ((b(3) = g(3)) and (b(2) = (g(3) xor g(2))) and
			(b(1) = ((g(3) xor g(2)) xor g(1))) and (b(0) = (((g(3) xor g(2)) xor g(1)) xor g(0))))
			report "Error for input " & to_string((g)) & "."
				severity error;
		end loop;
		wait;	-- infinite wait, no more stimulus vectors to generate
	end process;

end tb_architecture;


																		   