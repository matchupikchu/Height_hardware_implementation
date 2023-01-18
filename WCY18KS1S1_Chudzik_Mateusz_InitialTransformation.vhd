library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_InitialTransformation is
port(
	inPlaintext 			: in std_logic_vector(63 downto 0);
	inWhiteningKeysInit	: in std_logic_vector(31 downto 0);
	outInitialBlock 		: out std_logic_vector(63 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_InitialTransformation;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_InitialTransformation is
	
begin

	outInitialBlock(63 downto 56) <= std_logic_vector(unsigned(inPlaintext(63 downto 56)) + unsigned(inWhiteningKeysInit(31 downto 24)));
	outInitialBlock(55 downto 48) <= inPlaintext(55 downto 48);
	outInitialBlock(47 downto 40) <= inPlaintext(47 downto 40) xor inWhiteningKeysInit(23 downto 16);
	outInitialBlock(39 downto 32) <= inPlaintext(39 downto 32);
	outInitialBlock(31 downto 24) <= std_logic_vector(unsigned(inPlaintext(31 downto 24)) + unsigned(inWhiteningKeysInit(15 downto 8)));
	outInitialBlock(23 downto 16) <= inPlaintext(23 downto 16);
	outInitialBlock(15 downto 8) <= inPlaintext(15 downto 8) xor inWhiteningKeysInit(7 downto 0);
	outInitialBlock(7 downto 0) <= inPlaintext(7 downto 0);
	
end logic;