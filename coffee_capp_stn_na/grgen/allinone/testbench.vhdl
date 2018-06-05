library IEEE;
use std.textio.all;
use IEEE.STD_LOGIC_1164.ALL;

--this is how entity for your test bench code has to be declared.
entity testbench is
    PORT(
        clk : in std_logic := '0';
        p_Cappuccino : out std_logic := '0';
        p_Coffee : out std_logic := '0';
        p_Espresso : out std_logic := '0';
        p_event_cappuccino : out std_logic := '0';
        p_event_coffee : out std_logic := '0';
        p_event_espresso : out std_logic := '0';
        p_event_milk : out std_logic := '0';
        p_event_reset : out std_logic := '0';
        p_Grind_Coffee : out std_logic := '0';
        p_Ingredients : out std_logic := '0';
        p_Ingredients_Coffee : out std_logic := '0';
        p_Ingredients_Milk : out std_logic := '0';
        p_Ingredients_out : out std_logic := '0';
        p_Milk : out std_logic := '0';
        p_Milk_Heating : out std_logic := '0';
        p_Preparing : out std_logic := '0';
        p_Preparing_out : out std_logic := '0';
        p_Pump : out std_logic := '0';
        p_Running : out std_logic := '0';
        p_state_Cappuccino : out std_logic := '0';
        p_state_Coffee : out std_logic := '0';
        p_state_Coffeen_Milk : out std_logic := '0';
        p_state_Espresso : out std_logic := '0';
        p_state_Espresson_Milk : out std_logic := '0';
        p_state_None : out std_logic := '0';
        p_Stopped : out std_logic := '0';
        p_Stopping : out std_logic := '0';
        p_Water_Heating : out std_logic := '0';
        t_Cappuccino_Cappuccino_cappuccino : in std_logic := '1';
        t_Cappuccino_Cappuccino_coffee : in std_logic := '1';
        t_Cappuccino_Cappuccino_espresso : in std_logic := '1';
        t_Cappuccino_Cappuccino_milk : in std_logic := '1';
        t_Cappuccino_None_reset : in std_logic := '1';
        t_Coffee_Coffee_cappuccino : in std_logic := '1';
        t_Coffee_Coffee_coffee : in std_logic := '1';
        t_Coffee_Coffee_espresso : in std_logic := '1';
        t_Coffee_Coffeen_Milk_milk : in std_logic := '1';
        t_Coffee_None_reset : in std_logic := '1';
        t_Coffeen_Milk_Coffeen_Milk_cappuccino : in std_logic := '1';
        t_Coffeen_Milk_Coffeen_Milk_coffee : in std_logic := '1';
        t_Coffeen_Milk_Coffeen_Milk_espresso : in std_logic := '1';
        t_Coffeen_Milk_Coffeen_Milk_milk : in std_logic := '1';
        t_Coffeen_Milk_None_reset : in std_logic := '1';
        t_end_running : in std_logic := '1';
        t_Espresso_Espresso_cappuccino : in std_logic := '1';
        t_Espresso_Espresso_coffee : in std_logic := '1';
        t_Espresso_Espresso_espresso : in std_logic := '1';
        t_Espresso_Espresson_Milk_milk : in std_logic := '1';
        t_Espresso_None_reset : in std_logic := '1';
        t_Espresson_Milk_Espresson_Milk_cappuccino : in std_logic := '1';
        t_Espresson_Milk_Espresson_Milk_coffee : in std_logic := '1';
        t_Espresson_Milk_Espresson_Milk_espresso : in std_logic := '1';
        t_Espresson_Milk_Espresson_Milk_milk : in std_logic := '1';
        t_Espresson_Milk_None_reset : in std_logic := '1';
        t_no_prepare : in std_logic := '1';
        t_None_Cappuccino_cappuccino : in std_logic := '1';
        t_None_Coffee_coffee : in std_logic := '1';
        t_None_Espresso_espresso : in std_logic := '1';
        t_None_None_milk : in std_logic := '1';
        t_None_None_reset : in std_logic := '1';
        t_reqd_cappuccino : in std_logic := '1';
        t_reqd_coffee : in std_logic := '1';
        t_reqd_espresso : in std_logic := '1';
        t_reqd_milk : in std_logic := '1';
        t_start_transition : in std_logic := '1';
        t_t_capp2 : in std_logic := '1';
        t_t_espresso : in std_logic := '1';
        t_t10 : in std_logic := '1';
        t_t11 : in std_logic := '1';
        t_t14 : in std_logic := '1';
        t_t19 : in std_logic := '1';
        t_t2 : in std_logic := '1';
        t_t20 : in std_logic := '1';
        t_t21 : in std_logic := '1';
        t_t22 : in std_logic := '1';
        t_t24 : in std_logic := '1';
        t_t4 : in std_logic := '1';
        t_t5 : in std_logic := '1'    );
