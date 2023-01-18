library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inInitWrite 		: std_logic := '0';
	signal inRoundWrite	   : std_logic := '0';
	signal inFinalWrite   	: std_logic := '0';
	signal inInitData			: std_logic_vector(63 downto 0) := x"0000000000000000";
	signal inRoundData		: std_logic_vector(63 downto 0) := x"1111111111111111";
	signal inFinalData		: std_logic_vector(63 downto 0) := x"2222222222222222";
	
	-- Output signals:
	
	signal outData					: std_logic_vector(63 downto 0);
	signal outNextBlock 			:  std_logic_vector(63 downto 0);
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
	COMPONENT WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg
	port(
	inClk 						: in std_logic;
	inInitWrite					: in std_logic;
	inRoundWrite 				: in std_logic;
	inFinalWrite 				: in std_logic;
	inInitData					: in std_logic_vector(63 downto 0);
	inRoundData					: in std_logic_vector(63 downto 0);
	inFinalData					: in std_logic_vector(63 downto 0);
	outNextBlock 				: in std_logic_vector(63 downto 0);
	outData						: out std_logic_vector(63 downto 0)
	);
	END COMPONENT;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_BlockReg
		port map(
			inClk => inClk,
			inInitWrite => inInitWrite,
			inRoundWrite => inRoundWrite,
			inFinalWrite => inFinalWrite,
			inInitData => inInitData,
			inRoundData => inRoundData,
			inFinalData => inFinalData,
			outNextBlock => outNextBlock,
			outData => outData
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
	
		inInitWrite <= '0';
		inRoundWrite <= '0';
		inFinalWrite <= '0';
		inInitData <= inInitData;
		inRoundData <= inRoundData;
		inFinalData <= inFinalData;

		wait for clk_period;
	
	
		inInitWrite <= '1';
		inRoundWrite <= '0';
		inFinalWrite <= '0';
		inInitData <= inInitData;
		inRoundData <= inRoundData;
		inFinalData <= inFinalData;

		wait for clk_period;
		
		inInitWrite <= '0';
		inRoundWrite <= '1';
		inFinalWrite <= '0';
		inInitData <= inInitData;
		inRoundData <= inRoundData;
		inFinalData <= inFinalData;

		wait for clk_period;
		
		inInitWrite <= '0';
		inRoundWrite <= '0';
		inFinalWrite <= '1';
		inInitData <= inInitData;
		inRoundData <= inRoundData;
		inFinalData <= inFinalData;

		wait for clk_period;
		
	end process stimulus;

end architecture testbench;