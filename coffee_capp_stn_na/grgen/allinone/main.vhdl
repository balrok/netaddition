library IEEE;
use std.textio.all;
use IEEE.STD_LOGIC_1164.ALL;

--this is how entity for your test bench code has to be declared.
entity main is
    PORT(
    );
end main;


architecture behavior of main is


    -- signal declarations.
    signal clk :std_logic := '0'; -- in
    signal t_Cappuccino_Cappuccino_cappuccino :std_logic := '1'; -- in
    signal t_Cappuccino_Cappuccino_coffee :std_logic := '1'; -- in
    signal t_Cappuccino_Cappuccino_espresso :std_logic := '1'; -- in
    signal t_Cappuccino_Cappuccino_milk :std_logic := '1'; -- in
    signal t_Cappuccino_None_reset :std_logic := '1'; -- in
    signal t_Coffee_Coffee_cappuccino :std_logic := '1'; -- in
    signal t_Coffee_Coffee_coffee :std_logic := '1'; -- in
    signal t_Coffee_Coffee_espresso :std_logic := '1'; -- in
    signal t_Coffee_Coffeen_Milk_milk :std_logic := '1'; -- in
    signal t_Coffee_None_reset :std_logic := '1'; -- in
    signal t_Coffeen_Milk_Coffeen_Milk_cappuccino :std_logic := '1'; -- in
    signal t_Coffeen_Milk_Coffeen_Milk_coffee :std_logic := '1'; -- in
    signal t_Coffeen_Milk_Coffeen_Milk_espresso :std_logic := '1'; -- in
    signal t_Coffeen_Milk_Coffeen_Milk_milk :std_logic := '1'; -- in
    signal t_Coffeen_Milk_None_reset :std_logic := '1'; -- in
    signal t_end_running :std_logic := '1'; -- in
    signal t_Espresso_Espresso_cappuccino :std_logic := '1'; -- in
    signal t_Espresso_Espresso_coffee :std_logic := '1'; -- in
    signal t_Espresso_Espresso_espresso :std_logic := '1'; -- in
    signal t_Espresso_Espresson_Milk_milk :std_logic := '1'; -- in
    signal t_Espresso_None_reset :std_logic := '1'; -- in
    signal t_Espresson_Milk_Espresson_Milk_cappuccino :std_logic := '1'; -- in
    signal t_Espresson_Milk_Espresson_Milk_coffee :std_logic := '1'; -- in
    signal t_Espresson_Milk_Espresson_Milk_espresso :std_logic := '1'; -- in
    signal t_Espresson_Milk_Espresson_Milk_milk :std_logic := '1'; -- in
    signal t_Espresson_Milk_None_reset :std_logic := '1'; -- in
    signal t_no_prepare :std_logic := '1'; -- in
    signal t_None_Cappuccino_cappuccino :std_logic := '1'; -- in
    signal t_None_Coffee_coffee :std_logic := '1'; -- in
    signal t_None_Espresso_espresso :std_logic := '1'; -- in
    signal t_None_None_milk :std_logic := '1'; -- in
    signal t_None_None_reset :std_logic := '1'; -- in
    signal t_reqd_cappuccino :std_logic := '1'; -- in
    signal t_reqd_coffee :std_logic := '1'; -- in
    signal t_reqd_espresso :std_logic := '1'; -- in
    signal t_reqd_milk :std_logic := '1'; -- in
    signal t_start_transition :std_logic := '1'; -- in
    signal t_t_capp2 :std_logic := '1'; -- in
    signal t_t_espresso :std_logic := '1'; -- in
    signal t_t10 :std_logic := '1'; -- in
    signal t_t11 :std_logic := '1'; -- in
    signal t_t14 :std_logic := '1'; -- in
    signal t_t19 :std_logic := '1'; -- in
    signal t_t2 :std_logic := '1'; -- in
    signal t_t20 :std_logic := '1'; -- in
    signal t_t21 :std_logic := '1'; -- in
    signal t_t22 :std_logic := '1'; -- in
    signal t_t24 :std_logic := '1'; -- in
    signal t_t4 :std_logic := '1'; -- in
    signal t_t5 :std_logic := '1'; -- in
    signal p_Cappuccino :std_logic; -- out
    signal p_Coffee :std_logic; -- out
    signal p_Espresso :std_logic; -- out
    signal p_event_cappuccino :std_logic; -- out
    signal p_event_coffee :std_logic; -- out
    signal p_event_espresso :std_logic; -- out
    signal p_event_milk :std_logic; -- out
    signal p_event_reset :std_logic; -- out
    signal p_Grind_Coffee :std_logic; -- out
    signal p_Ingredients :std_logic; -- out
    signal p_Ingredients_Coffee :std_logic; -- out
    signal p_Ingredients_Milk :std_logic; -- out
    signal p_Ingredients_out :std_logic; -- out
    signal p_Milk :std_logic; -- out
    signal p_Milk_Heating :std_logic; -- out
    signal p_Preparing :std_logic; -- out
    signal p_Preparing_out :std_logic; -- out
    signal p_Pump :std_logic; -- out
    signal p_Running :std_logic; -- out
    signal p_state_Cappuccino :std_logic; -- out
    signal p_state_Coffee :std_logic; -- out
    signal p_state_Coffeen_Milk :std_logic; -- out
    signal p_state_Espresso :std_logic; -- out
    signal p_state_Espresson_Milk :std_logic; -- out
    signal p_state_None :std_logic; -- out
    signal p_Stopped :std_logic; -- out
    signal p_Stopping :std_logic; -- out
    signal p_Water_Heating :std_logic; -- out

