@256 //WriteInit Function 
D=A
@SP
M=D
@Sys.init_RET //WriteCall Function
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
(Sys.init_RET)
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
@4000 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //WritePushPop Function
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
@5000 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //WritePushPop Function
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
@Sys.main_RET //WriteCall Function
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
@Sys.main //WriteGoto Function
0;JMP
(Sys.main_RET)
@6 //WritePushPop Function
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
(LOOP)
@LOOP //WriteGoto Function
0;JMP
(Sys.main) //WriteFunction 
	@5
	D=A
	@temp_Sys.main
	M=D
	(START_Sys.main)
	@END_Sys.main
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Sys.main
	MD=M-1
	@START_Sys.main
	0;JMP
(END_Sys.main)
@4001 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //WritePushPop Function
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
@5001 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //WritePushPop Function
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
@200 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@1
D=A 
@LCL
D=M+D
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@40 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@2
D=A 
@LCL
D=M+D
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@6 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@3
D=A 
@LCL
D=M+D
@SP //PopTemplate function
A=M
M=D 
@SP
AM=M-1 
D=M 
A=A+1 
A=M 
M=D
@123 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@Sys.add12_RET //WriteCall Function
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
@Sys.add12 //WriteGoto Function
0;JMP
(Sys.add12_RET)
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
@0
D=A
@LCL
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@1
D=A
@LCL
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@2
D=A
@LCL
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@3
D=A
@LCL
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@4
D=A
@LCL
A=M+D
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
M=M+D //ADD
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
M=M+D //ADD
@SP //arithmeticTemplate Function
AM=M-1
D=M
@SP
A=M-1
M=M+D //ADD
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
(Sys.add12) //WriteFunction 
	@0
	D=A
	@temp_Sys.add12
	M=D
	(START_Sys.add12)
	@END_Sys.add12
	D;JLE
	@0 //Push Zero Start 
	D=A
	@SP
	M=M+1
	A=M-1
	M=D //Push Zero End
	@temp_Sys.add12
	MD=M-1
	@START_Sys.add12
	0;JMP
(END_Sys.add12)
@4002 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THIS //WritePushPop Function
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
@5002 //WritePushPop Function
D=A
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@THAT //WritePushPop Function
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
@0
D=A
@ARG
A=M+D
D=M
@SP //PushTemplate function
M=M+1
A=M-1
M=D 
@12 //WritePushPop Function
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
