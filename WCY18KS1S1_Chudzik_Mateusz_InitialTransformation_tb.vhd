library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_InitialTransformation_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_InitialTransformation_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_InitialTransformation_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inPlaintext 			:  std_logic_vector(63 downto 0) := x"0000000000000000";
	signal inWhiteningKeysInit	:  std_logic_vector(31 downto 0) := x"33221100";
	
	-- Output signals:
	
	signal outInitialBlock 		: std_logic_vector(63 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	component WCY18KS1S1_Chudzik_Mateusz_InitialTransformation is
	port(
	inPlaintext 			: in std_logic_vector(63 downto 0);
	inWhiteningKeysInit	: in std_logic_vector(31 downto 0);
	outInitialBlock 		: out std_logic_vector(63 downto 0)
	);
	end component;

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_InitialTransformation
		port map(
			inPlaintext => inPlaintext,
			inWhiteningKeysInit => inWhiteningKeysInit,
			outInitialBlock => outInitialBlock
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
	
		inPlaintext <= x"0000000000000000";
		inWhiteningKeysInit <= x"33221100";

		wait for clk_period;
		
		
	end process stimulus;

end architecture testbench;