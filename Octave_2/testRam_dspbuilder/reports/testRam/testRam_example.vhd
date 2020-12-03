library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity testRam_example is  
	port(
		Avalon_ST_Sink_valid : in STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Sink_startofpacket : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		Avalon_ST_Sink_endofpacket : in STD_LOGIC;
		Clock : in STD_LOGIC;
		Avalon_ST_Sink_data : in STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Sink_ready : out STD_LOGIC;
		Input : in STD_LOGIC_VECTOR(17 downto 0);
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_ST_Source_endofpacket : out STD_LOGIC); 
end entity;
architecture rtl of testRam_example is
component testRam
	  
	port(
		Avalon_ST_Sink_valid : in STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Sink_startofpacket : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		Avalon_ST_Sink_endofpacket : in STD_LOGIC;
		Clock : in STD_LOGIC;
		Avalon_ST_Sink_data : in STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Sink_ready : out STD_LOGIC;
		Input : in STD_LOGIC_VECTOR(17 downto 0);
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_ST_Source_endofpacket : out STD_LOGIC); 
end component;
begin
	testRam_instance : 
		component testRam
			port map(
				Avalon_ST_Sink_valid => Avalon_ST_Sink_valid,
				Avalon_ST_Source_data => Avalon_ST_Source_data,
				Avalon_ST_Sink_startofpacket => Avalon_ST_Sink_startofpacket,
				aclr => aclr,
				Avalon_ST_Source_valid => Avalon_ST_Source_valid,
				Avalon_ST_Source_ready => Avalon_ST_Source_ready,
				Avalon_ST_Sink_endofpacket => Avalon_ST_Sink_endofpacket,
				Clock => Clock,
				Avalon_ST_Sink_data => Avalon_ST_Sink_data,
				Avalon_ST_Sink_ready => Avalon_ST_Sink_ready,
				Input => Input,
				Avalon_ST_Source_startofpacket => Avalon_ST_Source_startofpacket,
				Avalon_ST_Source_endofpacket => Avalon_ST_Source_endofpacket);
end architecture rtl;
