library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity main is 
	port ( 
	
	e1, f1, g1, h1, i, j1 : in integer range 0 to 255;
	saida : out std_logic_vector (7 downto 0);
	clock : in std_logic
	);

end main;

architecture hardware of main is
signal saida1: integer range 0 to 65535;

begin
	saida1 <= (e1-(5*f1)+(20*g1)+(20*h1)-(5*i)+j1)/32;
	
	--if saida1 > 255 then 
		--saida1 <= 255;
	--elsif saida1 < 0 then 
		--saida1 <= 0;
	--end if;
	
	saida <= std_logic_vector(to_unsigned(saida1, 8));
	
end hardware;
		


