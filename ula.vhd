library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ULA is

port(	A:	in std_logic_vector(3 downto 0);
	B:	in std_logic_vector(3 downto 0);
	con:	in std_logic_vector(5 downto 0);
	Res:	out std_logic_vector(3 downto 0)    	
);

end ULA;

---------------------------------------------------

architecture behv of ULA is
signal outAdd: std_logic_vector(3 downto 0);
signal outSub: std_logic_vector(3 downto 0);
signal outOr: std_logic_vector(3 downto 0);
signal outAnd: std_logic_vector(3 downto 0);

begin					   
ADDER: entity work.doSUM port map (A,B,outAdd);
SUBBER: entity work.doSUB port map (A,B,outSub);
ANDER: entity work.doAND port map (A,B,outAnd);
ORER: entity work.doSUM port map (A,B,outOr);
    process(A,B,con)
    begin


	case con is
	    when "111100" =>
				Res <= outAdd;
	    when "111111" =>						
	        Res <= outSub;
       when "001100" =>
				Res <= outAnd;
	    when "011100" =>	 
				Res <= outOr;
	    when "011000" =>
				Res <= A;
	    when "010100" =>
				Res <= B;
	    when "011010" =>
				Res <= not A;
	    when "101100" =>
				Res <= not B;
	    when "111101" =>
				Res <= outAdd + 1;
	    when "111001" =>
				Res <= A + 1;
	    when "110101" =>
				Res <= B + 1;
	    when "110110" =>
				Res <= B - 1;
	    when "111011" =>
				Res <= "0000"-A;-- -A
	    when "010000" =>
				Res <= "0000";
	    when "110001" =>
				Res <= "0001";
	    when "110010" =>
				Res <= -"0001";
	    when others =>	 
				Res <= "0000";
        end case;

    end process;

end behv;