
entity SR_Latch is



entity D_FlipFlop is
    port(D,CLK: in bit;
        Q,Qb: out bit);
end D_FlipFlop;

architecture D_FlipFlop is

begin

flipflop: process (CLK,D)
    begin
        if (CLK'event and CLK="1") then
            Q <= D;
            Qn <= not D;
        end if;
    end process flipflop;
    
end D_FlipFlop;


entity Latch is
    port(
        A:      in bit_vector(3 downto 0);
        W_EN:   in bit;
        R:      out bit_vector(3 downto 0));
end Latch;

architecture Latch is
    component D_FlipFlop
        port(
            D,CLK:  in bit;
            Q,Qb:   out bit );
    end component;
    
begin
    FF0: D_FlipFlop port map(A(0),W_EN,R(0),open);
    FF1: D_FlipFlop port map(A(1),W_EN,R(1),open);
    FF2: D_FlipFlop port map(A(2),W_EN,R(2),open);
    FF3: D_FlipFlop port map(A(3),W_EN,R(3),open);
end Latch;