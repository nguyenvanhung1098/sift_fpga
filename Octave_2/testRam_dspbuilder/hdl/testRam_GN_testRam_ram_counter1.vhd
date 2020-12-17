-- testRam_GN_testRam_ram_counter1.vhd

-- Generated using ACDS version 16.0 222

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testRam_GN_testRam_ram_counter1 is
	port (
		Clock    : in  std_logic                     := '0'; --    Clock.clk
		aclr     : in  std_logic                     := '0'; --         .reset
		valid_in : in  std_logic                     := '0'; -- valid_in.wire
		eof_in   : in  std_logic                     := '0'; --   eof_in.wire
		col_out  : out std_logic_vector(13 downto 0)         --  col_out.wire
	);
end entity testRam_GN_testRam_ram_counter1;

architecture rtl of testRam_GN_testRam_ram_counter1 is
	component alt_dspbuilder_clock_GNQFU4PUDH is
		port (
			aclr      : in  std_logic := 'X'; -- reset
			aclr_n    : in  std_logic := 'X'; -- reset_n
			aclr_out  : out std_logic;        -- reset
			clock     : in  std_logic := 'X'; -- clk
			clock_out : out std_logic         -- clk
		);
	end component alt_dspbuilder_clock_GNQFU4PUDH;

	component alt_dspbuilder_port_GN37ALZBS4 is
		port (
			input  : in  std_logic := 'X'; -- wire
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_port_GN37ALZBS4;

	component alt_dspbuilder_counter_GNIBE3FG2X is
		generic (
			svalue       : string  := "0";
			use_cnt_ena  : string  := "false";
			use_cout     : string  := "false";
			modulus      : integer := 256;
			use_sclr     : string  := "false";
			ndirection   : natural := 1;
			use_usr_aclr : string  := "false";
			width        : natural := 8;
			use_ena      : string  := "false";
			use_sset     : string  := "false";
			use_aload    : string  := "false";
			avalue       : string  := "0";
			use_aset     : string  := "false";
			use_sload    : string  := "false";
			use_cin      : string  := "false"
		);
		port (
			aclr      : in  std_logic                          := 'X';             -- clk
			aload     : in  std_logic                          := 'X';             -- wire
			aset      : in  std_logic                          := 'X';             -- wire
			cin       : in  std_logic                          := 'X';             -- wire
			clock     : in  std_logic                          := 'X';             -- clk
			cnt_ena   : in  std_logic                          := 'X';             -- wire
			cout      : out std_logic;                                             -- wire
			data      : in  std_logic_vector(width-1 downto 0) := (others => 'X'); -- wire
			direction : in  std_logic                          := 'X';             -- wire
			ena       : in  std_logic                          := 'X';             -- wire
			q         : out std_logic_vector(width-1 downto 0);                    -- wire
			sclr      : in  std_logic                          := 'X';             -- wire
			sload     : in  std_logic                          := 'X';             -- wire
			sset      : in  std_logic                          := 'X';             -- wire
			user_aclr : in  std_logic                          := 'X'              -- wire
		);
	end component alt_dspbuilder_counter_GNIBE3FG2X;

	component alt_dspbuilder_port_GNBOOX3JQY is
		port (
			input  : in  std_logic_vector(13 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(13 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNBOOX3JQY;

	signal valid_in_0_output_wire     : std_logic;                     -- valid_in_0:output -> Counter:cnt_ena
	signal eof_in_0_output_wire       : std_logic;                     -- eof_in_0:output -> Counter:sclr
	signal counter_q_wire             : std_logic_vector(13 downto 0); -- Counter:q -> col_out_0:input
	signal clock_0_clock_output_clk   : std_logic;                     -- Clock_0:clock_out -> Counter:clock
	signal clock_0_clock_output_reset : std_logic;                     -- Clock_0:aclr_out -> Counter:aclr

begin

	clock_0 : component alt_dspbuilder_clock_GNQFU4PUDH
		port map (
			clock_out => clock_0_clock_output_clk,   -- clock_output.clk
			aclr_out  => clock_0_clock_output_reset, --             .reset
			clock     => Clock,                      --        clock.clk
			aclr      => aclr                        --             .reset
		);

	valid_in_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => valid_in,               --  input.wire
			output => valid_in_0_output_wire  -- output.wire
		);

	counter : component alt_dspbuilder_counter_GNIBE3FG2X
		generic map (
			svalue       => "1",
			use_cnt_ena  => "true",
			use_cout     => "false",
			modulus      => 10000,
			use_sclr     => "true",
			ndirection   => 1,
			use_usr_aclr => "false",
			width        => 14,
			use_ena      => "false",
			use_sset     => "false",
			use_aload    => "false",
			avalue       => "0",
			use_aset     => "false",
			use_sload    => "false",
			use_cin      => "false"
		)
		port map (
			clock   => clock_0_clock_output_clk,   -- clock_aclr.clk
			aclr    => clock_0_clock_output_reset, --           .reset
			cnt_ena => valid_in_0_output_wire,     --    cnt_ena.wire
			sclr    => eof_in_0_output_wire,       --       sclr.wire
			q       => counter_q_wire,             --          q.wire
			cout    => open                        --       cout.wire
		);

	eof_in_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => eof_in,               --  input.wire
			output => eof_in_0_output_wire  -- output.wire
		);

	col_out_0 : component alt_dspbuilder_port_GNBOOX3JQY
		port map (
			input  => counter_q_wire, --  input.wire
			output => col_out         -- output.wire
		);

end architecture rtl; -- of testRam_GN_testRam_ram_counter1