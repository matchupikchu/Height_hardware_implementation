library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inRoundNumber : std_logic_vector(5 downto 0);
	signal inKey	  		: std_logic_vector(127 downto 0) := x"ffeeddccbbaa99887766554433221100";
	
	-- Output signals:
	
	signal outSK : std_logic_vector(127 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	component WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun is
	port(
	inRoundNumber		: in std_logic_vector(5 downto 0);
	inKey					: in std_logic_vector(127 downto 0);
	outSK					: out std_logic_vector(127 downto 0)
	);
	end component;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_KeyScheduleFun
		port map(
			inRoundNumber => inRoundNumber,
			inKey => inKey,
			outSK => outSK
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
	
		inRoundNumber <= b"000000";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000001";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000010";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000011";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000100";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000101";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000110";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inRoundNumber <= b"000111";
		inKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		
	end process stimulus;

end architecture testbench;