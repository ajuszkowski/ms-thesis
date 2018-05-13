<instruction>
    :   'include' <string>
    |   'let' <pattern-binding> ('and <pattern-binding>)*
    |   'not'? <assertion-kind> <expression> <as-var-name>?
    ;

<assertion-kind>
    :   'acyclic'
    |   'irreflexive'
    |   'empty'
    ;

<pattern-binding>
    :    <binding>
    |    <var-name> <var-name> '=' <expression>
    |    <var-name> '(' formals ')' '=' <expression>
    ;

<binding>
    :    <var-name> '=' <expression>
    |    '(' <formals> ')' '=' <expression>
    ;

<formals>
    :   <var-name>
    |   <var-name> ',' <formals>
    ;

<as-var-name>
    :   'as' <var-name>
    ;

<expression>
    :   <set>
    |   <basic-relation>
    |   <expression> '*' <expression>
    |   <expression> '*'
    |   <expression> '+'
    |   <expression> '?'
    |   <expression> '^' '-1'
    |   <expression> ';' <expression>
    |   <expression> '|' <expression>
    |   <expression> '\' <expression>
    |   <expression> '&' <expression>
    |   '~' <expression>
    ;

<set>
    :   ('E' | 'W' | 'R' | 'IW' | ...)
    ;

<basic-relation>
    :   'po'
    |   'rf'
    |   'co'
    ;