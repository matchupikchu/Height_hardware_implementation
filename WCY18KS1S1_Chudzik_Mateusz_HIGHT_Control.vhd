library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_Control is
port(
	inClk 							 : in std_logic;
	inExtReset 						 : in std_logic;
	inExtDataWr				 		 : in std_logic;
	outInitWhiteningKeysReg		 : out std_logic;
	outReset							 : out std_logic;
	outInitTransformationWrite  : out std_logic;
	outRoundTransformationWrite : out std_logic;
	outFinalTransformationWrite : out std_logic;
	outRoundNumber 				 : out std_logic_vector(5 downto 0);
	outBusy							 : out std_logic
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_Control;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_Control is

	signal counter : std_logic_vector(7 downto 0) := x"00";
	
begin

	process(inClk)
	begin
		
		if(rising_edge(inClk)) then
		
			if((inExtDataWr = '1') or (unsigned(counter) /= 0)) then
				
				if(unsigned(counter) /= 11) then	
					counter <= std_logic_vector(unsigned(counter) + 1);
				else 
					counter <= x"00";
				end if;
				
				if(unsigned(counter) = 11) then
					counter <= x"00";
				end if;
				
			end if;
		
		end if;
		
	end process;	

	
	outRoundNumber 	<= std_logic_vector(resize(unsigned(unsigned(counter) - 2), outRoundNumber'length));
	
	outInitWhiteningKeysReg <= '1' when (inExtDataWr = '1') and (unsigned(counter) = 0) else '0';
	
	outReset  	<= '1' when (unsigned(counter) = 11) else '0';
	
	outInitTransformationWrite	<= '1' when (unsigned(counter) = 1) else '0';
	
	outRoundTransformationWrite  	<= '1' when ((unsigned(counter) > 1) and(unsigned(counter) < 10)) else '0';	
	
	outFinalTransformationWrite	<= '1' when (unsigned(counter) = 10) else '0';
	
	outBusy						<= '1' when ((unsigned(counter) >= 1 ) and (unsigned(counter) <= 10)) else '0';
	
end logic;