library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity leitura_escrita is end leitura_escrita;

architecture hardware of leitura_escrita is
  
  file file_VECTORS : text;
  file file_RESULTS : text;
  
  constant c_WIDTH : natural := 8;
  
  -- Componente do somador utilizado (RippleCarry)
  component main
  port ( 	
		e1, f1, g1, h1, i, j1 : in integer range 0 to 255;
		saida : out std_logic_vector(7 downto 0);
		clock : in std_logic
	);
	end component;
	
	--Inputs
	signal ci : std_logic := '0';
	signal e, f, g, h, i, j: integer range 0 to 255;
	signal clock : std_logic := '0';
	
	--Outputs
	signal s : std_logic_vector(7 downto 0);
	signal cout : std_logic;
	
	begin
	  -- Passa os sinais criadoerrorss para o calculo do pixel com o objetivo de gerar os resultados
	  uut: main port map(e, f, g, h, i, j, s, '1');
	
	--cllock: process
	--BEGIN
	--	clock <= '0', '1' AFTER 5 ns;
  	--	WAIT FOR 10 ns;
	--END PROCESS;
	clock <= '1';
	-- Este process realiza a leitura do arquivo de entrada (input.txt) e escreve os resultados em um outro arquivo (output.txt)   
  leitura : process
    variable v_ILINE     : line;
    variable v_OLINE     : line;
    variable v_ADD_TERMe : std_logic_vector(7 downto 0);
    variable v_ADD_TERMf : std_logic_vector(7 downto 0);
	 variable v_ADD_TERMg : std_logic_vector(7 downto 0);
	 variable v_ADD_TERMh : std_logic_vector(7 downto 0);
	 variable v_ADD_TERMi : std_logic_vector(7 downto 0);
	 variable v_ADD_TERMj : std_logic_vector(7 downto 0);
	 variable v_ADD_TERMb : std_logic_vector(7 downto 0);
	 variable k : std_logic_vector(7 downto 0);
	 variable primeiro    : std_logic_vector(7 downto 0);
	 variable segundo     : std_logic_vector(7 downto 0);
	 variable terceiro    : std_logic_vector(7 downto 0);
	 variable quarto      : std_logic_vector(7 downto 0);
	 variable quinto      : std_logic_vector(7 downto 0);
    variable sexto       : std_logic_vector(7 downto 0);
	 variable setimo      : std_logic_vector(7 downto 0);
	 variable oitavo      : std_logic_vector(7 downto 0);
	 variable nono        : std_logic_vector(7 downto 0);
    variable condition   : integer := 0;
	 variable count 		 : integer range 0 to 2047 := 0;
	 variable icount : integer range 0 to 2047 := 0;
    begin
	 
		file_open(file_VECTORS, "input.txt",  read_mode);
      file_open(file_RESULTS, "output.txt", write_mode);
		
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMe);
		primeiro := v_ADD_TERMe;        
		
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMf);
		segundo  := v_ADD_TERMf;
		
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMg);
		terceiro := v_ADD_TERMg;
		
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMh);
		quarto   := v_ADD_TERMh;
		--
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMi);
		quinto   := v_ADD_TERMi;
		--
		readline(file_VECTORS, v_ILINE);
		read(v_ILINE, v_ADD_TERMj);
		sexto    := v_ADD_TERMj;
		
		e <= to_integer(unsigned(primeiro));
		f <= to_integer(unsigned(segundo));
		g <= to_integer(unsigned(terceiro));
		h <= to_integer(unsigned(quarto));
		i <= to_integer(unsigned(quinto));
		j <= to_integer(unsigned(sexto));
		
		
      -- Abre os arquivos de leitura e escrita
      
      -- Enquanto o arquivo de leitura n�o terminar, o programa continuar� lendo ele
      while not endfile(file_VECTORS) loop
			
			readline(file_VECTORS, v_ILINE);
			read(v_ILINE, k);
			setimo    := k;

			-- Passa para a entrada os 6 pixels
			e <= to_integer(unsigned(segundo));
			f <= to_integer(unsigned(terceiro));
			g <= to_integer(unsigned(quarto));
			h <= to_integer(unsigned(quinto));
			i <= to_integer(unsigned(sexto));
			j <= to_integer(unsigned(setimo));
			
			wait for 10ns;
					  
			-- Escreve o resultado obtidos no output.txt
			
			write(v_OLINE, s, right, 8);
			writeline(file_RESULTS, v_OLINE);
				
      end loop;
      file_close(file_VECTORS);
		file_close(file_RESULTS);
      -- Ap�s ler e escrever nos seus respectivos arquivos, eles s�o fechados
     
      wait;
    end process;
end hardware;
		


