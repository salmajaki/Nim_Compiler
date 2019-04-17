grammar nim_grammar;

import milestone_1;

literal : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT  | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | FLOAT_LIT | FLOAT32_LIT | FLOAT64_LIT | GENERALIZED_TRIPLESTR_LIT | STR_LIT | CHAR_LIT |TRIPLESTR_LIT | GENERALIZED_STR_LIT | 'true' | 'false';

binop:  EQUALS_OPERATOR |
        ADD_OPERATOR |
        MUL_OPERATOR |
        MINUS_OPERATOR |
        DIV_OPERATOR |
        LESS_THAN |
        GREATER_THAN || 
        OR_OPERATOR |
        AND_OPERATOR |
        BITWISE_NOT_OPERATOR |
        NOT_OPERATOR |
        XOR_OPERATOR;

exp: IDENTIFIER | literal | function_call | exp binop exp
params: exp (COMMA exp)*;
function_call:  attribute DOT IDENTIFIER '(' params ')' | IDENTIFIER '(' params ')';
attribute: IDENTIFIER (DOT IDENTIFIER)*

condition: exp
start : (expr)*;
