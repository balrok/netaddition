grammar NetAddDsl;

root
    : narule+
    ;

narule
    : WS* name WS* '=' WS* '(' (WS* pndef WS* '+' WS*)+ pndef WS* ')' '(' WS* (fusion WS* ',' WS*)* fusion WS* ','? ')' WS*
    ;

name
    : TXTNAME
    | STRINGNAME
    ;

fullnodename
    : pnref '.' name  // petrinet.place
    ;

nodename
    : name // just a place - the pnref will be the result of net-addition
    | fullnodename
    ;

pnref
    : name pnvector?
    ;

pndef
    : pnref WS* pnconf?
    ;

pnconf
    : '{' WS* (confplace WS* ',' WS*)* confplace WS* ','? '}'
    ;

pnvector
    : '[' WS* NUMBER WS* ']'
    ;

confplace
    : nodename WS* (arc=('->' | '-o')? WS* NUMBER)?
    ;

fusion
    : fusionset WS* '->' WS* name
    ;

fusionset
    : (fullnodename WS* '/' WS*)* fullnodename
    ;


NUMBER
    : ('1'..'9') ('0'..'9')*
    ;

TXTNAME
    : ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*
    ;

STRINGNAME
    : '"' (~'"')+ '"'
    ;

WS
    : (' ' | '\t' | '\n' | '\r') -> skip
    ;
LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n' -> skip
    ;
LINE_COMMENT2
    : '#' ~('\n'|'\r'|'#')* '\r'? '\n'? -> skip
    ;
