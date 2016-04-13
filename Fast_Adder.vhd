
entity Full_Adder is 
    port(A,B,Cin: in bit;
        Sum,Prp,Gen: out bit);
end Full_Adder;

architecture Full_Adder of Full_Adder is 
begin 
    Sum <= A xor B xor Cin;
    Gen <= A and B;
    Prp <= A or B;
    
end Full_Adder;

entity Carry_Logic is 
    port(Prp,Gen: in bit_vector(3 downto 0);
        Cin: in bit;
        C: out bit_vector(4 downto 1) );
end Carry_Logic;

architecture Carry_Logic of Carry_Logic is 
begin 
    C(1) <= Gen(0) or (Prp(0) and Cin);
    C(2) <= Gen(1) or (Prp(1) and Gen(0)) or 
            (Prp(1) and Prp(0) and Cin);
    C(3) <= Gen(2) or (Gen(1) and Prp(2)) or 
            (Gen(0) and Prp(1) and Prp(2)) or 
            (Cin and Prp(0) and Prp(1) and Prp(2));
    C(4) <= Gen(3) or (Gen(2) and Prp(3)) or 
            (Gen(1) and Prp(2) and Prp(3)) or
            (Gen(0) and Prp(1) and Prp(2) and Prp(3)) or
            (Cin and Prp(0) and Prp(1) and Prp(2) and Prp(3));
end Carry_Logic;

entity Adder_Block is 
    port(
        A,B,C:  in bit_vector(3 downto 0);
        P,G,S:  out bit_vector(3 downto 0)
        );
end Adder_Block;

architecture Adder_Block is
    component Full_Adder
        port(a,b,Cin: in bit;
            Sum,Prp,Gen: out bit);
    end component;
    
begin
    FA0: Full_Adder port map(A(0),B(0),C(0),S(0),P(0),G(0))
    FA1: Full_Adder port map(A(1),B(1),C(1),S(1),P(1),G(1))
    FA2: Full_Adder port map(A(2),B(2),C(2),S(2),P(2),G(2))
    FA3: Full_Adder port map(A(3),B(3),C(3),S(3),P(3),G(3)) 
end Adder_Block;

entity Fast_Adder is 
    port(
        A,B:    in bit_vector(3 downto 0);
        C_ifa:    in bit;
        S:      out bit_vector(3 downto 0);
        Cout:   out bit
        );
end Fast_Adder;

architecture Fast_Adder of Fast_Adder is 
    component Adder_Block
        port(A,B,Ci: in bit_vector(3 downto 0);
            Sum,Prp,Gen: out bit_vector(3 downto 0));
    end component;
    
    component Carry_Logic
        port(P,G: in bit_vector(3 downto 0);
            C_icl: in bit;
            Co: out bit_vector(4 downto 1));
    end component;
begin 
    
end Fast_Adder;
    
    
    
    
    
    
    