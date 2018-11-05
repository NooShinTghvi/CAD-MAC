----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:45:10 11/05/2018 
-- Design Name: 
-- Module Name:    multiplier - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplier is
    Port ( multInA : in  STD_LOGIC_VECTOR (15 downto 0);
           multInB : in  STD_LOGIC_VECTOR (15 downto 0);
           multOut : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplier;

architecture Behavioral of multiplier is
signal tmp : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
begin
	tmp <= multInA * multInB;
	multOut <= tmp(multOut'range);
end Behavioral;

