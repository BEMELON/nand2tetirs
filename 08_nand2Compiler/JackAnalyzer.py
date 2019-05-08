import JackTokenizer
# import CompilationEngine
import sys


def Analyze():
    jackFileName = sys.argv[1]
    xmlFileName = jackFileName[:-3] + "xml"
    Tokenizer = JackTokenizer.JackTokenizer(inputStream=jackFileName)
    #Compiler = CompilationEngine.CompilationEngine(inputStream=jackFileName, outputStream=xmlFileName)

if __name__ == "__main__":
    Analyze()