library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inInitKeyReg : std_logic := '0';
	signal inResetReg	  : std_logic := '0';
	signal inMainKey   : std_logic_vector(127 downto 0) := x"ffeeddccbbaa99887766554433221100";
	
	-- Output signals:
	
	signal outWhiteningKeysInit : std_logic_vector(31 downto 0);
	signal outWhiteningKeysEnd  : std_logic_vector(31 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	COMPONENT WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg
	port(
	inClk 					: in std_logic;
	inInitKeyReg			: in std_logic;
	inResetReg 				: in std_logic;
	inMainKey 				: in std_logic_vector(127 downto 0);
	outWhiteningKeysInit	: out std_logic_vector(31 downto 0);
	outWhiteningKeysEnd	: out std_logic_vector(31 downto 0)
	);
	END COMPONENT;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_WhiteningKeysReg
		port map(
			inClk => inClk,
			inInitKeyReg => inInitKeyReg,
			inResetReg => inResetReg,
			inMainKey => inMainKey,
			outWhiteningKeysInit => outWhiteningKeysInit,
			outWhiteningKeysEnd => outWhiteningKeysEnd
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
	
		inInitKeyReg <= '0';
		inResetReg <= '0';
		inMainKey <= x"00000000000000000000000000000000";

		wait for clk_period;
	
	
	
		inInitKeyReg <= '1';
		inResetReg <= '0';
		inMainKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
		inInitKeyReg <= '0';
		inResetReg <= '1';
		inMainKey <= x"ffeeddccbbaa99887766554433221100";

		wait for clk_period;
		
	end process stimulus;

end architecture testbench;