end testbench;


architecture behavior of testbench is


    -- signal declarations.
    signal event_cappuccinoir :std_logic;
    signal event_cappuccinois :std_logic;
    signal event_cappuccinoo2 :std_logic;
    signal event_coffeeir :std_logic;
    signal event_coffeeis :std_logic;
    signal event_coffeeo2 :std_logic;
    signal event_espressoir :std_logic;
    signal event_espressois :std_logic;
    signal event_espressoo2 :std_logic;
    signal event_milkir :std_logic;
    signal event_milkis :std_logic;
    signal event_milko2 :std_logic;
    signal event_resetir :std_logic;
    signal event_resetis :std_logic;
    signal event_reseto2 :std_logic;
    signal Ingredients_Coffeeir :std_logic;
    signal Ingredients_Coffeeis :std_logic;
    signal Ingredients_Coffeeo2 :std_logic;
    signal Ingredients_Milkir :std_logic;
    signal Ingredients_Milkis :std_logic;
    signal Ingredients_Milko2 :std_logic;
    signal Ingredients_outir :std_logic;
    signal Ingredients_outis :std_logic;
    signal Ingredients_outo2 :std_logic;
    signal Ingredientsir :std_logic;
    signal Ingredientsis :std_logic;
    signal Ingredientso2 :std_logic;
    signal Milk_Heatingir :std_logic;
    signal Milk_Heatingis :std_logic;
    signal Milk_Heatingo2 :std_logic;
    signal o104 :std_logic;
    signal o112 :std_logic;
    signal o116 :std_logic;
    signal o124 :std_logic;
    signal o128 :std_logic;
    signal o13 :std_logic;
    signal o132 :std_logic;
    signal o136 :std_logic;
    signal o147 :std_logic;
    signal o162 :std_logic;
    signal o172 :std_logic;
    signal o176 :std_logic;
    signal o18 :std_logic;
    signal o180 :std_logic;
    signal o183 :std_logic;
    signal o2 :std_logic;
    signal o201 :std_logic;
    signal o207 :std_logic;
    signal o211 :std_logic;
    signal o230 :std_logic;
    signal o234 :std_logic;
    signal o238 :std_logic;
    signal o244 :std_logic;
    signal o27 :std_logic;
    signal o298 :std_logic;
    signal o302 :std_logic;
    signal o31 :std_logic;
    signal o35 :std_logic;
    signal o5 :std_logic;
    signal o55 :std_logic;
    signal o59 :std_logic;
    signal o63 :std_logic;
    signal o67 :std_logic;
    signal o71 :std_logic;
    signal o75 :std_logic;
    signal o79 :std_logic;
    signal o87 :std_logic;
    signal o9 :std_logic;
    signal o91 :std_logic;
    signal o96 :std_logic;
    signal Preparing_outir :std_logic;
    signal Preparing_outis :std_logic;
    signal Preparing_outo2 :std_logic;
    signal Preparingir :std_logic;
    signal Preparingis :std_logic;
    signal Preparingo2 :std_logic;
    signal Pumpir :std_logic;
    signal Pumpis :std_logic;
    signal Pumpo2 :std_logic;
    signal state_Cappuccinoir :std_logic;
    signal state_Cappuccinois :std_logic;
    signal state_Cappuccinoo2 :std_logic;
    signal state_Coffeeir :std_logic;
    signal state_Coffeeis :std_logic;
    signal state_Coffeen_Milkir :std_logic;
    signal state_Coffeen_Milkis :std_logic;
    signal state_Coffeen_Milko2 :std_logic;
    signal state_Coffeeo2 :std_logic;
    signal state_Espressoir :std_logic;
    signal state_Espressois :std_logic;
    signal state_Espresson_Milkir :std_logic;
    signal state_Espresson_Milkis :std_logic;
    signal state_Espresson_Milko2 :std_logic;
    signal state_Espressoo2 :std_logic;
    signal state_Noneir :std_logic;
    signal state_Noneis :std_logic;
    signal state_Noneo2 :std_logic;
    signal Stoppedir :std_logic;
    signal Stoppedis :std_logic;
    signal Stoppedo2 :std_logic;
    signal Stoppingir :std_logic;
    signal Stoppingis :std_logic;
    signal Stoppingo2 :std_logic;
    signal Water_Heatingir :std_logic;
    signal Water_Heatingis :std_logic;
    signal Water_Heatingo2 :std_logic;

