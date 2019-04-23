@7
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@8
D=A // D = n
@SP
A=M // dereference
M=D // *sp = D
@SP
M=M+1 // sp++
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M+D //ADD
