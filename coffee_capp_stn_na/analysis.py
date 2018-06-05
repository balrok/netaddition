#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import sys

script_path = os.path.dirname(os.path.realpath(__file__))
tools_path = os.path.dirname(script_path)
for _ in range(10):
    t = os.path.join(tools_path, "tools")
    if os.path.exists(t):
        tools_path = t
        break
    tools_path = os.path.dirname(tools_path)
sys.path.append(tools_path)

print(tools_path)
from pnanalysis.run import run_analysis

basefile = script_path + "/grgen/allinone/contextinhibitortransform.grs.grsi.pnml.lola"
if not os.path.exists(basefile):
    basefile = script_path + "/grgen/allinone/inhibitortransform.grs.grsi.pnml.lola"

formulas = [
    "NOT EF DEADLOCK",
    "AGEF INITIAL",
    "AGEF(Running = 1 -> (Stopping = 0 AND Stopped = 0))",
    "AGEF(Stopping = 1 -> (Stopped = 0 AND Running = 0))",
    "AGEF(Stopped = 1 -> (Stopping = 0 AND Running = 0))",
    "AGEF(Cappuccino_1 = 1 -> (Coffee_1 = 0))",
    "AGEF(Coffee_1 = 1 -> (Cappuccino_1 = 0))",
    "AGEF(Espresso = 1 -> (Coffee_1 = 0))",
    "AGEF(Coffee_1 = 1 -> (Espresso = 0))",
    # Coffee_1 and Milk_1 can go together
    "AGEF(Coffee_1 = 1 AND Milk_1 = 1 AND Running = 1)",
    # Coffee_1 and Espresso can not go together
    "NOT AGEF(Coffee_1 = 1 AND Espresso = 1)",
    # when coffee we will reach the Grind_Coffee_1
    "AGEF(Coffee_1 = 1 AND Running = 1 AND AF(Grind_Coffee = 1))",
    # when coffee and no milk, we won't reach millk_heating
    "AGEF(Coffee_1 = 1 AND Milk_1 = 0 AND Running = 1 AND NOT AF(Milk_Heating = 1))",
    # when coffee and stopped state, we can reach Milk_1 always
    "AGEF(Coffee_1 = 1 AND Stopped = 1 AND AF(Milk_1 = 1))",
    # when coffee and stopped state, we can not reach Espresso
    "AGEF(Coffee_1 = 1 AND Stopped = 1 AND NOT AF(Espresso = 1))",
    # when coffee and stopped state, we can not reach Espresso
    "AGEF(Espresso = 1 AND Stopped = 1 AND NOT AF(Coffee_1 = 1))",
]

if __name__ == "__main__":
    result = run_analysis(basefile, formulas)
    if not result:
        sys.exit(1)
