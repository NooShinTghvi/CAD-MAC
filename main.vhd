library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity multiplier is
    port(
        clk, reset : in std_logic;
        a :  in std_logic_vector(15 downto 0);
        b :  in std_logic_vector(15 downto 0);
        c :  out std_logic_vector(15 downto 0);
        f :  out std_logic
    );
end multiplier;

architecture mult of multiplier is
signal tmp: std_logic_vector(31 downto 0);
begin
    process (clk,reset) begin
        if (reset='1') then
            tmp <= "0";
        elsif rising_edge(clk) then
            tmp <= a * b;
            if (tmp > "1111111111111111")
                f <= "1";
                c <= f;
            else
                f <= "0";
                c <= f;
            end if;
        end if;
    end process;
end mult;
-- * * * * * * * * * * * * * * * * * * * * * * *
entity accumulator is
    port(
            clk, reset : in std_logic;
            Din : in std_logic_vector(15 downto 0);
            Q : out std_logic_vector(15 downto 0)
    );
end accumulator;

architecture bhv of accumulator is
signal tmp: std_logic_vector(3 downto 0);
begin
        process (clk, reset) begin
            if (reset='1') then
                tmp <= "0000";
            elsif rising_edge(clk) then
                tmp <= tmp + Din;
            end if;
        end process;
        Q <= tmp;
end bhv;
