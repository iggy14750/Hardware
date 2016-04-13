


entity Full_Adder is
    port(A,B,Cin: in BIT;
        SUM,Cout: out BIT);
end Full_Adder;

architecture Full_Adder of Full_Adder is
begin
    SUM <= A xor B xor Cin after 15ns;
    Cout <= (A and B) or (B and Cin) or (A and Cin) after 10ns;
end Full_Adder;


entity Ripple_Adder is
    port (A,B: in bit_vector(3 downto 0);
        Cin: in bit;
        S: out bit_vector(3 downto 0);
        Cout: out bit);
end Ripple_Adder;

architecture Ripple_Adder of Ripple_Adder is
    component Full_Adder
        port (A,B,Cin: in bit;
            SUM,Cout: out bit);
    end component;
    signal C: bit_vector(2 downto 0);
    
begin
    FA0: Full_Adder port map(A(0),B(0),Cin,S(0),C(0));
    FA1: Full_Adder port map(A(1),B(1),Cin,S(1),C(1));
    FA2: Full_Adder port map(A(2),B(2),Cin,S(2),C(2));
    FA3: Full_Adder port map(A(3),B(3),Cin,S(3),Cout);
end Ripple_Adder;


