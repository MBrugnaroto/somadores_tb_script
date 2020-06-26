
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY RippleCarry IS

PORT (
		ci: IN STD_LOGIC;
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		clock: in std_LOGIC;
		s : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		cout: OUT STD_LOGIC
		);
		
END RippleCarry;

ARCHITECTURE Struct OF RippleCarry IS
SIGNAL c: STD_LOGIC_VECTOR (31 downto 0);
signal fio_a: std_LOGIC_VECTOR(31 downto 0);
signal fio_b: std_LOGIC_VECTOR(31 downto 0);
signal fio_s: std_LOGIC_VECTOR(31 downto 0);

COMPONENT FullAdder
PORT (
		cin, a, b : IN  STD_LOGIC;
		s, cout : OUT  STD_LOGIC);

END COMPONENT;

component reg32 
generic (length : integer := 32);
port(
	d : in std_logic_vector(length - 1 downto 0);
	clk: in std_logic;
	q: out std_logic_vector(length - 1 downto 0)
);

end component;


BEGIN 
	REG0: reg32
		port map (d => a, clk => clock, q => fio_a);
		
	REG1: reg32
		port map (d => b, clk => clock, q => fio_b);
      
	REG2: reg32
		port map (d => fio_s, clk => clock, q => s);
   
	PET0: FullAdder
		PORT MAP (ci, fio_a(0), fio_b(0), fio_s(0), c(0));
		
	FIRST: FOR I IN 1 TO 31 GENERATE
			PET1: FullAdder
				PORT MAP (c(I-1), fio_a(I), fio_b(I), fio_s(I), c(I));
		END GENERATE;
			cout <= c(31);
END Struct;

