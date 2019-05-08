class JackTokenizer:

    def __init__(self, inputStream):
        self.rawStreamList = open(inputStream, "r").read().splitlines()
        self.commentCheck = False
        self.tokens_keyword = ["class", "constructor", "function", "method", "field", "static", "var",
                               "int", "char", "boolean", "void", "true", "false", "null", "this", "let"
                               "do", "if", "else", "while", "return"]
        self.tokens_symbol = ["{", "}", "(", ")", "[", "]", ".", ",", ";", "+", "-", "*", "/", "&", "|", "<", ">", "=", "-"]
        self.removeWhiteSpace()
        self.tokenize()

    # def hasMoreTokens(self):
    #
    # def advance(self):
    #
    # def tokenType(self):
    #
    # def keyWord(self):
    #
    # def symbol(self):
    #
    # def identifier(self):
    #
    # def intVal(self):
    #
    # def stringVal(self):

    def removeWhiteSpace(self):
        """
            1. 공백인 경우
                1-1. 부분 공백인 경우
            2. 전체 주석인 경우
                2-1. /* ~ */
                2-2. /** ~ */ (API comment)
                2-3. // 
            3. 일부분만 주석인 경우              
        """
        srcList = []
        for code in self.rawStreamList:
            newCode = ""
            if len(code) != 0:
                if self.isComment(code=code):
                    idxComment = code.find("//")
                    if idxComment != -1 and idxComment != 0:
                        newCode = code[:idxComment - 1]
                else:
                    newCode = code
                newCode = self.removeSpaces(code=newCode)

                if len(newCode) != 0:
                    srcList.append(newCode)
        self.rawStreamList = srcList

    def removeSpaces(self, code):
        code = code.replace(" ", "")
        code = code.replace("\t", "")
        return code

    def isComment(self, code):
        if code.find("/*") != -1:
            self.commentCheck = True
        if code.find("*/") != -1:
            self.commentCheck = False

        return code.find("//") != -1 or code.find("/*") != -1 \
               or code.find("*/") != -1 or self.commentCheck or len(code) == 0

    def tokenize(self):
        """
            1. keyword
            2. symbol
        """
        newList = []
        for code in self.rawStreamList:
            idx_symbol = self.findSymbol_idx(code=code)
            while idx_symbol:
                keyword = self.getKeyword(code=code)
                if idx_symbol == 0 and \
                        self.isArithmetic(symbol=code[idx_symbol]) and self.isArithmetic(symbol=code[idx_symbol+1]):
                    newList.append(code[:idx_symbol + 1])
                    code = code[2:]

               if keyword:
                    newList.append(keyword)
                    code = code[len(keyword)]
                else:
                    word = code[:idx_symbol - 1]
                    code = code[idx_symbol:]
                    newList.append(word)
                idx_symbol = self.findSymbol_idx(code=code)
        print(newList)

    def getKeyword(self, code):
        for keyword in self.tokens_keyword:
            if keyword in code:
                return True
        return None

    def isArithmetic(self, symbol):
        return symbol == "<" or symbol == "=" or symbol == ">"

    def findSymbol_idx(self, code):
        for symbol in self.tokens_symbol:
            idx_symbol= code.find(symbol)
            if idx_symbol != -1:
                return idx_symbol
        return None

    def findKeyWord(self, code):
        for keyword in self.tokens_keyword:
            if code.find(keyword) != -1:
                return keyword
        return None
