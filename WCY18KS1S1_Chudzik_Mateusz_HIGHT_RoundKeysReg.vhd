library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg is
port(
	inClk 					: in std_logic;
	inWriteData				: in std_logic;
	inResetReg				: in std_logic;
	inRoundKeys				: in std_logic_vector(127 downto 0);
	outRoundKeys 			: out std_logic_vector(127 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg is

	signal RoundKeys : std_logic_vector(127 downto 0) := x"00000000000000000000000000000000";

begin


	process(inClk)
	begin
		if(rising_edge(inClk)) then 
			
			if(inWriteData = '1') then
				
				RoundKeys <= inRoundKeys;
				
			end if;
		
			if(inResetReg = '1') then
			
				RoundKeys <= x"00000000000000000000000000000000";
			
			end if;
		
		end if;
		
	end process;
	
	outRoundKeys <= RoundKeys;


end logic;