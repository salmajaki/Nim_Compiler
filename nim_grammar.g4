grammar nim_grammar;

import milestone_1;

start : (stmt (SEMI_COLON)*)* EOF;


echo : ECHO (((strings| IDENTIFIER | function_call | attribute) (COMMA (strings| IDENTIFIER | function_call | attribute))*) | (OPEN_PAREN (strings| IDENTIFIER | function_call | attribute) (COMMA (strings| IDENTIFIER | function_call |attribute))* CLOSE_PAREN));
strings : STR_LIT | CHAR_LIT | RSTR_LIT | TRIPLESTR_LIT ;

return_stmt: RETURN exp?;

import_stmt : (FROM IDENTIFIER)? IMPORT IDENTIFIER (COMMA IDENTIFIER)* ;

break_stmt : BREAK IDENTIFIER?;

num_lit : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT| UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT
          | UINT64_LIT | EXP | FLOAT_LIT  | FLOAT32_LIT | FLOAT64_LIT ;
assert_stmt : ASSERT num_lit EQUALS_COMPARE num_lit;

if_stmt: IF condition COLON 
                (INDENT* stmt)*
        INDENT* (ELIF condition COLON 
                (INDENT* stmt)*)*
        INDENT* (ELSE COLON (INDENT* stmt)*)?;

while_stmt : WHILE condition COLON (INDENT stmt)* ;

stmt: if_stmt | assignmnet | decl_stmt | echo | return_stmt | import_stmt | break_stmt | assert_stmt | while_stmt | CONTINUE;

literal : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT  | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | FLOAT_LIT | FLOAT32_LIT | FLOAT64_LIT | GENERALIZED_TRIPLESTR_LIT | STR_LIT | CHAR_LIT |TRIPLESTR_LIT | GENERALIZED_STR_LIT | DIGIT | TRUE | FALSE;

binop:  EQUALS_COMPARE |
        ADD_OPERATOR |
        MUL_OPERATOR |
        MINUS_OPERATOR |
        DIV_OPERATOR |
        LESS_THAN |
        (LESS_THAN EQUALS_ASSIGN)  |
        GREATER_THAN |
        (GREATER_THAN EQUALS_ASSIGN) |
        OR_OPERATOR |
        AND_OPERATOR |
        BITWISE_NOT_OPERATOR |
        NOT_OPERATOR |
        XOR_OPERATOR;

exp: exp binop exp | NOT exp | IDENTIFIER | literal | function_call | attribute;
params: exp (COMMA exp)*;
function_call:  attribute DOT IDENTIFIER OPEN_PAREN params CLOSE_PAREN | IDENTIFIER OPEN_PAREN params CLOSE_PAREN;
attribute: IDENTIFIER (DOT IDENTIFIER)*;

condition: exp;

assignmnet: attribute EQUALS_ASSIGN exp;

decl_stmt: var_stmt | const_or_let_stmt;

var_stmt: VARIABLE IDENTIFIER EQUALS_ASSIGN exp | 
        VARIABLE decl_type_stmt | 
        VARIABLE decl_type_block;

decl_type_stmt: IDENTIFIER (COMMA IDENTIFIER)* COLON IDENTIFIER;
decl_type_block: ((INDENT+) IDENTIFIER (COMMA IDENTIFIER)* COLON IDENTIFIER)+;

const_or_let_stmt: (LET | CONST) IDENTIFIER EQUALS_ASSIGN exp |
        (LET | CONST) assignment_block;

assignment_block: ((INDENT+) IDENTIFIER EQUALS_ASSIGN exp)+;

