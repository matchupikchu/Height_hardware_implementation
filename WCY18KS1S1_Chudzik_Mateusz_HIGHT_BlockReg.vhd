library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg is
port(
	inClk 					: in std_logic;
	inInitWrite				: in std_logic;
	inRoundWrite 			: in std_logic;
	inFinalWrite			: in std_logic;
	inResetReg				: in std_logic;
	inInitData				: in std_logic_vector(63 downto 0);
	inRoundData				: in std_logic_vector(63 downto 0);
	inFinalData				: in std_logic_vector(63 downto 0);
	outNextBlock 			: out std_logic_vector(63 downto 0);
	outData					: out std_logic_vector(63 downto 0)
);

end WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg;

architecture logic of WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg is

	signal data 		: std_logic_vector(63 downto 0) := x"0000000000000000";
	signal outoutData : std_logic_vector(63 downto 0) := x"0000000000000000";

begin


	process(inClk)
	begin
		if(rising_edge(inClk)) then 
			
			if(inInitWrite = '1') then
				
				data <= inInitData;
				
			end if;
		
			if(inRoundWrite = '1') then
		
				data <= inRoundData;
			
			end if;
			
			if(inFinalWrite = '1') then
		
				outoutData <= inFinalData;
			
			end if;
			
			if(inResetReg = '1') then
			
				outoutData <= x"0000000000000000";
				data 		  <= x"0000000000000000";
			
			end if;
		
		end if;
		
	end process;
	
	outNextBlock <= data;
	outData <= outoutData;


end logic;