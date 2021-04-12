Library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity NFC is
  port (
    clk        : in std_logic;
    rst        : in std_logic;
    done       : out std_logic;
    F_IO_A       : inout std_logic_vector(7 downto 0);
    F_CLE_A     : out std_logic;
    F_ALE_A      : out std_logic;
    F_REN_A      : out std_logic;
    F_WEN_A      : out std_logic;
    F_RB_A       : in std_logic
    F_IO_B       : inout std_logic_vector(7 downto 0);
    F_CLE_B     : out std_logic;
    F_ALE_B      : out std_logic;
    F_REN_B      : out std_logic;
    F_WEN_B      : out std_logic;
    F_RB_B       : in std_logic
  );
end NFC;

architecture NFC_arc of NFC is

begin

end NFC_arc;  
