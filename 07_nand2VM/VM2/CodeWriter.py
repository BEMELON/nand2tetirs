"""
Translates VM commands into Hack assembly code.
"""
class CodeWriter:

    def __init__(self):
        self.stream = -1
        self.JEQIndex = -1
        self.JLTIndex = -1
        self.JGTIndex = -1


    def setFileName(self, fileName):
        self.stream = open(fileName, "w")

    def writeArithmetic(self, command):
        str = self.arithmeticTemplate()

        if command == "add":
            str += "M=M+D //ADD\n"
        elif command == "sub":
            str += "M=M-D //SUB\n"
        elif command == "and":
            str += "M=M&D //AND\n"
        elif command == "or":
            str += "M=M|D // OR\n"
        elif command == "neg":
            str += "M=-M // NEG\n"
        elif command == "not":
            str += "M=!M// NOT\n"
        elif command == "eq":
            str += "D=M-D\n"
            str += self.ifTemplate("JEQ")
        elif command == "lt":
            str += "D=M-D\n"
            str += self.ifTemplate("JLT")
        elif command == "gt":
            str += "D=M-D\n"
            str += self.ifTemplate("JGT")


        self.stream.write(str)

    def writePushPop(self, command, segment, index):
        template = ""
        if command == "C_PUSH":
            if segment == "constant":
                template += "@" + str(index) + "\n" \
                            "D=A // D = @constant\n"

            else:
                if segment == "temp":
                    index = 5 + index
                    template = "@" + str(index) + "\n" \
                               "D=M // D=*temp\n"

                elif segment == "pointer":
                    segment = index == 1 and "@THAT\n" or "@THIS\n"
                    template = segment
                    template += "D=M\n"

                elif segment == "static":
                    offset = str(16 + index) + "\n"
                    template = "@" + offset
                    template += "D=M\n"

                else:
                    if segment == "local":
                        segment = "LCL"
                    elif segment == "this":
                        segment = "THIS"
                    elif segment == "that":
                        segment = "THAT"
                    elif segment == "argument":
                        segment = "ARG"

                    # set D to OFFSET + INDEX
                    template = "@" + str(index) + "\n" \
                                "D=A //A = @index \n" \
                                "@" + segment + "\n" \
                                "A=M+D // sp = sp + index\n" \
                                "D=M // D = *sp\n"

            # D must be Value of dest
            template += self.pushTemplate()

        elif command == "C_POP":
            if segment == "temp":
                index = 5 + index
                template = "@" + str(index) + "\n" \
                           "D=A // offset for Temp\n"

            elif segment == "pointer":
                segment = index == 1 and "@THAT\n" or "@THIS\n"
                template = segment
                template += "D=A\n"

            elif segment == "static":
                offset = str(16 + index) + "\n"
                template = "@" + offset
                template += "D=A\n"
            else:
                if segment == "local":
                    segment = "LCL"
                elif segment == "this":
                    segment = "THIS"
                elif segment == "that":
                    segment = "THAT"
                elif segment == "argument":
                    segment = "ARG"

                template ="@" + str(index) + "\n" \
                          "D=A // A = @index\n" \
                          "@" + segment + "\n" \
                          "D=M+D // D = address(OFFSET + index)\n"

            # D must be address of dest
            template += self.popTemplate()

        self.stream.write(template)

    """
        Must be called First
    """
    def writeInit(self):
        pass
        # self.stream.write("@256 //=====================================\n"
        #                   "D=A //Initialize the stack pointer to 0x0100\n"
        #                   "@SP\n"
        #                   "A=D //======================================\n"
        #                   "call Sys.init // Start executing Sys.init\n")

    def writeLabel(self, label):
        self.stream.write("(" + label + ")\n")

    def writeGoto(self, label):
        self.stream.write("@" + label + "\n"
                          "0;JMP // ======== WriteGoto Func executed\n")

    def writeIf(self, label):
        self.stream.write("@SP //=================================\n"
                          "AM=M-1 // WriteIf func executed\n"
                          "D=M\n"
                          "@" + label + "\n"
                          "D;JGT //===============================\n")


    def writeCall(self, functionName, numArgs):
        numArgs += 5

        template = "@" + functionName + "_RET// =======================\n"
        template += "D=A // writeCallFunction executed!\n"
        template += self.pushTemplate()
        template += "@LCL\nD=M\n"
        template += self.pushTemplate()
        template += "@ARG\nD=M\n"
        template += self.pushTemplate()
        template += "@THIS\nD=M\n"
        template += self.pushTemplate()
        template += "@THAT\nD=M\n"
        template += self.pushTemplate()
        template += "@SP\nD=M\n@" + str(numArgs) + "\nD=D-A\n"
        template += "@ARG\nM=D\n"
        template += "@SP\nD=M\n@LCL\nM=D\n"
        self.stream.write(template)
        self.writeGoto(label=functionName)
        self.writeLabel(label=functionName + "_RET")




    def writeReturn(self):
        self.stream.write(
                          "@LCL //writeReturn Start!\n"
                          "D=M\n"
                          "@FRAME\n"
                          "M=D //FRAME=LCL\n"
                          "@5\n"
                          "A=D-A\n"
                          "A=M\n"
                          "D=A\n"
                          "@RET\n"
                          "M=D //RET = *(FRAME-5)\n"
                          "@SP\n"
                          "AM=M-1\n"
                          "D=M\n"
                          "@ARG\n"
                          "A=M\n"
                          "M=D //*ARG = POP()\n"
                          "@ARG\n"
                          "D=M\n"
                          "@SP\n"
                          "M=D+1 //SP = ARG + 1\n"
                          "@FRAME\n"
                          # "A=M-1\n"
                          # "A=M\n"
                          "D=M\n"
                          "AD=D-1\n"
                          "AD=M\n"
                          "@THAT\n"
                          "M=D //THAT = *(FRAME -1)\n"
                          "@FRAME\n"
                          "D=M\n"
                          "@2\n"
                          "AD=D-A\n"
                          "AD=M\n"
                          "@THIS\n"
                          "M=D //THIS = *(FRAME -2)\n"
                          "@FRAME\n"
                          "D=M\n"
                          "@3\n"
                          "AD=D-A\n"
                          "AD=M\n"
                          "@ARG\n"
                          "M=D //ARG = *(FRAME-3)\n"
                          "@FRAME\n"
                          "D=M\n"
                          "@4\n"
                          "AD=D-A\n"
                          "AD=M\n"
                          "@LCL\n"
                          "M=D //LCL = *(FRAME-4)\n"
                          "@RET\n"
                          "A=M\n"
                          "0;JMP\n"
                          )

    def writeFunction(self, functionName, numLocals):
        self.stream.write(
                           "(" + functionName + ")\n"
                           "\t@" + numLocals + " //WriteFunction Start\n"
                           "\tD=A\n"
                           "\t@temp_" + functionName + "\n"
                           "\tM=D\n"
                           "\t(START_" + functionName + ")\n"
                           "\t@END_" + functionName + "\n"
                           "\tD;JLE\n" 
                           "\t@0 //Push Zero Start \n"
                           "\tD=A\n"
                           "\t@SP\n"
                           "\tM=M+1\n"
                           "\tA=M-1\n"
                           "\tM=D //Push Zero End\n"
                           "\t@temp_" + functionName + " //iterater - 1\n"
                           "\tMD=M-1\n"
                           "\t@START_" + functionName + "\n"
                           "\t0;JMP\n"
                           "(END_" + functionName + ") //WriteFunction End\n")


    """
        D must be Value of dest
        Push D to SP
    """
    def pushTemplate(self):
        return "@SP\n" \
               "M=M+1 // sp++ \n" \
               "A=M-1 //A = sp-1 \n" \
               "M=D // *sp = D\n"

    """
        D must be address of dest
        POP SP to D
    """
    def popTemplate(self):
        return  "@SP //popTemplate START\n" \
                "A=M // ?\n" \
                "M=D \n" \
                "@SP\n" \
                "AM=M-1 \n" \
                "D=M \n" \
                "A=A+1 \n" \
                "A=M \n" \
                "M=D //popTemplate END\n"

    def ifTemplate(self, condition):
        index = 0

        if condition == "JEQ":
            self.JEQIndex += 1
            index = self.JEQIndex

        elif condition == "JLT":
            self.JLTIndex += 1
            index = self.JLTIndex

        elif condition == "JGT":
            self.JGTIndex += 1
            index = self.JGTIndex

        strCondition = condition + "_CONDITION" + str(index)
        strNot = "Else_" + condition + str(index)
        return  "@" + strCondition + "\n" \
                "D;" + condition + "//Jump condition \n" \
                "@SP\n" \
                "A=M-1\n" \
                "M=0 // FALSE\n" \
                "@" + strNot + "\n" \
                "0;JMP\n" \
                "(" + strCondition + ")\n" \
                "@SP\n" \
                "A=M-1\n" \
                "M=-1 // if\n" \
                "(" + strNot + ")\n" \


    def arithmeticTemplate(self):
        return "@SP\n" \
               "AM=M-1 // sp--\n" \
               "D=M // D = TOP element\n" \
               "@SP\n" \
               "A=M-1 // M = second element from top\n" \


    def close(self):
        self.stream.close()

