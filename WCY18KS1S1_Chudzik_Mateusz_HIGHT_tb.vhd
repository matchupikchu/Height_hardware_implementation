library ieee;
use ieee.std_logic_1164.all;
LIBRARY work;

entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_tb is
end entity WCY18KS1S1_Chudzik_Mateusz_HIGHT_tb;

architecture testbench of WCY18KS1S1_Chudzik_Mateusz_HIGHT_tb is

	signal TEST : std_logic_vector(63 downto 0) := x"0000000000000000";

	-- Input signals:
	
	signal inExtReset   		: std_logic := '0';
	signal inExtDataWr	   : std_logic := '0';
	signal inKey   			: std_logic_vector(127 downto 0) := x"ffeeddccbbaa99887766554433221100";
	signal inPlaintext	   : std_logic_vector(63 downto 0)  := x"0000000000000000";
	
	-- Output signals:
	
	signal outData 	: std_logic_vector(63 downto 0);
	signal outBusy 	: std_logic;
	
	-- Clock signal:
	
	signal inClk : std_logic;
	constant clk_period : time := 10 ps;

	-- Other signals:
	
component WCY18KS1S1_Chudzik_Mateusz_HIGHT_vhdl IS 
	PORT
	(
		inClk :  IN  STD_LOGIC;
		inExtReset :  IN  STD_LOGIC;
		inExtDataWr :  IN  STD_LOGIC;
		inKey :  IN  STD_LOGIC_VECTOR(127 DOWNTO 0);
		inPlaintext :  IN  STD_LOGIC_VECTOR(63 DOWNTO 0);
		outBusy :  OUT  STD_LOGIC;
		outData :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END component;
	

begin

	hight : WCY18KS1S1_Chudzik_Mateusz_HIGHT_vhdl
		port map(
			inClk => inClk,
			inExtReset => inExtReset,
			inExtDataWr => inExtDataWr,
			inKey => inKey,
			inPlaintext => inPlaintext,
			outBusy => outBusy,
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
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0000000000000000";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0000000000000000";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0000000000000000";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"f2034fd9ae18f400") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"f2034fd9ae18f400";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"f2034fd9ae18f400";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"f2034fd9ae18f400";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"0caa4f7de9c5c5f0") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0caa4f7de9c5c5f0";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0caa4f7de9c5c5f0";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"0caa4f7de9c5c5f0";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"e5307d7eb8709b92") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e5307d7eb8709b92";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e5307d7eb8709b92";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e5307d7eb8709b92";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"a2a4b5a0b383c68f") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a2a4b5a0b383c68f";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a2a4b5a0b383c68f";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a2a4b5a0b383c68f";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"a893a5db59933e67") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a893a5db59933e67";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a893a5db59933e67";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"a893a5db59933e67";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"c97e9b3acddc926e") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"c97e9b3acddc926e";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"c97e9b3acddc926e";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"c97e9b3acddc926e";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"e868cc243c48ada0") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e868cc243c48ada0";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e868cc243c48ada0";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"e868cc243c48ada0";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"7d8a5d06746ab37f") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"7d8a5d06746ab37f";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"7d8a5d06746ab37f";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"7d8a5d06746ab37f";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"96897c38253b3720") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
		--------------------------------------------------
		
		inExtReset <= '1';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"96897c38253b3720";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '1';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"96897c38253b3720";
		
		wait for clk_period;
	
		inExtReset <= '0';
		inExtDataWr <= '0';
		inKey <= x"ffeeddccbbaa99887766554433221100";
		inPlaintext <= x"96897c38253b3720";
		
		wait until (outBusy = '0' and inClk = '0');

		
		if(outData = x"6563717142f1e8a4") then
			report "poprawne szyfrowanie"
			severity NOTE;
		end if;
		
	end process stimulus;

end architecture testbench;