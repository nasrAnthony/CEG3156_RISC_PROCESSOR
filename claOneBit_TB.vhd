library ieee;
use ieee.std_logic_1164.all;

entity claOneBit_TB is
end entity;

architecture tb_arch of claOneBit_TB is
    -- Component declaration for the unit under test (UUT)
    component claOneBit is
        port (
            i_CARRY : in std_logic;
            in_P : in std_logic_vector(1 downto 0);
            in_G : in std_logic_vector(1 downto 0);
            o_CARRY : out std_logic;
            genC : out std_logic
        );
    end component;

    -- Test bench signals
    signal s_CARRY : std_logic;
    signal s_P : std_logic_vector(1 downto 0);
    signal s_G : std_logic_vector(1 downto 0);
    signal s_genC : std_logic;

begin

    -- Instantiate the unit under test (UUT)
    uut: claOneBit port map (
        i_CARRY => s_CARRY,
        in_P => s_P,
        in_G => s_G,
        o_CARRY => s_CARRY,
        genC => s_genC
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize inputs
        s_CARRY <= '0';
        s_P <= "00";
        s_G <= "00";

        -- Insert stimulus here
        -- You can provide different input values and test cases

        wait;
    end process;

end tb_arch;
