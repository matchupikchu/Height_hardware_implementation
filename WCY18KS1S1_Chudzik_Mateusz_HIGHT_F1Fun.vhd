library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun is
port(
	input  : in std_logic_vector(7 downto 0);
	output : out std_logic_vector(7 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun is
	
begin

	output <= (input(4 downto 0) & input(7 downto 5)) xor (input(3 downto 0) & input(7 downto 4)) xor (input(1 downto 0) & input(7 downto 2));
	
end logic;