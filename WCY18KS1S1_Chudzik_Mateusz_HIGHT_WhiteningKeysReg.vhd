library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg is
port(
	inClk 					: in std_logic;
	inInitKeyReg			: in std_logic;
	inResetReg 				: in std_logic;
	inMainKey 				: in std_logic_vector(127 downto 0);
	outWhiteningKeysInit	: out std_logic_vector(31 downto 0);
	outWhiteningKeysEnd	: out std_logic_vector(31 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg is

	signal WhiteningKeys : std_logic_vector(63 downto 0) := x"0000000000000000";

begin


	process(inClk)
	begin
		if(rising_edge(inClk)) then 
			
			if(inInitKeyReg = '1') then
				
				WhiteningKeys(63 downto 56) <= inMainKey(31 downto 24);
				WhiteningKeys(55 downto 48) <= inMainKey(23 downto 16);
				WhiteningKeys(47 downto 40) <= inMainKey(15 downto 8);
				WhiteningKeys(39 downto 32) <= inMainKey(7 downto 0);
				WhiteningKeys(31 downto 24) <= inMainKey(127 downto 120);
				WhiteningKeys(23 downto 16) <= inMainKey(119 downto 112);
				WhiteningKeys(15 downto 8) <= inMainKey(111 downto 104);
				WhiteningKeys(7 downto 0) <= inMainKey(103 downto 96);
				
			end if;
		
		if(inResetReg = '1') then
		
			WhiteningKeys <= x"0000000000000000";
		
		end if;
		
		end if;
		
	end process;
	
	outWhiteningKeysInit <= WhiteningKeys(63 downto 32);
	outWhiteningKeysEnd <= WhiteningKeys(31 downto 0);


end logic;