import sys
from SymbolTable import *
from Parser import *
from Code import *

parser = parser(sys.argv[1])  # init Parser
SymbolTable = SymbolTable()  # init SymbolTable
Code = Code()  # init Code

# init pre-defined symbol table
def initTable():
    SymbolTable.addEntry(symbol="SCREEN", address="16384")
    SymbolTable.addEntry(symbol="KBD", address="24576")
    SymbolTable.addEntry(symbol="SP", address="0")
    SymbolTable.addEntry(symbol="LCL", address="1")
    SymbolTable.addEntry(symbol="ARG", address="2")
    SymbolTable.addEntry(symbol="THIS", address="3")
    SymbolTable.addEntry(symbol="THAT", address="4")
    SymbolTable.addEntry(symbol="R0", address="0")
    SymbolTable.addEntry(symbol="R1", address="1")
    SymbolTable.addEntry(symbol="R2", address="2")
    SymbolTable.addEntry(symbol="R3", address="3")
    SymbolTable.addEntry(symbol="R4", address="4")
    SymbolTable.addEntry(symbol="R5", address="5")
    SymbolTable.addEntry(symbol="R6", address="6")
    SymbolTable.addEntry(symbol="R7", address="7")
    SymbolTable.addEntry(symbol="R8", address="8")
    SymbolTable.addEntry(symbol="R9", address="9")
    SymbolTable.addEntry(symbol="R10", address="10")
    SymbolTable.addEntry(symbol="R11", address="11")
    SymbolTable.addEntry(symbol="R12", address="12")
    SymbolTable.addEntry(symbol="R13", address="13")
    SymbolTable.addEntry(symbol="R14", address="14")
    SymbolTable.addEntry(symbol="R15", address="15")

def firstpass(asmStream):
    pc = 0  # pc counter

    while parser.hasMoreCommands():
        parser.advance()
        if parser.commandType() == "L":
            label = parser.symbol()
            SymbolTable.addEntry(symbol=label, address=pc)
        else:
            pc += 1

offset = 16
def secondpass(asmStream):
    while parser.hasMoreCommands():
        parser.advance()
        if parser.commandType() == "A":
            # A-instruction
            word = parser.symbol()
            if SymbolTable.contains(symbol=word):
                # registered label
                word = SymbolTable.getAddress(symbol=word)
            elif not word.isdecimal():
                # if is Variable
                global offset
                SymbolTable.addEntry(symbol=word, address=offset)
                word = offset
                offset += 1

            parser.hackStream.write("0" + Code.binary(mnemonic=word) + "\n")

        elif parser.commandType() == "C":
            # C-instruction
            comp = parser.comp()
            dest = parser.dest()
            jump = parser.jump()
            parser.hackStream.write("111" + Code.comp(comp) + Code.dest(dest) + Code.jump(jump) + "\n")

def assembler():
    initTable()  # init pre-defined labels
    firstpass(parser.asmStream) # parse label
    secondpass(parser.asmStream)

if __name__ == "__main__":
    assembler()



