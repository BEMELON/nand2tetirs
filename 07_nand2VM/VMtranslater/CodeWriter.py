"""
Translates VM commands into Hack assembly code.
"""
class CodeWriter:

    def __init__(self):
        self.stream = -1
        self.JEQIndex = -1
        self.JLTIndex = -1
        self.JGTIndex = -1
        self.idx = 0
        self.indent = 0

    def setFileName(self, fileName):
        self.stream = open(fileName, "w")

    def writeArithmetic(self, command):
        str = self.arithmeticTemplate()

        if command.find("add") != -1:
            str += "M=M+D //ADD\n"
        elif command.find("sub") != -1:
            str += "M=M-D //SUB\n"
        elif command.find("and") != -1:
            str += "M=M&D //AND\n"
        elif command.find("or") != -1:
            str += "M=M|D // OR\n"
        elif command.find("neq") != -1:
            str += "M=-M // NEG\n"
        elif command.find("not") != -1:
            str += "M=!M// NOT\n"
        elif command.find("eq") != -1:
            str += "D=M-D\n"
            str += self.jumpTemplate("JEQ")
        elif command.find("lt") != -1:
            str += "D=M-D\n"
            str += self.jumpTemplate("JLT")
        elif command.find("gt") != -1:
            str += "D=M-D\n"
            str += self.jumpTemplate("JGT")

        self.stream.write(str)

    def writePushPop(self, command, segment, index):
        template = ""
        if command == "C_PUSH":

            if segment == "constant":
                template += "@" + str(index) + " //WritePushPop Function\n" \
                            "D=A\n"

            else:
                if segment == "temp":
                    index = 5 + index
                    template = "@" + str(index) + " //WritePushPop Function\n" \
                               "D=M\n"

                elif segment == "pointer":
                    segment = index == 1 and "@THAT" or "@THIS"
                    template = segment + " //WritePushPop Function\n"
                    template += "D=M\n"

                elif segment == "static":
                    offset = str(16 + index) + " //WritePushPop Function\n"
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
                               "D=A\n" \
                               "@" + segment + "\n" \
                               "A=M+D\n" \
                               "D=M\n"

            # D must be Value of dest
            template += self.pushTemplate()

        elif command == "C_POP":
            if segment == "temp":
                index = 5 + index
                template = "@" + str(index) + " //WritePushPop Function\n" \
                           "D=A\n"

            elif segment == "pointer":
                segment = index == 1 and "@THAT" or "@THIS"
                template = segment + " //WritePushPop Function\n"
                template += "D=A\n"

            elif segment == "static":
                offset = str(16 + index) + " //WritePushPop Function\n"
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

                template = "@" + str(index) + "\n" \
                           "D=A \n" \
                           "@" + segment + "\n" \
                           "D=M+D\n"

            # D must be address of dest
            template += self.popTemplate()

        self.stream.write(template)

    """
        Must be called First
    """
    def writeInit(self):
        self.stream.write( "@256 //WriteInit Function \n"
                           "D=A\n"
                           "@SP\n"
                           "M=D\n")
        self.writeCall(functionName="Sys.init", numArgs=0, jump=True)

    def writeLabel(self, label):
        self.stream.write("(" + label + ")\n")

    def writeGoto(self, label, M=False, D=False):
        if label.find("@") == -1:
            label = "@" + label

        command = label + " //WriteGoto Function\n"
        if M:
            command += "A=M\n"
        elif D:
            command += "A=D\n"
        command += "0;JMP\n"
        self.stream.write(command)
        self.endFunction()

    def writeIf(self, label):
        self.stream.write("@SP //WriteIf Function\n"
                          "AM=M-1\n"
                          "D=M\n"
                          "@" + label + "\n"
                          "D;JNE\n")

    def writeCall(self, functionName, numArgs, jump=True):
        numArgs += 5
        segments = ["@LCL", "@ARG", "@THIS", "@THAT"]

        command = "@" + functionName + "_RET_" + str(self.idx) + " //WriteCall Function\n" \
                  "D=A\n" \
                  "" + self.pushTemplate()

        for segment in segments:
            command += segment + " //Save " + segment[1:] + " of the calling Function\n" \
                        "D=M\n" \
                        "" + self.pushTemplate()

        command += "@SP //Reposition ARG\n" \
                   "D=M\n" \
                   "@" + str(numArgs) + "\n" \
                   "D=D-A\n" \
                   "@ARG\n" \
                   "M=D\n" \
                   "@SP //LCL=SP\n" \
                   "D=M\n" \
                   "@LCL\n" \
                   "M=D\n"

        self.stream.write(command)
        if jump:
            self.writeGoto(label=functionName)
        self.writeLabel(label=functionName + "_RET_" + str(self.idx))
        self.idx += 1

    def writeReturn(self):
        segments = ["@RET", "@THAT", "@THIS", "@ARG", "@LCL"]
        segments_set = [5, 1, 2, 3, 4]
        command = "@LCL //WriteReturn Function\n" \
                  "D=M\n" \
                  "@FRAME\n" \
                  "M=D //FRAME=LCL\n"

        for idx, segment in enumerate(segments):
            command += "@FRAME //" + segments[idx][1:] + " = *(FRAME - " + str(segments_set[idx]) + ")\n" \
                       "D=M\n" \
                       "@" + str(segments_set[idx]) + "\n" \
                       "AD=D-A\n" \
                       "AD=M\n" \
                       "" + segments[idx] + "\n" \
                       "M=D\n"
            if idx == 0:
                command += "@SP //*ARG = POP()\n" \
                           "AM=M-1\n"\
                           "D=M\n" \
                           "@ARG\n"\
                           "A=M\n" \
                           "M=D \n" \
                           "@ARG //SP = ARG + 1\n" \
                           "D=M\n" \
                           "@SP\n" \
                           "M=D+1\n"
        self.stream.write(command)

        self.writeGoto(label="@RET", M=True)

    def writeFunction(self, functionName, numLocals):
        preIndent, indent = self.startFunction()
        self.stream.write(
                           "" + preIndent + "(" + functionName + ") //WriteFunction \n"
                           "" + indent + "@" + numLocals + "\n"
                           "" + indent + "D=A\n"
                           "" + indent + "@temp_" + functionName + "\n"
                           "" + indent + "M=D\n"
                           "" + indent + "(START_" + functionName + ")\n"
                           "" + indent + "@END_" + functionName + "\n"
                           "" + indent + "D;JLE\n" 
                           "" + indent + "@0 //Push Zero Start \n"
                           "" + indent + "D=A\n"
                           "" + indent + "@SP\n"
                           "" + indent + "M=M+1\n"
                           "" + indent + "A=M-1\n"
                           "" + indent + "M=D //Push Zero End\n"
                           "" + indent + "@temp_" + functionName + "\n"
                           "" + indent + "MD=M-1\n"
                           "" + indent + "@START_" + functionName + "\n"
                           "" + indent + "0;JMP\n"
                           "" + preIndent + "(END_" + functionName + ")\n")


    """
        D must be Value of dest
        Push D to SP
    """
    def pushTemplate(self):
        return "@SP //PushTemplate function\n" \
               "M=M+1\n" \
               "A=M-1\n" \
               "M=D \n"

    """
        D must be address of dest
        POP SP to D
    """
    def popTemplate(self):
        return  "@SP //PopTemplate function\n" \
                "A=M\n" \
                "M=D \n" \
                "@SP\n" \
                "AM=M-1 \n" \
                "D=M \n" \
                "A=A+1 \n" \
                "A=M \n" \
                "M=D\n"

    " D register has Value"
    def jumpTemplate(self, condition):
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

        jumpCondition = condition + "_TRUE_" + str(index)
        jumpNotCondition = condition + "_FALSE_" + str(index)

        return "@" + jumpCondition + " //jumpTemplate Function\n" \
               "D;" + condition + "\n" \
               "@SP\n" \
               "A=M-1\n" \
               "M=0 // FALSE\n" \
               "@" + jumpNotCondition + "\n" \
               "0;JMP\n" \
               "(" + jumpCondition + ")\n" \
               "@SP\n" \
               "A=M-1\n" \
               "M=-1 // TRUE\n" \
               "(" + jumpNotCondition + ")\n" \

    def arithmeticTemplate(self):
        return "@SP //arithmeticTemplate Function\n" \
               "AM=M-1\n" \
               "D=M\n" \
               "@SP\n" \
               "A=M-1\n" \

    def startFunction(self):
        self.indent += 1

        indent = ""
        for i in range(self.indent):
            indent += "\t"

        preindent = ""
        for i in range(self.indent - 1):
            indent += "\t"

        return preindent, indent

    def endFunction(self):

        if self.indent != 0:
            self.indent -= 1

    def close(self):
        self.stream.close()

