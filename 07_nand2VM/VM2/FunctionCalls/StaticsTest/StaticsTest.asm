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
@6 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@8 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class1.set_RET_1 //WriteCall Function
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
@7
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Class1.set //WriteGoto Function
0;JMP
(Class1.set_RET_1)
@5 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@23 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@15 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class2.set_RET_2 //WriteCall Function
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
@7
D=D-A
@ARG
M=D
@SP //LCL=SP
D=M
@LCL
M=D
@Class2.set //WriteGoto Function
0;JMP
(Class2.set_RET_2)
@5 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@Class1.get_RET_3 //WriteCall Function
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
@Class1.get //WriteGoto Function
0;JMP
(Class1.get_RET_3)
@Class2.get_RET_4 //WriteCall Function
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
@Class2.get //WriteGoto Function
0;JMP
(Class2.get_RET_4)
(WHILE)
@WHILE //WriteGoto Function
0;JMP
(Class1.set) //WriteFunction 
	@0
	D=A
	@temp_Class1.set
	M=D
	(START_Class1.set)
	@END_Class1.set
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Class1.set
	MD=M-1
	@START_Class1.set
	0;JMP
(END_Class1.set)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class1.0 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@1
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class1.1 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@0 //WritePushPop Function
D=A
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
(Class1.get) //WriteFunction 
	@0
	D=A
	@temp_Class1.get
	M=D
	(START_Class1.get)
	@END_Class1.get
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Class1.get
	MD=M-1
	@START_Class1.get
	0;JMP
(END_Class1.get)
@Class1.0 //WritePushPop Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class1.1 //WritePushPop Function
D=M
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
(Class2.set) //WriteFunction 
	@0
	D=A
	@temp_Class2.set
	M=D
	(START_Class2.set)
	@END_Class2.set
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Class2.set
	MD=M-1
	@START_Class2.set
	0;JMP
(END_Class2.set)
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class2.0 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@1
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class2.1 //WritePushPop Function
D=A
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@0 //WritePushPop Function
D=A
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
(Class2.get) //WriteFunction 
	@0
	D=A
	@temp_Class2.get
	M=D
	(START_Class2.get)
	@END_Class2.get
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Class2.get
	MD=M-1
	@START_Class2.get
	0;JMP
(END_Class2.get)
@Class2.0 //WritePushPop Function
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Class2.1 //WritePushPop Function
D=M
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
