-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_counter is
	generic (
		SVALUE : string := "0";
		USE_CNT_ENA : string := "false";
		USE_COUT : string := "false";
		MODULUS : integer := 256;
		USE_SCLR : string := "false";
		NDIRECTION : natural := 1;
		USE_USR_ACLR : string := "false";
		WIDTH : natural := 8;
		USE_ENA : string := "false";
		USE_SSET : string := "false";
		USE_ALOAD : string := "false";
		AVALUE : string := "0";
		USE_ASET : string := "false";
		USE_SLOAD : string := "false";
		USE_CIN : string := "false"
	);
	port (
		sclr : in std_logic := '0';
		data : in std_logic_vector(width-1 downto 0) := (others=>'0');
		aclr : in std_logic := '0';
		cout : out std_logic;
		user_aclr : in std_logic := '0';
		cin : in std_logic := '0';
		clock : in std_logic := '0';
		aset : in std_logic := '0';
		aload : in std_logic := '0';
		cnt_ena : in std_logic := '0';
		q : out std_logic_vector(width-1 downto 0);
		ena : in std_logic := '0';
		sset : in std_logic := '0';
		sload : in std_logic := '0';
		direction : in std_logic := '0'
	);
end entity alt_dspbuilder_counter;

architecture rtl of alt_dspbuilder_counter is

component alt_dspbuilder_counter_GNIBE3FG2X is
	generic (
		SVALUE : string := "1";
		USE_CNT_ENA : string := "true";
		USE_COUT : string := "false";
		MODULUS : integer := 10000;
		USE_SCLR : string := "true";
		NDIRECTION : natural := 1;
		USE_USR_ACLR : string := "false";
		WIDTH : natural := 14;
		USE_ENA : string := "false";
		USE_SSET : string := "false";
		USE_ALOAD : string := "false";
		AVALUE : string := "0";
		USE_ASET : string := "false";
		USE_SLOAD : string := "false";
		USE_CIN : string := "false"
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		cnt_ena : in std_logic := '0';
		cout : out std_logic;
		q : out std_logic_vector(14-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_counter_GNIBE3FG2X;

begin

alt_dspbuilder_counter_GNIBE3FG2X_0: if ((SVALUE = "1") and (USE_CNT_ENA = "true") and (USE_COUT = "false") and (MODULUS = 10000) and (USE_SCLR = "true") and (NDIRECTION = 1) and (USE_USR_ACLR = "false") and (WIDTH = 14) and (USE_ENA = "false") and (USE_SSET = "false") and (USE_ALOAD = "false") and (AVALUE = "0") and (USE_ASET = "false") and (USE_SLOAD = "false") and (USE_CIN = "false")) generate
	inst_alt_dspbuilder_counter_GNIBE3FG2X_0: alt_dspbuilder_counter_GNIBE3FG2X
		generic map(SVALUE => "1", USE_CNT_ENA => "true", USE_COUT => "false", MODULUS => 10000, USE_SCLR => "true", NDIRECTION => 1, USE_USR_ACLR => "false", WIDTH => 14, USE_ENA => "false", USE_SSET => "false", USE_ALOAD => "false", AVALUE => "0", USE_ASET => "false", USE_SLOAD => "false", USE_CIN => "false")
		port map(aclr => aclr, clock => clock, cnt_ena => cnt_ena, cout => cout, q => q, sclr => sclr);
end generate;

assert not (((SVALUE = "1") and (USE_CNT_ENA = "true") and (USE_COUT = "false") and (MODULUS = 10000) and (USE_SCLR = "true") and (NDIRECTION = 1) and (USE_USR_ACLR = "false") and (WIDTH = 14) and (USE_ENA = "false") and (USE_SSET = "false") and (USE_ALOAD = "false") and (AVALUE = "0") and (USE_ASET = "false") and (USE_SLOAD = "false") and (USE_CIN = "false")))
	report "Please run generate again" severity error;

end architecture rtl;

