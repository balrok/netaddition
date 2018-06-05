#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import os
from typing import List

import dsl

# TODO the include flag is a bit naive.. it should strip the including file with fix_grsi or something

def find_includes(pn:List[str]) -> List[str]:
    ret = []
    for v in pn:
        for location in (f"{v}.grs",f"{v}.grsi"):
            if os.path.exists(location):
                ret += [location]
                break
        else:
            raise Exception(f'Could not find include for petrinet "{v}".')
    return ret

def main():
    parser = argparse.ArgumentParser(
        description="Takes in a net-addition file and produces a grgen script"
    )
    parser.add_argument("na_file", nargs="+")
    parser.add_argument(
        "-i", action="store_true", help="Include the referenced nets by {name}.grs[i]")
    args = parser.parse_args()

    for file in args.na_file:
        if file.endswith(".grsi") or file.endswith(".grs"):
            continue
        rules = dsl.get_na_rules_from_file(file)
        new_content = dsl.netadd_to_grgen(rules)
        with open(file + ".grsi", "w") as f:
            f.write('new graph "Rules.grg"\n')
            f.write('include layout.grsi\n')
            if args.i:
                pns = dsl.get_petri_net_includes(rules)
                pn_files = find_includes(pns)
                for p in pn_files:
                    f.write(f'include {p}\n')
            f.write('\n')
            f.write(new_content)


if __name__ == "__main__":
    main()
