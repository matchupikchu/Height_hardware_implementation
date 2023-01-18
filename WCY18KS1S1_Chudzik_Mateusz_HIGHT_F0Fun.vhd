library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun is
port(
	input  : in std_logic_vector(7 downto 0);
	output : out std_logic_vector(7 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun is
	
begin

	output <= (input(6 downto 0) & input(7)) xor (input(5 downto 0) & input(7 downto 6)) xor (input(0) & input(7 downto 1));

end logic;