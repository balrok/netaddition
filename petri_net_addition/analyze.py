#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import argparse
import os
import sys
from subprocess import call

import gen
import tqdm
from grgen_helper.log import log
from grgen_helper.log import loge
script_path = os.path.dirname(os.path.realpath(__file__))
tools_path = os.path.dirname(script_path)
for _ in range(10):
    t = os.path.join(tools_path, "tools")
    if os.path.exists(t):
        tools_path = t
        break
    tools_path = os.path.dirname(tools_path)
sys.path.append(tools_path)


def find_last_export(file):
    with open(file) as f:
        for line in reversed(list(f)):
            if line.startswith("export"):
                return line[6:].rstrip()


def run(f):
    log(f"Handling file {f}")
    if f.endswith(".na"):
        f = gen.do(f, include=True, allinone=True, validate=True)
    r = 0
    t = tqdm.tqdm(10)
    log("Running the transformation")
    t.update(1)
    r |= call("GrShell -N -C 'include {};;exit'".format(f), shell=True)
    if r != 0:
        return False
    t.update(1)
    log("grsi to pnml")
    last = find_last_export(f)
    r |= call(tools_path + "/pnml2grgen.py {}".format(last), shell=True)
    r |= call("rm {}".format(last), shell=True)
    r |= call("mv {}.pnml petrinet.pnml".format(last), shell=True)
    if r != 0:
        return False
    t.update(1)
    # log("pnml to lola")
    # r|=call("ndrio petrinet.pnml petrinet.lola", shell=True)
    # if r != 0: return False
    # t.update(1)
    # log("No deadlocks:")
    # r|=call('lola --path --state --formula="NOT EF DEADLOCK" petrinet.lola', shell=True)
    # if r != 0: return False
    # t.update(1)
    # log("Reversible:")
    # r|=call('lola --path --state --formula="AGEF INITIAL" petrinet.lola', shell=True)
    # if r != 0: return False
    # t.update(1)
    log("Tina")
    r |= call("tina petrinet.pnml", shell=True)
    if r != 0:
        return False
    return True


def main():
    parser = argparse.ArgumentParser(
        description="Takes in a net-addition file" +
        " and transforms it until model checking can be done")
    parser.add_argument("na_file", nargs="?")
    args = parser.parse_args()
    all = gen.collect_na_files(args)
    for f in tqdm.tqdm(all):
        if not run(f):
            loge("An error happened")


if __name__ == "__main__":
    main()
