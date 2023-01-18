-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Sun Jun 13 02:25:15 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY WCY18KS1S1_Chudzik_Mateusz_HIGHT IS 
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
END WCY18KS1S1_Chudzik_Mateusz_HIGHT;

ARCHITECTURE bdf_type OF WCY18KS1S1_Chudzik_Mateusz_HIGHT IS 

COMPONENT wcy18ks1s1_chudzik_mateusz_encfourrounds
	PORT(inBlock : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inRoundKeys : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 outBlock : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_finaltransformation
	PORT(inPlaintext : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inWhiteningKeysEnd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 outFinalBlock : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_hight_whiteningkeysreg
	PORT(inClk : IN STD_LOGIC;
		 inInitKeyReg : IN STD_LOGIC;
		 inResetReg : IN STD_LOGIC;
		 inMainKey : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 outWhiteningKeysEnd : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 outWhiteningKeysInit : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_initialtransformation
	PORT(inPlaintext : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inWhiteningKeysInit : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 outInitialBlock : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_hight_keyschedulefun
	PORT(inKey : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
		 inRoundNumber : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		 outSK : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_hight_blockreg
	PORT(inClk : IN STD_LOGIC;
		 inInitWrite : IN STD_LOGIC;
		 inRoundWrite : IN STD_LOGIC;
		 inFinalWrite : IN STD_LOGIC;
		 inResetReg : IN STD_LOGIC;
		 inFinalData : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inInitData : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 inRoundData : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 outData : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
		 outNextBlock : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT wcy18ks1s1_chudzik_mateusz_hight_control
	PORT(inClk : IN STD_LOGIC;
		 inExtReset : IN STD_LOGIC;
		 inExtDataWr : IN STD_LOGIC;
		 outInitWhiteningKeysReg : OUT STD_LOGIC;
		 outReset : OUT STD_LOGIC;
		 outInitTransformationWrite : OUT STD_LOGIC;
		 outRoundTransformationWrite : OUT STD_LOGIC;
		 outFinalTransformationWrite : OUT STD_LOGIC;
		 outBusy : OUT STD_LOGIC;
		 outRoundNumber : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(63 DOWNTO 0);


BEGIN 



b2v_inst : wcy18ks1s1_chudzik_mateusz_encfourrounds
PORT MAP(inBlock => SYNTHESIZED_WIRE_15,
		 inRoundKeys => SYNTHESIZED_WIRE_1,
		 outBlock => SYNTHESIZED_WIRE_14);


b2v_inst1 : wcy18ks1s1_chudzik_mateusz_finaltransformation
PORT MAP(inPlaintext => SYNTHESIZED_WIRE_15,
		 inWhiteningKeysEnd => SYNTHESIZED_WIRE_3,
		 outFinalBlock => SYNTHESIZED_WIRE_12);


b2v_inst2 : wcy18ks1s1_chudzik_mateusz_hight_whiteningkeysreg
PORT MAP(inClk => inClk,
		 inInitKeyReg => SYNTHESIZED_WIRE_4,
		 inResetReg => SYNTHESIZED_WIRE_16,
		 inMainKey => inKey,
		 outWhiteningKeysEnd => SYNTHESIZED_WIRE_3,
		 outWhiteningKeysInit => SYNTHESIZED_WIRE_6);


b2v_inst3 : wcy18ks1s1_chudzik_mateusz_initialtransformation
PORT MAP(inPlaintext => inPlaintext,
		 inWhiteningKeysInit => SYNTHESIZED_WIRE_6,
		 outInitialBlock => SYNTHESIZED_WIRE_13);


b2v_inst4 : wcy18ks1s1_chudzik_mateusz_hight_keyschedulefun
PORT MAP(inKey => inKey,
		 inRoundNumber => SYNTHESIZED_WIRE_7,
		 outSK => SYNTHESIZED_WIRE_1);


b2v_inst7 : wcy18ks1s1_chudzik_mateusz_hight_blockreg
PORT MAP(inClk => inClk,
		 inInitWrite => SYNTHESIZED_WIRE_8,
		 inRoundWrite => SYNTHESIZED_WIRE_9,
		 inFinalWrite => SYNTHESIZED_WIRE_10,
		 inResetReg => SYNTHESIZED_WIRE_16,
		 inFinalData => SYNTHESIZED_WIRE_12,
		 inInitData => SYNTHESIZED_WIRE_13,
		 inRoundData => SYNTHESIZED_WIRE_14,
		 outData => outData,
		 outNextBlock => SYNTHESIZED_WIRE_15);


b2v_inst8 : wcy18ks1s1_chudzik_mateusz_hight_control
PORT MAP(inClk => inClk,
		 inExtReset => inExtReset,
		 inExtDataWr => inExtDataWr,
		 outInitWhiteningKeysReg => SYNTHESIZED_WIRE_4,
		 outReset => SYNTHESIZED_WIRE_16,
		 outInitTransformationWrite => SYNTHESIZED_WIRE_8,
		 outRoundTransformationWrite => SYNTHESIZED_WIRE_9,
		 outFinalTransformationWrite => SYNTHESIZED_WIRE_10,
		 outBusy => outBusy,
		 outRoundNumber => SYNTHESIZED_WIRE_7);


END bdf_type;