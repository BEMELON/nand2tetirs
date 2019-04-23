@111
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@333
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@888
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@24
D=A
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@19
D=A
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@17
D=A
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@19
D=M
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@17
D=M
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M-D //SUB
@24
D=M
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M+D //ADD
