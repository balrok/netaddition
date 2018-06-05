#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import argparse
import os
import shlex
import sys

import tqdm
script_path = os.path.dirname(os.path.realpath(__file__))
tools_path = os.path.dirname(script_path)
for _ in range(10):
    t = os.path.join(tools_path, "tools")
    if os.path.exists(t):
        tools_path = t
        break
    tools_path = os.path.dirname(tools_path)
sys.path.append(tools_path)
sys.path.append(os.path.join(tools_path, "netadddsl"))

from grgen_helper.log import log
from netadddsl import dsl, run

ignore_files = ["add_mul2.na"]


# TODO the default flags are very bad:
# e.g.handling of includes is very bad: -i -I -r
# or -a
def collect_na_files(args):
    all = []
    if args.na_file:
        all += [args.na_file]
    else:
        all = [
            os.path.join(script_path, f) for f in os.listdir(script_path)
            if f.endswith(".na") and f not in ignore_files
        ]
    return all


def main():
    parser = argparse.ArgumentParser(
        description="Takes in a net-addition file and produces a grgen script")
    parser.add_argument("na_file", nargs="?")
    parser.add_argument(
        "-r",
        action="store_true",
        help="Include the referenced nets by copying relative to .na")
    parser.add_argument(
        "-i",
        action="store_false",
        help="Include the referenced nets by {name}.grs[i]")
    parser.add_argument(
        "-I",
        action="store_true",
        help="Include the referenced nets by copying")
    parser.add_argument(
        "-a",
        action="store_false",
        help="Don't use AllInOne Rule and don't generate flat Petri net")
    parser.add_argument(
        "-v", action="store_false", help="Don't verify after each step")
    parser.add_argument("-p", action="store_true", help="Plain grsi file")
    parser.add_argument(
        "-b",
        type=int,
        nargs="?",
        default=4,
        help="Bound which is used for the inhibitortransform")
    args = parser.parse_args()
    all = collect_na_files(args)
    new = []
    for f in tqdm.tqdm(all):
        new += [do(f, args.i, args.a, args.v, args.I, args.r, args.p, args.b)]
    print("OK: " + " ".join(map(shlex.quote, new)))


def do(
        file: str,
        include: bool=False,
        allinone: bool=False,
        validate: bool=False,
        include_copy: bool=False,
        include_relative: bool=False,
        plain: bool=False,
        maxbound: int=5, ):
    # convert to lola
    log(f"Processing {file}")

    rules = dsl.get_na_rules_from_file(file)
    new_content = dsl.netadd_to_grgen(rules)
    with open(file + ".grsi", "w") as f:
        if not allinone:
            f.write('new graph "Rules.grg"\n')
        else:
            f.write('new graph "../allinone/Rules.grg"\n')
        if not plain:
            f.write('include layout.grsi\n')
        if include_relative:
            oldcwd = os.getcwd()
            os.chdir(os.path.dirname(file))
        if include_copy:
            pns = dsl.get_petri_net_includes(rules)
            pn_files = run.find_includes(pns)
            for p in pn_files:
                f.write("\n\n")
                f.write(open(p).read())
                f.write("\n\n")
        elif include:
            pns = dsl.get_petri_net_includes(rules)
            pn_files = run.find_includes(pns)
            for p in pn_files:
                f.write(f'include {p}\n')
        if include_relative:
            os.chdir(oldcwd)
        f.write("\n")
        f.write(new_content)
        f.write("\n")
        if not plain:
            f.write("exec na::Transform()\n")
            f.write("exec na::NACleanup()\n")
        if allinone:
            f.write("exec PetrinetCleanup()*\n")
        if validate:
            f.write("validate exitonfailure strict only specified\n")
        if not plain:
            f.write(f"export {file}.transformed.grs\n")
        if allinone:
            f.write("exec dyn2r::flatten()\n")
            f.write("exec PetrinetCleanup()*\n")
            f.write("exec id_unique()\n")
            if validate:
                f.write("validate exitonfailure strict only specified\n")
            f.write(f"export {file}.nodyn.grs\n")
            # inhibitor
            f.write("exec TransformMultiArcsToWeight()*\n")
            f.write(f"exec Init({maxbound})\n")
            f.write("exec ToPTNet()* | [InfoInhibitors()] | CheckError()\n")
            if validate:
                f.write("validate exitonfailure strict only specified\n")
            f.write("exec id_replace_lola()\n")
            f.write(f"export {file}.noinh.grs\n")
    return file + ".grsi"


if __name__ == "__main__":
    main()
