library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity reg32 is
		generic (length : integer := 32);
		port(
				d : in std_logic_vector(length - 1 downto 0);
				clk: in std_logic;
				q: out std_logic_vector(length - 1 downto 0)
				);
				
end reg32;

architecture a of reg32 is
signal Qreg : std_logic_vector (length - 1 downto 0);

begin

--reg: process(clk)
		--begin
		
			--if (clk= '1' and clk'event) then 
				Qreg <= d;
				
			--end if;
			
		--end process;
--q <= Qreg after 1 ns;
q <= Qreg;
end a;