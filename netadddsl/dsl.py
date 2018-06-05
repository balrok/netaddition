#!/usr/bin/env python3
import sys
from typing import List

import tqdm
from antlr4 import CommonTokenStream
from antlr4 import FileStream
from antlr4 import ParseTreeWalker
from Model import Addition
from Model import gen_grgen_id
from Model import PN
from MyListener import MyListener
from NetAddDslLexer import NetAddDslLexer
from NetAddDslParser import NetAddDslParser

# from filecache import filecache


def getTree(file):
    input = FileStream(file)
    lexer = NetAddDslLexer(input)
    stream = CommonTokenStream(lexer)
    parser = NetAddDslParser(stream)
    tree = parser.root()
    return tree


# def getFileContent(file):
#     with open(file) as f:
#         return f.read().split("\n")


def get_na_rules_from_file(file: str) -> List[Addition]:
    cl = MyListener()
    tree = getTree(file)
    walker = ParseTreeWalker()
    walker.walk(cl, tree)
    resolve_pn(cl.rules)
    return cl.rules


def main(argv) -> List[Addition]:
    # cl = MyNetAddDslListener()
    rules = []
    with tqdm.tqdm(total=len(argv) - 1) as pbar:
        for file in argv[1:]:
            pbar.set_description(file)
            pbar.update(1)
            rules += get_na_rules_from_file(file)
    return rules


def get_petri_net_includes(rules: List[Addition]) -> List[PN]:
    pns = set()
    for r in rules:
        for pn in r.petrinets:
            pns.add(pn.getOrigNetName())
    for r in rules:
        for p in pns:
            if p == r.target.net_s:
                pns.remove(p)
                break
    return sorted(list(pns))


def resolve_pn(rules: List[Addition]):
    def resolve(node, pns):
        if not isinstance(node.pn, str):
            return
        if node.pn not in pns:
            raise Exception(f"Could not resolve pn for {node.item_s}")
        node.pn = pns[n.pn]

    for r in rules:
        pns = {}
        pns[r.target.net_s] = r.target
        for pn in r.petrinets:
            pns[pn.net_s] = pn
        for pn in r.petrinets:
            for c, n in pn.conf_places:
                resolve(n, pns)
        for f in r.fusions:
            for n in f.sources:
                resolve(n, pns)


class IdHelper(object):
    def __init__(self):
        self.map = {}

    def get(self, item: str):
        item = gen_grgen_id(item)
        id = self.map.get(item, -1)
        id += 1
        self.map[item] = id
        return id

    def gets(self, item: str, prefix: str="_"):
        item = gen_grgen_id(item)
        prefix = gen_grgen_id(prefix)
        id = self.get(item)
        if id > 0:
            return prefix + str(id)
        return ""


def netadd_to_grgen(rules: List[Addition]):
    ih = IdHelper()
    ret = []
    ret.append(f'new sys:net_addition::System()')
    add_c = 0
    for r in rules:
        add_c += 1

        r.target.to_grgen(ih, ret)
        r.grgen_id = gen_grgen_id(f"a_{r.target.net_s}")
        r.grgen_id += ih.gets(r.grgen_id)
        ret.append(f'new {r.grgen_id}:net_addition::Addition' +
                   f'(target={r.target.grgen_id})')
        ret.append(
            f'new sys-:net_addition::rules(order={add_c})->{r.grgen_id}')
        for pn in r.petrinets:
            pn.to_grgen(ih, ret)
            ret.append(
                f'new {r.grgen_id}-:net_addition::petrinets->{pn.grgen_id}')
        for pn in r.petrinets:
            for c, n in pn.conf_places:
                n.to_grgen(ih, ret)
                ret.append(f'new {n.grgen_id} -:net_addition::configures' +
                           f'(activates={c.enable}, weight={c.weight})->' +
                           f' {pn.grgen_id}')
        for f in r.fusions:
            f.grgen_id = gen_grgen_id(f"f_{f.rename}")
            f.grgen_id += ih.gets(f.grgen_id)
            ret.append(
                f'new {f.grgen_id}:net_addition::Fusion(rename="{f.rename}")')
            ret.append(
                f'new {r.grgen_id}-:net_addition::fusions->{f.grgen_id}')
            for n in f.sources:
                n.to_grgen(ih, ret)
                ret.append(
                    f'new {f.grgen_id}-:net_addition::sources->{n.grgen_id}')
    return "\n".join(ret)


if __name__ == '__main__':
    adds = main(sys.argv)
    print(netadd_to_grgen(adds))
