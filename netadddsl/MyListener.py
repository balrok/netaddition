#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from Model import Addition
from Model import Config
from Model import Fusion
from Model import PN
from NetAddDslListener import NetAddDslListener
from NetAddDslParser import NetAddDslParser


def get_name(ctx):
    if ctx.name().STRINGNAME():
        return ctx.name().STRINGNAME().getText()[1:-1]
    if ctx.name().TXTNAME():
        return ctx.name().TXTNAME().getText()


class MyListener(NetAddDslListener):
    def __init__(self):
        self.rules = []
        # current context
        self.add = None
        self.pn = None
        self.fusion = None

    def enterNarule(self, ctx: NetAddDslParser.NaruleContext):
        pn = PN(None, get_name(ctx))
        self.add = Addition(pn)
        pn.add = self.add
        self.rules.append(self.add)

    def exitNarule(self, ctx: NetAddDslParser.NaruleContext):
        # resolve
        for node in self.add.nodes:
            if not node.pn:
                node.pn = self.add.resolve_pn(node.pn_s)
            if not node.pn:
                pns = [pn.net_s for pn in self.add.petrinets]
                pns = ", ".join(pns)
                raise Exception(
                    f"Node {node.item_s} has no resolved pn '{node.pn_s}'. All pns: '{pns}'"
                )
        self.add = None

    def enterPndef(self, ctx: NetAddDslParser.PndefContext):
        self.pn = self.add.resolve_or_add_pn(ctx.pnref().getText())

    def exitPndef(self, ctx: NetAddDslParser.PndefContext):
        self.pn = None

    # nodename WS* (arc=('->' | '-o')? WS* NUMBER)?
    def enterConfplace(self, ctx: NetAddDslParser.ConfplaceContext):
        if ctx.nodename().fullnodename():
            node = ctx.nodename().fullnodename()
            net = node.pnref().getText()
            item = get_name(node)
            pn = self.add.resolve_or_add_pn(net)
        else:
            pn = self.add.target
            item = get_name(ctx.nodename())
        enabled = True
        weight = 1
        if ctx.arc and ctx.arc.text == "-o":
            enabled = False
        if ctx.NUMBER:
            weight = int(ctx.NUMBER().getText())
        c = Config(enabled, weight)
        cp = pn.get_node(item)
        self.pn.conf_places.append((c, cp))

    def enterFusion(self, ctx: NetAddDslParser.FusionContext):
        self.fusion = Fusion(get_name(ctx))
        self.add.fusions.append(self.fusion)

    def exitFusion(self, ctx: NetAddDslParser.FusionContext):
        self.fusion = None

    def enterFusionset(self, ctx: NetAddDslParser.FusionsetContext):
        for node in ctx.fullnodename():
            net = node.pnref().getText()
            item = get_name(node)
            pn = self.add.resolve_pn(net)
            if pn is None:
                raise Exception("You need to declare " + net)
            node = pn.get_node(item)
            self.fusion.sources.append(node)
