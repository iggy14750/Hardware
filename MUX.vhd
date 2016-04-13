

entity MUX is
    port(A,B: in bit_vector(3 downto 0);
         IN_SEL: in bit;
         R: OUT bit_vector(3 downto 0));
end MUX;

architecture MUX is 
begin
    R <= A when IN_SEL=0;
    R <= B when IN_SEL=1;
end MUX;