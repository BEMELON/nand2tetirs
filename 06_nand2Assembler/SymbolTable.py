class SymbolTable:
    def __init__(self):
        self.labelTable = {}

    def addEntry(self, symbol, address):
        self.labelTable[symbol] = address

    def contains(self, symbol):
        return True if symbol in self.labelTable else False

    def getAddress(self, symbol):
        return self.labelTable[symbol]

