import Parser
import CodeWriter
import sys


def translate():
    codeWriter = CodeWriter.CodeWriter()
    codeWriter.setFileName("StaticsTest.asm")
    for i in range(len(sys.argv) - 1):
        fname = sys.argv[i + 1]
        parser = Parser.Parser(fname)
        if i == 0:
            codeWriter.writeInit()
        while parser.hasMoreCommands():
            parser.advance()
            commandType = parser.commandType()

            if commandType == "C_ARITHMETIC":
                codeWriter.writeArithmetic(parser.arg1())
            elif commandType == "C_PUSH" or commandType == "C_POP":
                segment = parser.arg1()
                index = parser.arg2()
                codeWriter.writePushPop(command=commandType, segment=segment, index=int(index), name=fname[:-3])
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
            elif commandType == "C_CALL":
                functionName = parser.arg1()
                numArgs = parser.arg2()
                codeWriter.writeCall(functionName=functionName, numArgs=int(numArgs))
            elif commandType == "C_RETURN":
                codeWriter.writeReturn()
    codeWriter.close()


if __name__ == "__main__":
    translate()

