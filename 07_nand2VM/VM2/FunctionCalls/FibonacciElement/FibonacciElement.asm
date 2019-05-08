@256 //WriteInit Function 
D=A
@SP
M=D
@Sys.init_RET_0 //WriteCall Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@LCL //Save LCL of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@ARG //Save ARG of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //Save THIS of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //Save THAT of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //Reposition ARG
D=M
@5
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Sys.init //WriteGoto Function
0;JMP
(Sys.init_RET_0)
(Sys.init) //WriteFunction 
	@0
	D=A
	@temp_Sys.init
	M=D
	(START_Sys.init)
	@END_Sys.init
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Sys.init
	MD=M-1
	@START_Sys.init
	0;JMP
(END_Sys.init)
@4 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Main.fibonacci_RET_1 //WriteCall Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@LCL //Save LCL of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@ARG //Save ARG of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //Save THIS of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //Save THAT of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //Reposition ARG
D=M
@6
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Main.fibonacci //WriteGoto Function
0;JMP
(Main.fibonacci_RET_1)
(WHILE)
@WHILE //WriteGoto Function
0;JMP
(Main.fibonacci) //WriteFunction 
	@0
	D=A
	@temp_Main.fibonacci
	M=D
	(START_Main.fibonacci)
	@END_Main.fibonacci
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Main.fibonacci
	MD=M-1
	@START_Main.fibonacci
	0;JMP
(END_Main.fibonacci)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@2 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
D=M-D
@JLT_TRUE_0 //jumpTemplate Function
D;JLT
@SP
A=M-1
M=0 // FALSE
@JLT_FALSE_0
0;JMP
(JLT_TRUE_0)
@SP
A=M-1
M=-1 // TRUE
(JLT_FALSE_0)
@SP //WriteIf Function
AM=M-1
D=M
@IF_TRUE
D;JNE
@IF_FALSE //WriteGoto Function
0;JMP
(IF_TRUE)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@LCL //WriteReturn Function
D=M
@FRAME
M=D //FRAME=LCL
@FRAME //RET = *(FRAME - 5)
D=M
@5
AD=D-A
AD=M
@RET
M=D
@SP //*ARG = POP()
AM=M-1
D=M
@ARG
A=M
M=D 
@ARG //SP = ARG + 1
D=M
@SP
M=D+1
@FRAME //THAT = *(FRAME - 1)
D=M
@1
AD=D-A
AD=M
@THAT
M=D
@FRAME //THIS = *(FRAME - 2)
D=M
@2
AD=D-A
AD=M
@THIS
M=D
@FRAME //ARG = *(FRAME - 3)
D=M
@3
AD=D-A
AD=M
@ARG
M=D
@FRAME //LCL = *(FRAME - 4)
D=M
@4
AD=D-A
AD=M
@LCL
M=D
@RET //WriteGoto Function
A=M
0;JMP
(IF_FALSE)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@2 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
M=M-D //SUB
@Main.fibonacci_RET_2 //WriteCall Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@LCL //Save LCL of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@ARG //Save ARG of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //Save THIS of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //Save THAT of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //Reposition ARG
D=M
@6
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Main.fibonacci //WriteGoto Function
0;JMP
(Main.fibonacci_RET_2)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@1 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
M=M-D //SUB
@Main.fibonacci_RET_3 //WriteCall Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@LCL //Save LCL of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@ARG //Save ARG of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //Save THIS of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //Save THAT of the calling Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@SP //Reposition ARG
D=M
@6
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Main.fibonacci //WriteGoto Function
0;JMP
(Main.fibonacci_RET_3)
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
M=M+D //ADD
@LCL //WriteReturn Function
D=M
@FRAME
M=D //FRAME=LCL
@FRAME //RET = *(FRAME - 5)
D=M
@5
AD=D-A
AD=M
@RET
M=D
@SP //*ARG = POP()
AM=M-1
D=M
@ARG
A=M
M=D 
@ARG //SP = ARG + 1
D=M
@SP
M=D+1
@FRAME //THAT = *(FRAME - 1)
D=M
@1
AD=D-A
AD=M
@THAT
M=D
@FRAME //THIS = *(FRAME - 2)
D=M
@2
AD=D-A
AD=M
@THIS
M=D
@FRAME //ARG = *(FRAME - 3)
D=M
@3
AD=D-A
AD=M
@ARG
M=D
@FRAME //LCL = *(FRAME - 4)
D=M
@4
AD=D-A
AD=M
@LCL
M=D
@RET //WriteGoto Function
A=M
0;JMP
