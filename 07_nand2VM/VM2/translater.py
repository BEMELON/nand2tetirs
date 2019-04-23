import Parser
import CodeWriter
import sys


def translate():
    fname = sys.argv[1]
    codeWriter = CodeWriter.CodeWriter(fname[:-2] + "asm")
    parser = Parser.Parser(fname)

    codeWriter.writeInit()
    while parser.hasMoreCommands():
        parser.advance()
        commandType = parser.commandType()
        if commandType == "C_ARITHMETIC":
            codeWriter.writeArithmetic(parser.arg1())
        elif commandType == "C_PUSH" or commandType == "C_POP":
            segment = parser.arg1()
            index = parser.arg2()

            codeWriter.writePushPop(command=commandType, segment=segment, index=int(index))
        elif commandType == "C_LABEL":
            label = parser.arg1()
            codeWriter.writeLabel(label=label)
        elif commandType == "C_IF":
            label = parser.arg1()
            codeWriter.writeIf(label=label)
        elif commandType == "C_GOTO":
            label = parser.arg1()
            codeWriter.writeGoto(label=label)
        elif commandType == "C_FUNCTION":
            functionName = parser.arg1()
            numLocals = parser.arg2()
            codeWriter.writeFunction(functionName=functionName, numLocals=numLocals)
        elif commandType == "C_RETURN":
            codeWriter.writeReturn()
    codeWriter.close()


if __name__ == "__main__":
    translate()

