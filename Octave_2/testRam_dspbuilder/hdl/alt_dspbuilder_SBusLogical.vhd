--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_SBusLogical is
		generic (     
				lpm_width		: positive 			:=8;
				lop				: LogicalOperator	:=AltAND;
				mask			: natural			:=3;
				valmask			: std_logic_vector 	:="10101010";
				sgnext_rshift	: natural 			:=0
			);
		port 	( 
				dataa		: in  std_logic_vector(lpm_width-1 downto 0);
				result		: out std_logic_vector(lpm_width-1 downto 0) 
			);	
end alt_dspbuilder_SBusLogical;


architecture SSBusLogical_SYNTH of alt_dspbuilder_SBusLogical is

signal busmask	: std_logic_vector(lpm_width-1 downto 0);

begin

busmask <= valmask;

------------------AND--------------------------------
	go1p:if lop = AltAND generate
		gw:for i in 0 to lpm_width-1 generate
			result(i) <= dataa(i) and busmask(i);
		end generate gw;
	end generate;

------------------or--------------------------------
	go2p:if lop = AltOR generate
		gw:for i in 0 to lpm_width-1 generate
			result(i) <= dataa(i) or busmask(i);
		end generate gw;
	end generate;

------------------xor--------------------------------
	go3p:if lop = AltXOR generate
		gw:for i in 0 to lpm_width-1 generate
			result(i) <= dataa(i) xor busmask(i);
		end generate gw;
	end generate;

------------------inv--------------------------------
	go4p:if lop = AltNOT generate
		process(dataa)
		begin
			for i in 0 to lpm_width-1 loop
				result(i) <= not dataa(i);
			end loop;
		end process;
	end generate go4p;
	
------------------shift left arithmetic--------------------------------

	go5p:if lop = AltShiftLeft generate
		gn0:if (mask>0) generate
			gh:for i in mask to lpm_width-1 generate
				result(i) <= dataa(i-mask);
			end generate gh;
			gl:for i in 0 to mask-1 generate
				result(i)	<= '0'; 
			end generate gl;
		end generate gn0;

		g0:if (mask=0) generate
			result <= dataa;
		end generate g0;

	end generate go5p;

------------------shift right arithmetic--------------------------------

	go6p:if lop = AltShiftRight generate
		gu0:if (mask>0) and (sgnext_rshift=0) generate
			gl:for i in 0 to lpm_width-1-mask generate
				result(i) <= dataa(i+mask);
			end generate gl;
			gh:for i in lpm_width-1-mask+1 to lpm_width-1 generate
				result(i) <= '0'; 
			end generate gh;
		end generate gu0;
		gs0:if (mask>0) and (sgnext_rshift>0) generate
			gl:for i in 0 to lpm_width-1-mask generate
				result(i) <= dataa(i+mask);
			end generate gl;
			gh:for i in lpm_width-1-mask+1 to lpm_width-1 generate
				result(i) <= dataa(lpm_width-1); 
			end generate gh;
		end generate gs0;		
		g0:if (mask=0) generate
			result <= dataa;
		end generate g0;
	end generate go6p;

------------------Rotate right --------------------------------
	go7p:if lop = AltRotateRight generate
		process(dataa)
		begin
			for i in mask to lpm_width-1 loop
				result(i-mask) <= dataa(i);
			end loop;
			for i in lpm_width-mask to lpm_width-1 loop
				result(i)	<= dataa(i-(lpm_width-mask)); 
			end loop;
		end process;
	end generate go7p;

------------------Rotate left --------------------------------
	go8p:if lop = AltRotateLeft generate
		process(dataa)
		begin
			for i in 0 to lpm_width-1-mask loop
				result(i+mask) <= dataa(i);
			end loop;
			for i in lpm_width-mask to lpm_width-1 loop
				result(i-(lpm_width-mask))	<= dataa(i); 
			end loop;
		end process;
	end generate go8p;

end SSBusLogical_SYNTH;


