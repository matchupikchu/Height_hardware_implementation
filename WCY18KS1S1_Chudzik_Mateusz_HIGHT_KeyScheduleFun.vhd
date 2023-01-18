library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun is
port(
	inRoundNumber		: in std_logic_vector(5 downto 0);
	inKey					: in std_logic_vector(127 downto 0);
	outSK					: out std_logic_vector(127 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun is

	type delta is array (0 to 127) of std_logic_vector(7 downto 0);
	constant D : delta := (x"5a", x"6d", x"36", x"1b", x"0d", x"06", x"03", x"41", x"60", x"30", x"18", x"4c", x"66", x"33", x"59", x"2c",
								  x"56", x"2b", x"15", x"4a", x"65", x"72", x"39", x"1c", x"4e", x"67", x"73", x"79", x"3c", x"5e", x"6f", x"37",
								  x"5b", x"2d", x"16", x"0b", x"05", x"42", x"21", x"50", x"28", x"54", x"2a", x"55", x"6a", x"75", x"7a", x"7d",
								  x"3e", x"5f", x"2f", x"17", x"4b", x"25", x"52", x"29", x"14", x"0a", x"45", x"62", x"31", x"58", x"6c", x"76",
								  x"3b", x"1d", x"0e", x"47", x"63", x"71", x"78", x"7c", x"7e", x"7f", x"3f", x"1f", x"0f", x"07", x"43", x"61",
								  x"70", x"38", x"5c", x"6e", x"77", x"7b", x"3d", x"1e", x"4f", x"27", x"53", x"69", x"34", x"1a", x"4d", x"26",
								  x"13", x"49", x"24", x"12", x"09", x"04", x"02", x"01", x"40", x"20", x"10", x"08", x"44", x"22", x"11", x"48",
								  x"64", x"32", x"19", x"0c", x"46", x"23", x"51", x"68", x"74", x"3a", x"5d", x"2e", x"57", x"6b", x"35", x"5a" 
									);
	
--	type indexes is array(0 to 127) of integer;
--	constant index : indexes := (0,1,2,3,4,5,6,7,8, 9, 10,11,12,13,14,15,
--										  7,0,1,2,3,4,5,6,15,8, 9, 10,11,12,13,14,
--										  6,7,0,1,2,3,4,5,14,15,8, 9, 10,11,12,13,
--										  5,6,7,0,1,2,3,4,13,14,15,8, 9, 10,11,12,
--										  4,5,6,7,0,1,2,3,12,13,14,15,8, 9, 10,11,
--										  3,4,5,6,7,0,1,2,11,12,13,14,15,8, 9, 10,
--										  2,3,4,5,6,7,0,1,10,11,12,13,14,15,8, 9,
--										  1,2,3,4,5,6,7,0,9, 10,11,12,13,14,15,8);

	

begin

	outSK(127 downto 120) <= std_logic_vector(unsigned(inKey(127 downto 120))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(71 downto 64))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(79 downto 72))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(87 downto 80))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(95 downto 88))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(103 downto 96))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(111 downto 104))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(119 downto 112))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)))))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
	
	
	outSK(119 downto 112) <= std_logic_vector(unsigned(inKey(119 downto 112))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  0 else
									 std_logic_vector(unsigned(inKey(127 downto 120))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  1 else
									 std_logic_vector(unsigned(inKey(71 downto 64))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  2 else
									 std_logic_vector(unsigned(inKey(79 downto 72))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  3 else
									 std_logic_vector(unsigned(inKey(87 downto 80))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  4 else
									 std_logic_vector(unsigned(inKey(95 downto 88))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  5 else
									 std_logic_vector(unsigned(inKey(103 downto 96))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  6 else
									 std_logic_vector(unsigned(inKey(111 downto 104))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 1)))) when unsigned(inRoundNumber) =  7 else 
									 x"00";
	
	
	outSK(111 downto 104) <= std_logic_vector(unsigned(inKey(111 downto 104))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 0 else
									std_logic_vector(unsigned(inKey(119 downto 112))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 1 else
									std_logic_vector(unsigned(inKey(127 downto 120))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 2 else
									std_logic_vector(unsigned(inKey(71 downto 64))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 3 else
									std_logic_vector(unsigned(inKey(79 downto 72))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 4 else
									std_logic_vector(unsigned(inKey(87 downto 80))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 5 else
									std_logic_vector(unsigned(inKey(95 downto 88))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 6 else
									std_logic_vector(unsigned(inKey(103 downto 96))  + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 2)))) when unsigned(inRoundNumber) = 7 else 
									x"00";
									
									
	outSK(103 downto 96)  <= std_logic_vector(unsigned(inKey(103 downto 96))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(111 downto 104))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(119 downto 112))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(127 downto 120))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(71 downto 64))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(79 downto 72))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(87 downto 80))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(95 downto 88))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 3)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(95 downto  88)  <= std_logic_vector(unsigned(inKey(95  downto 88))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(103  downto 96))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(111 downto 104))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(119  downto 112))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(127  downto 120))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(71  downto 64))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(79  downto 72))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(87  downto 80))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 4)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									
									 
	outSK(87 downto  80)  <= std_logic_vector(unsigned(inKey(87  downto 80))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(95  downto 88))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(103  downto 96))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(111  downto 104))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(119  downto 112))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(127  downto 120))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(71  downto 64))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(79  downto 72))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 5)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(79 downto 72) 	 <= std_logic_vector(unsigned(inKey(79  downto 72))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(87  downto 80))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(95  downto 88))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(103  downto 96))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(111  downto 104))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(119  downto 112))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(127  downto 120))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(71  downto 64))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 6)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(71 downto 64)   <= std_logic_vector(unsigned(inKey(71  downto 64))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(79  downto 72))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(87  downto 80))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(95  downto 88))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(103  downto 96))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(111  downto 104))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(119  downto 112))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(127  downto 120))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 7)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(63 downto 56)   <= std_logic_vector(unsigned(inKey(63  downto 56))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(7  downto 0))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(15  downto 8))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(23  downto 16))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(31  downto 24))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(39  downto 32))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(47  downto 40))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(55  downto 48))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 8)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(55 downto 48)   <= std_logic_vector(unsigned(inKey(55  downto 48))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(63  downto 56))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(7   downto 0))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(15  downto 8))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(23  downto 16))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(31  downto 24))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(39  downto 32))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(47  downto 40))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 9)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(47 downto 40)   <= std_logic_vector(unsigned(inKey(47  downto 40))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(55  downto 48))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(63  downto 56))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(7  downto 0))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(15  downto 8))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(23  downto 16))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(31  downto 24))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(39  downto 32))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 10)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(39 downto 32)   <= std_logic_vector(unsigned(inKey(39  downto 32))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(47  downto 40))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(55  downto 48))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(63  downto 56))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(7  downto 0))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(15  downto 8))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(23  downto 16))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(31  downto 24))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 11)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(31 downto 24)   <= std_logic_vector(unsigned(inKey(31  downto 24)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(39  downto 32)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(47  downto 40)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(55  downto 48)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(63  downto 56)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(7  downto 0)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(15  downto 8)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(23  downto 16)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 12)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(23 downto 16)   <= std_logic_vector(unsigned(inKey(23  downto 16))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(31  downto 24))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(39  downto 32))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(47  downto 40))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(55  downto 48))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(63  downto 56))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(7  downto 0))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(15  downto 8))   + unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 13)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
									 
									 
	outSK(15 downto 8) 	 <= std_logic_vector(unsigned(inKey(15  downto 8)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(23  downto 16)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(31  downto 24)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(39  downto 32)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(47  downto 40)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(55  downto 48)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(63  downto 56)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(7  downto 0)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 14)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
	
	
	outSK(7 downto 0) 	 <= std_logic_vector(unsigned(inKey(7   downto 0)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 0 else
									 std_logic_vector(unsigned(inKey(15   downto 8)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 1 else
									 std_logic_vector(unsigned(inKey(23   downto 16)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 2 else
									 std_logic_vector(unsigned(inKey(31   downto 24)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 3 else
									 std_logic_vector(unsigned(inKey(39   downto 32)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 4 else
									 std_logic_vector(unsigned(inKey(47   downto 40)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 5 else
									 std_logic_vector(unsigned(inKey(55   downto 48)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 6 else
									 std_logic_vector(unsigned(inKey(63   downto 56)) 	+ unsigned(D(to_integer((16*unsigned(inRoundNumber)) + 15)))) when unsigned(inRoundNumber) = 7 else 
									 x"00";
	

end logic;