
Library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity SET is  port (
    clk        : in std_logic;
    rst        : in std_logic;
    en        : in std_logic;
    central        : in std_logic_vector (23 downto 0);
    radius        : in std_logic_vector (11 downto 0);
	mode        : in std_logic_vector (1 downto 0);
    busy     : out std_logic;
    valid      : out std_logic;
    candidate      : out std_logic_vector (7 downto 0)  );
end STI_DAC;

architecture SET_arc of SET is

begin

end SET_arc; 