library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_EncTwoRounds is
port(
	inBlock		 			: in std_logic_vector(63 downto 0);
	inRoundKeys				: in std_logic_vector(63 downto 0);
	outBlock 				: out std_logic_vector(63 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_EncTwoRounds;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_EncTwoRounds is
	
	component WCY18KS1S1_Chudzik_Mateusz_EncRound is
	port(
	inBlock		 			: in std_logic_vector(63 downto 0);
	inRoundKeys				: in std_logic_vector(31 downto 0);
	outBlock 				: out std_logic_vector(63 downto 0)
	);
	end component;
	
	signal firstEnc : std_logic_vector(63 downto 0);
	
begin

	
	Enc0 : WCY18KS1S1_Chudzik_Mateusz_EncRound port map(
		inBlock => inBlock,
		inRoundKeys => inRoundKeys(63 downto 32),
		outBlock => firstEnc
	);
	
	Enc1 : WCY18KS1S1_Chudzik_Mateusz_EncRound port map(
		inBlock => firstEnc,
		inRoundKeys => inRoundKeys(31 downto 0),
		outBlock => outBlock
	);
	
	
end logic;