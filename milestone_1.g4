grammar milestone_1;

INDENT: '    '+;

NEWLINE : '\r'? '\n' ->skip ;
WS    :  [ \r\t]+ -> skip;

AND : 'and' ;
ADDR : 'addr';
AS : 'as';
ASM : 'asm';
BIND : 'bind' ;
BLOCK : 'block' ;
BREAK : 'break';
CASE : 'case';
CAST : 'cast';
CONCEPT : 'concept';
CONST : 'const';
CONTINUE : 'continue';
CONVERTER : 'converter';
DEFER : 'defer';
DISCARD : 'discard';
DISTINCT : 'distinct';
DIV : 'div';
DO : 'do';
ELIF : 'elif';
ELSE : 'else';
END : 'end';
ENUM : 'enum';
EXCEPT : 'except';
EXPORT : 'export';
FINALLY : 'finally';
FOR : 'for';
FROM : 'from';
FUNC : 'func';
IF : 'if';
IMPORT : 'import';
IN : 'in';
INCLUDE : 'include';
INTERFACE : 'interface';
IS : 'is';
ISNOT : 'isnot';
ITERATOR: 'iterator';
LET : 'let';
MACRO : 'macro';
METHOD : 'method';
MIXIN: 'mixin';
MOD : 'mod';
NIL : 'nil';
NOT : 'not';
NOTIN : 'notin';
OBJECT : 'object';
OF : 'of';
OR : 'or';
OUT : 'out';
PROC: 'proc';
PTR : 'ptr';
RAISE : 'raise';
REF : 'ref';
RETURN : 'return';
SHL : 'shl';
SHR : 'shr';
STATIC : 'static';
TEMPLATE : 'template';
TRY: 'try';
TUPLE : 'tuple';
TYPE : 'type';
USING : 'using';
WHEN : 'when';
WHILE : 'while';
XOR : 'xor';
YIELD : 'yield';
VARIABLE : 'var';

IDENTIFIER : LETTER+ (('_')?(LETTER | DIGIT))*  ;
LETTER : [a-zA-Z];
EQUALS_COMPARE : '==';
EQUALS_ASSIGN : '=';
// EQUALS_OPERATOR : EQUALS_COMPARE | EQUALS_ASSIGN;
ADD_OPERATOR : '+';
MUL_OPERATOR : '*';
MINUS_OPERATOR : '-';
DIV_OPERATOR : '/';
LESS_THAN : '<';
GREATER_THAN : '>';
OR_OPERATOR : '|';
AND_OPERATOR : '&';
BITWISE_NOT_OPERATOR : '~';
NOT_OPERATOR: '!';
XOR_OPERATOR : '^';
AT : '@';
MODULUS : '%';
DOT : '.';
COLON : ':';
SEMI_COLON : ';';
COMMA : ',' ;
OPEN_PAREN : '(';
CLOSE_PAREN : ')';
OPEN_BRACE : '{';
CLOSE_BRACE : '}';
OPEN_BRACK : '[';
CLOSE_BRACK : ']';

INT8_LIT : INT_LIT ('\'')? [Ii] '8' ;
INT16_LIT : INT_LIT ('\'')? ('i' | 'I') '16' ;
INT32_LIT : INT_LIT ('\'')? ('i' | 'I') '32' ;
INT64_LIT : INT_LIT ('\'')? ('i' | 'I') '64';

UINT_LIT : INT_LIT ('\'')? ('u' | 'U');
UINT8_LIT : INT_LIT ('\'')? ('u' | 'U') '8';
UINT16_LIT : INT_LIT ('\'')? ('u' | 'U') '16';
UINT32_LIT : INT_LIT ('\'')? ('u' | 'U') '32';
UINT64_LIT : INT_LIT ('\'')? ('u' | 'U') '64';

EXP : [eE] ('+'|'-')? DIGIT (('_')? DIGIT)*;
FLOAT_LIT : DIGIT (('_')? DIGIT)* (('.' DIGIT (('_')? DIGIT)* EXP?) |EXP);
FLOAT32_SUFFIX : ('f' | 'F') ('32')?;
FLOAT32_LIT : HEX_LIT '\'' FLOAT32_SUFFIX | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ('\'')? FLOAT32_SUFFIX ;
FLOAT64_SUFFIX : ( ('f' | 'F') '64' ) | 'd' | 'D' ;
FLOAT64_LIT : HEX_LIT '\'' FLOAT64_SUFFIX | (FLOAT_LIT | DEC_LIT | OCT_LIT | BIN_LIT) ('\'')? FLOAT64_SUFFIX ;

