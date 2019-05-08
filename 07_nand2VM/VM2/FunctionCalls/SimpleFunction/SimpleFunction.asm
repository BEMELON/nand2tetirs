@2 //WriteFunction Start
D=A
@temp_SimpleFunction.test
M=D
(SimpleFunction.test)
	@END_SimpleFunction.test
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_SimpleFunction.test //iterater - 1
	MD=M-1
	@SimpleFunction.test
	0;JMP
(END_SimpleFunction.test) //WriteFunction End
@0
D=A //A = @index 
@LCL
A=M+D // sp = sp + index
D=M // D = *sp
@SP
M=M+1 // sp++ 
A=M-1 //A = sp-1 
M=D // *sp = D
@1
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
@SP
AM=M-1 // sp--
D=M // D = TOP element
@SP
A=M-1 // M = second element from top
M=!M// NOT
@0
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
@LCL //writeReturn Start!
D=M
@FRAME
M=D //FRAME=LCL
D=A
@5
A=D-A
AD=M
@RET
M=D //RET = *(FRAME-5)
@SP
AM=M-1
D=M
@ARG
A=M
M=D //SP = ARG + 1
@ARG
D=A
@SP
A=D+1
@FRAME
A=A-1
A=M
D=M
@THAT
M=D //THAT = *(FRAME -1)
@FRAME
D=A
@2
AD=D-A
AD=M
@THIS
M=D //THIS = *(FRAME -2)
@FRAME
D=A
@3
AD=D-A
AD=M
@THAT
M=D //THAT = *(FRAME -3)
@FRAME
D=A
@4
AD=D-A
AD=M
@LCL
M=D //LCL = *(FRAME-4)
