instructionList
    :   instruction*
    ;

instruction
    :   includeInstruction
    |   letInstruction
    |   constraintDefinition
    ;

includeInstruction
    :   INCLUDE STRING
    ;

letInstruction
    :   LET REC? patternBindingList IN?
    |   LET REC patternBindingList WHEN constraint IN?
    ;

constraintDefinition
    :   checkType? constraint
    ;

constraint
    :   NOT? (ACYCLIC | IRREFLEXIVE | TESTEMPTY) baseExpression asVarName?
    ;

asVarName
    :   AS varName
    ;

baseExpression
    :   simpleExpression
    |   varNameExpression
    |   baseExpression STAR baseExpression
    |   baseExpression STAR
    |   baseExpression PLUS
    |   baseExpression OPT
    |   baseExpression HAT INV
    |   <assoc=right> baseExpression SEMI baseExpression
    |   <assoc=right> baseExpression UNION baseExpression
    |   <assoc=right> baseExpression PLUSPLUS baseExpression
    |   <assoc=left>  baseExpression DIFF baseExpression
    |   <assoc=right> baseExpression INTER baseExpression
    |   NOT baseExpression  //todo: mark as non-associative
    ;


LET : 'let';
REC : 'rec';
AND : 'and';
WHEN : 'when';
ACYCLIC : 'acyclic';
IRREFLEXIVE : 'irreflexive';
SHOW : 'show';
UNSHOW : 'unshow';
TESTEMPTY : 'empty';
SUBSET : 'subset';  //jade: a virer
AS : 'as';
FUN : 'fun';
IN : 'in';
REQUIRES : 'undefined_unless';  // jade: deprecated?, indeed but still here !
FLAG : 'flag';

WITHCO      : 'withco';  //jade: a virer
WITHOUTCO   : 'withoutco';  //jade: a virer
WITHINIT    : 'withinit';  //jade: a virer
WITHOUTINIT : 'withoutinit';  //jade: a virer
WITHSC      : 'withsc';  //jade: a virer
WITHOUTSC   : 'withoutsc';  //jade: a virer

INCLUDE : 'include';
BEGIN : 'begin';
END : 'end';
PROCEDURE : 'procedure';
CALL : 'call';
ENUM : 'enum';
DEBUG : 'debug';
MATCH : 'match';
WITH : 'with';
FORALL : 'forall';
FROM : 'from';
DO : 'do';
TRY : 'try';
IF : 'if';
THEN : 'then';
ELSE : 'else';
YIELD : 'yield';
DEFAULT : 'default';
INSTRUCTIONS : 'instructions';
COMPAT : 'compat';

NAME
    : '_'? Alpha (Alpha | Digit | '_' |'.' | '-')* //'\''?
    ;

Digit
    :   [0-9]
    ;

Alpha
    : [a-zA-Z]
    ;

STRING : '"' ~["\\\r\n]* '"';
LPAR : '(';
RPAR : ')';
LACC : '{';
RACC : '}';
LBRAC : '[';
RBRAC : ']';
UNDERSCORE : '_';
EMPTY : '0';
UNION : '|';
ALT : '||';
INTER : '&';
STAR : '*';
NOT : '~';
PLUS : '+';
PLUSPLUS : '++';
HAT : '^';
INV : '-1';
DIFF : '\\';
OPT : '?';
EQUAL : '=';
SEMI : ';';
COMMA : ',';
ARROW : '->';
