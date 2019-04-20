grammar nim_grammar;

import milestone_1;

start : (stmt (SEMI_COLON)*)* EOF;


echo : ECHO (((strings| IDENTIFIER | function_call | attribute | array_access) (COMMA (strings| IDENTIFIER | function_call | attribute | array_access))*) | (OPEN_PAREN (strings| IDENTIFIER | function_call | attribute | array_access) (COMMA (strings| IDENTIFIER | function_call |attribute | array_access))* CLOSE_PAREN));
strings : STR_LIT | CHAR_LIT | RSTR_LIT | TRIPLESTR_LIT ;

return_stmt: RETURN exp?;

import_stmt : (FROM IDENTIFIER)? IMPORT IDENTIFIER (COMMA IDENTIFIER)* ;

break_stmt : BREAK IDENTIFIER?;

num_lit : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT| UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT
          | UINT64_LIT | EXP | FLOAT_LIT  | FLOAT32_LIT | FLOAT64_LIT ;
assert_stmt : ASSERT num_lit EQUALS_COMPARE num_lit;

if_stmt: IF condition COLON
                stmt_or_block
        (INDENT)* (ELIF condition COLON 
                stmt_or_block)*
        (INDENT)* (ELSE COLON stmt_or_block)?;

stmt_or_block: stmt | (INDENT+ stmt)+;

while_stmt : WHILE condition COLON (INDENT+ stmt)* ;

stmt: if_stmt | assignment | decl_stmt | echo | return_stmt 
        | import_stmt | break_stmt | assert_stmt | while_stmt | 
        CONTINUE | for_stmt | function_call | INDENT | case_stmt |
        DISCARD | type_stmt | template_stmt | macro_stmt;

literal : INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT  | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT | FLOAT_LIT | FLOAT32_LIT | FLOAT64_LIT | GENERALIZED_TRIPLESTR_LIT | STR_LIT | CHAR_LIT |TRIPLESTR_LIT | GENERALIZED_STR_LIT | DIGIT | TRUE | FALSE | array_literal | seq_literal | array_access;

numeral: DIGIT | INT_LIT | INT8_LIT | INT16_LIT | INT32_LIT | INT64_LIT  | UINT_LIT | UINT8_LIT | UINT16_LIT | UINT32_LIT | UINT64_LIT;

array_literal: OPEN_BRACK array_elems? CLOSE_BRACK;

seq_literal: AT array_literal;

array_access: IDENTIFIER OPEN_BRACK IDENTIFIER CLOSE_BRACK;

array_elems: literal ((COMMA) literal)*;

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

exp: exp binop exp | NOT exp | IDENTIFIER | literal | function_call | attribute | OPEN_PAREN exp CLOSE_PAREN;
params: exp (COMMA exp)*;
function_call:  attribute DOT IDENTIFIER (OPEN_PAREN params CLOSE_PAREN)? | IDENTIFIER OPEN_PAREN params CLOSE_PAREN
        | OPEN_PAREN exp CLOSE_PAREN DOT IDENTIFIER | IDENTIFIER;
attribute: IDENTIFIER (DOT IDENTIFIER)* | OPEN_PAREN attribute CLOSE_PAREN;

condition: exp;

assignment: attribute EQUALS_ASSIGN exp;

decl_stmt: var_stmt | const_or_let_stmt;

var_stmt: VARIABLE IDENTIFIER EQUALS_ASSIGN exp | 
        VARIABLE decl_type_stmt | 
        VARIABLE decl_type_block;

decl_type_stmt: IDENTIFIER (COMMA IDENTIFIER)* COLON types;
decl_type_block: ((INDENT+) IDENTIFIER (COMMA IDENTIFIER)* COLON types)+;

const_or_let_stmt: (LET | CONST) IDENTIFIER EQUALS_ASSIGN exp |
        (LET | CONST) assignment_block;

assignment_block: ((INDENT+) IDENTIFIER EQUALS_ASSIGN exp)+;

range_exp: numeral DOT DOT LESS_THAN attribute | CHAR_LIT DOT DOT CHAR_LIT | numeral DOT DOT numeral;
for_stmt: for_exp
                stmt_or_block;
for_exp: FOR IDENTIFIER (COMMA IDENTIFIER)* IN (range_exp | attribute | array_literal | seq_literal) COLON;

case_stmt: CASE exp COLON?
        (INDENT* OF params COLON stmt_or_block)*
        (INDENT* ELSE COLON stmt_or_block)?;

case_stmt_in_type: CASE exp COLON? (COLON types)?
        ((INDENT)+ OF params COLON IDENTIFIER COLON types*)*
        ((INDENT)+ ELSE COLON IDENTIFIER COLON types)?;

types: 'int' | 'int8' | 'int16' | 'int32' | 'int64' |
        'uint' | 'uint8' | 'uint16' | 'uint32' | 'uint64' |
        'float' | 'float32' | 'float64'| 'bool' | 'char' |
        'string' | 'cstring' | 'object' | 'ref' | 'untyped' | structured_types | type_identifier | IDENTIFIER;

type_identifier: IDENTIFIER OPEN_BRACK type_identifier CLOSE_BRACK | IDENTIFIER OPEN_BRACK IDENTIFIER CLOSE_BRACK;
types_block:
        ((INDENT)+ types EQUALS_ASSIGN types+) | ((INDENT)* case_stmt_in_type);

structured_types: array_seq_type | open_arr | varargs;

type_stmt: TYPE types_block+;

array_params: (numeral DOT DOT numeral | numeral) COMMA types;
array_seq_type: 'array' OPEN_BRACK array_params CLOSE_BRACK;
open_arr: 'openarray' OPEN_BRACK IDENTIFIER CLOSE_BRACK;
varargs: 'ax';

template_stmt: TEMPLATE IDENTIFIER OPEN_PAREN params CLOSE_PAREN (OPEN_BRACE DOT IDENTIFIER CLOSE_BRACE)? EQUALS_ASSIGN
                stmt_or_block;

macro_stmt: MACRO IDENTIFIER OPEN_PAREN 
                (IDENTIFIER COLON types (SEMI_COLON IDENTIFIER COLON types)*)?
                CLOSE_PAREN COLON types EQUALS_ASSIGN stmt_or_block;
