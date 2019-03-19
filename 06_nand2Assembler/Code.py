class Code:
    def __init__(self):
        self.compTable = {}
        self.destTable = {}
        self.jumpTable = {}
        self.updateTable()

    def updateTable(self):

        self.compTable['0'] = "0101010"
        self.compTable['1'] = "0111111"
        self.compTable['-1'] = "0111010"
        self.compTable['D'] = "0001100"
        self.compTable['A'] = "0110000"
        self.compTable['!D'] = "0001101"
        self.compTable['!A'] = "0110001"
        self.compTable['-D'] = "0001111"
        self.compTable['-A'] = "0110011"
        self.compTable['D+1'] = "0011111"
        self.compTable['A+1'] = "0110111"
        self.compTable['D-1'] = "0001110"
        self.compTable['A-1'] = "0110010"
        self.compTable['D+A'] = "0000010"
        self.compTable['D-A'] = "0010011"
        self.compTable['A-D'] = "0000111"
        self.compTable['D&A'] = "0000000"
        self.compTable["D|A"] = "0010101"
        self.compTable['M'] = "1110000"
        self.compTable['!M'] = "1110001"
        self.compTable['-M'] = "1110011"
        self.compTable['M+1'] = "1110111"
        self.compTable['M-1'] = "1110010"
        self.compTable['D+M'] = "1000010"
        self.compTable['D-M'] = "1010011"
        self.compTable['M-D'] = "1000111"
        self.compTable['D&M'] = "1000000"
        self.compTable['D|M'] = "1010101"

        self.destTable['M'] = "001"
        self.destTable['D'] = "010"
        self.destTable["MD"] = "011"
        self.destTable["A"] = "100"
        self.destTable["AM"] = "101"
        self.destTable["AD"] = "110"
        self.destTable["AMD"] = "111"
        self.destTable[None] = "000"

        self.jumpTable[None] = "000"
        self.jumpTable["JGT"] = "001"
        self.jumpTable["JEQ"] = "010"
        self.jumpTable["JGE"] = "011"
        self.jumpTable["JLT"] = "100"
        self.jumpTable["JNE"] = "101"
        self.jumpTable["JLE"] = "110"
        self.jumpTable["JMP"] = "111"

    def jump(self, mnemonic):
        return self.jumpTable[mnemonic]

    def dest(self, mnemonic):
        return self.destTable[mnemonic]

    def comp(self, mnemonic):
        return self.compTable[mnemonic]

    # change decimal to binary
    def binary(self, mnemonic):
        binary = ""
        dec = int(mnemonic)
        while dec != 0:
            binary += str(dec % 2)
            dec //= 2

        # add zeros until 15-bits
        while len(binary) != 15:
            binary += "0"

        return binary[::-1]  # reverse binary


