-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_delay is
	generic (
		CLOCKPHASE : string := "1";
		BITPATTERN : string := "00000001";
		WIDTH : positive := 8;
		USE_INIT : natural := 0;
		DELAY : positive := 1
	);
	port (
		output : out std_logic_vector(width-1 downto 0);
		input : in std_logic_vector(width-1 downto 0) := (others=>'0');
		sclr : in std_logic := '0';
		aclr : in std_logic := '0';
		ena : in std_logic := '0';
		clock : in std_logic := '0'
	);
end entity alt_dspbuilder_delay;

architecture rtl of alt_dspbuilder_delay is

component alt_dspbuilder_delay_GNLRSWL7NV is
	generic (
		CLOCKPHASE : string := "1";
		BITPATTERN : string := "00000000000001";
		WIDTH : positive := 14;
		USE_INIT : natural := 0;
		DELAY : positive := 2
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(14-1 downto 0) := (others=>'0');
		output : out std_logic_vector(14-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNLRSWL7NV;

component alt_dspbuilder_delay_GNQBXYU75H is
	generic (
		CLOCKPHASE : string := "1";
		BITPATTERN : string := "1";
		WIDTH : positive := 1;
		USE_INIT : natural := 0;
		DELAY : positive := 4
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(1-1 downto 0) := (others=>'0');
		output : out std_logic_vector(1-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNQBXYU75H;

component alt_dspbuilder_delay_GNGQ56ZS4N is
	generic (
		CLOCKPHASE : string := "1";
		BITPATTERN : string := "1";
		WIDTH : positive := 1;
		USE_INIT : natural := 0;
		DELAY : positive := 1
	);
	port (
		aclr : in std_logic := '0';
		clock : in std_logic := '0';
		ena : in std_logic := '0';
		input : in std_logic_vector(1-1 downto 0) := (others=>'0');
		output : out std_logic_vector(1-1 downto 0);
		sclr : in std_logic := '0'
	);
end component alt_dspbuilder_delay_GNGQ56ZS4N;

begin

alt_dspbuilder_delay_GNLRSWL7NV_0: if ((CLOCKPHASE = "1") and (BITPATTERN = "00000000000001") and (WIDTH = 14) and (USE_INIT = 0) and (DELAY = 2)) generate
	inst_alt_dspbuilder_delay_GNLRSWL7NV_0: alt_dspbuilder_delay_GNLRSWL7NV
		generic map(CLOCKPHASE => "1", BITPATTERN => "00000000000001", WIDTH => 14, USE_INIT => 0, DELAY => 2)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNQBXYU75H_1: if ((CLOCKPHASE = "1") and (BITPATTERN = "1") and (WIDTH = 1) and (USE_INIT = 0) and (DELAY = 4)) generate
	inst_alt_dspbuilder_delay_GNQBXYU75H_1: alt_dspbuilder_delay_GNQBXYU75H
		generic map(CLOCKPHASE => "1", BITPATTERN => "1", WIDTH => 1, USE_INIT => 0, DELAY => 4)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

alt_dspbuilder_delay_GNGQ56ZS4N_2: if ((CLOCKPHASE = "1") and (BITPATTERN = "1") and (WIDTH = 1) and (USE_INIT = 0) and (DELAY = 1)) generate
	inst_alt_dspbuilder_delay_GNGQ56ZS4N_2: alt_dspbuilder_delay_GNGQ56ZS4N
		generic map(CLOCKPHASE => "1", BITPATTERN => "1", WIDTH => 1, USE_INIT => 0, DELAY => 1)
		port map(aclr => aclr, clock => clock, ena => ena, input => input, output => output, sclr => sclr);
end generate;

assert not (((CLOCKPHASE = "1") and (BITPATTERN = "00000000000001") and (WIDTH = 14) and (USE_INIT = 0) and (DELAY = 2)) or ((CLOCKPHASE = "1") and (BITPATTERN = "1") and (WIDTH = 1) and (USE_INIT = 0) and (DELAY = 4)) or ((CLOCKPHASE = "1") and (BITPATTERN = "1") and (WIDTH = 1) and (USE_INIT = 0) and (DELAY = 1)))
	report "Please run generate again" severity error;

end architecture rtl;

