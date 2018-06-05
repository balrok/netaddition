# Net Addition DSL

This DSL implements net addition:
Paper:
	* Net model composition and modification by net operations: a pragmatic approach
		* JP Barros, L Gomes - INDIN'04

This python program can read a dsl specification and print it back
Also it can read the dsl specification and print it in grgen format with a metamodel like this

```
node class Addition;
node class PN { // we need this because one net can be referenced multiple times
	net: PetriNet;
	net_s: string = ""; // we might initialize it with a string which automatically finds the net
}
directed edge class petrinets
	connect Addition[1:*] --> PN;
directed edge class fusions
	connect Addition[1:*] --> Fusion;
node class Fusion {
	rename: string;
}
node class FusionNode {
	pn: PN;
	item: PetriNetNode;
	item_s: string = ""; // we might initialize it with a string which automatically finds the net
}
directed edge class sources
	connect Fusion[*] --> FusionNode;
```

A net addition looks like this:

``` PN3 = (PN1 + PN2) (PN1.p1/PN2.p1 -> p3) ```


## TODO:

* support subtraction
	* additionally support subtraction of just an arc - how?
* support vector access by a variable
* support nested braces e.g. ((e[i].p/x.p->y)[i:1..2] f.p/g.x->z)
* support resolving nets e.g.:
	* xy = (x + y)
	* z = (xy + f)
	* j = (z + f) (z.xy.x.p / f.p -> p)
