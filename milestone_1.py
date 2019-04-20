import argparse
from antlr4 import *
from nim_grammarLexer import nim_grammarLexer
from nim_grammarListener import nim_grammarListener
from nim_grammarParser import nim_grammarParser
from antlr4.tree.Trees import Trees

output_file = open("nim_grammar_result.txt", "w+")


def get_token_type(token):
    if token.type == nim_grammarLexer.STR_LIT:
        return "STR_LIT"
    elif token.type == nim_grammarLexer.CHAR_LIT:
        return "CHAR_LIT"
    elif token.type == nim_grammarLexer.TRIPLESTR_LIT:
        return "TRIPLESTR_LIT"
    elif token.type == nim_grammarLexer.RSTR_LIT:
        return "RSTR_LIT"
    elif token.type == nim_grammarLexer.GENERALIZED_TRIPLESTR_LIT:
        return "GENERALIZED_TRIPLESTR_LIT"
    elif token.type == nim_grammarLexer.GENERALIZED_STR_LIT:
        return "GENERALIZED_STR_LIT"
    elif token.type == nim_grammarLexer.AND:
        return "AND"
    elif token.type == nim_grammarLexer.ADDR:
        return "ADDR"
    elif token.type == nim_grammarLexer.AS:
        return "AS"
    elif token.type == nim_grammarLexer.ASM:
        return "ASM"
    elif token.type == nim_grammarLexer.BIND:
        return "BIND"
    elif token.type == nim_grammarLexer.BLOCK:
        return "BLOCK"
    elif token.type == nim_grammarLexer.BREAK:
        return "BREAK"
    elif token.type == nim_grammarLexer.CASE:
        return "CASE"
    elif token.type == nim_grammarLexer.CAST:
        return "CAST"
    elif token.type == nim_grammarLexer.CONCEPT:
        return "CONCEPT"
    elif token.type == nim_grammarLexer.CONST:
        return "CONST"
    elif token.type == nim_grammarLexer.CONTINUE:
        return "CONTINUE"
    elif token.type == nim_grammarLexer.CONVERTER:
        return "CONVERTER"
    elif token.type == nim_grammarLexer.DEFER:
        return "DEFER"
    elif token.type == nim_grammarLexer.DISCARD:
        return "DISCARD"
    elif token.type == nim_grammarLexer.DISTINCT:
        return "DISTINCT"
    elif token.type == nim_grammarLexer.DIV:
        return "DIV"
    elif token.type == nim_grammarLexer.DO:
        return "DO"
    elif token.type == nim_grammarLexer.ELIF:
        return "ELIF"
    elif token.type == nim_grammarLexer.ELSE:
        return "ELSE"
    elif token.type == nim_grammarLexer.END:
        return "END"
    elif token.type == nim_grammarLexer.ENUM:
        return "ENUM"
    elif token.type == nim_grammarLexer.EXCEPT:
        return "EXCEPT"
    elif token.type == nim_grammarLexer.EXPORT:
        return "EXPORT"
    elif token.type == nim_grammarLexer.FINALLY:
        return "FINALLY"
    elif token.type == nim_grammarLexer.FOR:
        return "FOR"
    elif token.type == nim_grammarLexer.FROM:
        return "FROM"
    elif token.type == nim_grammarLexer.FUNC:
        return "FUNC"
    elif token.type == nim_grammarLexer.IF:
        return "IF"
    elif token.type == nim_grammarLexer.IMPORT:
        return "IMPORT"
    elif token.type == nim_grammarLexer.IN:
        return "IN"
    elif token.type == nim_grammarLexer.INCLUDE:
        return "INCLUDE"
    elif token.type == nim_grammarLexer.INTERFACE:
        return "INTERFACE"
    elif token.type == nim_grammarLexer.IS:
        return "IS"
    elif token.type == nim_grammarLexer.ISNOT:
        return "ISNOT"
    elif token.type == nim_grammarLexer.ITERATOR:
        return "ITERATOR"
    elif token.type == nim_grammarLexer.LET:
        return "LET"
    elif token.type == nim_grammarLexer.MACRO:
        return "MACRO"
    elif token.type == nim_grammarLexer.METHOD:
        return "METHOD"
    elif token.type == nim_grammarLexer.MIXIN:
        return "MIXIN"
    elif token.type == nim_grammarLexer.MOD:
        return "MOD"
    elif token.type == nim_grammarLexer.NIL:
        return "NIL"
    elif token.type == nim_grammarLexer.NOT:
        return "NOT"
    elif token.type == nim_grammarLexer.NOTIN:
        return "NOTIN"
    elif token.type == nim_grammarLexer.OBJECT:
        return "OBJECT"
    elif token.type == nim_grammarLexer.OF:
        return "OF"
    elif token.type == nim_grammarLexer.OR:
        return "OR"
    elif token.type == nim_grammarLexer.OUT:
        return "OUT"
    elif token.type == nim_grammarLexer.PROC:
        return "PROC"
    elif token.type == nim_grammarLexer.PTR:
        return "PTR"
    elif token.type == nim_grammarLexer.RAISE:
        return "RAISE"
    elif token.type == nim_grammarLexer.REF:
        return "REF"
    elif token.type == nim_grammarLexer.RETURN:
        return "RETURN"
    elif token.type == nim_grammarLexer.SHL:
        return "SHL"
    elif token.type == nim_grammarLexer.SHR:
        return "SHR"
    elif token.type == nim_grammarLexer.STATIC:
        return "STATIC"
    elif token.type == nim_grammarLexer.TEMPLATE:
        return "TEMPLATE"
    elif token.type == nim_grammarLexer.TRY:
        return "TRY"
    elif token.type == nim_grammarLexer.TUPLE:
        return "TUPLE"
    elif token.type == nim_grammarLexer.TYPE:
        return "TYPE"
    elif token.type == nim_grammarLexer.USING:
        return "USING"
    elif token.type == nim_grammarLexer.WHEN:
        return "WHEN"
    elif token.type == nim_grammarLexer.WHILE:
        return "WHILE"
    elif token.type == nim_grammarLexer.XOR:
        return "XOR"
    elif token.type == nim_grammarLexer.YIELD:
        return "YIELD"
    elif token.type == nim_grammarLexer.IDENTIFIER:
        return "IDENTIFIER"
    elif token.type == nim_grammarLexer.LETTER:
        return "LETTER"
    elif token.type == nim_grammarLexer.VARIABLE:
        return "VARIABLE"
    elif token.type == nim_grammarLexer.EQUALS_ASSIGN:
        return "EQUALS_ASSIGN"
    elif token.type == nim_grammarLexer.EQUALS_COMPARE:
        return "EQUALS_COMPARE"
    elif token.type == nim_grammarLexer.ADD_OPERATOR:
        return "ADD_OPERATOR"
    elif token.type == nim_grammarLexer.MUL_OPERATOR:
        return "MUL_OPERATOR"
    elif token.type == nim_grammarLexer.MINUS_OPERATOR:
        return "MINUS_OPERATOR"
    elif token.type == nim_grammarLexer.DIV_OPERATOR:
        return "DIV_OPERATOR"
    elif token.type == nim_grammarLexer.LESS_THAN:
        return "LESS_THAN"
    elif token.type == nim_grammarLexer.GREATER_THAN:
        return "GREATER_THAN"
    elif token.type == nim_grammarLexer.OR_OPERATOR:
        return "OR_OPERATOR"
    elif token.type == nim_grammarLexer.AND_OPERATOR:
        return "AND_OPERATOR"
    elif token.type == nim_grammarLexer.BITWISE_NOT_OPERATOR:
        return "BITWISE_NOT_OPERATOR"
    elif token.type == nim_grammarLexer.NOT_OPERATOR:
        return "NOT_OPERATOR"
    elif token.type == nim_grammarLexer.XOR_OPERATOR:
        return "XOR_OPERATOR"
    elif token.type == nim_grammarLexer.AT:
        return "AT"
    elif token.type == nim_grammarLexer.MODULUS:
        return "MODULUS"
    elif token.type == nim_grammarLexer.DOT:
        return "DOT"
    elif token.type == nim_grammarLexer.COLON:
        return "COLON"
    elif token.type == nim_grammarLexer.SEMI_COLON:
        return "SEMI_COLON"
    elif token.type == nim_grammarLexer.COMMA:
        return "COMMA"
    elif token.type == nim_grammarLexer.OPEN_PAREN:
        return "OPEN_PAREN"
    elif token.type == nim_grammarLexer.CLOSE_PAREN:
        return "CLOSE_PAREN"
    elif token.type == nim_grammarLexer.OPEN_BRACE:
        return "OPEN_BRACE"
    elif token.type == nim_grammarLexer.CLOSE_BRACE:
        return "CLOSE_BRACE"
    elif token.type == nim_grammarLexer.OPEN_BRACK:
        return "OPEN_BRACK"
    elif token.type == nim_grammarLexer.CLOSE_BRACK:
        return "CLOSE_BRACK"
    elif token.type == nim_grammarLexer.HEXDIGIT:
        return "HEXDIGIT"
    elif token.type == nim_grammarLexer.OCTDIGIT:
        return "OCTDIGIT"
    elif token.type == nim_grammarLexer.BINDIGIT:
        return "BINDIGIT"
    elif token.type == nim_grammarLexer.HEX_LIT:
        return "HEX_LIT"
    elif token.type == nim_grammarLexer.DEC_LIT:
        return "DEC_LIT"
    elif token.type == nim_grammarLexer.OCT_LIT:
        return "OCT_LIT"
    elif token.type == nim_grammarLexer.BIN_LIT:
        return "BIN_LIT"
    elif token.type == nim_grammarLexer.DIGIT:
        return "DIGIT"
    elif token.type == nim_grammarLexer.INT_LIT:
        return "INT_LIT"
    elif token.type == nim_grammarLexer.INT8_LIT:
        return "INT8_LIT"
    elif token.type == nim_grammarLexer.INT16_LIT:
        return "INT16_LIT"
    elif token.type == nim_grammarLexer.INT32_LIT:
        return "INT32_LIT"
    elif token.type == nim_grammarLexer.INT64_LIT:
        return "INT64_LIT"
    elif token.type == nim_grammarLexer.UINT_LIT:
        return "UINT_LIT"
    elif token.type == nim_grammarLexer.UINT8_LIT:
        return "UINT8_LIT"
    elif token.type == nim_grammarLexer.UINT16_LIT:
        return "UINT16_LIT"
    elif token.type == nim_grammarLexer.UINT32_LIT:
        return "UINT32_LIT"
    elif token.type == nim_grammarLexer.UINT64_LIT:
        return "UINT64_LIT"
    elif token.type == nim_grammarLexer.EXP:
        return "EXP"
    elif token.type == nim_grammarLexer.FLOAT_LIT:
        return "FLOAT_LIT"
    elif token.type == nim_grammarLexer.FLOAT32_SUFFIX:
        return "FLOAT32_SUFFIX"
    elif token.type == nim_grammarLexer.FLOAT32_LIT:
        return "FLOAT32_LIT"
    elif token.type == nim_grammarLexer.FLOAT64_SUFFIX:
        return "FLOAT64_SUFFIX"
    elif token.type == nim_grammarLexer.FLOAT64_LIT:
        return "FLOAT64_LIT"
    elif token.type == nim_grammarLexer.INDENT:
        return "INDENT"
    elif token.type == nim_grammarLexer.ECHO:
        return "ECHO"
    elif token.type == nim_grammarLexer.ASSERT:
        return "ASSERT"
    else:
        return "ERROR UNKNOWN TOKEN"


def main():
    with open(args.file, "r") as file:
        lines = file.read()
    input_stream = InputStream(lines)
    lexer = nim_grammarLexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = nim_grammarParser(token_stream)

    tree = parser.start()
    # print(Trees.toStringTree(tree,None, parser))

    token = lexer.nextToken()

    while not token.type == Token.EOF:
        output_file.write(get_token_type(token)+"  "+ token.text+"\n")
        token = lexer.nextToken()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=True, description='Sample Commandline')

    parser.add_argument('--file', action="store", help="path of file to take as input", nargs="?", metavar="file")

    args = parser.parse_args()

    print(args.file)

    main()