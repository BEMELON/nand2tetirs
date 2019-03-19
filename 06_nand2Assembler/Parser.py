class parser:
    def __init__(self, argv):
        self.asmStream = open(argv, "r").read().splitlines()
        self.pointer = -1
        self.hackStream = open(argv[:-4] + ".hack", "w")
        self.removeWhiteSpace()

    def removeWhiteSpace(self):
        newStream = []
        for command in self.asmStream:
            if len(command) != 0:
                command = command.replace(" ", "")

            if len(command) != 0:

                if command[0] != "/" and command.find("/") != -1:
                    newStream.append(command[:command.find('/')])
                elif command[0] != "/":
                    newStream.append(command)
        self.asmStream = newStream

    def hasMoreCommands(self):
        if len(self.asmStream) - 1 != self.pointer:
            return True
        else:
            self.pointer = -1
            return False

    def advance(self):
        self.pointer += 1

    def commandType(self):
        command = self.asmStream[self.pointer]
        if command[0] == "@":
            return "A"
        elif command[0] == "(":
            return "L"
        else:
            return "C"

    def symbol(self):
        command = self.asmStream[self.pointer]
        if command[0] == "@":
            return command[1:]

        if command[0] == "(":
            return command[1:command.find(")")]

    def dest(self):
        command = self.asmStream[self.pointer]
        if command.find('=') != -1:
            return command[:command.find("=")]
        return None

    def comp(self):
        command = self.asmStream[self.pointer]
        if command.find('=') != -1:
            return command[command.find('=') + 1:]
        else:
            return command[:command.find(';')]

    def jump(self):
        command = self.asmStream[self.pointer]
        if command.find(';') != -1:
            return command[command.find(';') + 1:]
        else:
            return None
