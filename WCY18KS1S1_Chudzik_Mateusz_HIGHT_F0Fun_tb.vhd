library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal input  : std_logic_vector(7 downto 0) := x"43";
	
	
	-- Output signals:
	
	signal output : std_logic_vector(7 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	component WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun is
	port(
	input  : in std_logic_vector(7 downto 0);
	output : out std_logic_vector(7 downto 0)
	);
	end component;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_F0Fun
		port map(
			input => input,
			output => output
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
	
		input <= x"43";

		wait for clk_period;
		
		
	end process stimulus;

end architecture testbench;