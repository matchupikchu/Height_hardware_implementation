library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_FinalTransformation is
port(
	inPlaintext 			: in std_logic_vector(63 downto 0);
	inWhiteningKeysEnd	: in std_logic_vector(31 downto 0);
	outFinalBlock 			: out std_logic_vector(63 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_FinalTransformation;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_FinalTransformation is
	
begin

	outFinalBlock(63 downto 56) <= std_logic_vector(unsigned(inPlaintext(55 downto 48)) + unsigned(inWhiteningKeysEnd(31 downto 24)));
	outFinalBlock(55 downto 48) <= inPlaintext(47 downto 40);
	outFinalBlock(47 downto 40) <= inPlaintext(39 downto 32) xor inWhiteningKeysEnd(23 downto 16);
	outFinalBlock(39 downto 32) <= inPlaintext(31 downto 24);
	outFinalBlock(31 downto 24) <= std_logic_vector(unsigned(inPlaintext(23 downto 16)) + unsigned(inWhiteningKeysEnd(15 downto 8)));
	outFinalBlock(23 downto 16) <= inPlaintext(15 downto 8);
	outFinalBlock(15 downto 8) <= inPlaintext(7 downto 0) xor inWhiteningKeysEnd(7 downto 0);
	outFinalBlock(7 downto 0) <= inPlaintext(63 downto 56);
	
end logic;