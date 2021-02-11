library ieee;
use ieee.std_logic_1164.all;

entity testbench is -- test bench entity has no ports
end testbench;

architecture table of testbench is
-- Stimulus signals
signal s1 : std_logic;
signal s0 : std_logic;
signal datain : std_logic_vector (3 downto 0);


-- Observed signals
signal route0 : std_logic_vector (3 downto 0);
signal route1 : std_logic_vector (3 downto 0);
signal route2 : std_logic_vector (3 downto 0);
signal route3 : std_logic_vector (3 downto 0);

constant dont_care : boolean := false; 

type test_vector is record --1. Record Declaration
  s1 : std_logic;
  s0 : std_logic;
  datain : std_logic_vector (3 downto 0);

-- Observed signals
  route0 : std_logic_vector (3 downto 0);
  route1 : std_logic_vector (3 downto 0);
  route2 : std_logic_vector (3 downto 0);
  route3 : std_logic_vector (3 downto 0);
end record;


type test_vector_array is array (natural range <>) -- 2. Record Array Declaration
of test_vector;
constant test_vectors : test_vector_array := (
						-- 3. Record Array Content Declaration
('0', '0',  "0000",  "0000", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0001",  "0001", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0010",  "0010", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0011",  "0011", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0100",  "0100", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0101",  "0101", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0110",  "0110", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "0111",  "0111", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1000",  "1000", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1001",  "1001", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1010",  "1010", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1011",  "1011", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1100",  "1100", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1101",  "1101", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1110",  "1110", "ZZZZ","ZZZZ","ZZZZ"),
('0', '0',  "1111",  "1111", "ZZZZ","ZZZZ","ZZZZ"),
('0', '1',  "0000",  "ZZZZ", "0000","ZZZZ","ZZZZ"),
('0', '1',  "0001",  "ZZZZ", "0001","ZZZZ","ZZZZ"),
('0', '1',  "0010",  "ZZZZ", "0010","ZZZZ","ZZZZ"),
('0', '1',  "0011",  "ZZZZ", "0011","ZZZZ","ZZZZ"),
('0', '1',  "0100",  "ZZZZ", "0100","ZZZZ","ZZZZ"),
('0', '1',  "0101",  "ZZZZ", "0101","ZZZZ","ZZZZ"),
('0', '1',  "0110",  "ZZZZ", "0110","ZZZZ","ZZZZ"),
('0', '1',  "0111",  "ZZZZ", "0111","ZZZZ","ZZZZ"),
('0', '1',  "1000",  "ZZZZ", "1000","ZZZZ","ZZZZ"),
('0', '1',  "1001",  "ZZZZ", "1001","ZZZZ","ZZZZ"),
('0', '1',  "1010",  "ZZZZ", "1010","ZZZZ","ZZZZ"),
('0', '1',  "1011",  "ZZZZ", "1011","ZZZZ","ZZZZ"),
('0', '1',  "1100",  "ZZZZ", "1100","ZZZZ","ZZZZ"),
('0', '1',  "1101",  "ZZZZ", "1101","ZZZZ","ZZZZ"),
('0', '1',  "1110",  "ZZZZ", "1110","ZZZZ","ZZZZ"),
('0', '1',  "1111",  "ZZZZ", "1111","ZZZZ","ZZZZ"),
('1', '0',  "0000",  "ZZZZ", "ZZZZ","0000","ZZZZ"),
('1', '0',  "0001",  "ZZZZ", "ZZZZ","0001","ZZZZ"),
('1', '0',  "0010",  "ZZZZ", "ZZZZ","0010","ZZZZ"),
('1', '0',  "0011",  "ZZZZ", "ZZZZ","0011","ZZZZ"),
('1', '0',  "0100",  "ZZZZ", "ZZZZ","0100","ZZZZ"),
('1', '0',  "0101",  "ZZZZ", "ZZZZ","0101","ZZZZ"),
('1', '0',  "0110",  "ZZZZ", "ZZZZ","0110","ZZZZ"),
('1', '0',  "0111",  "ZZZZ", "ZZZZ","0111","ZZZZ"),
('1', '0',  "1000",  "ZZZZ", "ZZZZ","1000","ZZZZ"),
('1', '0',  "1001",  "ZZZZ", "ZZZZ","1001","ZZZZ"),
('1', '0',  "1010",  "ZZZZ", "ZZZZ","1010","ZZZZ"),
('1', '0',  "1011",  "ZZZZ", "ZZZZ","1011","ZZZZ"),
('1', '0',  "1100",  "ZZZZ", "ZZZZ","1100","ZZZZ"),
('1', '0',  "1101",  "ZZZZ", "ZZZZ","1101","ZZZZ"),
('1', '0',  "1110",  "ZZZZ", "ZZZZ","1110","ZZZZ"),
('1', '0',  "1111",  "ZZZZ", "ZZZZ","1111","ZZZZ"),
('1', '1',  "0000",  "ZZZZ", "ZZZZ","ZZZZ","0000"),
('1', '1',  "0001",  "ZZZZ", "ZZZZ","ZZZZ","0001"),
('1', '1',  "0010",  "ZZZZ", "ZZZZ","ZZZZ","0010"),
('1', '1',  "0011",  "ZZZZ", "ZZZZ","ZZZZ","0011"),
('1', '1',  "0100",  "ZZZZ", "ZZZZ","ZZZZ","0100"),
('1', '1',  "0101",  "ZZZZ", "ZZZZ","ZZZZ","0101"),
('1', '1',  "0110",  "ZZZZ", "ZZZZ","ZZZZ","0110"),
('1', '1',  "0111",  "ZZZZ", "ZZZZ","ZZZZ","0111"),
('1', '1',  "1000",  "ZZZZ", "ZZZZ","ZZZZ","1000"),
('1', '1',  "1001",  "ZZZZ", "ZZZZ","ZZZZ","1001"),
('1', '1',  "1010",  "ZZZZ", "ZZZZ","ZZZZ","1010"),
('1', '1',  "1011",  "ZZZZ", "ZZZZ","ZZZZ","1011"),
('1', '1',  "1100",  "ZZZZ", "ZZZZ","ZZZZ","1100"),
('1', '1',  "1101",  "ZZZZ", "ZZZZ","ZZZZ","1101"),
('1', '1',  "1110",  "ZZZZ", "ZZZZ","ZZZZ","1110"),
('1', '1',  "1111",  "ZZZZ", "ZZZZ","ZZZZ","1111"));


begin 
	UUT: entity demux
		port map 
		(  
		s1 => s1,
		s0 => s0,
		datain => datain,
		
		route0 => route0,
		route1 => route1,
		route2 => route2,
		route3 => route3
		);
		
verify : process
	begin
	for i in test_vectors'range loop
	s1 <= test_vectors(i).s1;
	s0 <= test_vectors(i).s0;
	datain <= test_vectors(i).datain;
	wait for 20 ns;
	-- assert reports on false 
	
	if(dont_care) then
		
	assert (( route0 = test_vectors(i).route0 ) 
	and (route1 = test_vectors(i).route1)
	and (route2 = test_vectors(i).route2)
	and (route3 = test_vectors(i).route3))
	report "test failed for inputcomb: " &  to_string(test_vectors(i).s1) & to_string(test_vectors(i).s0) & to_string(test_vectors(i).datain) & CR & LF &
	" output should have been: " & to_string(test_vectors(i).route0) & to_string(test_vectors(i).route1) & to_string(test_vectors(i).route2) & to_string(test_vectors(i).route3) & CR & LF &
	" output was : " & to_string(route0) & to_string(route1) & to_string(route2) & to_string(route3) & CR & LF
	severity error;	
	
	else  --dont verify check dont cares
		
	assert ((( route0 = test_vectors(i).route0 ) 
	and (route1 = test_vectors(i).route1)
	and (route2 = test_vectors(i).route2)
	and (route3 = test_vectors(i).route3))
	or 
	(test_vectors(i).route0 = "ZZZZ")
	or
	(test_vectors(i).route1 = "ZZZZ")
	or
	(test_vectors(i).route2 = "ZZZZ")
	or
	(test_vectors(i).route3 = "ZZZZ")
	
	)
	report "test failed for inputcomb: " &  to_string(test_vectors(i).s1) & to_string(test_vectors(i).s0) & to_string(test_vectors(i).datain) & CR & LF &
	" output should have been: " & to_string(test_vectors(i).route0) & to_string(test_vectors(i).route1) & to_string(test_vectors(i).route2) & to_string(test_vectors(i).route3) & CR & LF &
	" output was : " & to_string(route0) & to_string(route1) & to_string(route2) & to_string(route3) & CR & LF
	severity error;
	end if;

	end loop;
end process;
end;
