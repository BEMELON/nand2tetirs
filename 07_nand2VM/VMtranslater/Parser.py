"""
Handles the parsing of single .vm file, and encapsulates access to the input code.
It reads VM commands, parses them, and provides convenient access to their components.
In addition, it removes all white space and commands
"""
class Parser:

    def __init__(self, stream):
        self.index = -1
        self.stream = open(stream, "r").read().splitlines()
        self.removeWhiteSpaces()

    def removeWhiteSpaces(self):
        newStream = []
        for instruction in self.stream:
            if len(instruction) != 0 and instruction[0] != '/':
                if instruction[0] == ' ':
                    instruction = instruction.lstrip()
                if instruction.find('/') != -1:
                    instruction = instruction[:instruction.find('/')]

                newStream.append(instruction)
        self.stream = newStream

    def hasMoreCommands(self):
        if self.index == (len(self.stream) - 1):
            self.index = -1
            return False
        return True

    def advance(self):
        self.index += 1

    def commandType(self):
        instruction = self.stream[self.index]

        if instruction.find("push") != -1:
            return "C_PUSH"
        elif instruction.find("pop") != -1:
            return "C_POP"
        elif instruction.find("label") != -1:
            return "C_LABEL"
        elif instruction.find("if-goto") != -1:
            return "C_IF"
        elif instruction.find("goto") != -1:
            return "C_GOTO"
        elif instruction.find("function") != -1:
            return "C_FUNCTION"
        elif instruction.find("return") != -1:
            return "C_RETURN"
        elif instruction.find("call") != -1:
            return "C_CALL"
        else:
            return "C_ARITHMETIC"

    def arg1(self):
        instruction = self.stream[self.index]
        if self.commandType() == "C_ARITHMETIC":
            return instruction
        elif self.commandType() == "C_RETURN":
            return None
        else:
            return instruction.split(' ')[1]

    def arg2(self):
        instruction = self.stream[self.index]
        if self.commandType() == "C_PUSH" or \
           self.commandType() == "C_POP" or \
           self.commandType() == "C_CALL" or \
           self.commandType() == "C_FUNCTION":

            return instruction.split(' ')[2]
        return None
