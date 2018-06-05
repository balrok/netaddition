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

current_dir = script_path
root = os.path.dirname(script_path)
root = os.path.dirname(root)
os.chdir(str(root))

from grgen_helper.chain import run, Command
import grgen_helper.base_commands as bc

chain = Command(
    "statemachine",
    "chain.grs",
    "chain.grs.grsi",
    add_artifacts=[current_dir + "/stn.grs"],
    descr="stn"
).addChild(
    bc.move(current_dir + "/net/Statemachine.grs").addChild(
        bc.netadd_dsl(current_dir + "/net/machine.na").addChild(
            bc.netaddtransform.addChild(
                bc.pninfo(
                    "../allinone/netaddtransform.grs.grsi.pninfo.tina.grsi",
                    ["-n"]))
            .addChild(
                bc.inhibitortransform.addChild(
                    bc.grgen2pnml.addChild(bc.tina).addChild(
                        bc.lola(current_dir + "/lola_check.sh")))
                .addChild(
                    bc.pninfo(
                        "../allinone/inhibitortransform.grs.grsi.pninfo.grsi",
                        ["-i"])))
            .addChild(
                bc.vhdl_pninfo([
                    "inhibitortransform.grs.grsi.pninfo.grsi",
                    "../allinone/netaddtransform.grs.grsi.pninfo.tina.grsi",
                ])))))
run(chain, current_dir)
