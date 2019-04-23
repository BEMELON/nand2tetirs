import Parser
import CodeWriter
import sys


def translate():
    fname = sys.argv[1]
    codeWriter = CodeWriter.CodeWriter(fname[:-2] + "asm")
    parser = Parser.Parser(fname)

    while parser.hasMoreCommands():
        parser.advance()
        commandType = parser.commandType()
        if commandType == "C_ARITHMETIC":
            codeWriter.writeArithmetic(parser.arg1())
        elif commandType == "C_PUSH" or "C_POP":
            segment = parser.arg1()
            index = parser.arg2()
            codeWriter.writePushPop(command=commandType, segment=segment, index=int(index))
    codeWriter.close()


if __name__ == "__main__":
    translate()