begin
    -- instantiation of entities
    event_cappuccino : entity work.place generic map(1, 0) port map(event_cappuccinois, event_cappuccinoir, event_cappuccinoo2, clk);
    event_coffee : entity work.place generic map(1, 0) port map(event_coffeeis, event_coffeeir, event_coffeeo2, clk);
    event_espresso : entity work.place generic map(1, 0) port map(event_espressois, event_espressoir, event_espressoo2, clk);
    event_milk : entity work.place generic map(1, 0) port map(event_milkis, event_milkir, event_milko2, clk);
    event_reset : entity work.place generic map(1, 0) port map(event_resetis, event_resetir, event_reseto2, clk);
    Ingredients : entity work.place generic map(1, 0) port map(Ingredientsis, Ingredientsir, Ingredientso2, clk);
    Ingredients_Coffee : entity work.place generic map(1, 0) port map(Ingredients_Coffeeis, Ingredients_Coffeeir, Ingredients_Coffeeo2, clk);
    Ingredients_Milk : entity work.place generic map(1, 0) port map(Ingredients_Milkis, Ingredients_Milkir, Ingredients_Milko2, clk);
    Ingredients_out : entity work.place generic map(1, 0) port map(Ingredients_outis, Ingredients_outir, Ingredients_outo2, clk);
    Milk_Heating : entity work.place generic map(1, 0) port map(Milk_Heatingis, Milk_Heatingir, Milk_Heatingo2, clk);
    Preparing : entity work.place generic map(1, 0) port map(Preparingis, Preparingir, Preparingo2, clk);
    Preparing_out : entity work.place generic map(1, 0) port map(Preparing_outis, Preparing_outir, Preparing_outo2, clk);
    Pump : entity work.place generic map(1, 0) port map(Pumpis, Pumpir, Pumpo2, clk);
    state_Cappuccino : entity work.place generic map(1, 0) port map(state_Cappuccinois, state_Cappuccinoir, state_Cappuccinoo2, clk);
    state_Coffee : entity work.place generic map(1, 0) port map(state_Coffeeis, state_Coffeeir, state_Coffeeo2, clk);
    state_Coffeen_Milk : entity work.place generic map(1, 0) port map(state_Coffeen_Milkis, state_Coffeen_Milkir, state_Coffeen_Milko2, clk);
    state_Espresso : entity work.place generic map(1, 0) port map(state_Espressois, state_Espressoir, state_Espressoo2, clk);
    state_Espresson_Milk : entity work.place generic map(1, 0) port map(state_Espresson_Milkis, state_Espresson_Milkir, state_Espresson_Milko2, clk);
    state_None : entity work.place generic map(1, 1) port map(state_Noneis, state_Noneir, state_Noneo2, clk);
    Stopped : entity work.place generic map(1, 1) port map(Stoppedis, Stoppedir, Stoppedo2, clk);
    Stopping : entity work.place generic map(1, 0) port map(Stoppingis, Stoppingir, Stoppingo2, clk);
    Water_Heating : entity work.place generic map(1, 0) port map(Water_Heatingis, Water_Heatingir, Water_Heatingo2, clk);


    -- connection of entities by their ports

    event_cappuccinoir <= (o112 or o128 or o172 or o71 or o87 or state_Cappuccinois);
    event_cappuccinois <= (Stoppedo2 and t_reqd_cappuccino and not event_cappuccinoo2); -- req.cappuccino
    event_coffeeir <= (o104 or o124 or o55 or o63 or o67 or state_Coffeeis);
    event_coffeeis <= (Stoppedo2 and t_reqd_coffee and not event_coffeeo2); -- req.coffee
    event_espressoir <= (o116 or o132 or o176 or o75 or o91 or state_Espressois);
    event_espressois <= (Stoppedo2 and t_reqd_espresso and not event_espressoo2); -- req.espresso
    event_milkir <= (o136 or o180 or o59 or o79 or state_Coffeen_Milkis or state_Espresson_Milkis);
    event_milkis <= (Stoppedo2 and t_reqd_milk and not event_milko2); -- req.milk
    event_resetir <= (o147 or o162 or o96 or state_Cappuccinoir or state_Coffeen_Milkir or state_Espresson_Milkir);
    event_resetis <= o35;
    Ingredients_Coffeeir <= (Ingredients_Coffeeo2 and t_t22); -- t22
    Ingredients_Coffeeis <= (Ingredientso2 and o5 and t_t21); -- t21
    Ingredients_Milkir <= (Ingredients_Milko2 and t_t20); -- t20
    Ingredients_Milkis <= (Ingredientso2 and o9 and t_t19); -- t19
    Ingredients_outir <= o183;
    Ingredients_outis <= (Ingredients_Coffeeir or Ingredients_Milkir or o201);
    Ingredientsir <= (Ingredients_Coffeeis or Ingredients_Milkis or o201);
    Ingredientsis <= o27;
    Milk_Heatingir <= (Milk_Heatingo2 and t_t4); -- t4
    Milk_Heatingis <= (o9 and Preparingo2 and t_t2 and not o18); -- t2
    o104 <= (event_coffeeo2 and state_Espressoo2 and t_Espresso_Espresso_coffee); -- Espresso_Espresso_coffee
    o112 <= (event_cappuccinoo2 and state_Espressoo2 and t_Espresso_Espresso_cappuccino); -- Espresso_Espresso_cappuccino
    o116 <= (event_espressoo2 and state_Espressoo2 and t_Espresso_Espresso_espresso); -- Espresso_Espresso_espresso
    o124 <= (event_coffeeo2 and state_Cappuccinoo2 and t_Cappuccino_Cappuccino_coffee); -- Cappuccino_Cappuccino_coffee
    o128 <= (event_cappuccinoo2 and state_Cappuccinoo2 and t_Cappuccino_Cappuccino_cappuccino); -- Cappuccino_Cappuccino_cappuccino
    o13 <= (not state_Noneo2 and not state_Coffeen_Milko2 and not state_Coffeeo2);
    o132 <= (event_espressoo2 and state_Cappuccinoo2 and t_Cappuccino_Cappuccino_espresso); -- Cappuccino_Cappuccino_espresso
    o136 <= (event_milko2 and state_Cappuccinoo2 and t_Cappuccino_Cappuccino_milk); -- Cappuccino_Cappuccino_milk
    o147 <= (event_reseto2 and o13 and state_Espressoo2 and t_Espresso_None_reset); -- Espresso_None_reset
    o162 <= (event_reseto2 and state_Noneo2 and t_None_None_reset); -- None_None_reset
    o172 <= (event_cappuccinoo2 and state_Espresson_Milko2 and t_Espresson_Milk_Espresson_Milk_cappuccino); -- Espresso-Milk_Espresso-Milk_cappuccino
    o176 <= (event_espressoo2 and state_Espresson_Milko2 and t_Espresson_Milk_Espresson_Milk_espresso); -- Espresso-Milk_Espresso-Milk_espresso
    o18 <= (not state_Noneo2 and not state_Espresson_Milko2 and not state_Espressoo2 and not o5);
    o180 <= (event_milko2 and state_Espresson_Milko2 and t_Espresson_Milk_Espresson_Milk_milk); -- Espresso-Milk_Espresso-Milk_milk
    o183 <= (Ingredients_outo2 and t_t14); -- t14
    o2 <= (not Stoppingo2 and not Stoppedo2);
    o201 <= (Ingredientso2 and o13 and t_t_espresso); -- t_espresso
    o207 <= (Preparingo2 and t_no_prepare and not o5 and not o9 and not o18); -- no_prepare
    o211 <= (o18 and Preparingo2 and t_t_capp2); -- t_capp2
    o230 <= (t_t5 and Water_Heatingo2 and Water_Heatingo2); -- t5
    o234 <= (o147 or state_Cappuccinoir or state_Espresson_Milkir);
    o238 <= (state_Cappuccinoir or state_Coffeen_Milkir or state_Espresson_Milkir);
    o244 <= (o96 or state_Coffeen_Milkir);
    o27 <= (Stoppedo2 and t_start_transition and not state_Noneo2 and not event_reseto2 and not event_cappuccinoo2 and not event_milko2 and not event_espressoo2 and not event_coffeeo2); -- start_transition
    o298 <= (state_Cappuccinois or state_Espressois);
    o302 <= (state_Cappuccinois or state_Coffeen_Milkis or state_Espresson_Milkis);
    o31 <= (state_Noneo2 and Stoppingo2 and t_t24); -- t24
    o35 <= (o2 and Preparing_outo2 and t_end_running); -- end_running
    o5 <= (not state_Noneo2 and not o13);
    o55 <= (event_coffeeo2 and state_Espresson_Milko2 and t_Espresson_Milk_Espresson_Milk_coffee); -- Espresso-Milk_Espresso-Milk_coffee
    o59 <= (event_milko2 and state_Noneo2 and t_None_None_milk); -- None_None_milk
    o63 <= (event_coffeeo2 and state_Coffeeo2 and t_Coffee_Coffee_coffee); -- Coffee_Coffee_coffee
    o67 <= (event_coffeeo2 and state_Coffeen_Milko2 and t_Coffeen_Milk_Coffeen_Milk_coffee); -- Coffee-Milk_Coffee-Milk_coffee
    o71 <= (event_cappuccinoo2 and state_Coffeen_Milko2 and t_Coffeen_Milk_Coffeen_Milk_cappuccino); -- Coffee-Milk_Coffee-Milk_cappuccino
    o75 <= (event_espressoo2 and state_Coffeen_Milko2 and t_Coffeen_Milk_Coffeen_Milk_espresso); -- Coffee-Milk_Coffee-Milk_espresso
    o79 <= (event_milko2 and state_Coffeen_Milko2 and t_Coffeen_Milk_Coffeen_Milk_milk); -- Coffee-Milk_Coffee-Milk_milk
    o87 <= (event_cappuccinoo2 and state_Coffeeo2 and t_Coffee_Coffee_cappuccino); -- Coffee_Coffee_cappuccino
    o9 <= (not state_Noneo2 and not state_Espressoo2 and not state_Coffeeo2);
    o91 <= (event_espressoo2 and state_Coffeeo2 and t_Coffee_Coffee_espresso); -- Coffee_Coffee_espresso
    o96 <= (event_reseto2 and o5 and state_Coffeeo2 and t_Coffee_None_reset); -- Coffee_None_reset
    p_Cappuccino <= o18;
    p_Coffee <= o5;
    p_Espresso <= o13;
    p_event_cappuccino <= event_cappuccinoo2;
    p_event_coffee <= event_coffeeo2;
    p_event_espresso <= event_espressoo2;
    p_event_milk <= event_milko2;
    p_event_reset <= event_reseto2;
    p_Grind_Coffee <= Water_Heatingo2;
    p_Ingredients <= Ingredientso2;
    p_Ingredients_Coffee <= Ingredients_Coffeeo2;
    p_Ingredients_Milk <= Ingredients_Milko2;
    p_Ingredients_out <= Ingredients_outo2;
    p_Milk <= o9;
    p_Milk_Heating <= Milk_Heatingo2;
    p_Preparing <= Preparingo2;
    p_Preparing_out <= Preparing_outo2;
    p_Pump <= Pumpo2;
    p_Running <= o2;
    p_state_Cappuccino <= state_Cappuccinoo2;
    p_state_Coffee <= state_Coffeeo2;
    p_state_Coffeen_Milk <= state_Coffeen_Milko2;
    p_state_Espresso <= state_Espressoo2;
    p_state_Espresson_Milk <= state_Espresson_Milko2;
    p_state_None <= state_Noneo2;
    p_Stopped <= Stoppedo2;
    p_Stopping <= Stoppingo2;
    p_Water_Heating <= Water_Heatingo2;
    Preparing_outir <= o35;
    Preparing_outis <= (Milk_Heatingir or o207 or o211 or Pumpir);
    Preparingir <= (Milk_Heatingis or o207 or o211 or Water_Heatingis);
    Preparingis <= o183;
    Pumpir <= (Pumpo2 and t_t11); -- t11
    Pumpis <= o230;
    state_Cappuccinoir <= (event_reseto2 and o13 and o18 and o9 and state_Cappuccinoo2 and t_Cappuccino_None_reset); -- Cappuccino_None_reset
    state_Cappuccinois <= (event_cappuccinoo2 and state_Noneo2 and t_None_Cappuccino_cappuccino); -- None_Cappuccino_cappuccino
    state_Coffeeir <= (o96 or state_Coffeen_Milkis);
    state_Coffeeis <= (event_coffeeo2 and state_Noneo2 and t_None_Coffee_coffee); -- None_Coffee_coffee
    state_Coffeen_Milkir <= (event_reseto2 and o5 and o9 and state_Coffeen_Milko2 and t_Coffeen_Milk_None_reset); -- Coffee-Milk_None_reset
    state_Coffeen_Milkis <= (event_milko2 and state_Coffeeo2 and t_Coffee_Coffeen_Milk_milk); -- Coffee_Coffee-Milk_milk
    state_Espressoir <= (o147 or state_Espresson_Milkis);
    state_Espressois <= (event_espressoo2 and state_Noneo2 and t_None_Espresso_espresso); -- None_Espresso_espresso
    state_Espresson_Milkir <= (event_reseto2 and o13 and o9 and state_Espresson_Milko2 and t_Espresson_Milk_None_reset); -- Espresso-Milk_None_reset
    state_Espresson_Milkis <= (event_milko2 and state_Espressoo2 and t_Espresso_Espresson_Milk_milk); -- Espresso_Espresso-Milk_milk
    state_Noneir <= (state_Cappuccinois or state_Coffeeis or state_Espressois);
    state_Noneis <= (o147 or o96 or state_Cappuccinoir or state_Coffeen_Milkir or state_Espresson_Milkir);
    Stoppedir <= o27;
    Stoppedis <= o31;
    Stoppingir <= o31;
    Stoppingis <= o35;
    Water_Heatingir <= o230;
    Water_Heatingis <= (o5 and Preparingo2 and t_t10); -- t10
end;
