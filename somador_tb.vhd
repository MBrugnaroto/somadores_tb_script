library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity somador_tb is end somador_tb;

architecture hardware of somador_tb is
  
  file file_VECTORS : text;
  file file_RESULTS : text;
  
  constant c_WIDTH : natural := 32;
  
  -- Componente do somador utilizado (RippleCarry)
  component RippleCarry
  port (
    ci: IN STD_LOGIC;
		a, b : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		clock: in std_LOGIC;
		s : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		cout: OUT STD_LOGIC
		);
	end component;
	
	--Inputs
	signal ci : std_logic := '0';
	signal a, b : std_logic_vector (31 downto 0);
	signal clock : std_logic := '0';
	
	--Outputs
	signal s : std_logic_vector (31 downto 0);
	signal cout : std_logic;
	
	begin
	  -- Passa os sinais criados para o somador com o objetivo de gerar os resultados do teste
	  uut: RippleCarry port map(ci => ci, a => a, b => b, clock => clock, s => s, cout => cout);
	
	cllock: process 
	BEGIN
  		clock <= '0', '1' AFTER 5 ns;
  		WAIT FOR 10 ns;
	END PROCESS;
	
	-- Este process realiza a leitura do arquivo de entrada (input.txt) e escreve os resultados em um outro arquivo (output.txt)   
  leitura : process
    variable v_ILINE     : line;
    variable v_OLINE     : line;
    variable v_ADD_TERM1 : std_logic_vector(31 downto 0);
    variable v_ADD_TERM2 : std_logic_vector(31 downto 0);
    variable v_SPACE     : character;
     
    begin
      -- Abre os arquivos de leitura e escrita
      file_open(file_VECTORS, "input.txt",  read_mode);
      file_open(file_RESULTS, "output.txt", write_mode);
      
      -- Enquanto o arquivo de leitura não terminar, o programa continuará lendo ele
      while not endfile(file_VECTORS) loop
        readline(file_VECTORS, v_ILINE);
        read(v_ILINE, v_ADD_TERM1);
        read(v_ILINE, v_SPACE);           
        read(v_ILINE, v_ADD_TERM2);
  
        a <= v_ADD_TERM1; -- Passa para a entrada "a" o primeiro valor (coluna 1 do input.txt)
        b <= v_ADD_TERM2; -- Passa para a entrada "b" o segundo valor (coluna 2 do input.txt)
 
        wait for 10 ns;
        
        -- Escreve o resultado obtido no somador (sinal "s") no output.txt
        write(v_OLINE, s, right, c_WIDTH);
        writeline(file_RESULTS, v_OLINE);
      end loop;
      
      -- Após ler e escrever nos seus respectivos arquivos, eles são fechados
      file_close(file_VECTORS);
      file_close(file_RESULTS);
     
      wait;
    end process;
end hardware;
		


