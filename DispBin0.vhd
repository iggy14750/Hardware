
-- Prepared for Frontiers In Education 1997 (VHDL workshop)
-- Author: Morris Chang (Illinois Institute of Technology)

-- Lab 1
-- File name: DispBin.vhd
-- Description:
-- To display four-bit Data_in at the seven-segment LED (The decimal point is used
-- for displaying 10 to 15.)

ENTITY DispBin IS
     PORT( 
		D_in:	IN  BIT_VECTOR(3 DOWNTO 0);
		dp, a, b, c, d, e, f, g: OUT	BIT
      	);
END DispBin;


ARCHITECTURE dataflow OF DispBin IS
    SIGNAL dig_sig: BIT_VECTOR(7 DOWNTO 0);
BEGIN 

	dig_sig <=
---------dabcdefg (for Low True) ---------
		"10000001" WHEN D_in = "0000" ELSE 	-- 0x0
        "11001111" WHEN D_in = "0001" ELSE 	-- 0x1
        "10010010" WHEN D_in = "0010" ELSE  -- 0x2
        "10000110" WHEN D_in = "0011" ELSE  -- 0x3
        "11001100" WHEN D_in = "0100" ELSE  -- 0x4
        "10100100" WHEN D_in = "0101" ELSE  -- 0x5
        "10100000" WHEN D_in = "0110" ELSE  -- 0x6
        "10001101" WHEN D_in = "0111" ELSE  -- 0x7
        "10000000" WHEN D_in = "1000" ELSE  -- 0x8
        "10000100" WHEN D_in = "1001" ELSE  -- 0x9
        
        
        "10001000" WHEN D_in = "1010" ELSE  -- 0xA "0."
        "11100000" WHEN D_in = "1011" ELSE  -- 0xB "1."
        "10110001" WHEN D_in = "1100" ELSE	-- 0xC "2."
        "11000010" WHEN D_in = "1101" ELSE	-- 0xD "3."
        "10110000" WHEN D_in = "1110" ELSE	-- 0xE "4."
        "10111000";				-- 0xF "5."

	dp 	<= dig_sig(7);
	a	<= dig_sig(6);
	b	<= dig_sig(5);
	c	<= dig_sig(4);
	d	<= dig_sig(3);
	e	<= dig_sig(2);
	f	<= dig_sig(1);
	g	<= dig_sig(0);

 END dataflow;