begin
    -- instantiation of entities
    testbench : entity work.testbench port map(clk => clk
, t_Cappuccino_Cappuccino_cappuccino => t_Cappuccino_Cappuccino_cappuccino
, t_Cappuccino_Cappuccino_coffee => t_Cappuccino_Cappuccino_coffee
, t_Cappuccino_Cappuccino_espresso => t_Cappuccino_Cappuccino_espresso
, t_Cappuccino_Cappuccino_milk => t_Cappuccino_Cappuccino_milk
, t_Cappuccino_None_reset => t_Cappuccino_None_reset
, t_Coffee_Coffee_cappuccino => t_Coffee_Coffee_cappuccino
, t_Coffee_Coffee_coffee => t_Coffee_Coffee_coffee
, t_Coffee_Coffee_espresso => t_Coffee_Coffee_espresso
, t_Coffee_Coffeen_Milk_milk => t_Coffee_Coffeen_Milk_milk
, t_Coffee_None_reset => t_Coffee_None_reset
, t_Coffeen_Milk_Coffeen_Milk_cappuccino => t_Coffeen_Milk_Coffeen_Milk_cappuccino
, t_Coffeen_Milk_Coffeen_Milk_coffee => t_Coffeen_Milk_Coffeen_Milk_coffee
, t_Coffeen_Milk_Coffeen_Milk_espresso => t_Coffeen_Milk_Coffeen_Milk_espresso
, t_Coffeen_Milk_Coffeen_Milk_milk => t_Coffeen_Milk_Coffeen_Milk_milk
, t_Coffeen_Milk_None_reset => t_Coffeen_Milk_None_reset
, t_end_running => t_end_running
, t_Espresso_Espresso_cappuccino => t_Espresso_Espresso_cappuccino
, t_Espresso_Espresso_coffee => t_Espresso_Espresso_coffee
, t_Espresso_Espresso_espresso => t_Espresso_Espresso_espresso
, t_Espresso_Espresson_Milk_milk => t_Espresso_Espresson_Milk_milk
, t_Espresso_None_reset => t_Espresso_None_reset
, t_Espresson_Milk_Espresson_Milk_cappuccino => t_Espresson_Milk_Espresson_Milk_cappuccino
, t_Espresson_Milk_Espresson_Milk_coffee => t_Espresson_Milk_Espresson_Milk_coffee
, t_Espresson_Milk_Espresson_Milk_espresso => t_Espresson_Milk_Espresson_Milk_espresso
, t_Espresson_Milk_Espresson_Milk_milk => t_Espresson_Milk_Espresson_Milk_milk
, t_Espresson_Milk_None_reset => t_Espresson_Milk_None_reset
, t_no_prepare => t_no_prepare
, t_None_Cappuccino_cappuccino => t_None_Cappuccino_cappuccino
, t_None_Coffee_coffee => t_None_Coffee_coffee
, t_None_Espresso_espresso => t_None_Espresso_espresso
, t_None_None_milk => t_None_None_milk
, t_None_None_reset => t_None_None_reset
, t_reqd_cappuccino => t_reqd_cappuccino
, t_reqd_coffee => t_reqd_coffee
, t_reqd_espresso => t_reqd_espresso
, t_reqd_milk => t_reqd_milk
, t_start_transition => t_start_transition
, t_t_capp2 => t_t_capp2
, t_t_espresso => t_t_espresso
, t_t10 => t_t10
, t_t11 => t_t11
, t_t14 => t_t14
, t_t19 => t_t19
, t_t2 => t_t2
, t_t20 => t_t20
, t_t21 => t_t21
, t_t22 => t_t22
, t_t24 => t_t24
, t_t4 => t_t4
, t_t5 => t_t5
, p_Cappuccino => p_Cappuccino
, p_Coffee => p_Coffee
, p_Espresso => p_Espresso
, p_event_cappuccino => p_event_cappuccino
, p_event_coffee => p_event_coffee
, p_event_espresso => p_event_espresso
, p_event_milk => p_event_milk
, p_event_reset => p_event_reset
, p_Grind_Coffee => p_Grind_Coffee
, p_Ingredients => p_Ingredients
, p_Ingredients_Coffee => p_Ingredients_Coffee
, p_Ingredients_Milk => p_Ingredients_Milk
, p_Ingredients_out => p_Ingredients_out
, p_Milk => p_Milk
, p_Milk_Heating => p_Milk_Heating
, p_Preparing => p_Preparing
, p_Preparing_out => p_Preparing_out
, p_Pump => p_Pump
, p_Running => p_Running
, p_state_Cappuccino => p_state_Cappuccino
, p_state_Coffee => p_state_Coffee
, p_state_Coffeen_Milk => p_state_Coffeen_Milk
, p_state_Espresso => p_state_Espresso
, p_state_Espresson_Milk => p_state_Espresson_Milk
, p_state_None => p_state_None
, p_Stopped => p_Stopped
, p_Stopping => p_Stopping
, p_Water_Heating => p_Water_Heating);


    -- connection of entities by their ports

end;
