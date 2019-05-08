@1
D=A //A = @index 
@ARG
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@THAT
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
@0
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@0
D=A // A = @index
@THAT
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
@1
D=A // D = @constant
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@1
D=A // A = @index
@THAT
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
@2
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
(MAIN_LOOP_START)
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
@COMPUTE_ELEMENT
D;JGT //===============================
@END_PROGRAM
0;JMP // ======== WriteGoto Func executed
(COMPUTE_ELEMENT)
@0
D=A //A = @index 
@THAT
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@1
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
@2
D=A // A = @index
@THAT
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
@THAT
D=M
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
M=M+D //ADD
@THAT
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
@MAIN_LOOP_START
0;JMP // ======== WriteGoto Func executed
(END_PROGRAM)
