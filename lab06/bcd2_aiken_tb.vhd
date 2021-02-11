library ieee;
use ieee.std_logic_1164.all;

entity testbench is -- test bench entity has no ports
end testbench;

architecture table of testbench is
-- Stimulus signals
signal d : std_logic;
signal c : std_logic;
signal b : std_logic;
signal a : std_logic;

-- Observed signals
signal v : std_logic;
signal w : std_logic;
signal x : std_logic;
signal y : std_logic;

constant dont_care : boolean := false; 

type test_vector is record --1. Record Declaration
  d : std_logic;
  c : std_logic;
  b : std_logic;
  a : std_logic;

-- Observed signals
  v : std_logic;
  w : std_logic;
  x : std_logic;
  y : std_logic;
end record;


type test_vector_array is array (natural range <>) -- 2. Record Array Declaration
of test_vector;
constant test_vectors : test_vector_array := (
						-- 3. Record Array Content Declaration
('0', '0', '0', '0',   '0', '0', '0', '0'),
('0', '0', '0', '1',   '0', '0', '0', '1'),
('0', '0', '1', '0',   '0', '0', '1', '0'),
('0', '0', '1', '1',   '0', '0', '1', '1'),
('0', '1', '0', '0',   '0', '1', '0', '0'),
('0', '1', '0', '1',   '1', '0', '1', '1'),
('0', '1', '1', '0',   '1', '1', '0', '0'),
('0', '1', '1', '1',   '1', '1', '0', '1'),
('1', '0', '0', '0',   '1', '1', '1', '0'),
('1', '0', '0', '1',   '1', '1', '1', '1'),
('1', '0', '1', '0',   '-', '-', '-', '-'),
('1', '0', '1', '1',   '-', '-', '-', '-'),
('1', '1', '0', '0',   '-', '-', '-', '-'),
('1', '1', '0', '1',   '-', '-', '-', '-'),
('1', '1', '1', '0',   '-', '-', '-', '-'),
('1', '1', '1', '1',   '-', '-', '-', '-'));

begin 
	UUT: entity bcd2aiken
		port map 
		(  
		a => a,
		b => b,
		c => c,
		d => d,
		
		v => v,
		w => w,
		x => x,
		y => y
		);
		
verify : process
	begin
	for i in test_vectors'range loop
	a <= test_vectors(i).a;
	b <= test_vectors(i).b;
	c <= test_vectors(i).c;
	d <= test_vectors(i).d;
	wait for 20 ns;
	-- assert reports on false 
	
	if(dont_care) then
		
	assert ((( v = test_vectors(i).v ) 
	and (w = test_vectors(i).w)
	and (x = test_vectors(i).x)
	and (y = test_vectors(i).y))
	or(( v = '-' )
	and (w = '-')
	and (x = '-')
	and (y = '-')))
	report "test failed for inputcomb: " &  std_logic'image(test_vectors(i).a) & std_logic'image(test_vectors(i).b) & std_logic'image(test_vectors(i).c) & std_logic'image(test_vectors(i).d) & CR & LF &
	" output should have been: " & std_logic'image(test_vectors(i).v) & std_logic'image(test_vectors(i).w) & std_logic'image(test_vectors(i).x) & std_logic'image(test_vectors(i).y) & "or a dont care" & CR & LF &
	" output was : " & std_logic'image(a) & std_logic'image(b) & std_logic'image(c) & std_logic'image(d) & CR & LF
	severity error;	
	
	else 
		
	assert (( v = test_vectors(i).v ) 
	and (w = test_vectors(i).w)
	and (x = test_vectors(i).x)
	and (y = test_vectors(i).y))
	report "test failed for inputcomb: " &  std_logic'image(test_vectors(i).a) & std_logic'image(test_vectors(i).b) & std_logic'image(test_vectors(i).c) & std_logic'image(test_vectors(i).d) & CR & LF &
	" output should have been: " & std_logic'image(test_vectors(i).v) & std_logic'image(test_vectors(i).w) & std_logic'image(test_vectors(i).x) & std_logic'image(test_vectors(i).y) & CR & LF &
	" output was : " & std_logic'image(a) & std_logic'image(b) & std_logic'image(c) & std_logic'image(d) & CR & LF
	 severity error;
	
	end if;

	end loop;
end process;
end;
