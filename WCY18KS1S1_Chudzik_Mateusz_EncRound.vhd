library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_EncRound is
port(
	inBlock		 			: in std_logic_vector(63 downto 0);
	inRoundKeys				: in std_logic_vector(31 downto 0);
	outBlock 				: out std_logic_vector(63 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_EncRound;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_EncRound is
	
	signal temp6 : std_logic_vector(7 downto 0) := inBlock(15 downto 8);
	signal temp7 : std_logic_vector(7 downto 0) := inBlock(7 downto 0);
	
	signal outF00, outF01, outF10, outF11 : std_logic_vector(7 downto 0);
	
	component WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun port(
		input 		: in std_logic_vector(7 downto 0);
		output	 	: out std_logic_vector(7 downto 0));
	end component;
	
	component WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun port(
		input 		: in std_logic_vector(7 downto 0);
		output	 	: out std_logic_vector(7 downto 0));
	end component;
	
begin

	F1Fun0 : WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun port map(
		input => inBlock(31 downto 24),
		output => outF10
	);
	
	F0Fun0 : WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun port map(
		input => inBlock(47 downto 40),
		output => outF00
	);
	
	F1Fun1 : WCY18KS1S1_Chudzik_Mateusz_HIGHT_F1Fun port map(
		input => inBlock(63 downto 56),
		output => outF11
	);
	
	F0Fun1 : WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun port map(
		input => inBlock(15 downto 8),
		output => outF01
	);
	
	outBlock(63 downto 56) <= inBlock(7 downto 0) xor std_logic_vector(unsigned(outF01) + unsigned(inRoundKeys(7 downto 0)));
	outBlock(55 downto 48) <= inBlock(63 downto 56);
	outBlock(47 downto 40) <= std_logic_vector(unsigned(inBlock(55 downto 48)) + unsigned(outF11 xor inRoundKeys(31 downto 24)));
	outBlock(39 downto 32) <= inBlock(47 downto 40);
	outBlock(31 downto 24) <= inBlock(39 downto 32) xor std_logic_vector(unsigned(outF00) + unsigned(inRoundKeys(23 downto 16)));
	outBlock(23 downto 16) <= inBlock(31 downto 24);
	outBlock(15 downto 8)  <= std_logic_vector(unsigned(inBlock(23 downto 16)) + unsigned(outF10 xor inRoundKeys(15 downto 8)));
	outBlock(7 downto 0)   <= inBlock(15 downto 8);
	
--	outBlock(63 downto 56) <= inBlock(15 downto 8);
--	outBlock(55 downto 48) <= std_logic_vector(unsigned(inBlock(23 downto 16)) + unsigned(outF10 xor inRoundKeys(15 downto 8)));
--	outBlock(47 downto 40) <= inBlock(31 downto 24);
--	outBlock(39 downto 32) <= inBlock(39 downto 32) xor std_logic_vector(unsigned(outF00) + unsigned(inRoundKeys(23 downto 16)));
--	outBlock(31 downto 24) <= inBlock(47 downto 40);
--	outBlock(23 downto 16) <= std_logic_vector(unsigned(inBlock(55 downto 48)) + unsigned(outF11 xor inRoundKeys(31 downto 24)));
--	outBlock(15 downto 8)  <= inBlock(63 downto 56);
--	outBlock(7 downto 0)   <= inBlock(7 downto 0) xor std_logic_vector(unsigned(outF01) + unsigned(inRoundKeys(7 downto 0)));
--	
end logic;