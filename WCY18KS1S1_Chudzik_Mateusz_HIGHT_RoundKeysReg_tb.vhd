library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inWriteData   : std_logic := '0';
	signal inResetReg	   : std_logic := '0';
	signal inRoundKeys   : std_logic_vector(127 downto 0) := x"ffeeddccbbaa99887766554433221100";
	
	-- Output signals:
	
	signal outRoundKeys 	: std_logic_vector(127 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	COMPONENT WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg is
	port(
	inClk 					: in std_logic;
	inWriteData				: in std_logic;
	inResetReg				: in std_logic;
	inRoundKeys				: in std_logic_vector(127 downto 0);
	outRoundKeys 			: out std_logic_vector(127 downto 0)
	);
	END COMPONENT;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_RoundKeysReg
		port map(
			inClk => inClk,
			inWriteData => inWriteData,
			inResetReg => inResetReg,
			inRoundKeys => inRoundKeys,
			outRoundKeys => outRoundKeys
		);


	clock: process
	begin
		inClk <= '0';
		wait for clk_period / 2;
		inClk <= '1';
		wait for clk_period / 2;
	end process clock;
	
	stimulus: process
	begin
	
		inWriteData <= '0';
		inResetReg <= '0';
		inRoundKeys <= inRoundKeys;

		wait for clk_period;
	
	
	
		inWriteData <= '1';
		inResetReg <= '0';
		inRoundKeys <= inRoundKeys;

		wait for clk_period;
		
		inWriteData <= '0';
		inResetReg <= '1';
		inRoundKeys <= inRoundKeys;

		wait for clk_period;
		
	end process stimulus;

end architecture testbench;