DIGIT : [0-9] ;
INT_LIT : HEX_LIT | DEC_LIT | OCT_LIT | BIN_LIT ;
HEXDIGIT : DIGIT | [a-f] | [A-F];
OCTDIGIT : [0-7];
BINDIGIT : '0'|'1' ;
HEX_LIT : '0'[Xx] HEXDIGIT (('_')?HEXDIGIT)* ;
DEC_LIT : DIGIT (('_')?DIGIT)* ;
OCT_LIT : '0' 'o' OCTDIGIT (('_')?OCTDIGIT)* ;
BIN_LIT : '0' ('b' | 'B' ) BINDIGIT (('_')?BINDIGIT)* ;


STR_LIT : '\"' (STR_CHAR | '\\p')* '\"'  ;
STR_CHAR: '\\r' | '\\c' | '\\l' | '\\n' | '\\f' | '\\v' | '\\t' | '\\\\' | '\\"' | '\\\'' | ('\\' [0-9]+) | '\\a' | '\\b' | '\\e'
        | '\\x'HEXDIGIT HEXDIGIT | [\u0000-\u0009\u000b-\u000c\u000e-\u0021\u0023-\u005b\u005d-\u007f];


RSTR_LIT: 'r' TRIPLESTR_LIT | 'r\"\"' | NONEMPTY_SINGLE_STR ;
TRIPLESTR_LIT : '\"' '\"' '\"' .*?  '\"' '\"' '\"' ;
CHAR_LIT : '\'' CHAR_L '\'';
CHAR_L : '\\r' | '\\c' | '\\l' | '\\n' | '\\f' | '\\v' | '\\t' | '\\\\' | '\\"' | '\\\'' | ('\\' [0-9]+) | '\\a' | '\\b' | '\\e'
        | '\\x'HEXDIGIT HEXDIGIT | [\u0000-\u007f];
GENERALIZED_STR_LIT : IDENTIFIER STR_LIT;
GENERALIZED_TRIPLESTR_LIT :  IDENTIFIER TRIPLESTR_LIT;

NONEMPTY_SINGLE_STR: 'r\"'~('\"') RSTR_CHAR* '\"';
RSTR_CHAR: [\u0000-\u0009\u000b-\u000c\u000e-\u0021\u0023-\u007f] | '\"\"';


//MULTI_COMMENT :   ('#' '[' .*? NEWLINE*? ']' '#') -> skip ;
MULTI_COMMENT: ' '* (('#' '[' NON_HASH_CHAR* MULTI_COMMENT_LEAF NON_HASH_CHAR* ']' '#') | ' '* MULTI_COMMENT_LEAF) -> skip;
MULTI_COMMENT_LEAF :   ('#' '[' .*? ']' '#') |
                   ('##' '[' .*? ']' '##') ;
NON_HASH_CHAR: [\u0000-\u0022\u0024-\u007f] | '#'~('[');
COMMENT : ' '* '#'.*? (NEWLINE | [\u0003])  ->skip;

TRUE: 'true';
FALSE: 'false';

// expr : INDENT | AND | ADDR | AS | ASM | BIND | BLOCK | BREAK | CASE | CAST | CONCEPT | CONST | CONTINUE | CONVERTER | DEFER | DISCARD | DISTINCT | DIV | DO | ELIF | ELSE | END | ENUM | EXCEPT | EXPORT | FINALLY | FOR | FROM | FUNC | IF | IMPORT | IN | INCLUDE | INTERFACE | IS | ISNOT | ITERATOR | LET | MACRO | METHOD | MIXIN | MOD | NIL | NOT | NOTIN | OBJECT | OF | OR | OUT | PROC | PTR | RAISE | REF | RETURN | SHL | SHR | STATIC | TEMPLATE | TRY | TUPLE | TYPE | USING | WHEN | WHILE | XOR | YIELD |  IDENTIFIER | LETTER | VARIABLE | EQUALS_OPERATOR | ADD_OPERATOR | MUL_OPERATOR | MINUS_OPERATOR | DIV_OPERATOR | LESS_THAN | GREATER_THAN | OR_OPERATOR | AND_OPERATOR | BITWISE_NOT_OPERATOR | NOT_OPERATOR | XOR_OPERATOR | AT | MODULUS | DOT | COLON | SEMI_COLON | COMMA | OPEN_PAREN | CLOSE_PAREN | OPEN_BRACE | CLOSE_BRACE | OPEN_BRACK | CLOSE_BRACK | HEXDIGIT | OCTDIGIT | BINDIGIT | HEX_LIT | DEC_LIT | OCT_LIT | BIN_LIT | DIGIT | INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT  | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT  | EXP | FLOAT_LIT | FLOAT32_SUFFIX | FLOAT32_LIT | FLOAT64_SUFFIX | FLOAT64_LIT | GENERALIZED_TRIPLESTR_LIT|RSTR_LIT| STR_LIT | CHAR_LIT |TRIPLESTR_LIT | GENERALIZED_STR_LIT;

