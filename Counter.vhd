
entity Counter is
    port(
        CLK: in bit;
        Q: out bit_vector(3 downto 0) );
end Counter;

architecture Counter is
begin
    process(CLK)
    signal count: bit_vector(3 downto 0) := "0000";
    begin
        
        if( CLK'event and CLK = "1") then
            count = count + 1;
        end if;
        Q <= count;
    
    end process;
end Counter;










