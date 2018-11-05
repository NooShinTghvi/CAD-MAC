----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:53:41 11/05/2018 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  regIn : in  STD_LOGIC_VECTOR (15 downto 0);
           regOut : out  STD_LOGIC_VECTOR (15 downto 0));
end reg;

architecture Behavioral of reg is
signal tmp : STD_LOGIC_VECTOR (15 downto 0);
begin

	tmp <= regIn when( clk = '1' and not clk'stable) else tmp;
	regOut <= regIn ;

end Behavioral;

