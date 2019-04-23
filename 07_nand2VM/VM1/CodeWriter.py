"""
Translates VM commands into Hack assembly code.
"""
class CodeWriter:

    def __init__(self, stream):
        self.stream = open(stream, "w")
        self.JEQIndex = -1
        self.JLTIndex = -1
        self.JGTIndex = -1


    def setFileName(self, fileName):
        print("What is this for?")

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
        return  "@SP\n" \
                "A=M // dereference\n" \
                "M=D // *sp = D(address OFFSET + index)\n" \
                "@SP\n" \
                "AM=M-1 //sp--, dereference\n" \
                "D=M //D=*sp\n" \
                "A=A+1 //A=sp++ sp+1(OFFSET + index address)\n" \
                "A=M //dereference to OFFSET + index address\n" \
                "M=D //update value\n"

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

