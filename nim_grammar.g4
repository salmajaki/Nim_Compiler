grammar nim_grammar;

import milestone_1;
strings : STR_LIT | STR_CHAR | RSTR_LIT | TRIPLESTR_LIT ;
echo : "echo" strings (',' strings)*;





start : (expr)*;
