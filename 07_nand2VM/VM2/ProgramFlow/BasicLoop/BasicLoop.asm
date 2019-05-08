@0
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@0
D=A // A = @index
@LCL
D=M+D // D = address(OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
(LOOP_START)
@0
D=A //A = @index 
@ARG
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@0
D=A //A = @index 
@LCL
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
@0
D=A // A = @index
@LCL
D=M+D // D = address(OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@0
D=A //A = @index 
@ARG
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@1
D=A // D = @constant
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
@0
D=A // A = @index
@ARG
D=M+D // D = address(OFFSET + index)
@SP
A=M // dereference
M=D // *sp = D(address OFFSET + index)
@SP
AM=M-1 //sp--, dereference
D=M //D=*sp
A=A+1 //A=sp++ sp+1(OFFSET + index address)
A=M //dereference to OFFSET + index address
M=D //update value
@0
D=A //A = @index 
@ARG
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@SP //=================================
AM=M-1 // WriteIf func executed
D=M
@LOOP_START
D;JGT //===============================
@0
D=A //A = @index 
@LCL
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
