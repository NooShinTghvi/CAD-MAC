----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    18:04:15 11/05/2018
-- Design Name:
-- Module Name:    systemImplementation - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity systemImplementation is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end systemImplementation;

architecture Behavioral of systemImplementation is
component multiplier is
    Port ( multInA : in  STD_LOGIC_VECTOR (15 downto 0);
           multInB : in  STD_LOGIC_VECTOR (15 downto 0);
           multOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
--for mult : multiplier use entity work.multiplier(Behavioral);

component adder is
    Port ( adderInA : in  STD_LOGIC_VECTOR (15 downto 0);
           adderInB : in  STD_LOGIC_VECTOR (15 downto 0);
           adderOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
--for a2:_adder use entity work.adder(Behavioral);

component reg is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  regIn : in  STD_LOGIC_VECTOR (15 downto 0);
           regOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;
--for a3:_reg use entity work.reg(Behavioral);
signal multOutWire : STD_LOGIC_VECTOR (15 downto 0));
signal adderOutWire : STD_LOGIC_VECTOR (15 downto 0));
signal regOutWire : STD_LOGIC_VECTOR (15 downto 0));
begin
	m : multiplier port map( A , B , multOutWire);
	-- multInA <= A , multInB <= B , multOut => multOutWire
	a : adder port map(multOutWire , regOutWire , adderOutWire);
	--adderInA <= multOutWire , adderInB <= regOutWire , adderOut => adderOutWire
	r : reg port map(clk , rst , adderOutWire , regOutWire);
	--clk <= clk , rst <= rst , regIn <= adderOutWire , regOut => regOutWire
	
	output <= regOutWire;
end Behavioral;
