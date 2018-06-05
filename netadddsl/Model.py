#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import re
from typing import List


def gen_grgen_id(str):
    return re.sub("[^a-zA-Z0-9_]", "_", str)


class GrgenObject(object):
    grgen_id = None


class Addition(GrgenObject):
    def __init__(self, net):
        self.petrinets = []
        self.nodes = []
        self.fusions = []
        self.target = net

    def resolve_pn(self, net: str):
        for pn in self.petrinets:
            if pn.net_s == net:
                return pn

    def resolve_or_add_pn(self, net: str):
        pn = self.resolve_pn(net)
        if not pn:
            pn = PN(self, net)
            self.petrinets.append(pn)
        return pn

    def create_petri_node(self, net: str, item: str):
        pn = None
        if net:
            pn = self.resolve_pn(net)
        if not pn:
            raise Exception("Could not find net for %s.%s" % (net, item))
        # if not res:
        #     raise Exception("Could not find item for %s.%s" % (net, item))
        if not pn:
            pn = net
        return PetriNode(pn, item)


class PN(GrgenObject):
    def __init__(self, add: Addition, net: str):
        self.add = add
        self.net_s = net
        self.conf_places = []
        self.nodes = {}

    def get_node(self, item: str):
        node = self.nodes.get(item)
        if not node:
            node = PetriNode(self.add, self, item)
            self.nodes[item] = node
        return node

    def getNetName(self):
        if "[" in self.net_s:
            return self.net_s.replace("[", "_v").replace("]", "")
        return self.net_s

    def getOrigNetName(self):
        idx = self.net_s.find("[")
        if idx > 0:
            return self.net_s[:idx]
        return self.net_s

    def to_grgen(self, ih, result: List[str]):
        if not self.grgen_id:
            self.grgen_id = f"pn_{self.getNetName()}"
            self.grgen_id += ih.gets(self.grgen_id)
            self.grgen_id = gen_grgen_id(self.grgen_id)
            result.append(
                f'new {self.grgen_id}:net_addition::PN(net_s="{self.getOrigNetName()}")'
            )


class Fusion(GrgenObject):
    def __init__(self, rename: str):
        self.rename = rename
        self.sources = []


class PetriNode(GrgenObject):
    def __init__(self, add, pn, item: str):
        add.nodes.append(self)
        self.pn = None
        if isinstance(pn, str):
            self.pn_s = pn
        else:
            self.pn = pn
        self.item_s = item

    def to_grgen(self, ih, result: List[str]):
        if not self.grgen_id:
            self.grgen_id = f"n_{self.pn.grgen_id}_{self.item_s}"
            self.grgen_id += ih.gets(self.grgen_id)
            self.grgen_id = gen_grgen_id(self.grgen_id)
            if "." in self.grgen_id:
                raise Exception("AA")
            result.append(
                f'new {self.grgen_id}:net_addition::PetriNode(item_s="{self.item_s}")'
            )
            result.append(
                f'new {self.pn.grgen_id}-:net_addition::pn_nodes->{self.grgen_id}'
            )


class Config(GrgenObject):
    def __init__(self, enable: bool=True, weight: int=1):
        self.enable = enable
        self.weight = weight
