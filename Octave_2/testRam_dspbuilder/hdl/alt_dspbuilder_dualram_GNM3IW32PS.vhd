library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_dualram_GNM3IW32PS is
	generic		( 			ClockPhase : string := "1";
			numwords : positive := 307200;
			register_outputs : natural := 1;
			data_width : positive := 24;
			supportROM : natural := 1;
			ram_block_type : string := "M144K";
			use_ena : natural := 0;
			XFILE : string := "input.hex";
			initialization : string := "Blank";
			dont_care : natural := 0;
			family : string := "Cyclone IV GX");

	port(
		clock : in std_logic;
		aclr : in std_logic;
		data : in std_logic_vector(23 downto 0);
		rd_addr : in std_logic_vector(18 downto 0);
		wr_addr : in std_logic_vector(18 downto 0);
		wren : in std_logic;
		ena : in std_logic;
		q : out std_logic_vector(23 downto 0));		
end entity;

library altera;
use altera.alt_dspbuilder_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;



architecture rtl of alt_dspbuilder_dualram_GNM3IW32PS is

	signal seqenable	: STD_LOGIC ;
	signal enadff		: STD_LOGIC ;
    signal vcc_or_ena   : STD_LOGIC ;


Begin


	
						vcc_or_ena <= '1';
		
											enadff <= vcc_or_ena;
	

    -------------------------------------------------------------
    -- Simple Dual-Port RAM
    -------------------------------------------------------------
    u1 : altsyncram
            GENERIC MAP (
                address_aclr_b                     => "NONE",
                address_aclr_a                     => "NONE",
                address_reg_b                      => "CLOCK0",
		indata_aclr_a                      => "NONE",
                intended_device_family             => "Cyclone IV GX",
                lpm_type                           => "altsyncram",
                numwords_a                         => 307200,
                numwords_b                         => 307200,
                operation_mode                     => "DUAL_PORT",
  		outdata_aclr_b                     => "CLEAR0",
  		outdata_reg_b                      => "CLOCK0",
                power_up_uninitialized             => "FALSE",
                ram_block_type                     => "M144K",
                read_during_write_mode_mixed_ports => "OLD_DATA",
                widthad_a                          => 19,
                widthad_b                          => 19,
                width_a                            => 24,
                width_b                            => 24,
                width_byteena_a                    => 1,
                wrcontrol_aclr_a                   => "NONE"
            )
            PORT MAP (
                clocken0    => enadff,
                wren_a      => wren,
                aclr0       => aclr,
                clock0      => clock,
                address_a   => wr_addr,
                address_b   => rd_addr,
                data_a      => data,
                q_b         => q
            );

end architecture;
