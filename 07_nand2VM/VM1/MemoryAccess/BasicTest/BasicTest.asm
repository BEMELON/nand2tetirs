@10
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@0
D=A // A = @index
@LCL
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@21
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@22
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@2
D=A // A = @index
@ARG
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@1
D=A // A = @index
@ARG
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@36
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@6
D=A // A = @index
@THIS
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@42
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@45
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@5
D=A // A = @index
@THAT
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@2
D=A // A = @index
@THAT
D=M+D // D = (OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@510
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@11
D=A // offset for Temp
@SP
A=M // dereference
M=D // *sp = D(OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@0
D=A //A = @index 
@LCL
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@5
D=A //A = @index 
@THAT
A=M+D // sp = sp + index
D=M // D = *sp
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
@1
D=A //A = @index 
@ARG
A=M+D // sp = sp + index
D=M // D = *sp
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
@6
D=A //A = @index 
@THIS
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@6
D=A //A = @index 
@THIS
A=M+D // sp = sp + index
D=M // D = *sp
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
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=M-D //SUB
@11
D=M // D=*temp
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
