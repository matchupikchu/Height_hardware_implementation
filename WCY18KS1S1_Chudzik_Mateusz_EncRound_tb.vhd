library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_EncRound_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_EncRound_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_EncRound_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inBlock 			:  std_logic_vector(63 downto 0) := x"0000000000000000";
	signal inRoundKeys		:  std_logic_vector(31 downto 0) := x"33221100";
	
	-- Output signals:
	
	signal outBlock 		: std_logic_vector(63 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	component WCY18KS1S1_Chudzik_Mateusz_EncRound is
	port(
	inBlock		 			: in std_logic_vector(63 downto 0);
	inRoundKeys				: in std_logic_vector(31 downto 0);
	outBlock 				: out std_logic_vector(63 downto 0)
	);
	end component;

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_EncRound
		port map(
			inBlock => inBlock,
			inRoundKeys => inRoundKeys,
			outBlock => outBlock
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
	
		inBlock <= x"0000000000000000";
		inRoundKeys <= x"33221100";

		wait for clk_period;
		
		
	end process stimulus;

end architecture testbench;